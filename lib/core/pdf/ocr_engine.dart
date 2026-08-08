import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdfx/pdfx.dart' as pdfx;
import 'package:syncfusion_flutter_pdf/pdf.dart' as sf;

import 'pdf_engine.dart';

/// Recognized text for a single page, kept so the screen can offer a
/// "copy all text" action alongside the searchable PDF.
class OcrPageResult {
  OcrPageResult({required this.pageNumber, required this.text});
  final int pageNumber;
  final String text;
}

class OcrResult {
  OcrResult({required this.pdfBytes, required this.pages});
  final Uint8List pdfBytes;
  final List<OcrPageResult> pages;

  String get allText =>
      pages.map((p) => '--- Page ${p.pageNumber} ---\n${p.text}').join('\n\n');
}

/// Turns a scanned (image-only) PDF into a searchable one: each page is
/// rasterized, run through ML Kit's on-device text recognizer, and the
/// recognized words are drawn back onto the original page as invisible
/// (zero-alpha) text lined up over the scan — the page still looks like a
/// scan, but every word underneath is now real, selectable, searchable text.
class OcrEngine {
  OcrEngine._();

  static const double _dpi = 200;
  static const double _renderScale = _dpi / 72.0;

  static Future<OcrResult> run(
    Uint8List pdfBytes, {
    required void Function(int done, int total) onProgress,
    required CancelToken cancelToken,
  }) async {
    final pdfx.PdfDocument rasterDoc = await pdfx.PdfDocument.openData(
      pdfBytes,
    );
    final sf.PdfDocument editDoc = sf.PdfDocument(inputBytes: pdfBytes);
    final TextRecognizer recognizer = TextRecognizer(
      script: TextRecognitionScript.latin,
    );
    final Directory tempDir = await getTemporaryDirectory();
    final List<OcrPageResult> results = <OcrPageResult>[];
    try {
      final int total = rasterDoc.pagesCount;
      for (var i = 1; i <= total; i++) {
        if (cancelToken.isCancelled) throw CancelledException();

        final pdfx.PdfPage rasterPage = await rasterDoc.getPage(i);
        String tempPath = '';
        try {
          final double renderWidth = rasterPage.width * _renderScale;
          final double renderHeight = rasterPage.height * _renderScale;
          // An explicit white background is essential: pdfx renders PNG on a
          // TRANSPARENT background by default, and ML Kit then sees black
          // text on black and recognizes nothing at all.
          final pdfx.PdfPageImage? image = await rasterPage.render(
            width: renderWidth,
            height: renderHeight,
            format: pdfx.PdfPageImageFormat.png,
            backgroundColor: '#FFFFFF',
          );
          if (image == null) {
            throw StateError('Rendu de la page $i impossible');
          }

          tempPath = '${tempDir.path}/ocr_page_$i.png';
          await File(tempPath).writeAsBytes(image.bytes);

          final InputImage input = InputImage.fromFilePath(tempPath);
          final RecognizedText recognized = await recognizer.processImage(
            input,
          );

          final sf.PdfPage editPage = editDoc.pages[i - 1];
          final double scaleX = editPage.size.width / renderWidth;
          final double scaleY = editPage.size.height / renderHeight;

          for (final TextBlock block in recognized.blocks) {
            for (final TextLine line in block.lines) {
              for (final TextElement element in line.elements) {
                if (element.text.trim().isEmpty) continue;
                final Rect box = element.boundingBox;
                final Rect target = Rect.fromLTWH(
                  box.left * scaleX,
                  box.top * scaleY,
                  box.width * scaleX,
                  box.height * scaleY,
                );
                final double fontSize = (box.height * scaleY).clamp(4.0, 72.0);
                editPage.graphics.drawString(
                  element.text,
                  sf.PdfStandardFont(sf.PdfFontFamily.helvetica, fontSize),
                  brush: sf.PdfSolidBrush(sf.PdfColor(0, 0, 0, 0)),
                  bounds: target,
                );
              }
            }
          }

          results.add(OcrPageResult(pageNumber: i, text: recognized.text));
        } finally {
          await rasterPage.close();
          if (tempPath.isNotEmpty) {
            unawaited(_deleteQuietly(tempPath));
          }
        }

        onProgress(i, total);
      }

      final List<int> savedBytes = await editDoc.save();
      return OcrResult(
        pdfBytes: Uint8List.fromList(savedBytes),
        pages: results,
      );
    } finally {
      await recognizer.close();
      await rasterDoc.close();
      editDoc.dispose();
    }
  }
}

Future<void> _deleteQuietly(String path) async {
  try {
    await File(path).delete();
  } catch (_) {
    // Best-effort cleanup only.
  }
}
