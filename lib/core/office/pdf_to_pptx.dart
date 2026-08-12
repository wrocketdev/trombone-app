import 'dart:typed_data';

import 'package:pdfx/pdfx.dart' as pdfx;

import '../pdf/pdf_engine.dart';
import 'ooxml.dart';

/// Resolution de rendu des pages du PDF.
enum PptxQuality { standard, high }

extension PptxQualityX on PptxQuality {
  int get dpi {
    switch (this) {
      case PptxQuality.standard:
        return 150;
      case PptxQuality.high:
        return 220;
    }
  }
}

/// Convertit un PDF en presentation PowerPoint : une diapositive par page,
/// chaque page etant rendue en image pleine diapositive.
///
/// C'est volontairement une conversion visuelle : le texte des diapositives
/// n'est pas editable dans PowerPoint. En contrepartie la mise en page est
/// strictement identique a celle du PDF d'origine.
class PdfToPptx {
  PdfToPptx._();

  /// Garde-fou memoire : au-dela, un PDF grand format en haute qualite
  /// produirait des bitmaps de plusieurs centaines de Mo en RAM.
  static const double _maxPixelsPerSide = 3200;

  static Future<Uint8List> convert(
    Uint8List pdfBytes, {
    required PptxQuality quality,
    void Function(int done, int total)? onProgress,
    CancelToken? cancelToken,
  }) async {
    final pdfx.PdfDocument doc = await pdfx.PdfDocument.openData(pdfBytes);
    try {
      final int pages = doc.pagesCount;
      if (pages == 0) {
        throw StateError('Ce PDF ne contient aucune page.');
      }
      // Une etape supplementaire pour l'assemblage du fichier .pptx.
      final int total = pages + 1;
      final double scale = quality.dpi / 72.0;
      final List<PptxSlide> slides = <PptxSlide>[];

      for (var i = 1; i <= pages; i++) {
        if (cancelToken?.isCancelled ?? false) {
          throw CancelledException();
        }
        final pdfx.PdfPage page = await doc.getPage(i);
        try {
          final double widthPt = page.width;
          final double heightPt = page.height;
          double widthPx = widthPt * scale;
          double heightPx = heightPt * scale;
          final double longest = widthPx > heightPx ? widthPx : heightPx;
          if (longest > _maxPixelsPerSide) {
            final double factor = _maxPixelsPerSide / longest;
            widthPx *= factor;
            heightPx *= factor;
          }
          // backgroundColor est obligatoire : pdfx rend sur un fond
          // transparent par defaut, ce qui donnerait des diapositives
          // illisibles une fois compositees par PowerPoint.
          final pdfx.PdfPageImage? image = await page.render(
            width: widthPx,
            height: heightPx,
            format: pdfx.PdfPageImageFormat.png,
            quality: 100,
            backgroundColor: '#FFFFFF',
          );
          if (image == null) {
            throw StateError('Rendu de la page $i impossible.');
          }
          slides.add(
            PptxSlide.image(
              pngBytes: image.bytes,
              widthPt: widthPt,
              heightPt: heightPt,
            ),
          );
        } finally {
          await page.close();
        }
        onProgress?.call(i, total);
        if (i % 2 == 0) {
          // Laisse respirer la boucle d'evenements pour que la barre de
          // progression et le bouton Annuler restent reactifs.
          await Future<void>.delayed(Duration.zero);
        }
      }

      if (cancelToken?.isCancelled ?? false) {
        throw CancelledException();
      }
      final Uint8List bytes = Ooxml.buildPptx(slides);
      onProgress?.call(total, total);
      return bytes;
    } finally {
      await doc.close();
    }
  }

  /// 'rapport.pdf' -> 'rapport.pptx'
  static String suggestedName(String pdfName) {
    final int dot = pdfName.lastIndexOf('.');
    final String base = dot > 0 ? pdfName.substring(0, dot) : pdfName;
    final String cleaned = base.trim();
    return '${cleaned.isEmpty ? 'presentation' : cleaned}.pptx';
  }
}
