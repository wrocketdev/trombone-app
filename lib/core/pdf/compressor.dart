import 'dart:math' as math;
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:pdfx/pdfx.dart' as pdfx;
import 'package:syncfusion_flutter_pdf/pdf.dart' as sf;

import 'pdf_engine.dart';

enum CompressionLevel { light, medium, strong }

class _RasterSettings {
  const _RasterSettings(this.dpi, this.quality);
  final double dpi;
  final int quality;
}

/// Compresses a finished PDF by rasterizing every page at a reduced
/// resolution/JPEG quality and rebuilding the document from those images.
/// This flattens vector content and live text, which is an acceptable
/// trade-off for the target use case (scanned documents, photos, receipts)
/// and is the only compression strategy achievable fully on-device without
/// a general-purpose PDF content-stream re-encoder.
class Compressor {
  Compressor._();

  static const Map<CompressionLevel, _RasterSettings> _settings = {
    CompressionLevel.light: _RasterSettings(150, 85),
    CompressionLevel.medium: _RasterSettings(110, 70),
    CompressionLevel.strong: _RasterSettings(80, 55),
  };

  /// Renders a handful of sample pages to project the final file size
  /// without paying the cost of compressing the whole document.
  static Future<int> estimateSize(
    Uint8List originalPdf,
    CompressionLevel level, {
    int sampleMaxPages = 3,
  }) async {
    final pdfx.PdfDocument doc = await pdfx.PdfDocument.openData(originalPdf);
    try {
      final int total = doc.pagesCount;
      if (total == 0) return originalPdf.length;
      final int sampleCount = math.min(sampleMaxPages, total);
      final _RasterSettings settings = _settings[level]!;
      int sampleBytes = 0;
      for (var i = 1; i <= sampleCount; i++) {
        final pdfx.PdfPage page = await doc.getPage(i);
        try {
          final double scale = settings.dpi / 72.0;
          final pdfx.PdfPageImage? img = await page.render(
            width: page.width * scale,
            height: page.height * scale,
            format: pdfx.PdfPageImageFormat.jpeg,
            quality: settings.quality,
          );
          sampleBytes += img?.bytes.length ?? 0;
        } finally {
          await page.close();
        }
      }
      final double avgPerPage = sampleBytes / sampleCount;
      return (avgPerPage * total * 1.03).round() + 2048;
    } finally {
      await doc.close();
    }
  }

  static Future<Uint8List> compress(
    Uint8List originalPdf,
    CompressionLevel level, {
    void Function(int done, int total)? onProgress,
    CancelToken? cancelToken,
  }) async {
    final _RasterSettings settings = _settings[level]!;
    final pdfx.PdfDocument srcDoc = await pdfx.PdfDocument.openData(
      originalPdf,
    );
    final sf.PdfDocument dest = sf.PdfDocument();
    try {
      final int total = srcDoc.pagesCount;
      for (var i = 1; i <= total; i++) {
        if (cancelToken?.isCancelled ?? false) {
          throw CancelledException();
        }
        final pdfx.PdfPage page = await srcDoc.getPage(i);
        Uint8List jpg;
        final double wPt = page.width;
        final double hPt = page.height;
        try {
          final double scale = settings.dpi / 72.0;
          final pdfx.PdfPageImage? img = await page.render(
            width: wPt * scale,
            height: hPt * scale,
            format: pdfx.PdfPageImageFormat.jpeg,
            quality: settings.quality,
          );
          if (img == null) {
            throw StateError('Rendu de compression impossible');
          }
          jpg = img.bytes;
        } finally {
          await page.close();
        }
        final sf.PdfSection section = dest.sections!.add();
        section.pageSettings.margins.all = 0;
        section.pageSettings.size = ui.Size(wPt, hPt);
        final sf.PdfPage newPage = section.pages.add();
        newPage.graphics.drawImage(
          sf.PdfBitmap(jpg),
          ui.Rect.fromLTWH(0, 0, wPt, hPt),
        );
        onProgress?.call(i, total);
        if (i % 2 == 0) {
          await Future<void>.delayed(Duration.zero);
        }
      }
      final List<int> bytes = await dest.save();
      return Uint8List.fromList(bytes);
    } finally {
      dest.dispose();
      await srcDoc.close();
    }
  }
}
