import 'dart:typed_data';
import 'dart:ui';

import 'package:syncfusion_flutter_pdf/pdf.dart' as sf;

import '../../models/page_selection.dart';

class CancelledException implements Exception {
  @override
  String toString() => 'Opération annulée';
}

/// Cooperative cancellation flag shared between a UI dialog and a running
/// build so the user can stop a long merge/compress without killing the app.
class CancelToken {
  bool _cancelled = false;
  bool get isCancelled => _cancelled;
  void cancel() => _cancelled = true;
}

/// Builds output PDFs by copying page content (as vector templates) from
/// already-open source documents into a brand new destination document.
/// Every feature (merge, recto-verso, split, extract, reorder) reduces to
/// "build a PDF from this ordered list of pages", so it all goes through
/// this one function.
class PdfEngine {
  PdfEngine._();

  static Future<Uint8List> buildPdf(
    List<PageSelection> pages, {
    void Function(int done, int total)? onProgress,
    CancelToken? cancelToken,
  }) async {
    if (pages.isEmpty) {
      throw ArgumentError('Aucune page à assembler');
    }
    final sf.PdfDocument dest = sf.PdfDocument();
    try {
      var done = 0;
      for (final sel in pages) {
        if (cancelToken?.isCancelled ?? false) {
          throw CancelledException();
        }
        final sf.PdfPage srcPage = sel.source.document.pages[sel.pageIndex];
        final sf.PdfTemplate template = srcPage.createTemplate();

        final int intrinsicIndex = srcPage.rotation.index;
        final int extraIndex = ((sel.extraRotationDegrees ~/ 90) % 4 + 4) % 4;
        final int totalIndex = (intrinsicIndex + extraIndex) % 4;
        final sf.PdfPageRotateAngle rotation =
            sf.PdfPageRotateAngle.values[totalIndex];

        // Each page gets its own section so it can carry its own size and
        // rotation — dest.pages.insert() assumes an already-loaded document
        // and null-derefs on a brand new one, so we go through sections
        // instead (the same mechanism Syncfusion itself uses for mixed
        // page sizes/orientations within a single document).
        final sf.PdfSection section = dest.sections!.add();
        section.pageSettings.margins.all = 0;
        section.pageSettings.size = template.size;
        section.pageSettings.rotate = rotation;
        final sf.PdfPage newPage = section.pages.add();
        newPage.graphics.drawPdfTemplate(template, Offset.zero);

        done++;
        onProgress?.call(done, pages.length);
        // Yield periodically so the UI thread can paint the progress bar
        // and pick up a cancellation tap.
        if (done % 2 == 0) {
          await Future<void>.delayed(Duration.zero);
        }
      }
      if (dest.pages.count == 0) {
        throw ArgumentError('Aucune page à assembler');
      }
      final List<int> bytes = await dest.save();
      return Uint8List.fromList(bytes);
    } finally {
      dest.dispose();
    }
  }

  /// Loads a standalone PDF from bytes without touching a destination doc —
  /// used by the organize screen (split / extract / reorder a single file).
  static sf.PdfDocument loadPdf(Uint8List bytes) {
    return sf.PdfDocument(inputBytes: bytes);
  }
}
