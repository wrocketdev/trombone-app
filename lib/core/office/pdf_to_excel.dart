import 'dart:typed_data';

import 'package:syncfusion_flutter_pdf/pdf.dart' as sf;

import '../pdf/layout_analyzer.dart';
import '../pdf/pdf_engine.dart' show CancelToken, CancelledException;
import 'ooxml.dart';

/// Ce qu'une analyse a reellement trouve dans le PDF.
///
/// L'analyse (couteuse) est faite une seule fois : [pages] conserve la
/// structure reconstruite pour que l'utilisateur puisse basculer l'option
/// « texte hors tableaux » sans tout re-analyser.
class PdfToExcelAnalysis {
  PdfToExcelAnalysis({required this.pages})
    : tableCount = pages.fold<int>(
        0,
        (int n, PageLayout p) =>
            n +
            p.blocks
                .where((LayoutBlock b) => b.kind == LayoutBlockKind.table)
                .length,
      ),
      paragraphCount = pages.fold<int>(
        0,
        (int n, PageLayout p) =>
            n +
            p.blocks
                .where(
                  (LayoutBlock b) =>
                      b.kind == LayoutBlockKind.paragraph &&
                      b.text.trim().isNotEmpty,
                )
                .length,
      ),
      pagesWithTables = pages
          .where(
            (PageLayout p) => p.blocks.any(
              (LayoutBlock b) => b.kind == LayoutBlockKind.table,
            ),
          )
          .map((PageLayout p) => p.pageIndex + 1)
          .toList(growable: false);

  /// Structure reconstruite, une entree par page du document.
  final List<PageLayout> pages;

  /// Nombre total de tableaux detectes.
  final int tableCount;

  /// Nombre total de paragraphes hors tableaux (texte non vide).
  final int paragraphCount;

  /// Numeros de page (1-base) contenant au moins un tableau.
  final List<int> pagesWithTables;

  int get pageCount => pages.length;

  bool get hasTables => tableCount > 0;

  /// Vrai si le document ne contient aucun texte extractible : PDF purement
  /// scanne, seule l'OCR pourrait en tirer quelque chose.
  bool get isScanned => tableCount == 0 && paragraphCount == 0;

  /// Y a-t-il quelque chose a exporter avec ces reglages ?
  bool canExport({required bool includeParagraphs}) =>
      hasTables || (includeParagraphs && paragraphCount > 0);
}

/// Conversion PDF -> classeur Excel (.xlsx).
///
/// Seuls les tableaux ont un sens dans un tableur : le moteur s'appuie donc
/// sur la detection de tableaux de [LayoutAnalyzer] et n'invente rien. Une
/// feuille par page contenant au moins un tableau ; plusieurs tableaux d'une
/// meme page sont empiles dans la meme feuille, separes par une ligne vide.
class PdfToExcel {
  PdfToExcel._();

  /// Analyse le PDF page par page (progression + annulation possibles).
  ///
  /// Leve l'exception de Syncfusion si le fichier est illisible ou protege
  /// par mot de passe : c'est a l'appelant de l'afficher.
  static Future<PdfToExcelAnalysis> analyze(
    Uint8List pdfBytes, {
    CancelToken? cancelToken,
    void Function(int done, int total)? onProgress,
  }) async {
    final sf.PdfDocument doc = sf.PdfDocument(inputBytes: pdfBytes);
    try {
      final int total = doc.pages.count;
      final List<PageLayout> pages = <PageLayout>[];
      onProgress?.call(0, total);
      for (var i = 0; i < total; i++) {
        if (cancelToken?.isCancelled ?? false) throw CancelledException();
        // Page par page : c'est ce qui permet d'avancer la barre de
        // progression et de repondre a l'annulation sur un gros document.
        pages.addAll(LayoutAnalyzer.analyze(doc, startPage: i, endPage: i));
        onProgress?.call(i + 1, total);
        // Rend la main a la boucle d'evenements pour que le dialogue de
        // progression se redessine.
        await Future<void>.delayed(Duration.zero);
      }
      return PdfToExcelAnalysis(pages: pages);
    } finally {
      doc.dispose();
    }
  }

  /// Construit le classeur a partir d'une analyse deja faite.
  ///
  /// Renvoie null s'il n'y a rien a exporter : on ne genere jamais un classeur
  /// vide. Avec [includeParagraphs], le texte hors tableaux est ajoute en fin
  /// de feuille, une ligne d'une seule colonne par paragraphe.
  static Uint8List? build(
    PdfToExcelAnalysis analysis, {
    bool includeParagraphs = false,
  }) {
    final List<XlsxSheet> sheets = <XlsxSheet>[];

    for (final PageLayout page in analysis.pages) {
      final List<LayoutBlock> tables = page.blocks
          .where((LayoutBlock b) => b.kind == LayoutBlockKind.table)
          .toList(growable: false);
      final List<LayoutBlock> paragraphs = includeParagraphs
          ? page.blocks
                .where(
                  (LayoutBlock b) =>
                      b.kind == LayoutBlockKind.paragraph &&
                      b.text.trim().isNotEmpty,
                )
                .toList(growable: false)
          : const <LayoutBlock>[];

      if (tables.isEmpty && paragraphs.isEmpty) continue;

      final List<List<String>> rows = <List<String>>[];
      for (final LayoutBlock table in tables) {
        if (rows.isNotEmpty) rows.add(<String>['']);
        rows.addAll(_normalise(table.rows));
      }
      if (paragraphs.isNotEmpty && rows.isNotEmpty) rows.add(<String>['']);
      for (final LayoutBlock p in paragraphs) {
        rows.add(<String>[p.text.trim()]);
      }
      if (rows.isEmpty) continue;

      sheets.add(XlsxSheet(name: 'Page ${page.pageIndex + 1}', rows: rows));
    }

    if (sheets.isEmpty) return null;
    return Ooxml.buildXlsx(sheets);
  }

  /// Analyse puis construit, pour les appels en une seule passe.
  static Future<Uint8List?> convert(
    Uint8List pdfBytes, {
    bool includeParagraphs = false,
    CancelToken? cancelToken,
    void Function(int done, int total)? onProgress,
  }) async {
    final PdfToExcelAnalysis analysis = await analyze(
      pdfBytes,
      cancelToken: cancelToken,
      onProgress: onProgress,
    );
    return build(analysis, includeParagraphs: includeParagraphs);
  }

  /// Toutes les lignes d'un tableau ramenees au meme nombre de colonnes.
  static List<List<String>> _normalise(List<List<String>> rows) {
    var columns = 0;
    for (final List<String> r in rows) {
      if (r.length > columns) columns = r.length;
    }
    if (columns == 0) return const <List<String>>[];
    return rows
        .map(
          (List<String> r) => List<String>.generate(
            columns,
            (int i) => i < r.length ? r[i].trim() : '',
            growable: false,
          ),
        )
        .toList(growable: false);
  }
}
