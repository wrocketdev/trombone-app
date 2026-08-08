import 'dart:typed_data';
import 'dart:ui';

import 'package:syncfusion_flutter_pdf/pdf.dart' as sf;

import 'pdf_engine.dart';

enum PageNumberPosition { bottomCenter, bottomRight, topCenter, topRight }

enum PageNumberFormat { pageOnly, pageOfTotal }

/// Stamps a page number on every page of an existing PDF, loaded fresh from
/// bytes so the source is never mutated in place.
class PageNumbersEngine {
  PageNumbersEngine._();

  static const double _margin = 24;
  static const double _boxHeight = 20;

  static Future<Uint8List> apply({
    required Uint8List pdfBytes,
    required PageNumberPosition position,
    required PageNumberFormat format,
    required int startNumber,
    void Function(int done, int total)? onProgress,
    CancelToken? cancelToken,
  }) async {
    final sf.PdfDocument doc = sf.PdfDocument(inputBytes: pdfBytes);
    try {
      final int total = doc.pages.count;
      final sf.PdfStandardFont font = sf.PdfStandardFont(
        sf.PdfFontFamily.helvetica,
        11,
      );
      final sf.PdfSolidBrush brush = sf.PdfSolidBrush(sf.PdfColor(60, 60, 60));
      final bool top =
          position == PageNumberPosition.topCenter ||
          position == PageNumberPosition.topRight;
      final bool right =
          position == PageNumberPosition.bottomRight ||
          position == PageNumberPosition.topRight;
      final sf.PdfStringFormat stringFormat = sf.PdfStringFormat(
        alignment: right
            ? sf.PdfTextAlignment.right
            : sf.PdfTextAlignment.center,
      );

      for (var i = 0; i < total; i++) {
        if (cancelToken?.isCancelled ?? false) {
          throw CancelledException();
        }
        final sf.PdfPage page = doc.pages[i];
        final int number = startNumber + i;
        final String label = format == PageNumberFormat.pageOnly
            ? '$number'
            : '$number / $total';

        final Size size = page.size;
        final double y = top ? _margin : size.height - _margin - _boxHeight;
        final Rect bounds = Rect.fromLTWH(
          _margin,
          y,
          size.width - _margin * 2,
          _boxHeight,
        );
        page.graphics.drawString(
          label,
          font,
          brush: brush,
          bounds: bounds,
          format: stringFormat,
        );

        onProgress?.call(i + 1, total);
        if ((i + 1) % 3 == 0) {
          await Future<void>.delayed(Duration.zero);
        }
      }

      final List<int> bytes = await doc.save();
      return Uint8List.fromList(bytes);
    } finally {
      doc.dispose();
    }
  }
}
