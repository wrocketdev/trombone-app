import 'dart:math' as math;
import 'dart:typed_data';
import 'dart:ui';

import 'package:syncfusion_flutter_pdf/pdf.dart' as sf;

import '../pdf/pdf_engine.dart';
import 'ooxml.dart';

/// Rend chaque feuille d'un classeur .xlsx sous forme de vrai tableau dans un
/// PDF A4 paysage.
///
/// Limites assumees : seules les valeurs des cellules (telles qu'enregistrees
/// dans le fichier) sont reprises. Les couleurs, bordures personnalisees,
/// cellules fusionnees, images, graphiques et formules ne sont pas rendus.
class ExcelToPdf {
  ExcelToPdf._();

  // A4 paysage, en points.
  static const double _pageWidth = 842;
  static const double _pageHeight = 595;
  static const double _margin = 32;

  static const double _cellPadding = 3;
  static const double _minColumnWidth = 26;
  static const double _maxColumnWidth = 190;

  static const double _maxFontSize = 9;
  static const double _minFontSize = 6;

  /// Lit les feuilles d'un classeur (nom + grille de cellules).
  static List<XlsxSheet> readSheets(Uint8List xlsxBytes) =>
      Ooxml.readXlsx(xlsxBytes);

  /// Convertit un classeur complet en PDF.
  ///
  /// [repeatHeaderRow] : redessine la premiere ligne de la feuille en haut de
  /// chaque page de cette feuille.
  static Future<Uint8List> convert(
    Uint8List xlsxBytes, {
    bool repeatHeaderRow = true,
    void Function(int done, int total)? onProgress,
    CancelToken? cancelToken,
  }) async {
    final List<XlsxSheet> sheets = Ooxml.readXlsx(xlsxBytes);
    return convertSheets(
      sheets,
      repeatHeaderRow: repeatHeaderRow,
      onProgress: onProgress,
      cancelToken: cancelToken,
    );
  }

  /// Meme chose a partir de feuilles deja lues (evite de relire le fichier
  /// apres l'apercu affiche a l'ecran).
  static Future<Uint8List> convertSheets(
    List<XlsxSheet> sheets, {
    bool repeatHeaderRow = true,
    void Function(int done, int total)? onProgress,
    CancelToken? cancelToken,
  }) async {
    final int totalRows = sheets.fold<int>(
      0,
      (int sum, XlsxSheet s) => sum + math.max(s.rows.length, 1),
    );
    int done = 0;

    final sf.PdfDocument dest = sf.PdfDocument();
    try {
      final sf.PdfFont headingFont = sf.PdfStandardFont(
        sf.PdfFontFamily.helvetica,
        14,
        style: sf.PdfFontStyle.bold,
      );
      final sf.PdfFont noteFont = sf.PdfStandardFont(
        sf.PdfFontFamily.helvetica,
        9,
        style: sf.PdfFontStyle.italic,
      );
      final sf.PdfBrush headingBrush = sf.PdfSolidBrush(
        sf.PdfColor(20, 20, 20),
      );
      final sf.PdfBrush noteBrush = sf.PdfSolidBrush(
        sf.PdfColor(110, 110, 110),
      );

      for (final XlsxSheet sheet in sheets) {
        if (cancelToken?.isCancelled ?? false) throw CancelledException();

        final _TablePlan plan = _planTable(sheet);
        final List<List<String>> rows = sheet.rows;

        sf.PdfPage page = _newPage(dest);
        double y = _margin;

        page.graphics.drawString(
          sheet.name,
          headingFont,
          brush: headingBrush,
          bounds: Rect.fromLTWH(_margin, y, _contentWidth, 18),
          format: sf.PdfStringFormat(wordWrap: sf.PdfWordWrapType.none),
        );
        y += 24;

        if (rows.isEmpty) {
          page.graphics.drawString(
            'Feuille vide.',
            noteFont,
            brush: noteBrush,
            bounds: Rect.fromLTWH(_margin, y, _contentWidth, 16),
          );
          done++;
          onProgress?.call(done, totalRows);
          continue;
        }

        final List<String> headerRow = rows.first;
        _drawRow(page, headerRow, plan, y, isHeader: true);
        y += plan.rowHeight;

        for (int r = 1; r < rows.length; r++) {
          if (cancelToken?.isCancelled ?? false) throw CancelledException();

          if (y + plan.rowHeight > _pageHeight - _margin) {
            page = _newPage(dest);
            y = _margin;
            page.graphics.drawString(
              '${sheet.name} (suite)',
              noteFont,
              brush: noteBrush,
              bounds: Rect.fromLTWH(_margin, y, _contentWidth, 14),
              format: sf.PdfStringFormat(wordWrap: sf.PdfWordWrapType.none),
            );
            y += 18;
            if (repeatHeaderRow) {
              _drawRow(page, headerRow, plan, y, isHeader: true);
              y += plan.rowHeight;
            }
          }

          _drawRow(page, rows[r], plan, y, isHeader: false);
          y += plan.rowHeight;

          done++;
          if (done % 40 == 0) {
            onProgress?.call(done, totalRows);
            // Laisse le thread UI repeindre la barre de progression et
            // recuperer un appui sur « Annuler ».
            await Future<void>.delayed(Duration.zero);
          }
        }

        done++; // la ligne d'en-tete
        onProgress?.call(done, totalRows);
      }

      onProgress?.call(totalRows, totalRows);
      final List<int> bytes = await dest.save();
      return Uint8List.fromList(bytes);
    } finally {
      dest.dispose();
    }
  }

  static double get _contentWidth => _pageWidth - 2 * _margin;

  static sf.PdfPage _newPage(sf.PdfDocument dest) {
    // Un document neuf n'accepte pas dest.pages.insert() : on passe par une
    // section par page, seul chemin sur pour imposer une taille de page.
    final sf.PdfSection section = dest.sections!.add();
    section.pageSettings.margins.all = 0;
    // Sans orientation explicite, Syncfusion remet la taille en portrait
    // (842x595 ressort en 595x842) et le tableau deborderait de la page.
    section.pageSettings.orientation = sf.PdfPageOrientation.landscape;
    section.pageSettings.size = const Size(_pageWidth, _pageHeight);
    return section.pages.add();
  }

  // ---------------------------------------------------------------------
  // Mise en page du tableau
  // ---------------------------------------------------------------------

  /// Choisit une taille de police et des largeurs de colonnes qui tiennent
  /// dans la largeur utile de la page.
  static _TablePlan _planTable(XlsxSheet sheet) {
    final int columns = sheet.columnCount;
    if (columns == 0 || sheet.rows.isEmpty) {
      return _TablePlan(
        fontSize: _maxFontSize,
        widths: const <double>[],
        rowHeight: _maxFontSize * 1.7,
      );
    }

    // Mesurer chaque cellule pour chaque taille testee serait trop lent sur
    // un gros classeur : on ne retient que la chaine la plus longue de chaque
    // colonne (plus son en-tete) comme gabarit de mesure.
    final List<String> widest = List<String>.filled(columns, '');
    final List<String> headers = List<String>.filled(columns, '');
    for (int r = 0; r < sheet.rows.length; r++) {
      final List<String> row = sheet.rows[r];
      for (int c = 0; c < row.length && c < columns; c++) {
        final String text = _oneLine(row[c]);
        if (r == 0) headers[c] = text;
        if (text.length > widest[c].length) widest[c] = text;
      }
    }

    _TablePlan? fallback;
    for (double size = _maxFontSize; size >= _minFontSize; size -= 1) {
      final sf.PdfFont regular = sf.PdfStandardFont(
        sf.PdfFontFamily.helvetica,
        size,
      );
      final sf.PdfFont bold = sf.PdfStandardFont(
        sf.PdfFontFamily.helvetica,
        size,
        style: sf.PdfFontStyle.bold,
      );

      // Largeur ideale (texte entier) puis largeur plafonnee.
      final List<double> desired = List<double>.generate(columns, (int c) {
        double w = _minColumnWidth;
        if (widest[c].isNotEmpty) {
          w = math.max(w, regular.measureString(widest[c]).width);
        }
        if (headers[c].isNotEmpty) {
          w = math.max(w, bold.measureString(headers[c]).width);
        }
        return w + 2 * _cellPadding;
      });
      final List<double> widths = desired
          .map((double w) => math.min(w, _maxColumnWidth))
          .toList(growable: true);

      final double total = widths.fold<double>(
        0,
        (double a, double b) => a + b,
      );
      double scale = 1;
      if (total > _contentWidth) {
        scale = _contentWidth / total;
        for (int c = 0; c < columns; c++) {
          widths[c] *= scale;
        }
      } else {
        // Il reste de la place : on la rend aux colonnes plafonnees plutot que
        // de tronquer leur texte en laissant la page a moitie vide.
        final List<double> unmet = List<double>.generate(
          columns,
          (int c) => math.max(0, desired[c] - widths[c]),
        );
        final double totalUnmet = unmet.fold<double>(
          0,
          (double a, double b) => a + b,
        );
        if (totalUnmet > 0) {
          final double factor = math.min(
            1,
            (_contentWidth - total) / totalUnmet,
          );
          for (int c = 0; c < columns; c++) {
            widths[c] += unmet[c] * factor;
          }
        }
      }

      final double smallest = widths.reduce(
        (double a, double b) => a < b ? a : b,
      );

      final _TablePlan plan = _TablePlan(
        fontSize: size,
        widths: List<double>.unmodifiable(widths),
        rowHeight: math.max(size * 1.7, 12),
      );
      fallback = plan;

      // Une colonne doit rester assez large pour ~4 caracteres, sinon on
      // retente avec une police plus petite.
      if (scale == 1 || smallest >= size * 2.5 + 2 * _cellPadding) {
        return plan;
      }
    }
    return fallback!;
  }

  static void _drawRow(
    sf.PdfPage page,
    List<String> row,
    _TablePlan plan,
    double y, {
    required bool isHeader,
  }) {
    final sf.PdfGraphics g = page.graphics;
    final sf.PdfFont font = isHeader ? plan.boldFont : plan.regularFont;
    final sf.PdfBrush textBrush = isHeader
        ? plan.headerTextBrush
        : plan.textBrush;

    double x = _margin;
    for (int c = 0; c < plan.widths.length; c++) {
      final double w = plan.widths[c];
      final Rect cell = Rect.fromLTWH(x, y, w, plan.rowHeight);

      if (isHeader) {
        g.drawRectangle(brush: plan.headerFill, bounds: cell);
      }
      g.drawRectangle(pen: plan.gridPen, bounds: cell);

      final String raw = c < row.length ? _oneLine(row[c]) : '';
      if (raw.isNotEmpty) {
        final double inner = w - 2 * _cellPadding;
        final String text = _fit(raw, font, inner);
        if (text.isNotEmpty) {
          g.drawString(
            text,
            font,
            brush: textBrush,
            bounds: Rect.fromLTWH(x + _cellPadding, y, inner, plan.rowHeight),
            format: sf.PdfStringFormat(
              alignment: !isHeader && _looksNumeric(raw)
                  ? sf.PdfTextAlignment.right
                  : sf.PdfTextAlignment.left,
              lineAlignment: sf.PdfVerticalAlignment.middle,
              wordWrap: sf.PdfWordWrapType.none,
            ),
          );
        }
      }
      x += w;
    }
  }

  /// Une cellule tient sur une seule ligne : les retours a la ligne internes
  /// deviennent des espaces.
  static String _oneLine(String value) =>
      value.replaceAll(RegExp(r'[\r\n\t]+'), ' ').trim();

  /// Tronque avec des points de suspension plutot que de laisser le texte
  /// deborder sur la colonne voisine.
  static String _fit(String text, sf.PdfFont font, double maxWidth) {
    if (maxWidth <= 0) return '';
    if (font.measureString(text).width <= maxWidth) return text;

    const String ellipsis = '...';
    int low = 0;
    int high = text.length;
    while (low < high) {
      final int mid = (low + high + 1) ~/ 2;
      final double w = font
          .measureString('${text.substring(0, mid)}$ellipsis')
          .width;
      if (w <= maxWidth) {
        low = mid;
      } else {
        high = mid - 1;
      }
    }
    if (low <= 0) return '';
    // Ne pas couper une paire de substitution en deux (emoji, etc.).
    if (_isHighSurrogate(text.codeUnitAt(low - 1))) low--;
    if (low <= 0) return '';
    return '${text.substring(0, low)}$ellipsis';
  }

  static bool _isHighSurrogate(int unit) => unit >= 0xD800 && unit <= 0xDBFF;

  /// Alignement a droite pour ce qui ressemble a un nombre, comme dans Excel.
  static bool _looksNumeric(String value) {
    final String t = value
        .replaceAll(RegExp(r'[\s% €$£]'), '')
        .replaceAll(',', '.');
    if (t.isEmpty) return false;
    return double.tryParse(t) != null;
  }
}

class _TablePlan {
  _TablePlan({
    required this.fontSize,
    required this.widths,
    required this.rowHeight,
  }) : regularFont = sf.PdfStandardFont(sf.PdfFontFamily.helvetica, fontSize),
       boldFont = sf.PdfStandardFont(
         sf.PdfFontFamily.helvetica,
         fontSize,
         style: sf.PdfFontStyle.bold,
       );

  final double fontSize;
  final List<double> widths;
  final double rowHeight;
  final sf.PdfFont regularFont;
  final sf.PdfFont boldFont;

  final sf.PdfBrush headerFill = sf.PdfSolidBrush(sf.PdfColor(230, 230, 230));
  final sf.PdfBrush headerTextBrush = sf.PdfSolidBrush(sf.PdfColor(0, 0, 0));
  final sf.PdfBrush textBrush = sf.PdfSolidBrush(sf.PdfColor(25, 25, 25));
  final sf.PdfPen gridPen = sf.PdfPen(sf.PdfColor(160, 160, 160), width: 0.4);
}
