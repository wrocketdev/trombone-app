import 'dart:typed_data';
import 'dart:ui';

import 'package:pdfx/pdfx.dart' as pdfx;
import 'package:syncfusion_flutter_pdf/pdf.dart' as sf;

import 'pdf_engine.dart';

/// A single redaction box, expressed as a fraction (0..1) of the page **as it
/// is displayed** — that is, after the page's /Rotate entry has been applied,
/// because that is the space the user drags in on screen.
class RedactRect {
  const RedactRect({
    required this.left,
    required this.top,
    required this.width,
    required this.height,
  });

  final double left;
  final double top;
  final double width;
  final double height;

  Rect scaledTo(double pageWidth, double pageHeight) => Rect.fromLTWH(
    left * pageWidth,
    top * pageHeight,
    width * pageWidth,
    height * pageHeight,
  );

  @override
  String toString() => 'RedactRect($left, $top, $width x $height)';
}

/// True redaction: the masked areas are not merely covered, the whole page is
/// re-imaged so the glyphs that were underneath no longer exist in the output.
///
/// Painting a black rectangle over text in a PDF hides nothing — the text
/// operators stay in the content stream and any reader can still select and
/// copy them. So [redact] runs two passes: pass 1 paints the boxes, pass 2
/// rasterises every page of the result and rebuilds a fresh document from
/// those images, which is what actually destroys the hidden text.
class RedactEngine {
  RedactEngine._();

  /// Rasterisation resolution of the second pass, in dots per inch.
  static const double dpi = 200;

  static const double _pointsPerInch = 72;

  static Future<Uint8List> redact(
    Uint8List sourceBytes, {
    required Map<int, List<RedactRect>> rectsByPage,
    void Function(int done, int total)? onProgress,
    CancelToken? cancelToken,
  }) async {
    final int pageCount = await _pageCount(sourceBytes);
    if (pageCount == 0) {
      throw ArgumentError('Le document ne contient aucune page.');
    }
    // Both passes touch every page, so the progress bar spans 2 x pageCount.
    final int total = pageCount * 2;

    final Uint8List masked = await _paintBoxes(
      sourceBytes,
      rectsByPage: rectsByPage,
      total: total,
      onProgress: onProgress,
      cancelToken: cancelToken,
    );

    return _rasterizeAll(
      masked,
      done: pageCount,
      total: total,
      onProgress: onProgress,
      cancelToken: cancelToken,
    );
  }

  static Future<int> _pageCount(Uint8List bytes) async {
    final sf.PdfDocument doc = sf.PdfDocument(inputBytes: bytes);
    try {
      return doc.pages.count;
    } finally {
      doc.dispose();
    }
  }

  /// Pass 1 — paint an opaque black rectangle over every requested area.
  static Future<Uint8List> _paintBoxes(
    Uint8List sourceBytes, {
    required Map<int, List<RedactRect>> rectsByPage,
    required int total,
    void Function(int done, int total)? onProgress,
    CancelToken? cancelToken,
  }) async {
    final sf.PdfDocument doc = sf.PdfDocument(inputBytes: sourceBytes);
    try {
      final sf.PdfSolidBrush black = sf.PdfSolidBrush(sf.PdfColor(0, 0, 0));
      final int count = doc.pages.count;
      for (var i = 0; i < count; i++) {
        _checkCancelled(cancelToken);
        final List<RedactRect> rects = rectsByPage[i] ?? const <RedactRect>[];
        if (rects.isNotEmpty) {
          final sf.PdfPage page = doc.pages[i];
          final Size size = page.size;
          // On a LOADED page Syncfusion does NOT apply /Rotate to the
          // graphics transform (it only does that for pages it authored),
          // while the on-screen preview comes from pdfx, which does. So the
          // user's fractions live in rotated space and have to be mapped
          // back into the unrotated media box before drawing.
          final int quarterTurns = page.rotation.index;
          for (final RedactRect rect in rects) {
            page.graphics.drawRectangle(
              brush: black,
              bounds: _unrotate(
                rect,
                quarterTurns,
              ).scaledTo(size.width, size.height),
            );
          }
        }
        onProgress?.call(i + 1, total);
        if (i % 4 == 3) await Future<void>.delayed(Duration.zero);
      }
      return Uint8List.fromList(await doc.save());
    } finally {
      doc.dispose();
    }
  }

  /// Pass 2 — re-image every page. This is the step that removes the text.
  ///
  /// Pages without any box are rasterised too: skipping them would leave a
  /// mixed text/image document in which the redacted pages are trivially
  /// identifiable, and would make page sizes inconsistent between passes.
  static Future<Uint8List> _rasterizeAll(
    Uint8List maskedBytes, {
    required int done,
    required int total,
    void Function(int done, int total)? onProgress,
    CancelToken? cancelToken,
  }) async {
    final pdfx.PdfDocument source = await pdfx.PdfDocument.openData(
      maskedBytes,
    );
    final sf.PdfDocument out = sf.PdfDocument();
    try {
      final int count = source.pagesCount;
      for (var n = 1; n <= count; n++) {
        _checkCancelled(cancelToken);
        final pdfx.PdfPage page = await source.getPage(n);
        Uint8List? png;
        double widthPt = page.width;
        double heightPt = page.height;
        try {
          if (widthPt <= 0 || heightPt <= 0) {
            throw StateError('Dimensions invalides pour la page $n');
          }
          final double scale = dpi / _pointsPerInch;
          // backgroundColor is mandatory: pdfx renders on a transparent
          // canvas by default, which would give a black page here.
          final pdfx.PdfPageImage? image = await page.render(
            width: (widthPt * scale).roundToDouble(),
            height: (heightPt * scale).roundToDouble(),
            format: pdfx.PdfPageImageFormat.png,
            backgroundColor: '#FFFFFF',
          );
          png = image?.bytes;
        } finally {
          await page.close();
        }
        if (png == null) {
          throw StateError('Rendu impossible pour la page $n');
        }

        final sf.PdfSection section = out.sections!.add();
        section.pageSettings.margins.all = 0;
        section.pageSettings.size = Size(widthPt, heightPt);
        final sf.PdfPage outPage = section.pages.add();
        outPage.graphics.drawImage(
          sf.PdfBitmap(png),
          Rect.fromLTWH(0, 0, widthPt, heightPt),
        );

        onProgress?.call(done + n, total);
        await Future<void>.delayed(Duration.zero);
      }
      return Uint8List.fromList(await out.save());
    } finally {
      out.dispose();
      await source.close();
    }
  }

  /// Maps a fractional rectangle from displayed (rotated) space back to the
  /// page's own unrotated coordinate space.
  static RedactRect _unrotate(RedactRect rect, int quarterTurns) {
    switch (quarterTurns & 3) {
      case 1: // /Rotate 90
        return RedactRect(
          left: rect.top,
          top: 1 - rect.left - rect.width,
          width: rect.height,
          height: rect.width,
        );
      case 2: // /Rotate 180
        return RedactRect(
          left: 1 - rect.left - rect.width,
          top: 1 - rect.top - rect.height,
          width: rect.width,
          height: rect.height,
        );
      case 3: // /Rotate 270
        return RedactRect(
          left: 1 - rect.top - rect.height,
          top: rect.left,
          width: rect.height,
          height: rect.width,
        );
      default:
        return rect;
    }
  }

  static void _checkCancelled(CancelToken? token) {
    if (token?.isCancelled ?? false) throw CancelledException();
  }
}
