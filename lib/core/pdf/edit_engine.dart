import 'dart:typed_data';
import 'dart:ui';

import 'package:syncfusion_flutter_pdf/pdf.dart' as sf;

enum EditAnnotationType { text, highlight }

/// A single stamp placed by the user on one page, in fractional page
/// coordinates (0..1, anchored top-left) so it survives independently of
/// whatever pixel size the page was rendered at on screen.
class EditAnnotation {
  const EditAnnotation.text({
    required this.dx,
    required this.dy,
    required this.text,
    required this.fontSize,
  }) : type = EditAnnotationType.text,
       w = 0,
       h = 0;

  const EditAnnotation.highlight({
    required this.dx,
    required this.dy,
    required this.w,
    required this.h,
  }) : type = EditAnnotationType.highlight,
       text = '',
       fontSize = 0;

  final EditAnnotationType type;
  final double dx;
  final double dy;
  final String text;
  final double fontSize;
  final double w;
  final double h;
}

/// Draws basic annotations (text stamps, highlight rectangles) onto an
/// existing PDF's pages, in place. Not a real editor — it can only add
/// content, never modify what was already on the page.
class EditEngine {
  EditEngine._();

  static Future<Uint8List> apply(
    Uint8List bytes,
    Map<int, List<EditAnnotation>> annotationsByPage,
  ) async {
    final sf.PdfDocument doc = sf.PdfDocument(inputBytes: bytes);
    try {
      for (final entry in annotationsByPage.entries) {
        final int pageIndex = entry.key;
        if (pageIndex < 0 || pageIndex >= doc.pages.count) continue;
        if (entry.value.isEmpty) continue;

        final sf.PdfPage page = doc.pages[pageIndex];
        final Size size = page.size;

        for (final ann in entry.value) {
          if (ann.type == EditAnnotationType.text) {
            page.graphics.drawString(
              ann.text,
              sf.PdfStandardFont(sf.PdfFontFamily.helvetica, ann.fontSize),
              brush: sf.PdfSolidBrush(sf.PdfColor(0, 0, 0)),
              bounds: Rect.fromLTWH(
                ann.dx * size.width,
                ann.dy * size.height,
                300,
                ann.fontSize * 1.4,
              ),
            );
          } else {
            page.graphics.drawRectangle(
              brush: sf.PdfSolidBrush(sf.PdfColor(255, 255, 0, 90)),
              bounds: Rect.fromLTWH(
                ann.dx * size.width,
                ann.dy * size.height,
                ann.w * size.width,
                ann.h * size.height,
              ),
            );
          }
        }
      }
      final List<int> out = await doc.save();
      return Uint8List.fromList(out);
    } finally {
      doc.dispose();
    }
  }
}
