import 'dart:math' as math;
import 'dart:typed_data';
import 'dart:ui';

import 'package:syncfusion_flutter_pdf/pdf.dart' as sf;

/// Draws a rotated, translucent text watermark on every page of a PDF.
class WatermarkEngine {
  WatermarkEngine._();

  static Future<Uint8List> apply(
    Uint8List sourceBytes, {
    required String text,
    required double opacity,
    required double rotationDegrees,
    required double fontSize,
    required sf.PdfColor color,
    void Function(int done, int total)? onProgress,
  }) async {
    final sf.PdfDocument doc = sf.PdfDocument(inputBytes: sourceBytes);
    try {
      final int alpha = (opacity.clamp(0.0, 1.0) * 255).round();
      final sf.PdfSolidBrush brush = sf.PdfSolidBrush(
        sf.PdfColor(color.r, color.g, color.b, alpha),
      );
      // wordWrap.none keeps the watermark on a single line: the default
      // would break "CONFIDENTIEL" mid-word on narrow pages.
      final sf.PdfStringFormat format = sf.PdfStringFormat(
        alignment: sf.PdfTextAlignment.center,
        lineAlignment: sf.PdfVerticalAlignment.middle,
        wordWrap: sf.PdfWordWrapType.none,
      );

      final int total = doc.pages.count;
      for (var i = 0; i < total; i++) {
        final sf.PdfPage page = doc.pages[i];
        final Size size = page.size;
        final double centerX = size.width / 2;
        final double centerY = size.height / 2;
        final double bigSide = math.sqrt(
          size.width * size.width + size.height * size.height,
        );

        // Shrink the font on pages too narrow for the requested size so the
        // watermark always fits across the page diagonal in one piece.
        sf.PdfFont font = sf.PdfStandardFont(
          sf.PdfFontFamily.helvetica,
          fontSize,
          style: sf.PdfFontStyle.bold,
        );
        final double naturalWidth = font.measureString(text).width;
        final double maxWidth = bigSide * 0.92;
        if (naturalWidth > maxWidth && naturalWidth > 0) {
          final double fitted = (fontSize * maxWidth / naturalWidth).clamp(
            6.0,
            fontSize,
          );
          font = sf.PdfStandardFont(
            sf.PdfFontFamily.helvetica,
            fitted,
            style: sf.PdfFontStyle.bold,
          );
        }

        final sf.PdfGraphicsState state = page.graphics.save();
        page.graphics.translateTransform(centerX, centerY);
        page.graphics.rotateTransform(rotationDegrees);
        page.graphics.drawString(
          text,
          font,
          brush: brush,
          bounds: Rect.fromLTWH(-bigSide / 2, -bigSide / 2, bigSide, bigSide),
          format: format,
        );
        page.graphics.restore(state);

        onProgress?.call(i + 1, total);
      }

      final List<int> outBytes = await doc.save();
      return Uint8List.fromList(outBytes);
    } finally {
      doc.dispose();
    }
  }
}
