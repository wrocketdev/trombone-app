package android.print

import android.os.Bundle
import android.os.CancellationSignal
import android.os.ParcelFileDescriptor
import android.webkit.WebView
import java.io.File

/**
 * Drives a WebView's PrintDocumentAdapter by hand so the page is written
 * straight to a PDF file, without ever showing the system print dialog.
 *
 * THIS FILE MUST STAY IN THE `android.print` PACKAGE: the constructors of
 * PrintDocumentAdapter.LayoutResultCallback and .WriteResultCallback are
 * package-private in the Android SDK, so they can only be subclassed from
 * inside that package. Everything here must be called on the UI thread.
 */
object WebViewPdfPrinter {

    /**
     * [onSuccess] / [onError] are always invoked exactly once, on the UI
     * thread. [onError] receives an error code and a message.
     */
    fun print(
        webView: WebView,
        outFile: File,
        attributes: PrintAttributes,
        documentName: String,
        onSuccess: () -> Unit,
        onError: (String, String) -> Unit,
    ) {
        val adapter: PrintDocumentAdapter = webView.createPrintDocumentAdapter(documentName)
        outFile.parentFile?.mkdirs()

        var settled = false
        fun succeed() {
            if (settled) return
            settled = true
            onSuccess()
        }
        fun failWith(code: String, message: String) {
            if (settled) return
            settled = true
            onError(code, message)
        }

        adapter.onLayout(
            attributes,
            attributes,
            CancellationSignal(),
            object : PrintDocumentAdapter.LayoutResultCallback() {
                override fun onLayoutFinished(info: PrintDocumentInfo?, changed: Boolean) {
                    val descriptor = try {
                        ParcelFileDescriptor.open(
                            outFile,
                            ParcelFileDescriptor.MODE_READ_WRITE or
                                ParcelFileDescriptor.MODE_CREATE or
                                ParcelFileDescriptor.MODE_TRUNCATE,
                        )
                    } catch (e: Throwable) {
                        adapter.onFinish()
                        failWith("IO_ERROR", e.message ?: "Fichier temporaire inaccessible.")
                        return
                    }

                    fun closeAndFinish() {
                        try {
                            descriptor.close()
                        } catch (ignored: Throwable) {
                            // Descripteur deja ferme par le moteur d'impression.
                        }
                        adapter.onFinish()
                    }

                    adapter.onWrite(
                        arrayOf(PageRange.ALL_PAGES),
                        descriptor,
                        CancellationSignal(),
                        object : PrintDocumentAdapter.WriteResultCallback() {
                            override fun onWriteFinished(pages: Array<out PageRange>?) {
                                closeAndFinish()
                                succeed()
                            }

                            override fun onWriteFailed(error: CharSequence?) {
                                closeAndFinish()
                                failWith(
                                    "WRITE_FAILED",
                                    error?.toString() ?: "Ecriture du PDF impossible.",
                                )
                            }

                            override fun onWriteCancelled() {
                                closeAndFinish()
                                failWith("CANCELLED", "Conversion annulee.")
                            }
                        },
                    )
                }

                override fun onLayoutFailed(error: CharSequence?) {
                    adapter.onFinish()
                    failWith("LAYOUT_FAILED", error?.toString() ?: "Mise en page impossible.")
                }

                override fun onLayoutCancelled() {
                    adapter.onFinish()
                    failWith("CANCELLED", "Conversion annulee.")
                }
            },
            Bundle(),
        )
    }
}
