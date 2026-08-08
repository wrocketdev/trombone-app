package fr.trombone.pdf

import android.os.Handler
import android.os.Looper
import android.print.PrintAttributes
import android.print.WebViewPdfPrinter
import android.view.View
import android.view.ViewGroup
import android.webkit.WebView
import android.webkit.WebViewClient
import android.widget.FrameLayout
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import java.io.File

/**
 * Hosts the "HTML / page web -> PDF" platform channel.
 *
 * The conversion goes through Android's own WebView + print pipeline (real
 * Chromium rendering), which gives far better fidelity than parsing the HTML
 * ourselves. Everything here runs on the UI thread because WebView requires
 * it; the Dart side is answered asynchronously.
 */
class MainActivity : FlutterActivity() {

    private companion object {
        const val CHANNEL = "trombone/html_to_pdf"
        // 300 dpi so text and images are printed at print quality.
        const val DPI = 300
        // 0.5 inch page margin, expressed in mils.
        const val MARGIN_MILS = 500
        // Settle delay after onPageFinished: late images / web fonts /
        // JS-driven layout are usually flushed within this window.
        const val SETTLE_DELAY_MS = 400L
        // Slightly under the Dart-side 60 s timeout.
        const val WATCHDOG_MS = 55_000L
    }

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL)
            .setMethodCallHandler { call, result -> onMethodCall(call, result) }
    }

    private fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        if (call.method != "convert") {
            result.notImplemented()
            return
        }
        val html = call.argument<String>("html")
        val url = call.argument<String>("url")
        val outputPath = call.argument<String>("outputPath")
        val baseUrl = call.argument<String>("baseUrl")
        if (outputPath.isNullOrEmpty() || (html == null && url.isNullOrEmpty())) {
            result.error("BAD_ARGS", "Arguments invalides.", null)
            return
        }
        runOnUiThread { startConversion(html, url, baseUrl, outputPath, result) }
    }

    private fun startConversion(
        html: String?,
        url: String?,
        baseUrl: String?,
        outputPath: String,
        result: MethodChannel.Result,
    ) {
        // A channel result may only be used once; every exit path goes through
        // succeed() / fail(), which are idempotent.
        var replied = false
        var writing = false
        var container: FrameLayout? = null
        var webView: WebView? = null

        fun cleanUp() {
            val wv = webView
            val holder = container
            webView = null
            container = null
            wv?.stopLoading()
            // Tearing the WebView down is posted to the next loop iteration:
            // cleanUp() is reached from inside a WebView / print callback, and
            // destroying it there kills the native renderer mid-call.
            Handler(Looper.getMainLooper()).post {
                (holder?.parent as? ViewGroup)?.removeView(holder)
                holder?.removeAllViews()
                wv?.destroy()
            }
        }

        fun succeed(path: String) {
            if (replied) return
            replied = true
            cleanUp()
            result.success(path)
        }

        fun fail(code: String, message: String) {
            if (replied) return
            replied = true
            cleanUp()
            result.error(code, message, null)
        }

        // Watchdog: if the page never finishes loading, free the WebView
        // instead of leaking it (the Dart side gives up at 60 s). It never
        // fires once printing started - destroying a WebView while the print
        // adapter writes would crash the renderer.
        Handler(Looper.getMainLooper()).postDelayed({
            if (!writing) {
                fail("TIMEOUT", "La page n'a pas fini de se charger a temps.")
            }
        }, WATCHDOG_MS)

        try {
            val wv = WebView(this)
            webView = wv
            wv.settings.apply {
                javaScriptEnabled = true
                domStorageEnabled = true
                loadWithOverviewMode = true
                useWideViewPort = true
                blockNetworkImage = false
                loadsImagesAutomatically = true
            }
            // The WebView is attached to the window but INVISIBLE: it is
            // measured and laid out (which the renderer needs) yet never
            // drawn and never receives touches. A fully detached WebView
            // prints blank pages on some devices.
            val holder = FrameLayout(this)
            holder.visibility = View.INVISIBLE
            holder.addView(
                wv,
                FrameLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT,
                    ViewGroup.LayoutParams.MATCH_PARENT,
                ),
            )
            container = holder
            addContentView(
                holder,
                ViewGroup.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT,
                    ViewGroup.LayoutParams.MATCH_PARENT,
                ),
            )

            wv.webViewClient = object : WebViewClient() {
                private var started = false

                override fun onPageFinished(view: WebView, finishedUrl: String) {
                    // Redirects make onPageFinished fire more than once.
                    if (started || replied) return
                    started = true
                    Handler(Looper.getMainLooper()).postDelayed({
                        if (!replied) {
                            writing = true
                            writePdf(
                                view,
                                outputPath,
                                { path -> succeed(path) },
                                { code, message -> fail(code, message) },
                            )
                        }
                    }, SETTLE_DELAY_MS)
                }

                // Deliberately the pre-API-23 overload: it is invoked for the
                // MAIN FRAME ONLY, so a missing image or tracker cannot abort
                // the conversion, and it needs no API-level guard.
                @Suppress("DEPRECATION", "OVERRIDE_DEPRECATION")
                override fun onReceivedError(
                    view: WebView,
                    errorCode: Int,
                    description: String?,
                    failingUrl: String?,
                ) {
                    fail(
                        "LOAD_FAILED",
                        "Chargement impossible : ${description ?: "erreur reseau"}",
                    )
                }
            }

            if (!url.isNullOrEmpty()) {
                wv.loadUrl(url)
            } else {
                wv.loadDataWithBaseURL(baseUrl, html ?: "", "text/html", "UTF-8", null)
            }
        } catch (e: Throwable) {
            fail("WEBVIEW_ERROR", e.message ?: e.toString())
        }
    }

    private fun writePdf(
        webView: WebView,
        outputPath: String,
        succeed: (String) -> Unit,
        fail: (String, String) -> Unit,
    ) {
        val attributes = PrintAttributes.Builder()
            .setMediaSize(PrintAttributes.MediaSize.ISO_A4)
            .setResolution(PrintAttributes.Resolution("pdf", "pdf", DPI, DPI))
            // Margins are in mils (1/1000 inch): ~12.7 mm all around, the
            // usual browser print default. PrintAttributes.Margins has no
            // DEFAULT constant, only NO_MARGINS.
            .setMinMargins(PrintAttributes.Margins(MARGIN_MILS, MARGIN_MILS, MARGIN_MILS, MARGIN_MILS))
            .build()
        val outFile = File(outputPath)

        try {
            WebViewPdfPrinter.print(
                webView = webView,
                outFile = outFile,
                attributes = attributes,
                documentName = "page-web",
                onSuccess = {
                    if (outFile.length() <= 0L) {
                        fail("EMPTY_PDF", "Le PDF genere est vide.")
                    } else {
                        succeed(outputPath)
                    }
                },
                onError = { code, message -> fail(code, message) },
            )
        } catch (e: Throwable) {
            // Defensive: the print result callbacks are package-private SDK
            // classes (see WebViewPdfPrinter). If a future Android release
            // blocks them we report a clean error instead of crashing.
            fail(
                "PRINT_UNAVAILABLE",
                "Le moteur d'impression Android a refuse la conversion : " +
                    (e.message ?: e.toString()),
            )
        }
    }
}
