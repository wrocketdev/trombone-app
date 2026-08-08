import 'dart:typed_data';

import 'package:syncfusion_flutter_pdf/pdf.dart' as sf;

import '../pdf/layout_analyzer.dart';
import '../pdf/pdf_engine.dart' show CancelToken, CancelledException;
import 'ooxml.dart';

/// Levee quand le PDF choisi est protege par un mot de passe : on ne peut ni
/// l'ouvrir ni en extraire le texte tant qu'il n'a pas ete deverrouille.
class PdfLockedException implements Exception {
  const PdfLockedException();

  @override
  String toString() =>
      'Ce PDF est protege par un mot de passe et ne peut pas etre analyse.';
}

/// Le resultat de l'analyse d'un PDF avant conversion : la structure
/// reconstruite page par page, plus de quoi afficher un resume honnete a
/// l'utilisateur (« X pages, Y paragraphes, Z titres, N tableaux »).
class PdfToWordAnalysis {
  PdfToWordAnalysis(this.pages);

  /// Structure reconstruite, une entree par page du PDF source.
  final List<PageLayout> pages;

  int get pageCount => pages.length;

  int get paragraphCount => _count(
    (LayoutBlock b) => b.kind == LayoutBlockKind.paragraph && !b.isHeading,
  );

  int get headingCount => _count((LayoutBlock b) => b.isHeading);

  int get tableCount =>
      _count((LayoutBlock b) => b.kind == LayoutBlockKind.table);

  /// Nombre de fragments de texte trouves, tableaux compris. A zero, le PDF
  /// ne contient aucun texte extractible : c'est presque surement un scan.
  int get textFragmentCount {
    int total = 0;
    for (final PageLayout page in pages) {
      for (final LayoutBlock block in page.blocks) {
        if (block.kind == LayoutBlockKind.table) {
          for (final List<String> row in block.rows) {
            for (final String cell in row) {
              if (cell.trim().isNotEmpty) total++;
            }
          }
        } else {
          for (final LayoutRun run in block.runs) {
            if (run.text.trim().isNotEmpty) total++;
          }
        }
      }
    }
    return total;
  }

  /// False = aucun texte du tout, il faut passer par l'OCR avant de convertir.
  bool get hasText => textFragmentCount > 0;

  int _count(bool Function(LayoutBlock) test) {
    int total = 0;
    for (final PageLayout page in pages) {
      for (final LayoutBlock block in page.blocks) {
        if (test(block)) total++;
      }
    }
    return total;
  }
}

/// Conversion PDF -> Word (.docx).
///
/// Le texte, sa mise en forme (gras / italique / taille), les niveaux de titre
/// et les tableaux sont reconstruits a partir de la position des caracteres
/// dans le PDF (voir [LayoutAnalyzer]). La mise en page exacte — colonnes,
/// images, positions absolues — n'est volontairement pas reproduite : un
/// .docx est un flux de paragraphes, pas une toile de dessin.
class PdfToWord {
  PdfToWord._();

  /// Taille de police maximale acceptee par Word (1638 pt).
  static const double _maxFontSizePt = 1638;

  /// Analyse le PDF page par page. [onProgress] est appele apres chaque page.
  static Future<PdfToWordAnalysis> analyze(
    Uint8List pdfBytes, {
    void Function(int done, int total)? onProgress,
    CancelToken? cancelToken,
  }) async {
    sf.PdfDocument doc;
    try {
      doc = sf.PdfDocument(inputBytes: pdfBytes);
    } catch (e) {
      // Syncfusion leve une ArgumentError generique sur un PDF chiffre.
      if (e.toString().toLowerCase().contains('password')) {
        throw const PdfLockedException();
      }
      rethrow;
    }

    try {
      final int total = doc.pages.count;
      final List<PageLayout> pages = <PageLayout>[];
      onProgress?.call(0, total);

      for (int i = 0; i < total; i++) {
        if (cancelToken?.isCancelled ?? false) throw CancelledException();
        // Une page a la fois : l'analyse reste interruptible et la barre de
        // progression avance vraiment au lieu de figer sur un seul appel.
        pages.addAll(LayoutAnalyzer.analyze(doc, startPage: i, endPage: i));
        onProgress?.call(i + 1, total);
        // Rend la main a la boucle d'evenements pour que le dialogue se
        // redessine entre deux pages.
        await Future<void>.delayed(Duration.zero);
      }

      return PdfToWordAnalysis(pages);
    } finally {
      doc.dispose();
    }
  }

  /// Transforme une analyse en fichier .docx.
  static Future<Uint8List> buildDocx(
    PdfToWordAnalysis analysis, {
    void Function(int done, int total)? onProgress,
    CancelToken? cancelToken,
  }) async {
    final int total = analysis.pages.length;
    final List<DocxBlock> blocks = <DocxBlock>[];
    onProgress?.call(0, total);

    for (int i = 0; i < total; i++) {
      if (cancelToken?.isCancelled ?? false) throw CancelledException();

      // Saut de page entre deux pages du PDF, jamais apres la derniere.
      if (i > 0) blocks.add(DocxBlock.pageBreak());

      for (final LayoutBlock block in analysis.pages[i].blocks) {
        if (block.kind == LayoutBlockKind.table) {
          if (block.rows.isEmpty) continue;
          blocks.add(DocxBlock.table(rows: block.rows));
        } else {
          if (block.text.trim().isEmpty) continue;
          blocks.add(
            DocxBlock.paragraph(
              runs: block.runs
                  .map(
                    (LayoutRun r) => DocxRun(
                      r.text,
                      bold: r.bold,
                      italic: r.italic,
                      fontSizePt: _safeFontSize(r.fontSize),
                    ),
                  )
                  .toList(growable: false),
              style: _styleFor(block.headingLevel),
            ),
          );
        }
      }

      onProgress?.call(i + 1, total);
      await Future<void>.delayed(Duration.zero);
    }

    return Ooxml.buildDocx(blocks);
  }

  /// 0 = « taille heritee du style » cote OOXML : on y retombe pour toute
  /// valeur aberrante plutot que d'ecrire une taille `w:sz` invalide.
  static double _safeFontSize(double size) {
    if (!size.isFinite || size <= 0 || size > _maxFontSizePt) return 0;
    return size;
  }

  static DocxStyle _styleFor(int headingLevel) {
    switch (headingLevel) {
      case 1:
        return DocxStyle.heading1;
      case 2:
        return DocxStyle.heading2;
      case 3:
        return DocxStyle.heading3;
      default:
        return DocxStyle.normal;
    }
  }

  /// « rapport.pdf » -> « rapport.docx ».
  static String suggestedFileName(String sourceName) {
    String base = sourceName.trim();
    final int dot = base.lastIndexOf('.');
    if (dot > 0) base = base.substring(0, dot);
    base = base.replaceAll(RegExp(r'[\\/:*?"<>|]'), '_').trim();
    if (base.isEmpty) base = 'document';
    return '$base.docx';
  }
}
