import 'dart:convert';
import 'dart:math' as math;
import 'dart:typed_data';
import 'dart:ui';

import 'package:archive/archive.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart' as sf;
import 'package:xml/xml.dart';

/// Rendu .docx -> PDF avec mise en forme (et non plus simple extraction de
/// texte brut).
///
/// Le fichier Word est une archive ZIP de parties XML : on lit
/// `word/document.xml` (contenu), `word/styles.xml` (styles nommes) et
/// `word/numbering.xml` (listes), puis on remet le tout en page nous-memes sur
/// des pages A4 avec les 14 polices standard du PDF (famille Helvetica).
///
/// Ce que le rendu reproduit : gras, italique, souligne, barre, taille de
/// police, couleur du texte, titres, alignement, retraits, listes a puces et
/// numerotees, tableaux (bordures, fusion horizontale de colonnes), sauts de
/// page, taille et marges de page de la section Word.
///
/// Ce que le rendu ne reproduit PAS : images et formes, en-tetes/pieds de page,
/// polices reelles (tout est rendu en Helvetica), colonnes, zones de texte,
/// notes de bas de page, arriere-plans/trames de cellules, fusion verticale de
/// cellules, interlignage exact, alphabets non latins (voir les notes).
class DocxRenderer {
  DocxRenderer._();

  /// Rend un .docx en PDF pagine. Leve une [FormatException] si l'archive
  /// n'est pas un document Word exploitable.
  static Future<Uint8List> renderToPdf(Uint8List docxBytes) async {
    final _ParsedDoc parsed = _DocxParser(docxBytes).parse();
    final sf.PdfDocument pdf = sf.PdfDocument();
    try {
      _PdfPainter(pdf, parsed.setup).render(parsed.blocks);
      final List<int> bytes = await pdf.save();
      return Uint8List.fromList(bytes);
    } finally {
      pdf.dispose();
    }
  }

  /// Meme rendu, mais renvoie un [sf.PdfDocument] deja CHARGE (sauvegarde puis
  /// rechargement) : c'est indispensable pour que `createTemplate()` fonctionne
  /// dans le moteur de fusion.
  static Future<sf.PdfDocument> renderToDocument(Uint8List docxBytes) async {
    final Uint8List bytes = await renderToPdf(docxBytes);
    return sf.PdfDocument(inputBytes: bytes);
  }
}

// ===========================================================================
// Modele interne
// ===========================================================================

enum _Align { left, center, right }

/// Puce des listes. U+2022 est absent des polices standard telles que
/// Syncfusion les encode ; le point median Latin-1 sert donc de marqueur, et
/// le rendu le remplace par un vrai disque plein dessine a la main.
const String bulletChar = '·';

/// Mise en forme d'un fragment de texte homogene.
class _RunStyle {
  const _RunStyle({
    this.bold = false,
    this.italic = false,
    this.underline = false,
    this.strike = false,
    this.sizePt = 11,
    this.rgb = 0,
  });

  final bool bold;
  final bool italic;
  final bool underline;
  final bool strike;
  final double sizePt;
  final int rgb;

  _RunStyle copyWith({
    bool? bold,
    bool? italic,
    bool? underline,
    bool? strike,
    double? sizePt,
    int? rgb,
  }) {
    return _RunStyle(
      bold: bold ?? this.bold,
      italic: italic ?? this.italic,
      underline: underline ?? this.underline,
      strike: strike ?? this.strike,
      sizePt: sizePt ?? this.sizePt,
      rgb: rgb ?? this.rgb,
    );
  }

  /// Cle de cache de police : seuls la taille et le couple gras/italique
  /// changent la police PDF utilisee.
  String get fontKey =>
      '${sizePt.toStringAsFixed(2)}|${bold ? 1 : 0}${italic ? 1 : 0}';

  @override
  bool operator ==(Object other) =>
      other is _RunStyle &&
      other.bold == bold &&
      other.italic == italic &&
      other.underline == underline &&
      other.strike == strike &&
      other.sizePt == sizePt &&
      other.rgb == rgb;

  @override
  int get hashCode => Object.hash(bold, italic, underline, strike, sizePt, rgb);
}

class _Run {
  const _Run(this.text, this.style);
  final String text;
  final _RunStyle style;
}

abstract class _Block {
  const _Block();
}

class _PageBreak extends _Block {
  const _PageBreak();
}

class _Para extends _Block {
  _Para({
    required this.runs,
    required this.baseStyle,
    this.align = _Align.left,
    this.indentPt = 0,
    this.hangingPt = 0,
    this.marker,
    this.spaceBeforePt = 0,
    this.spaceAfterPt = 6,
  });

  final List<_Run> runs;
  final _RunStyle baseStyle;
  final _Align align;
  final double indentPt;
  final double hangingPt;
  final String? marker;
  final double spaceBeforePt;
  final double spaceAfterPt;
}

class _Cell {
  _Cell(this.paras, this.gridSpan);
  final List<_Para> paras;
  final int gridSpan;
}

class _Row {
  _Row(this.cells);
  final List<_Cell> cells;
}

class _Table extends _Block {
  _Table(this.rows, this.colRatios);
  final List<_Row> rows;

  /// Largeurs relatives des colonnes (somme quelconque, normalisee au rendu).
  final List<double> colRatios;
}

class _PageSetup {
  const _PageSetup({
    required this.width,
    required this.height,
    required this.marginL,
    required this.marginR,
    required this.marginT,
    required this.marginB,
  });

  final double width;
  final double height;
  final double marginL;
  final double marginR;
  final double marginT;
  final double marginB;
}

class _ParsedDoc {
  const _ParsedDoc(this.setup, this.blocks);
  final _PageSetup setup;
  final List<_Block> blocks;
}

// ===========================================================================
// Lecture du .docx
// ===========================================================================

/// Definition d'un style nomme (`word/styles.xml`).
class _StyleDef {
  String? basedOn;
  String? name;
  double? sizePt;
  bool? bold;
  bool? italic;
  bool? underline;
  _Align? align;
  int? outlineLvl;
  double? indentLeftPt;
  double? spaceBeforePt;
  double? spaceAfterPt;
}

/// Style de paragraphe resolu (heritage `basedOn` applique).
class _ParaStyle {
  _ParaStyle({
    required this.run,
    required this.align,
    required this.indentLeftPt,
    required this.headingLevel,
    required this.spaceBeforePt,
    required this.spaceAfterPt,
  });
  _RunStyle run;
  _Align align;
  double indentLeftPt;

  /// -1 = texte courant, 0 = Titre du document, 1..n = Titre n.
  int headingLevel;
  double spaceBeforePt;
  double spaceAfterPt;
}

class _NumLevel {
  _NumLevel(this.format, this.text, this.indentPt, this.hangingPt);
  final String format; // bullet, decimal, lowerLetter, upperRoman...
  final String text; // ex. « %1. »
  final double? indentPt;
  final double? hangingPt;
}

class _DocxParser {
  _DocxParser(this._bytes);

  final Uint8List _bytes;

  static const double _twipsPerPoint = 20.0;
  static const double _defaultBodySize = 11.0;

  final Map<String, _StyleDef> _styles = <String, _StyleDef>{};
  final Map<String, _ParaStyle> _resolved = <String, _ParaStyle>{};

  /// numId -> (ilvl -> definition de niveau)
  final Map<String, Map<int, _NumLevel>> _numbering =
      <String, Map<int, _NumLevel>>{};

  /// Compteurs de listes numerotees : numId -> compteur par niveau.
  final Map<String, List<int>> _counters = <String, List<int>>{};

  _RunStyle _defaultRun = const _RunStyle(sizePt: _defaultBodySize);
  String? _defaultParaStyleId;

  _ParsedDoc parse() {
    Archive archive;
    try {
      archive = ZipDecoder().decodeBytes(_bytes);
    } catch (_) {
      throw const FormatException(
        "Ce fichier n'est pas un document Word valide (archive illisible).",
      );
    }
    final String? documentXml = _part(archive, 'word/document.xml');
    if (documentXml == null) {
      throw const FormatException(
        'Document Word invalide : word/document.xml est introuvable.',
      );
    }

    _readStyles(_part(archive, 'word/styles.xml'));
    _readNumbering(_part(archive, 'word/numbering.xml'));

    XmlDocument doc;
    try {
      doc = XmlDocument.parse(documentXml);
    } on XmlException {
      throw const FormatException(
        'Document Word invalide : contenu XML illisible.',
      );
    }

    final Iterable<XmlElement> bodies = doc.findAllElements(
      'body',
      namespaceUri: '*',
    );
    if (bodies.isEmpty) {
      throw const FormatException('Document Word vide : aucun corps de texte.');
    }
    final XmlElement body = bodies.first;

    final List<_Block> blocks = <_Block>[];
    _collect(body.childElements, blocks);

    return _ParsedDoc(_readPageSetup(body), blocks);
  }

  // -------------------------------------------------------------------------
  // Parcours du corps
  // -------------------------------------------------------------------------

  void _collect(Iterable<XmlElement> elements, List<_Block> out) {
    for (final XmlElement el in elements) {
      switch (el.name.local) {
        case 'p':
          _addParagraph(el, out);
        case 'tbl':
          final _Table? table = _parseTable(el);
          if (table != null) out.add(table);
        case 'sdt':
          // Controle de contenu : le contenu reel est dans <w:sdtContent>.
          for (final XmlElement content in el.findElements(
            'sdtContent',
            namespaceUri: '*',
          )) {
            _collect(content.childElements, out);
          }
        default:
          break; // sectPr, bookmarkStart, proofErr... : rien a rendre
      }
    }
  }

  // -------------------------------------------------------------------------
  // Paragraphes
  // -------------------------------------------------------------------------

  void _addParagraph(XmlElement p, List<_Block> out) {
    final XmlElement? pPr = _child(p, 'pPr');
    final String? styleId = _attr(_child(pPr, 'pStyle'), 'val');
    final _ParaStyle style = _paraStyle(styleId);

    if (pPr != null && _child(pPr, 'pageBreakBefore') != null) {
      final bool on = _onOff(_child(pPr, 'pageBreakBefore')) ?? true;
      if (on) out.add(const _PageBreak());
    }

    _Align align = style.align;
    final String? jc = _attr(_child(pPr, 'jc'), 'val');
    if (jc != null) align = _alignFromWord(jc) ?? align;

    // Mise en forme heritee du style, surchargee par le <w:rPr> du paragraphe
    // (qui s'applique a tous ses runs).
    _RunStyle base = style.run;
    final XmlElement? paraRPr = _child(pPr, 'rPr');
    if (paraRPr != null) base = _applyRunProps(base, paraRPr);

    double indent = style.indentLeftPt;
    double hanging = 0;
    String? marker;

    // Liste : <w:numPr> donne le numId et le niveau.
    final XmlElement? numPr = _child(pPr, 'numPr');
    if (numPr != null) {
      final String? numId = _attr(_child(numPr, 'numId'), 'val');
      final int ilvl =
          int.tryParse(_attr(_child(numPr, 'ilvl'), 'val') ?? '') ?? 0;
      if (numId != null && numId != '0') {
        final _NumLevel? level = _numbering[numId]?[ilvl];
        marker = _marker(numId, ilvl, level);
        indent = level?.indentPt ?? (18.0 * (ilvl + 1));
        hanging = level?.hangingPt ?? 18.0;
      } else {
        marker = bulletChar;
        indent = 18.0 * (ilvl + 1);
        hanging = 18.0;
      }
    }

    // Le retrait explicite du paragraphe l'emporte sur celui de la liste.
    final XmlElement? ind = _child(pPr, 'ind');
    if (ind != null) {
      final double? left = _twips(_attr(ind, 'left') ?? _attr(ind, 'start'));
      if (left != null) indent = left;
      final double? hang = _twips(_attr(ind, 'hanging'));
      if (hang != null) hanging = hang;
    }

    double spaceBefore = style.spaceBeforePt;
    double spaceAfter = style.spaceAfterPt;
    final XmlElement? spacing = _child(pPr, 'spacing');
    if (spacing != null) {
      final double? before = _twips(_attr(spacing, 'before'));
      final double? after = _twips(_attr(spacing, 'after'));
      if (before != null) spaceBefore = before;
      if (after != null) spaceAfter = after;
    }
    spaceBefore = spaceBefore.clamp(0.0, 48.0);
    spaceAfter = spaceAfter.clamp(0.0, 48.0);

    final List<_Run> runs = <_Run>[];
    _collectRuns(p, base, runs);

    // Un saut de page en plein paragraphe (\f) le coupe en deux.
    final List<List<_Run>> segments = _splitOnPageBreak(runs);
    for (int i = 0; i < segments.length; i++) {
      if (i > 0) out.add(const _PageBreak());
      out.add(
        _Para(
          runs: segments[i],
          baseStyle: base,
          align: align,
          indentPt: math.max(0, indent),
          hangingPt: math.max(0, hanging),
          // La puce n'est portee que par le premier morceau.
          marker: i == 0 ? marker : null,
          spaceBeforePt: i == 0 ? spaceBefore : 0,
          spaceAfterPt: i == segments.length - 1 ? spaceAfter : 0,
        ),
      );
    }
  }

  List<List<_Run>> _splitOnPageBreak(List<_Run> runs) {
    final List<List<_Run>> segments = <List<_Run>>[<_Run>[]];
    for (final _Run run in runs) {
      if (!run.text.contains('\f')) {
        segments.last.add(run);
        continue;
      }
      final List<String> pieces = run.text.split('\f');
      for (int i = 0; i < pieces.length; i++) {
        if (i > 0) segments.add(<_Run>[]);
        if (pieces[i].isNotEmpty) segments.last.add(_Run(pieces[i], run.style));
      }
    }
    return segments;
  }

  /// Descend dans le paragraphe pour recuperer les runs, y compris ceux
  /// emballes dans un lien hypertexte, une insertion suivie, etc.
  void _collectRuns(XmlElement parent, _RunStyle base, List<_Run> out) {
    for (final XmlElement el in parent.childElements) {
      switch (el.name.local) {
        case 'r':
          _parseRun(el, base, out);
        case 'hyperlink':
        case 'ins':
        case 'smartTag':
        case 'bdo':
        case 'dir':
          _collectRuns(el, base, out);
        case 'sdt':
          for (final XmlElement content in el.findElements(
            'sdtContent',
            namespaceUri: '*',
          )) {
            _collectRuns(content, base, out);
          }
        case 'del':
          break; // texte supprime en suivi de modifications
        default:
          break;
      }
    }
  }

  void _parseRun(XmlElement r, _RunStyle base, List<_Run> out) {
    final XmlElement? rPr = _child(r, 'rPr');
    final _RunStyle style = rPr == null ? base : _applyRunProps(base, rPr);
    final StringBuffer buffer = StringBuffer();

    void flush() {
      if (buffer.isEmpty) return;
      out.add(_Run(_sanitize(buffer.toString()), style));
      buffer.clear();
    }

    for (final XmlElement el in r.childElements) {
      switch (el.name.local) {
        case 't':
          buffer.write(el.innerText);
        case 'tab':
          buffer.write('\t');
        case 'br':
          final String? type = _attr(el, 'type');
          buffer.write(type == 'page' ? '\f' : '\n');
        case 'cr':
          buffer.write('\n');
        case 'noBreakHyphen':
          buffer.write('-');
        case 'sym':
          // Police symbole non embarquee : on ne peut pas la rendre fidelement.
          buffer.write(' ');
        default:
          break; // w:drawing, w:pict, w:object : images, hors perimetre
      }
    }
    flush();
  }

  _RunStyle _applyRunProps(_RunStyle base, XmlElement rPr) {
    _RunStyle style = base;

    // Style de caractere nomme (Strong, Emphasis, style maison...).
    final String? rStyle = _attr(_child(rPr, 'rStyle'), 'val');
    if (rStyle != null) {
      final _StyleDef? def = _flatten(rStyle);
      if (def != null) {
        style = style.copyWith(
          bold: def.bold ?? style.bold,
          italic: def.italic ?? style.italic,
          underline: def.underline ?? style.underline,
          sizePt: def.sizePt ?? style.sizePt,
        );
      }
    }

    final bool? bold = _onOff(_child(rPr, 'b'));
    final bool? italic = _onOff(_child(rPr, 'i'));
    final bool? strike = _onOff(_child(rPr, 'strike'));
    final XmlElement? u = _child(rPr, 'u');
    final XmlElement? sz = _child(rPr, 'sz');
    final XmlElement? color = _child(rPr, 'color');

    // <w:sz> est en DEMI-points.
    double? sizePt;
    final double? half = double.tryParse(_attr(sz, 'val') ?? '');
    if (half != null && half > 0) sizePt = (half / 2).clamp(4.0, 96.0);

    bool? underline;
    if (u != null) {
      final String val = _attr(u, 'val') ?? 'single';
      underline = val != 'none';
    }

    int? rgb;
    final String? hex = _attr(color, 'val');
    if (hex != null && hex.length == 6 && hex.toLowerCase() != 'auto') {
      rgb = int.tryParse(hex, radix: 16);
    }

    // Note : <w:vanish> (texte masque) est ignore, on prefere ne rien perdre
    // du contenu du document.
    return style.copyWith(
      bold: bold ?? style.bold,
      italic: italic ?? style.italic,
      underline: underline ?? style.underline,
      strike: strike ?? style.strike,
      sizePt: sizePt ?? style.sizePt,
      rgb: rgb ?? style.rgb,
    );
  }

  // -------------------------------------------------------------------------
  // Tableaux
  // -------------------------------------------------------------------------

  _Table? _parseTable(XmlElement tbl) {
    final List<_Row> rows = <_Row>[];
    for (final XmlElement tr in tbl.findElements('tr', namespaceUri: '*')) {
      final List<_Cell> cells = <_Cell>[];
      for (final XmlElement tc in tr.findElements('tc', namespaceUri: '*')) {
        final XmlElement? tcPr = _child(tc, 'tcPr');
        final int span =
            int.tryParse(_attr(_child(tcPr, 'gridSpan'), 'val') ?? '') ?? 1;
        final List<_Block> blocks = <_Block>[];
        _collect(tc.childElements, blocks);
        final List<_Para> paras = <_Para>[];
        for (final _Block block in blocks) {
          if (block is _Para) {
            paras.add(block);
          } else if (block is _Table) {
            // Tableau imbrique : on aplatit son contenu en paragraphes.
            for (final _Row nested in block.rows) {
              for (final _Cell cell in nested.cells) {
                paras.addAll(cell.paras);
              }
            }
          }
        }
        cells.add(_Cell(paras, span < 1 ? 1 : span));
      }
      if (cells.isNotEmpty) rows.add(_Row(cells));
    }
    if (rows.isEmpty) return null;

    // Largeurs de colonnes : <w:tblGrid> si present, sinon colonnes egales.
    final List<double> ratios = <double>[];
    final XmlElement? grid = _child(tbl, 'tblGrid');
    if (grid != null) {
      for (final XmlElement col in grid.findElements(
        'gridCol',
        namespaceUri: '*',
      )) {
        final double w = double.tryParse(_attr(col, 'w') ?? '') ?? 0;
        ratios.add(w > 0 ? w : 1);
      }
    }
    int maxSpans = 0;
    for (final _Row row in rows) {
      int spans = 0;
      for (final _Cell cell in row.cells) {
        spans += cell.gridSpan;
      }
      if (spans > maxSpans) maxSpans = spans;
    }
    if (ratios.length < maxSpans) {
      ratios.addAll(List<double>.filled(maxSpans - ratios.length, 1));
    }
    if (ratios.isEmpty) ratios.add(1);

    return _Table(rows, ratios);
  }

  // -------------------------------------------------------------------------
  // Styles nommes
  // -------------------------------------------------------------------------

  void _readStyles(String? xml) {
    if (xml == null) return;
    XmlDocument doc;
    try {
      doc = XmlDocument.parse(xml);
    } on XmlException {
      return;
    }

    // Valeurs par defaut du document.
    final Iterable<XmlElement> docDefaults = doc.findAllElements(
      'rPrDefault',
      namespaceUri: '*',
    );
    for (final XmlElement d in docDefaults) {
      final XmlElement? rPr = _child(d, 'rPr');
      if (rPr == null) continue;
      final double? half = double.tryParse(
        _attr(_child(rPr, 'sz'), 'val') ?? '',
      );
      if (half != null && half > 0) {
        _defaultRun = _defaultRun.copyWith(sizePt: (half / 2).clamp(4.0, 96.0));
      }
      break;
    }

    for (final XmlElement style in doc.findAllElements(
      'style',
      namespaceUri: '*',
    )) {
      final String? id = _attr(style, 'styleId');
      if (id == null) continue;
      final String type = _attr(style, 'type') ?? 'paragraph';
      if (type != 'paragraph' && type != 'character') continue;

      final _StyleDef def = _StyleDef()
        ..name = _attr(_child(style, 'name'), 'val')
        ..basedOn = _attr(_child(style, 'basedOn'), 'val');

      final XmlElement? rPr = _child(style, 'rPr');
      if (rPr != null) {
        def.bold = _onOff(_child(rPr, 'b'));
        def.italic = _onOff(_child(rPr, 'i'));
        final XmlElement? u = _child(rPr, 'u');
        if (u != null) def.underline = (_attr(u, 'val') ?? 'single') != 'none';
        final double? half = double.tryParse(
          _attr(_child(rPr, 'sz'), 'val') ?? '',
        );
        if (half != null && half > 0) def.sizePt = (half / 2).clamp(4.0, 96.0);
      }

      final XmlElement? pPr = _child(style, 'pPr');
      if (pPr != null) {
        final String? jc = _attr(_child(pPr, 'jc'), 'val');
        if (jc != null) def.align = _alignFromWord(jc);
        def.outlineLvl = int.tryParse(
          _attr(_child(pPr, 'outlineLvl'), 'val') ?? '',
        );
        final XmlElement? ind = _child(pPr, 'ind');
        if (ind != null) {
          def.indentLeftPt = _twips(_attr(ind, 'left') ?? _attr(ind, 'start'));
        }
        final XmlElement? spacing = _child(pPr, 'spacing');
        if (spacing != null) {
          def.spaceBeforePt = _twips(_attr(spacing, 'before'));
          def.spaceAfterPt = _twips(_attr(spacing, 'after'));
        }
      }

      _styles[id] = def;
      if (type == 'paragraph' && (_attr(style, 'default') == '1')) {
        _defaultParaStyleId ??= id;
      }
    }
  }

  /// Fusionne un style avec sa chaine `basedOn` (profondeur bornee : certains
  /// documents contiennent des cycles).
  _StyleDef? _flatten(String id) {
    final List<_StyleDef> chain = <_StyleDef>[];
    String? current = id;
    final Set<String> seen = <String>{};
    while (current != null && seen.add(current) && chain.length < 12) {
      final _StyleDef? def = _styles[current];
      if (def == null) break;
      chain.add(def);
      current = def.basedOn;
    }
    if (chain.isEmpty) return null;

    final _StyleDef merged = _StyleDef();
    for (final _StyleDef def in chain.reversed) {
      merged.name = def.name ?? merged.name;
      merged.bold = def.bold ?? merged.bold;
      merged.italic = def.italic ?? merged.italic;
      merged.underline = def.underline ?? merged.underline;
      merged.sizePt = def.sizePt ?? merged.sizePt;
      merged.align = def.align ?? merged.align;
      merged.outlineLvl = def.outlineLvl ?? merged.outlineLvl;
      merged.indentLeftPt = def.indentLeftPt ?? merged.indentLeftPt;
      merged.spaceBeforePt = def.spaceBeforePt ?? merged.spaceBeforePt;
      merged.spaceAfterPt = def.spaceAfterPt ?? merged.spaceAfterPt;
    }
    // Le nom affiche est celui du style demande, pas celui de son parent.
    merged.name = chain.first.name ?? merged.name;
    return merged;
  }

  _ParaStyle _paraStyle(String? styleId) {
    final String key = styleId ?? _defaultParaStyleId ?? '';
    final _ParaStyle? cached = _resolved[key];
    if (cached != null) {
      return _ParaStyle(
        run: cached.run,
        align: cached.align,
        indentLeftPt: cached.indentLeftPt,
        headingLevel: cached.headingLevel,
        spaceBeforePt: cached.spaceBeforePt,
        spaceAfterPt: cached.spaceAfterPt,
      );
    }

    final _StyleDef? def = key.isEmpty ? null : _flatten(key);
    final int level = _headingLevel(key, def);

    _RunStyle run = _defaultRun;
    double before = 0;
    double after = 6;

    if (level >= 0) {
      // Tailles de secours quand le style n'impose pas de taille explicite.
      const List<double> sizes = <double>[24, 18, 15, 13, 12, 11];
      run = run.copyWith(
        bold: true,
        sizePt: sizes[level.clamp(0, sizes.length - 1)],
      );
      before = 12;
      after = 6;
    }

    if (def != null) {
      run = run.copyWith(
        bold: def.bold ?? run.bold,
        italic: def.italic ?? run.italic,
        underline: def.underline ?? run.underline,
        sizePt: def.sizePt ?? run.sizePt,
      );
      before = def.spaceBeforePt ?? before;
      after = def.spaceAfterPt ?? after;
    }

    final _ParaStyle style = _ParaStyle(
      run: run,
      align: def?.align ?? _Align.left,
      indentLeftPt: def?.indentLeftPt ?? 0,
      headingLevel: level,
      spaceBeforePt: before.clamp(0.0, 48.0),
      spaceAfterPt: after.clamp(0.0, 48.0),
    );
    _resolved[key] = style;
    return style;
  }

  /// -1 si ce n'est pas un titre, 0 pour « Titre » (Title), 1..n pour
  /// « Titre n » / « Heading n ». Accepte les noms francais et anglais et
  /// retombe sur `w:outlineLvl`.
  int _headingLevel(String styleId, _StyleDef? def) {
    final String haystack =
        '${styleId.toLowerCase()} ${(def?.name ?? '').toLowerCase()}';
    if (RegExp(r'\b(title|titre)\b').hasMatch(haystack) &&
        !RegExp(r'[0-9]').hasMatch(haystack)) {
      return 0;
    }
    final Match? m = RegExp(
      r'(?:heading|titre|title|berschrift)\s*([1-9])',
    ).firstMatch(haystack);
    if (m != null) return int.parse(m.group(1)!);
    final int? outline = def?.outlineLvl;
    if (outline != null && outline >= 0 && outline <= 8) return outline + 1;
    return -1;
  }

  // -------------------------------------------------------------------------
  // Numerotation
  // -------------------------------------------------------------------------

  void _readNumbering(String? xml) {
    if (xml == null) return;
    XmlDocument doc;
    try {
      doc = XmlDocument.parse(xml);
    } on XmlException {
      return;
    }

    final Map<String, Map<int, _NumLevel>> abstracts =
        <String, Map<int, _NumLevel>>{};
    for (final XmlElement abs in doc.findAllElements(
      'abstractNum',
      namespaceUri: '*',
    )) {
      final String? id = _attr(abs, 'abstractNumId');
      if (id == null) continue;
      final Map<int, _NumLevel> levels = <int, _NumLevel>{};
      for (final XmlElement lvl in abs.findElements('lvl', namespaceUri: '*')) {
        final int ilvl = int.tryParse(_attr(lvl, 'ilvl') ?? '') ?? 0;
        final String format = _attr(_child(lvl, 'numFmt'), 'val') ?? 'bullet';
        final String text = _attr(_child(lvl, 'lvlText'), 'val') ?? '%1.';
        double? indent;
        double? hanging;
        final XmlElement? ind = _child(_child(lvl, 'pPr'), 'ind');
        if (ind != null) {
          indent = _twips(_attr(ind, 'left') ?? _attr(ind, 'start'));
          hanging = _twips(_attr(ind, 'hanging'));
        }
        levels[ilvl] = _NumLevel(format, text, indent, hanging);
      }
      abstracts[id] = levels;
    }

    for (final XmlElement num in doc.findAllElements(
      'num',
      namespaceUri: '*',
    )) {
      final String? numId = _attr(num, 'numId');
      final String? absId = _attr(_child(num, 'abstractNumId'), 'val');
      if (numId == null || absId == null) continue;
      final Map<int, _NumLevel>? levels = abstracts[absId];
      if (levels != null) _numbering[numId] = levels;
    }
  }

  String _marker(String numId, int ilvl, _NumLevel? level) {
    final String format = level?.format ?? 'bullet';
    if (format == 'bullet' || format == 'none') {
      // Les puces exotiques de Word (cercles vides, carres) viennent de
      // polices symboles non embarquees : on alterne disque plein et tiret.
      const List<String> bullets = <String>[bulletChar, '-'];
      return bullets[ilvl % bullets.length];
    }

    final List<int> counters = _counters.putIfAbsent(
      numId,
      () => List<int>.filled(9, 0),
    );
    final int index = ilvl.clamp(0, counters.length - 1);
    counters[index] = counters[index] + 1;
    for (int i = index + 1; i < counters.length; i++) {
      counters[i] = 0; // les niveaux plus profonds repartent a zero
    }

    String text = level?.text ?? '%${index + 1}.';
    for (int i = 0; i < counters.length; i++) {
      final String token = '%${i + 1}';
      if (!text.contains(token)) continue;
      final int value = counters[i] == 0 ? 1 : counters[i];
      text = text.replaceAll(token, _formatNumber(value, format));
    }
    return _sanitize(text);
  }

  String _formatNumber(int value, String format) {
    switch (format) {
      case 'lowerLetter':
        return _letters(value).toLowerCase();
      case 'upperLetter':
        return _letters(value);
      case 'lowerRoman':
        return _roman(value).toLowerCase();
      case 'upperRoman':
        return _roman(value);
      default:
        return '$value';
    }
  }

  static String _letters(int value) {
    int v = value;
    final StringBuffer sb = StringBuffer();
    while (v > 0) {
      final int rem = (v - 1) % 26;
      sb.write(String.fromCharCode(65 + rem));
      v = (v - 1) ~/ 26;
    }
    return String.fromCharCodes(sb.toString().codeUnits.reversed);
  }

  static String _roman(int value) {
    if (value <= 0 || value > 3999) return '$value';
    const List<int> values = <int>[
      1000,
      900,
      500,
      400,
      100,
      90,
      50,
      40,
      10,
      9,
      5,
      4,
      1,
    ];
    const List<String> symbols = <String>[
      'M',
      'CM',
      'D',
      'CD',
      'C',
      'XC',
      'L',
      'XL',
      'X',
      'IX',
      'V',
      'IV',
      'I',
    ];
    int v = value;
    final StringBuffer sb = StringBuffer();
    for (int i = 0; i < values.length; i++) {
      while (v >= values[i]) {
        sb.write(symbols[i]);
        v -= values[i];
      }
    }
    return sb.toString();
  }

  // -------------------------------------------------------------------------
  // Format de page
  // -------------------------------------------------------------------------

  _PageSetup _readPageSetup(XmlElement body) {
    double width = 595;
    double height = 842;
    double left = 50;
    double right = 50;
    double top = 50;
    double bottom = 50;

    final Iterable<XmlElement> sections = body.findAllElements(
      'sectPr',
      namespaceUri: '*',
    );
    if (sections.isNotEmpty) {
      final XmlElement sect = sections.last;
      final XmlElement? pgSz = _child(sect, 'pgSz');
      final double? w = _twips(_attr(pgSz, 'w'));
      final double? h = _twips(_attr(pgSz, 'h'));
      if (w != null && w >= 140 && w <= 2000) width = w;
      if (h != null && h >= 140 && h <= 2000) height = h;

      final XmlElement? pgMar = _child(sect, 'pgMar');
      if (pgMar != null) {
        left = (_twips(_attr(pgMar, 'left')) ?? left).clamp(18.0, 200.0);
        right = (_twips(_attr(pgMar, 'right')) ?? right).clamp(18.0, 200.0);
        top = (_twips(_attr(pgMar, 'top')) ?? top).clamp(18.0, 200.0);
        bottom = (_twips(_attr(pgMar, 'bottom')) ?? bottom).clamp(18.0, 200.0);
      }
    }

    // Garde-fou : il faut au moins 120 pt utiles dans chaque direction.
    if (width - left - right < 120) {
      left = right = 40;
    }
    if (height - top - bottom < 120) {
      top = bottom = 40;
    }

    return _PageSetup(
      width: width,
      height: height,
      marginL: left,
      marginR: right,
      marginT: top,
      marginB: bottom,
    );
  }

  // -------------------------------------------------------------------------
  // Utilitaires XML
  // -------------------------------------------------------------------------

  static String? _part(Archive archive, String path) {
    for (final ArchiveFile f in archive.files) {
      if (f.name == path) return utf8.decode(f.content, allowMalformed: true);
    }
    final String lower = path.toLowerCase();
    for (final ArchiveFile f in archive.files) {
      if (f.name.toLowerCase() == lower) {
        return utf8.decode(f.content, allowMalformed: true);
      }
    }
    return null;
  }

  /// Premier enfant direct portant ce nom local, quel que soit l'espace de noms.
  static XmlElement? _child(XmlElement? parent, String localName) {
    if (parent == null) return null;
    for (final XmlElement child in parent.findElements(
      localName,
      namespaceUri: '*',
    )) {
      return child;
    }
    return null;
  }

  static String? _attr(XmlElement? el, String name) =>
      el?.getAttribute(name, namespaceUri: '*') ?? el?.getAttribute(name);

  /// Propriete « on/off » de Word : absente = non defini, presente sans
  /// attribut = vrai, `w:val="0"` = faux.
  static bool? _onOff(XmlElement? el) {
    if (el == null) return null;
    final String? val = _attr(el, 'val');
    if (val == null || val.isEmpty) return true;
    return val != '0' && val != 'false' && val != 'off';
  }

  static double? _twips(String? raw) {
    final double? v = double.tryParse(raw ?? '');
    if (v == null) return null;
    return v / _twipsPerPoint;
  }

  static _Align? _alignFromWord(String jc) {
    switch (jc) {
      case 'center':
        return _Align.center;
      case 'right':
      case 'end':
        return _Align.right;
      case 'both':
      case 'distribute':
      case 'left':
      case 'start':
        // La justification est rendue comme un alignement a gauche.
        return _Align.left;
      default:
        return null;
    }
  }

  /// Reduit le texte a ce que les 14 polices standard du PDF savent
  /// reellement dessiner.
  ///
  /// Verifie sur Syncfusion 34 : seuls les codes 0x20-0x7E et 0xA1-0xFF
  /// arrivent intacts dans le flux PDF. Les codes 0x80-0x9F sont reecrits de
  /// travers et tout ce qui depasse U+00FF est purement et simplement
  /// supprime du dessin (sans erreur). On translittere donc en Latin-1 tout
  /// ce qui peut l'etre, et on remplace le reste par « ? » plutot que de
  /// laisser disparaitre du texte en silence.
  static String _sanitize(String input) {
    final StringBuffer sb = StringBuffer();
    for (final int rune in input.runes) {
      if (rune == 0x0A || rune == 0x09 || rune == 0x0C) {
        sb.writeCharCode(rune); // saut de ligne, tabulation, saut de page
      } else if (rune < 0x20 || rune == 0x7F) {
        continue;
      } else if (rune < 0x7F) {
        sb.writeCharCode(rune);
      } else if (rune <= 0x9F) {
        // Plage inutilisable : on la relit comme du Windows-1252.
        final int? unicode = _cp1252ToUnicode[rune];
        if (unicode != null) sb.write(_translitOf(unicode));
      } else if (rune == 0xA0) {
        sb.write(' '); // espace insecable
      } else if (rune == 0xAD) {
        continue; // trait d'union conditionnel
      } else if (rune <= 0xFF) {
        sb.writeCharCode(rune);
      } else {
        sb.write(_translitOf(rune));
      }
    }
    return sb.toString();
  }

  static String _translitOf(int rune) {
    if (rune >= 0x20 && rune <= 0x7E) return String.fromCharCode(rune);
    if (rune >= 0xA1 && rune <= 0xFF) return String.fromCharCode(rune);
    return _translit[rune] ?? '?';
  }

  /// Codes 0x80-0x9F -> point de code Unicode Windows-1252 correspondant.
  static const Map<int, int> _cp1252ToUnicode = <int, int>{
    0x80: 0x20AC,
    0x82: 0x201A,
    0x83: 0x0192,
    0x84: 0x201E,
    0x85: 0x2026,
    0x86: 0x2020,
    0x87: 0x2021,
    0x88: 0x02C6,
    0x89: 0x2030,
    0x8A: 0x0160,
    0x8B: 0x2039,
    0x8C: 0x0152,
    0x8E: 0x017D,
    0x91: 0x2018,
    0x92: 0x2019,
    0x93: 0x201C,
    0x94: 0x201D,
    0x95: 0x2022,
    0x96: 0x2013,
    0x97: 0x2014,
    0x98: 0x02DC,
    0x99: 0x2122,
    0x9A: 0x0161,
    0x9B: 0x203A,
    0x9C: 0x0153,
    0x9E: 0x017E,
    0x9F: 0x0178,
  };

  /// Equivalents Latin-1 des caracteres typographiques courants.
  static const Map<int, String> _translit = <int, String>{
    0x20AC: 'EUR',
    0x201A: ',',
    0x0192: 'f',
    0x201E: '"',
    0x2026: '...',
    0x2020: '+',
    0x2021: '++',
    0x02C6: '^',
    0x2030: '%0',
    0x0160: 'S',
    0x2039: '<',
    0x0152: 'OE',
    0x017D: 'Z',
    0x2018: "'",
    0x2019: "'",
    0x201C: '"',
    0x201D: '"',
    0x2022: bulletChar,
    0x2013: '-',
    0x2014: '-',
    0x02DC: '~',
    0x2122: '(TM)',
    0x0161: 's',
    0x203A: '>',
    0x0153: 'oe',
    0x017E: 'z',
    0x0178: 'Y',
    0x2010: '-',
    0x2011: '-',
    0x2012: '-',
    0x2015: '-',
    0x2212: '-',
    0x2032: "'",
    0x2033: '"',
    0x2044: '/',
    0x200B: '',
    0x2060: '',
    0xFEFF: '',
    0x2007: ' ',
    0x2009: ' ',
    0x202F: ' ',
    0x25CF: bulletChar,
    0x25AA: '-',
    0x25E6: '-',
    0x25A0: '-',
    0x25CB: '-',
    0x27A2: '>',
    0x2192: '->',
    0x2190: '<-',
    0x2713: 'v',
    0x2714: 'v',
    0x2264: '<=',
    0x2265: '>=',
    0x2260: '!=',
    0xFB01: 'fi',
    0xFB02: 'fl',
  };
}

// ===========================================================================
// Mise en page / dessin
// ===========================================================================

class _Frag {
  _Frag(this.text, this.font, this.style, this.x, this.width);
  String text;
  final sf.PdfFont font;
  final _RunStyle style;
  final double x;
  double width;

  /// Hauteur au-dessus de la ligne de base (Helvetica : 931/1156 de la hauteur
  /// totale de la police).
  double get ascent => font.height * _PdfPainter.ascentRatio;
  double get descent => font.height - ascent;
}

class _Line {
  _Line(this.frags, this.ascent, this.descent, this.width);
  final List<_Frag> frags;
  final double ascent;
  final double descent;
  final double width;
  double get height => ascent + descent;
}

/// Une ligne prete a dessiner dans une cellule de tableau.
class _CellLine {
  _CellLine(this.line, this.indent, this.align, this.gap);
  final _Line line;
  final double indent;
  final _Align align;
  final double gap;
  double get height => line.height * _PdfPainter.lineSpacing + gap;
}

class _PdfPainter {
  _PdfPainter(this._doc, this._setup);

  final sf.PdfDocument _doc;
  final _PageSetup _setup;

  static const double ascentRatio = 0.805;
  static const double lineSpacing = 1.14;
  static const double _tabStop = 36;
  static const double _cellPadX = 4;
  static const double _cellPadY = 3;

  final Map<String, sf.PdfFont> _fonts = <String, sf.PdfFont>{};
  final Map<String, double> _spaceWidths = <String, double>{};
  final Map<int, sf.PdfBrush> _brushes = <int, sf.PdfBrush>{};
  final sf.PdfPen _gridPen = sf.PdfPen(sf.PdfColor(150, 150, 150), width: 0.5);
  final sf.PdfStringFormat _noWrap = sf.PdfStringFormat(
    wordWrap: sf.PdfWordWrapType.none,
  );

  sf.PdfPage? _page;
  double _y = 0;
  bool _breakPending = false;

  double get _contentWidth => _setup.width - _setup.marginL - _setup.marginR;
  double get _pageBottom => _setup.height - _setup.marginB;

  void render(List<_Block> blocks) {
    for (final _Block block in blocks) {
      if (block is _PageBreak) {
        if (_page != null) _breakPending = true;
      } else if (block is _Para) {
        _drawParagraph(block);
      } else if (block is _Table) {
        _drawTable(block);
      }
    }
    if (_page == null) {
      // Document sans aucun contenu exploitable : on produit tout de meme une
      // page, sinon le PDF serait invalide.
      _newPage();
      final sf.PdfFont font = _fontFor(const _RunStyle());
      _page!.graphics.drawString(
        '(Document Word vide ou illisible)',
        font,
        brush: _brushFor(0x666666),
        bounds: Rect.fromLTWH(
          _setup.marginL,
          _setup.marginT,
          _contentWidth,
          40,
        ),
      );
    }
  }

  // -------------------------------------------------------------------------
  // Pages
  // -------------------------------------------------------------------------

  void _newPage() {
    // Une section par page : `PdfDocument.pages.insert()` plante sur un
    // document neuf, alors qu'une nouvelle section acceptant sa propre taille
    // de page est toujours sure.
    final sf.PdfSection section = _doc.sections!.add();
    section.pageSettings.margins.all = 0;
    section.pageSettings.size = Size(_setup.width, _setup.height);
    _page = section.pages.add();
    _y = _setup.marginT;
    _breakPending = false;
  }

  /// Garantit qu'il reste [height] points sur la page courante.
  void _ensure(double height) {
    if (_page == null) {
      _newPage();
      return;
    }
    if (_breakPending) {
      _newPage();
      return;
    }
    if (_y + height > _pageBottom) _newPage();
  }

  // -------------------------------------------------------------------------
  // Paragraphes
  // -------------------------------------------------------------------------

  void _drawParagraph(_Para para) {
    final double avail = math.max(48.0, _contentWidth - para.indentPt);
    final List<_Line> lines = _layout(para.runs, avail, para.baseStyle);

    for (int i = 0; i < lines.length; i++) {
      final _Line line = lines[i];
      final double extra = i == 0 ? para.spaceBeforePt : 0;
      _ensure(line.height + extra);
      if (i == 0 && _y > _setup.marginT) _y += para.spaceBeforePt;

      final double left = _setup.marginL + para.indentPt;
      final double x0 = _alignX(left, avail, line.width, para.align);

      if (i == 0 && para.marker != null) {
        _drawMarker(para, left);
      }
      _drawLine(line, x0, _y);
      _y += line.height * lineSpacing;
    }
    _y += para.spaceAfterPt;
  }

  void _drawMarker(_Para para, double left) {
    final _RunStyle style = para.baseStyle.copyWith(
      underline: false,
      strike: false,
    );
    final sf.PdfFont font = _fontFor(style);
    final String marker = para.marker!;
    final double width = _measure(font, style.fontKey, marker);
    final double hanging = para.hangingPt > 0 ? para.hangingPt : width + 6;
    double x = left - hanging;
    if (x < _setup.marginL) x = _setup.marginL;
    final sf.PdfBrush brush = _brushFor(style.rgb);

    if (marker == bulletChar) {
      // Un point median est trop discret : on dessine un vrai disque, cale sur
      // le milieu des minuscules.
      final double d = math.max(2.0, style.sizePt * 0.24);
      final double baseline = _y + font.height * ascentRatio;
      _page!.graphics.drawEllipse(
        Rect.fromLTWH(x, baseline - style.sizePt * 0.32 - d / 2, d, d),
        brush: brush,
      );
      return;
    }

    _page!.graphics.drawString(
      marker,
      font,
      brush: brush,
      bounds: Rect.fromLTWH(x, _y, width + 6, font.height + 4),
      format: _noWrap,
    );
  }

  double _alignX(double left, double avail, double lineWidth, _Align align) {
    switch (align) {
      case _Align.left:
        return left;
      case _Align.center:
        return left + math.max(0.0, (avail - lineWidth) / 2);
      case _Align.right:
        return left + math.max(0.0, avail - lineWidth);
    }
  }

  void _drawLine(_Line line, double x0, double top) {
    final sf.PdfGraphics g = _page!.graphics;
    for (final _Frag frag in line.frags) {
      // Les fragments composes uniquement d'espaces n'ont d'interet que s'ils
      // portent un soulignement/barre a prolonger.
      final bool blank = frag.text.trim().isEmpty;
      if (blank && !frag.style.underline && !frag.style.strike) continue;

      final double fragTop = top + line.ascent - frag.ascent;
      final sf.PdfBrush brush = _brushFor(frag.style.rgb);
      if (!blank) {
        g.drawString(
          frag.text,
          frag.font,
          brush: brush,
          // Marge de securite sur la largeur : avec `wordWrap: none`,
          // Syncfusion supprime purement et simplement ce qui depasse du
          // rectangle de dessin.
          bounds: Rect.fromLTWH(
            x0 + frag.x,
            fragTop,
            frag.width + 6,
            frag.font.height + 4,
          ),
          format: _noWrap,
        );
      }
      final double thickness = math.max(0.5, frag.style.sizePt * 0.055);
      if (frag.style.underline) {
        g.drawRectangle(
          brush: brush,
          bounds: Rect.fromLTWH(
            x0 + frag.x,
            fragTop + frag.ascent + frag.style.sizePt * 0.12,
            frag.width,
            thickness,
          ),
        );
      }
      if (frag.style.strike) {
        g.drawRectangle(
          brush: brush,
          bounds: Rect.fromLTWH(
            x0 + frag.x,
            fragTop + frag.ascent - frag.style.sizePt * 0.26,
            frag.width,
            thickness,
          ),
        );
      }
    }
  }

  // -------------------------------------------------------------------------
  // Tableaux
  // -------------------------------------------------------------------------

  void _drawTable(_Table table) {
    final double total = table.colRatios.fold<double>(
      0,
      (double a, double b) => a + b,
    );
    final double unit = total <= 0 ? 0 : _contentWidth / total;
    final List<double> widths = table.colRatios
        .map((double r) => unit * r)
        .toList(growable: false);

    for (final _Row row in table.rows) {
      _drawRow(row, widths);
    }
    _y += 6;
  }

  void _drawRow(_Row row, List<double> colWidths) {
    // Position et largeur reelle de chaque cellule (gridSpan pris en compte).
    final List<double> xs = <double>[];
    final List<double> ws = <double>[];
    double x = _setup.marginL;
    int col = 0;
    for (final _Cell cell in row.cells) {
      double w = 0;
      for (int i = 0; i < cell.gridSpan; i++) {
        if (col < colWidths.length) w += colWidths[col];
        col++;
      }
      if (w <= 0) w = colWidths.isEmpty ? _contentWidth : colWidths.last;
      xs.add(x);
      ws.add(w);
      x += w;
    }

    // Contenu de chaque cellule, deja mis en lignes.
    final List<List<_CellLine>> queues = <List<_CellLine>>[];
    for (int i = 0; i < row.cells.length; i++) {
      queues.add(_layoutCell(row.cells[i], ws[i] - 2 * _cellPadX));
    }

    bool pending() => queues.any((List<_CellLine> q) => q.isNotEmpty);
    bool first = true;

    while (first || pending()) {
      const double minChunk = 16;
      _ensure(minChunk);
      final double avail = _pageBottom - _y - 2 * _cellPadY;

      final List<List<_CellLine>> taken = List<List<_CellLine>>.generate(
        queues.length,
        (_) => <_CellLine>[],
      );
      double segHeight = 0;
      for (int i = 0; i < queues.length; i++) {
        double h = 0;
        while (queues[i].isNotEmpty && h + queues[i].first.height <= avail) {
          final _CellLine item = queues[i].removeAt(0);
          taken[i].add(item);
          h += item.height;
        }
        if (h > segHeight) segHeight = h;
      }

      if (segHeight == 0 && pending()) {
        if (_y > _setup.marginT) {
          _newPage();
          continue; // on retente sur une page vierge
        }
        // Meme une page entiere ne suffit pas : on force une ligne par cellule
        // pour ne jamais boucler indefiniment.
        for (int i = 0; i < queues.length; i++) {
          if (queues[i].isEmpty) continue;
          final _CellLine item = queues[i].removeAt(0);
          taken[i].add(item);
          if (item.height > segHeight) segHeight = item.height;
        }
      }
      if (segHeight == 0) segHeight = 12; // ligne vide

      final double rowHeight = segHeight + 2 * _cellPadY;
      final sf.PdfGraphics g = _page!.graphics;
      for (int i = 0; i < xs.length; i++) {
        g.drawRectangle(
          pen: _gridPen,
          bounds: Rect.fromLTWH(xs[i], _y, ws[i], rowHeight),
        );
        double cy = _y + _cellPadY;
        final double innerLeft = xs[i] + _cellPadX;
        final double innerWidth = math.max(8.0, ws[i] - 2 * _cellPadX);
        for (final _CellLine item in taken[i]) {
          final double left = innerLeft + item.indent;
          final double x0 = _alignX(
            left,
            math.max(8.0, innerWidth - item.indent),
            item.line.width,
            item.align,
          );
          _drawLine(item.line, x0, cy);
          cy += item.height;
        }
      }

      _y += rowHeight;
      first = false;
    }
  }

  List<_CellLine> _layoutCell(_Cell cell, double width) {
    final double w = math.max(24.0, width);
    final List<_CellLine> out = <_CellLine>[];
    for (int p = 0; p < cell.paras.length; p++) {
      final _Para para = cell.paras[p];
      final double indent = math.min(para.indentPt, w / 3);
      final List<_Line> lines = _layout(para.runs, w - indent, para.baseStyle);
      for (int i = 0; i < lines.length; i++) {
        final bool last = i == lines.length - 1;
        out.add(
          _CellLine(
            lines[i],
            indent,
            para.align,
            last && p < cell.paras.length - 1
                ? math.min(para.spaceAfterPt, 6)
                : 0,
          ),
        );
      }
    }
    if (out.isEmpty) {
      out.add(_CellLine(_emptyLine(const _RunStyle()), 0, _Align.left, 0));
    }
    return out;
  }

  // -------------------------------------------------------------------------
  // Moteur de retour a la ligne
  // -------------------------------------------------------------------------

  /// Decoupe les runs en lignes tenant dans [maxWidth]. Chaque ligne est une
  /// suite de fragments positionnes : un fragment par changement de mise en
  /// forme, ce qui permet de dessiner gras et italique avec leur propre police.
  List<_Line> _layout(List<_Run> runs, double maxWidth, _RunStyle fallback) {
    final double width = math.max(24.0, maxWidth);
    final List<_Line> lines = <_Line>[];
    List<_Frag> frags = <_Frag>[];
    double x = 0;
    double ascent = 0;
    double descent = 0;

    final sf.PdfFont fallbackFont = _fontFor(fallback);
    final double fbAscent = fallbackFont.height * ascentRatio;
    final double fbDescent = fallbackFont.height - fbAscent;

    void flush() {
      lines.add(
        _Line(
          frags,
          ascent > 0 ? ascent : fbAscent,
          descent > 0 ? descent : fbDescent,
          x,
        ),
      );
      frags = <_Frag>[];
      x = 0;
      ascent = 0;
      descent = 0;
    }

    void append(String text, _RunStyle style, sf.PdfFont font, double w) {
      if (text.isEmpty) return;
      final double a = font.height * ascentRatio;
      if (a > ascent) ascent = a;
      if (font.height - a > descent) descent = font.height - a;
      // Fusion avec le fragment precedent quand la mise en forme est identique
      // (les polices standard n'ont pas de crenage : les largeurs s'additionnent).
      if (frags.isNotEmpty &&
          frags.last.style == style &&
          (frags.last.x + frags.last.width - x).abs() < 0.01) {
        frags.last.text += text;
        frags.last.width += w;
      } else {
        frags.add(_Frag(text, font, style, x, w));
      }
      x += w;
    }

    String? pendingSpace;
    _RunStyle? pendingStyle;

    for (final _Run run in runs) {
      final _RunStyle style = run.style;
      final sf.PdfFont font = _fontFor(style);
      final String s = run.text;
      int i = 0;
      while (i < s.length) {
        final String c = s[i];
        if (c == '\n') {
          pendingSpace = null;
          pendingStyle = null;
          flush();
          i++;
          continue;
        }
        if (c == '\t') {
          pendingSpace = null;
          pendingStyle = null;
          final double next = ((x / _tabStop).floor() + 1) * _tabStop;
          if (next >= width) {
            flush();
          } else {
            // Un fragment d'espaces vide suffit : seul x compte.
            x = next;
          }
          i++;
          continue;
        }
        if (c == ' ') {
          int j = i;
          while (j < s.length && s[j] == ' ') {
            j++;
          }
          pendingSpace = (pendingSpace ?? '') + s.substring(i, j);
          pendingStyle = style;
          i = j;
          continue;
        }

        int j = i;
        while (j < s.length && s[j] != ' ' && s[j] != '\t' && s[j] != '\n') {
          j++;
        }
        String word = s.substring(i, j);
        i = j;

        // Espace en attente : on ne l'ecrit que si le mot suivant reste sur la
        // meme ligne (sinon il pendrait en fin de ligne).
        double spaceWidth = 0;
        sf.PdfFont? spaceFont;
        if (pendingSpace != null && frags.isNotEmpty) {
          spaceFont = _fontFor(pendingStyle!);
          spaceWidth = _measure(spaceFont, pendingStyle.fontKey, pendingSpace);
        }

        double wordWidth = _measure(font, style.fontKey, word);
        if (x + spaceWidth + wordWidth > width && frags.isNotEmpty) {
          flush();
          spaceWidth = 0;
          spaceFont = null;
        } else if (spaceFont != null) {
          append(pendingSpace!, pendingStyle!, spaceFont, spaceWidth);
        }
        pendingSpace = null;
        pendingStyle = null;

        // Mot plus long que la ligne entiere : on le coupe caractere par
        // caractere (URL, reference sans espace...).
        while (wordWidth > width && word.isNotEmpty) {
          int cut = 1;
          double cutWidth = _measure(font, style.fontKey, word[0]);
          while (cut < word.length) {
            final double w = _measure(
              font,
              style.fontKey,
              word.substring(0, cut + 1),
            );
            if (w > width) break;
            cutWidth = w;
            cut++;
          }
          append(word.substring(0, cut), style, font, cutWidth);
          flush();
          word = word.substring(cut);
          wordWidth = _measure(font, style.fontKey, word);
        }
        if (word.isEmpty) continue;
        if (x + wordWidth > width && frags.isNotEmpty) flush();
        append(word, style, font, wordWidth);
      }
    }

    flush();
    return lines;
  }

  _Line _emptyLine(_RunStyle style) {
    final sf.PdfFont font = _fontFor(style);
    final double a = font.height * ascentRatio;
    return _Line(<_Frag>[], a, font.height - a, 0);
  }

  // -------------------------------------------------------------------------
  // Ressources
  // -------------------------------------------------------------------------

  sf.PdfFont _fontFor(_RunStyle style) {
    return _fonts.putIfAbsent(style.fontKey, () {
      final List<sf.PdfFontStyle> multi = <sf.PdfFontStyle>[];
      if (style.bold) multi.add(sf.PdfFontStyle.bold);
      if (style.italic) multi.add(sf.PdfFontStyle.italic);
      return sf.PdfStandardFont(
        sf.PdfFontFamily.helvetica,
        style.sizePt.clamp(4.0, 96.0),
        multiStyle: multi.isEmpty ? null : multi,
      );
    });
  }

  /// `measureString` renvoie 0 pour une chaine composee uniquement d'espaces
  /// (Syncfusion la rogne avant de mesurer). Sans correction, la largeur des
  /// fragments serait sous-evaluee et le texte se retrouverait tronque au
  /// dessin. On mesure donc l'espace par difference, une fois par police.
  double _measure(sf.PdfFont font, String key, String text) {
    if (text.isEmpty) return 0;
    if (text.trim().isEmpty) {
      final double unit = _spaceWidths.putIfAbsent(
        key,
        () => font.measureString('. .').width - font.measureString('..').width,
      );
      return unit * text.length;
    }
    return font.measureString(text).width;
  }

  sf.PdfBrush _brushFor(int rgb) {
    return _brushes.putIfAbsent(
      rgb,
      () => sf.PdfSolidBrush(
        sf.PdfColor((rgb >> 16) & 0xFF, (rgb >> 8) & 0xFF, rgb & 0xFF),
      ),
    );
  }
}
