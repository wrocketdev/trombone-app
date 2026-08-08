import 'dart:convert';
import 'dart:typed_data';

import 'package:archive/archive.dart';
import 'package:xml/xml.dart';

/// Lecteur / ecrivain OOXML minimaliste, 100 % Dart (aucun appel plateforme).
///
/// Les formats .docx / .xlsx / .pptx sont des archives ZIP contenant des
/// parties XML. Ce module ecrit un sous-ensemble volontairement reduit mais
/// valide (ouvrable dans Word / Excel / PowerPoint et LibreOffice) et relit
/// le strict necessaire pour la conversion Office -> PDF.
///
/// Limites assumees (voir aussi les ecrans qui l'utilisent) :
///  - ecriture : pas de styles avances, pas d'images dans le .docx,
///    pas de formules ni de mise en forme de cellule dans le .xlsx.
///  - lecture : uniquement le texte (valeurs de cellules, textes de
///    diapositives). Les graphiques, images et mises en forme sont ignores.

// ---------------------------------------------------------------------------
// Modele : Word
// ---------------------------------------------------------------------------

/// Un fragment de texte homogene dans un paragraphe Word.
class DocxRun {
  /// [fontSizePt] a 0 signifie « taille heritee du style du paragraphe »
  /// (indispensable pour que les titres gardent leur taille de titre).
  const DocxRun(
    this.text, {
    this.bold = false,
    this.italic = false,
    this.fontSizePt = 0,
  });

  final String text;
  final bool bold;
  final bool italic;
  final double fontSizePt;
}

/// Style de paragraphe Word.
enum DocxStyle { normal, heading1, heading2, heading3 }

enum _DocxBlockKind { paragraph, table, pageBreak }

/// Un bloc de contenu Word : paragraphe, tableau ou saut de page.
class DocxBlock {
  DocxBlock.paragraph({
    required List<DocxRun> runs,
    this.style = DocxStyle.normal,
  }) : _kind = _DocxBlockKind.paragraph,
       runs = List<DocxRun>.unmodifiable(runs),
       rows = const <List<String>>[];

  DocxBlock.table({required List<List<String>> rows})
    : _kind = _DocxBlockKind.table,
      runs = const <DocxRun>[],
      style = DocxStyle.normal,
      rows = List<List<String>>.unmodifiable(
        rows.map((List<String> r) => List<String>.unmodifiable(r)),
      );

  DocxBlock.pageBreak()
    : _kind = _DocxBlockKind.pageBreak,
      runs = const <DocxRun>[],
      style = DocxStyle.normal,
      rows = const <List<String>>[];

  final _DocxBlockKind _kind;
  final List<DocxRun> runs;
  final DocxStyle style;
  final List<List<String>> rows;

  bool get isParagraph => _kind == _DocxBlockKind.paragraph;
  bool get isTable => _kind == _DocxBlockKind.table;
  bool get isPageBreak => _kind == _DocxBlockKind.pageBreak;

  /// Texte brut du bloc (pratique pour un apercu).
  String get plainText {
    switch (_kind) {
      case _DocxBlockKind.paragraph:
        return runs.map((DocxRun r) => r.text).join();
      case _DocxBlockKind.table:
        return rows.map((List<String> r) => r.join('\t')).join('\n');
      case _DocxBlockKind.pageBreak:
        return '';
    }
  }
}

// ---------------------------------------------------------------------------
// Modele : Excel
// ---------------------------------------------------------------------------

/// Une feuille de calcul : un nom et une grille de chaines.
class XlsxSheet {
  XlsxSheet({required this.name, required List<List<String>> rows})
    : rows = List<List<String>>.unmodifiable(
        rows.map((List<String> r) => List<String>.unmodifiable(r)),
      );

  final String name;
  final List<List<String>> rows;

  int get columnCount =>
      rows.fold<int>(0, (int m, List<String> r) => r.length > m ? r.length : m);
}

// ---------------------------------------------------------------------------
// Modele : PowerPoint
// ---------------------------------------------------------------------------

/// Une diapositive : soit une image plein cadre, soit un titre + des puces.
class PptxSlide {
  PptxSlide.image({
    required Uint8List pngBytes,
    required this.widthPt,
    required this.heightPt,
  }) : isImage = true,
       // ignore: prefer_initializing_formals — le champ est nullable, pas le parametre.
       pngBytes = pngBytes,
       title = '',
       bullets = const <String>[];

  PptxSlide.text({required this.title, required List<String> bullets})
    : isImage = false,
      pngBytes = null,
      widthPt = 0,
      heightPt = 0,
      bullets = List<String>.unmodifiable(bullets);

  final bool isImage;
  final Uint8List? pngBytes;
  final double widthPt;
  final double heightPt;
  final String title;
  final List<String> bullets;

  bool get isText => !isImage;
}

// ---------------------------------------------------------------------------
// Ooxml
// ---------------------------------------------------------------------------

class Ooxml {
  Ooxml._();

  /// 1 point typographique = 12700 EMU (English Metric Units).
  static const int emuPerPoint = 12700;

  /// Taille de diapositive 16:9 par defaut (EMU).
  static const int _defaultSlideCx = 12192000;
  static const int _defaultSlideCy = 6858000;

  // Espaces de noms
  static const String _nsPkgRels =
      'http://schemas.openxmlformats.org/package/2006/relationships';
  static const String _nsRelOfficeDoc =
      'http://schemas.openxmlformats.org/officeDocument/2006/relationships/officeDocument';
  static const String _nsContentTypes =
      'http://schemas.openxmlformats.org/package/2006/content-types';
  static const String _relBase =
      'http://schemas.openxmlformats.org/officeDocument/2006/relationships';

  static const String _xmlDecl =
      '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>\r\n';

  // =========================================================================
  // WORD
  // =========================================================================

  /// Construit un .docx a partir d'une liste de blocs.
  static Uint8List buildDocx(List<DocxBlock> blocks) {
    final Archive archive = Archive();

    _addPart(
      archive,
      '[Content_Types].xml',
      '$_xmlDecl'
          '<Types xmlns="$_nsContentTypes">'
          '<Default Extension="rels" ContentType="application/vnd.openxmlformats-package.relationships+xml"/>'
          '<Default Extension="xml" ContentType="application/xml"/>'
          '<Override PartName="/word/document.xml" ContentType="application/vnd.openxmlformats-officedocument.wordprocessingml.document.main+xml"/>'
          '<Override PartName="/word/styles.xml" ContentType="application/vnd.openxmlformats-officedocument.wordprocessingml.styles+xml"/>'
          '</Types>',
    );

    _addPart(
      archive,
      '_rels/.rels',
      '$_xmlDecl'
          '<Relationships xmlns="$_nsPkgRels">'
          '<Relationship Id="rId1" Type="$_nsRelOfficeDoc" Target="word/document.xml"/>'
          '</Relationships>',
    );

    _addPart(
      archive,
      'word/_rels/document.xml.rels',
      '$_xmlDecl'
          '<Relationships xmlns="$_nsPkgRels">'
          '<Relationship Id="rId1" Type="$_relBase/styles" Target="styles.xml"/>'
          '</Relationships>',
    );

    _addPart(archive, 'word/styles.xml', _docxStylesXml());
    _addPart(archive, 'word/document.xml', _docxDocumentXml(blocks));

    return _zip(archive);
  }

  static String _docxStylesXml() {
    String heading(String id, String name, int outline, int halfPt) =>
        '<w:style w:type="paragraph" w:styleId="$id">'
        '<w:name w:val="$name"/>'
        '<w:basedOn w:val="Normal"/>'
        '<w:next w:val="Normal"/>'
        '<w:qFormat/>'
        '<w:pPr><w:keepNext/><w:spacing w:before="240" w:after="120"/>'
        '<w:outlineLvl w:val="$outline"/></w:pPr>'
        '<w:rPr><w:b/><w:color w:val="1F3864"/><w:sz w:val="$halfPt"/>'
        '<w:szCs w:val="$halfPt"/></w:rPr>'
        '</w:style>';

    return '$_xmlDecl'
        '<w:styles xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main">'
        '<w:docDefaults><w:rPrDefault><w:rPr>'
        '<w:rFonts w:ascii="Calibri" w:hAnsi="Calibri" w:cs="Calibri"/>'
        '<w:sz w:val="22"/><w:szCs w:val="22"/>'
        '</w:rPr></w:rPrDefault>'
        '<w:pPrDefault><w:pPr><w:spacing w:after="120" w:line="259" w:lineRule="auto"/></w:pPr></w:pPrDefault>'
        '</w:docDefaults>'
        '<w:style w:type="paragraph" w:default="1" w:styleId="Normal">'
        '<w:name w:val="Normal"/><w:qFormat/></w:style>'
        '${heading('Heading1', 'heading 1', 0, 36)}'
        '${heading('Heading2', 'heading 2', 1, 28)}'
        '${heading('Heading3', 'heading 3', 2, 24)}'
        '</w:styles>';
  }

  static String? _docxStyleId(DocxStyle style) {
    switch (style) {
      case DocxStyle.normal:
        return null;
      case DocxStyle.heading1:
        return 'Heading1';
      case DocxStyle.heading2:
        return 'Heading2';
      case DocxStyle.heading3:
        return 'Heading3';
    }
  }

  static String _docxDocumentXml(List<DocxBlock> blocks) {
    // Largeur utile en twips : A4 (11906) moins 2 x 1134 de marge.
    const int contentWidthTwips = 9638;
    final StringBuffer body = StringBuffer();

    for (final DocxBlock block in blocks) {
      switch (block._kind) {
        case _DocxBlockKind.pageBreak:
          body.write('<w:p><w:r><w:br w:type="page"/></w:r></w:p>');
        case _DocxBlockKind.paragraph:
          body.write(_docxParagraph(block.runs, block.style));
        case _DocxBlockKind.table:
          body.write(_docxTable(block.rows, contentWidthTwips));
          // Word attend un paragraphe entre/apres les tableaux.
          body.write('<w:p/>');
      }
    }

    if (body.isEmpty) {
      body.write('<w:p/>');
    }

    return '$_xmlDecl'
        '<w:document xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main" '
        'xmlns:r="$_relBase">'
        '<w:body>'
        '$body'
        '<w:sectPr>'
        '<w:pgSz w:w="11906" w:h="16838"/>'
        '<w:pgMar w:top="1134" w:right="1134" w:bottom="1134" w:left="1134" '
        'w:header="708" w:footer="708" w:gutter="0"/>'
        '</w:sectPr>'
        '</w:body></w:document>';
  }

  static String _docxParagraph(List<DocxRun> runs, DocxStyle style) {
    final StringBuffer sb = StringBuffer('<w:p>');
    final String? styleId = _docxStyleId(style);
    if (styleId != null) {
      sb.write('<w:pPr><w:pStyle w:val="$styleId"/></w:pPr>');
    }
    for (final DocxRun run in runs) {
      sb.write(_docxRun(run));
    }
    sb.write('</w:p>');
    return sb.toString();
  }

  static String _docxRun(DocxRun run) {
    final StringBuffer props = StringBuffer();
    if (run.bold) props.write('<w:b/><w:bCs/>');
    if (run.italic) props.write('<w:i/><w:iCs/>');
    if (run.fontSizePt > 0) {
      final int half = (run.fontSizePt * 2).round();
      props.write('<w:sz w:val="$half"/><w:szCs w:val="$half"/>');
    }

    final StringBuffer sb = StringBuffer('<w:r>');
    if (props.isNotEmpty) sb.write('<w:rPr>$props</w:rPr>');

    // Les retours a la ligne doivent devenir des <w:br/> : un \n brut dans
    // <w:t> est simplement ignore par Word.
    final List<String> lines = run.text.replaceAll('\r\n', '\n').split('\n');
    for (int i = 0; i < lines.length; i++) {
      if (i > 0) sb.write('<w:br/>');
      sb.write('<w:t xml:space="preserve">${_esc(lines[i])}</w:t>');
    }
    sb.write('</w:r>');
    return sb.toString();
  }

  static String _docxTable(List<List<String>> rows, int contentWidthTwips) {
    int columns = 0;
    for (final List<String> row in rows) {
      if (row.length > columns) columns = row.length;
    }
    if (columns == 0 || rows.isEmpty) return '<w:p/>';

    final int colWidth = (contentWidthTwips / columns).floor();
    const String borderSide =
        'w:val="single" w:sz="4" w:space="0" w:color="808080"';

    final StringBuffer sb = StringBuffer('<w:tbl>');
    sb.write(
      '<w:tblPr>'
      '<w:tblW w:w="$contentWidthTwips" w:type="dxa"/>'
      '<w:tblBorders>'
      '<w:top $borderSide/><w:left $borderSide/><w:bottom $borderSide/>'
      '<w:right $borderSide/><w:insideH $borderSide/><w:insideV $borderSide/>'
      '</w:tblBorders>'
      '<w:tblLayout w:type="fixed"/>'
      '</w:tblPr>',
    );

    sb.write('<w:tblGrid>');
    for (int c = 0; c < columns; c++) {
      sb.write('<w:gridCol w:w="$colWidth"/>');
    }
    sb.write('</w:tblGrid>');

    for (final List<String> row in rows) {
      sb.write('<w:tr>');
      for (int c = 0; c < columns; c++) {
        final String value = c < row.length ? row[c] : '';
        sb.write(
          '<w:tc>'
          '<w:tcPr><w:tcW w:w="$colWidth" w:type="dxa"/></w:tcPr>'
          '${_docxParagraph(<DocxRun>[DocxRun(value)], DocxStyle.normal)}'
          '</w:tc>',
        );
      }
      sb.write('</w:tr>');
    }

    sb.write('</w:tbl>');
    return sb.toString();
  }

  // =========================================================================
  // EXCEL
  // =========================================================================

  /// Construit un .xlsx. Toutes les cellules sont ecrites en chaines inline
  /// (t="inlineStr"), ce qui evite d'avoir a gerer sharedStrings.xml.
  static Uint8List buildXlsx(List<XlsxSheet> sheets) {
    final List<XlsxSheet> input = sheets.isEmpty
        ? <XlsxSheet>[XlsxSheet(name: 'Feuille1', rows: const <List<String>>[])]
        : sheets;

    final List<String> names = _uniqueSheetNames(input);
    final Archive archive = Archive();

    final StringBuffer types = StringBuffer(
      '$_xmlDecl'
      '<Types xmlns="$_nsContentTypes">'
      '<Default Extension="rels" ContentType="application/vnd.openxmlformats-package.relationships+xml"/>'
      '<Default Extension="xml" ContentType="application/xml"/>'
      '<Override PartName="/xl/workbook.xml" ContentType="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet.main+xml"/>'
      '<Override PartName="/xl/styles.xml" ContentType="application/vnd.openxmlformats-officedocument.spreadsheetml.styles+xml"/>',
    );
    final StringBuffer sheetTags = StringBuffer();
    final StringBuffer wbRels = StringBuffer(
      '$_xmlDecl<Relationships xmlns="$_nsPkgRels">',
    );

    for (int i = 0; i < input.length; i++) {
      final int n = i + 1;
      types.write(
        '<Override PartName="/xl/worksheets/sheet$n.xml" '
        'ContentType="application/vnd.openxmlformats-officedocument.spreadsheetml.worksheet+xml"/>',
      );
      sheetTags.write(
        '<sheet name="${_esc(names[i])}" sheetId="$n" r:id="rId$n"/>',
      );
      wbRels.write(
        '<Relationship Id="rId$n" Type="$_relBase/worksheet" '
        'Target="worksheets/sheet$n.xml"/>',
      );
      _addPart(
        archive,
        'xl/worksheets/sheet$n.xml',
        _xlsxSheetXml(input[i].rows),
      );
    }

    // La relation vers styles.xml doit venir apres les feuilles pour ne pas
    // voler un rIdN attendu par workbook.xml.
    final int stylesRid = input.length + 1;
    wbRels.write(
      '<Relationship Id="rId$stylesRid" Type="$_relBase/styles" Target="styles.xml"/>',
    );
    wbRels.write('</Relationships>');
    types.write('</Types>');

    _addPart(archive, '[Content_Types].xml', types.toString());
    _addPart(
      archive,
      '_rels/.rels',
      '$_xmlDecl'
          '<Relationships xmlns="$_nsPkgRels">'
          '<Relationship Id="rId1" Type="$_nsRelOfficeDoc" Target="xl/workbook.xml"/>'
          '</Relationships>',
    );
    _addPart(
      archive,
      'xl/workbook.xml',
      '$_xmlDecl'
          '<workbook xmlns="http://schemas.openxmlformats.org/spreadsheetml/2006/main" '
          'xmlns:r="$_relBase">'
          '<sheets>$sheetTags</sheets>'
          '</workbook>',
    );
    _addPart(archive, 'xl/_rels/workbook.xml.rels', wbRels.toString());
    _addPart(archive, 'xl/styles.xml', _xlsxStylesXml());

    return _zip(archive);
  }

  static String _xlsxStylesXml() {
    return '$_xmlDecl'
        '<styleSheet xmlns="http://schemas.openxmlformats.org/spreadsheetml/2006/main">'
        '<fonts count="1"><font><sz val="11"/><name val="Calibri"/></font></fonts>'
        // Excel exige au minimum les deux remplissages par defaut.
        '<fills count="2">'
        '<fill><patternFill patternType="none"/></fill>'
        '<fill><patternFill patternType="gray125"/></fill>'
        '</fills>'
        '<borders count="1"><border><left/><right/><top/><bottom/><diagonal/></border></borders>'
        '<cellStyleXfs count="1"><xf numFmtId="0" fontId="0" fillId="0" borderId="0"/></cellStyleXfs>'
        '<cellXfs count="1"><xf numFmtId="0" fontId="0" fillId="0" borderId="0" xfId="0"/></cellXfs>'
        '<cellStyles count="1"><cellStyle name="Normal" xfId="0" builtinId="0"/></cellStyles>'
        '</styleSheet>';
  }

  static String _xlsxSheetXml(List<List<String>> rows) {
    final StringBuffer sb = StringBuffer(
      '$_xmlDecl'
      '<worksheet xmlns="http://schemas.openxmlformats.org/spreadsheetml/2006/main">'
      '<sheetData>',
    );

    for (int r = 0; r < rows.length; r++) {
      final List<String> row = rows[r];
      final int rowNumber = r + 1;
      final StringBuffer cells = StringBuffer();
      for (int c = 0; c < row.length; c++) {
        final String value = row[c];
        if (value.isEmpty) continue; // cellule vide : on ne l'ecrit pas
        cells.write(
          '<c r="${colLetters(c)}$rowNumber" t="inlineStr">'
          '<is><t xml:space="preserve">${_esc(value)}</t></is></c>',
        );
      }
      if (cells.isEmpty) continue;
      sb.write('<row r="$rowNumber">$cells</row>');
    }

    sb.write('</sheetData></worksheet>');
    return sb.toString();
  }

  /// Convertit un index de colonne 0-base en lettres A1 (0 -> A, 26 -> AA).
  static String colLetters(int index) {
    if (index < 0) return 'A';
    final List<int> codes = <int>[];
    int i = index;
    while (true) {
      codes.add(65 + (i % 26));
      i = (i ~/ 26) - 1;
      if (i < 0) break;
    }
    return String.fromCharCodes(codes.reversed);
  }

  /// Nettoie / rend uniques les noms de feuilles (Excel : 31 caracteres max,
  /// caracteres []:*?/\ interdits, noms uniques obligatoires).
  static List<String> _uniqueSheetNames(List<XlsxSheet> sheets) {
    final List<String> out = <String>[];
    final Set<String> used = <String>{};
    for (int i = 0; i < sheets.length; i++) {
      String name = sheets[i].name
          .replaceAll(RegExp(r'[\[\]:*?/\\]'), ' ')
          .replaceAll(RegExp(r'\s+'), ' ')
          .trim();
      if (name.isEmpty) name = 'Feuille${i + 1}';
      if (name.length > 31) name = name.substring(0, 31);
      String candidate = name;
      int suffix = 2;
      while (used.contains(candidate.toLowerCase())) {
        final String tail = ' ($suffix)';
        final String head = name.length + tail.length > 31
            ? name.substring(0, 31 - tail.length)
            : name;
        candidate = '$head$tail';
        suffix++;
      }
      used.add(candidate.toLowerCase());
      out.add(candidate);
    }
    return out;
  }

  // =========================================================================
  // POWERPOINT
  // =========================================================================

  /// Construit un .pptx. Les diapositives image portent le PNG en plein cadre,
  /// les diapositives texte un titre et une puce par ligne.
  static Uint8List buildPptx(List<PptxSlide> slides) {
    final List<PptxSlide> input = slides.isEmpty
        ? <PptxSlide>[PptxSlide.text(title: '', bullets: const <String>[])]
        : slides;

    // Taille de diapositive : celle de la premiere image, sinon 16:9.
    int slideCx = _defaultSlideCx;
    int slideCy = _defaultSlideCy;
    for (final PptxSlide s in input) {
      if (s.isImage && s.widthPt > 0 && s.heightPt > 0) {
        slideCx = _clampEmu((s.widthPt * emuPerPoint).round());
        slideCy = _clampEmu((s.heightPt * emuPerPoint).round());
        break;
      }
    }

    final Archive archive = Archive();

    final StringBuffer types = StringBuffer(
      '$_xmlDecl'
      '<Types xmlns="$_nsContentTypes">'
      '<Default Extension="rels" ContentType="application/vnd.openxmlformats-package.relationships+xml"/>'
      '<Default Extension="xml" ContentType="application/xml"/>'
      '<Default Extension="png" ContentType="image/png"/>'
      '<Override PartName="/ppt/presentation.xml" ContentType="application/vnd.openxmlformats-officedocument.presentationml.presentation.main+xml"/>'
      '<Override PartName="/ppt/slideMasters/slideMaster1.xml" ContentType="application/vnd.openxmlformats-officedocument.presentationml.slideMaster+xml"/>'
      '<Override PartName="/ppt/slideLayouts/slideLayout1.xml" ContentType="application/vnd.openxmlformats-officedocument.presentationml.slideLayout+xml"/>'
      '<Override PartName="/ppt/theme/theme1.xml" ContentType="application/vnd.openxmlformats-officedocument.theme+xml"/>',
    );

    final StringBuffer sldIdLst = StringBuffer();
    final StringBuffer presRels = StringBuffer(
      '$_xmlDecl<Relationships xmlns="$_nsPkgRels">'
      '<Relationship Id="rId1" Type="$_relBase/slideMaster" Target="slideMasters/slideMaster1.xml"/>',
    );

    for (int i = 0; i < input.length; i++) {
      final int n = i + 1;
      final int rid = n + 1; // rId1 est reserve au slideMaster
      types.write(
        '<Override PartName="/ppt/slides/slide$n.xml" '
        'ContentType="application/vnd.openxmlformats-officedocument.presentationml.slide+xml"/>',
      );
      sldIdLst.write('<p:sldId id="${255 + n}" r:id="rId$rid"/>');
      presRels.write(
        '<Relationship Id="rId$rid" Type="$_relBase/slide" '
        'Target="slides/slide$n.xml"/>',
      );

      final PptxSlide slide = input[i];
      final StringBuffer slideRels = StringBuffer(
        '$_xmlDecl<Relationships xmlns="$_nsPkgRels">'
        '<Relationship Id="rId1" Type="$_relBase/slideLayout" '
        'Target="../slideLayouts/slideLayout1.xml"/>',
      );

      if (slide.isImage && slide.pngBytes != null) {
        slideRels.write(
          '<Relationship Id="rId2" Type="$_relBase/image" '
          'Target="../media/image$n.png"/>',
        );
        archive.addFile(
          ArchiveFile(
            'ppt/media/image$n.png',
            slide.pngBytes!.length,
            slide.pngBytes!,
          ),
        );
      }
      slideRels.write('</Relationships>');

      _addPart(
        archive,
        'ppt/slides/_rels/slide$n.xml.rels',
        slideRels.toString(),
      );
      _addPart(
        archive,
        'ppt/slides/slide$n.xml',
        _pptxSlideXml(slide, slideCx, slideCy),
      );
    }

    presRels.write('</Relationships>');
    types.write('</Types>');

    _addPart(archive, '[Content_Types].xml', types.toString());
    _addPart(
      archive,
      '_rels/.rels',
      '$_xmlDecl'
          '<Relationships xmlns="$_nsPkgRels">'
          '<Relationship Id="rId1" Type="$_nsRelOfficeDoc" Target="ppt/presentation.xml"/>'
          '</Relationships>',
    );
    _addPart(
      archive,
      'ppt/presentation.xml',
      '$_xmlDecl'
          '<p:presentation xmlns:a="http://schemas.openxmlformats.org/drawingml/2006/main" '
          'xmlns:r="$_relBase" '
          'xmlns:p="http://schemas.openxmlformats.org/presentationml/2006/main">'
          '<p:sldMasterIdLst><p:sldMasterId id="2147483648" r:id="rId1"/></p:sldMasterIdLst>'
          '<p:sldIdLst>$sldIdLst</p:sldIdLst>'
          '<p:sldSz cx="$slideCx" cy="$slideCy"/>'
          '<p:notesSz cx="6858000" cy="9144000"/>'
          '</p:presentation>',
    );
    _addPart(archive, 'ppt/_rels/presentation.xml.rels', presRels.toString());
    _addPart(
      archive,
      'ppt/slideMasters/slideMaster1.xml',
      _pptxSlideMasterXml(),
    );
    _addPart(
      archive,
      'ppt/slideMasters/_rels/slideMaster1.xml.rels',
      '$_xmlDecl'
          '<Relationships xmlns="$_nsPkgRels">'
          '<Relationship Id="rId1" Type="$_relBase/slideLayout" Target="../slideLayouts/slideLayout1.xml"/>'
          '<Relationship Id="rId2" Type="$_relBase/theme" Target="../theme/theme1.xml"/>'
          '</Relationships>',
    );
    _addPart(
      archive,
      'ppt/slideLayouts/slideLayout1.xml',
      _pptxSlideLayoutXml(),
    );
    _addPart(
      archive,
      'ppt/slideLayouts/_rels/slideLayout1.xml.rels',
      '$_xmlDecl'
          '<Relationships xmlns="$_nsPkgRels">'
          '<Relationship Id="rId1" Type="$_relBase/slideMaster" Target="../slideMasters/slideMaster1.xml"/>'
          '</Relationships>',
    );
    _addPart(archive, 'ppt/theme/theme1.xml', _pptxThemeXml());

    return _zip(archive);
  }

  static int _clampEmu(int value) {
    const int min = 914400; // 1 pouce
    const int max = 51206400; // 56 pouces (limite PowerPoint)
    if (value < min) return min;
    if (value > max) return max;
    return value;
  }

  static const String _pptxNs =
      'xmlns:a="http://schemas.openxmlformats.org/drawingml/2006/main" '
      'xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships" '
      'xmlns:p="http://schemas.openxmlformats.org/presentationml/2006/main"';

  static const String _emptySpTree =
      '<p:spTree>'
      '<p:nvGrpSpPr><p:cNvPr id="1" name=""/><p:cNvGrpSpPr/><p:nvPr/></p:nvGrpSpPr>'
      '<p:grpSpPr><a:xfrm><a:off x="0" y="0"/><a:ext cx="0" cy="0"/>'
      '<a:chOff x="0" y="0"/><a:chExt cx="0" cy="0"/></a:xfrm></p:grpSpPr>';

  static String _pptxSlideMasterXml() {
    return '$_xmlDecl'
        '<p:sldMaster $_pptxNs>'
        '<p:cSld>$_emptySpTree</p:spTree></p:cSld>'
        '<p:clrMap bg1="lt1" tx1="dk1" bg2="lt2" tx2="dk2" accent1="accent1" '
        'accent2="accent2" accent3="accent3" accent4="accent4" accent5="accent5" '
        'accent6="accent6" hlink="hlink" folHlink="folHlink"/>'
        '<p:sldLayoutIdLst><p:sldLayoutId id="2147483649" r:id="rId1"/></p:sldLayoutIdLst>'
        '</p:sldMaster>';
  }

  static String _pptxSlideLayoutXml() {
    return '$_xmlDecl'
        '<p:sldLayout $_pptxNs type="blank" preserve="1">'
        '<p:cSld name="Vide">$_emptySpTree</p:spTree></p:cSld>'
        '<p:clrMapOvr><a:masterClrMapping/></p:clrMapOvr>'
        '</p:sldLayout>';
  }

  static String _pptxSlideXml(PptxSlide slide, int slideCx, int slideCy) {
    final StringBuffer shapes = StringBuffer();

    if (slide.isImage && slide.pngBytes != null) {
      // Ajustement de l'image dans la diapositive en conservant le ratio.
      int cx = slideCx;
      int cy = slideCy;
      if (slide.widthPt > 0 && slide.heightPt > 0) {
        final double scale = <double>[
          slideCx / (slide.widthPt * emuPerPoint),
          slideCy / (slide.heightPt * emuPerPoint),
        ].reduce((double a, double b) => a < b ? a : b);
        cx = (slide.widthPt * emuPerPoint * scale).round();
        cy = (slide.heightPt * emuPerPoint * scale).round();
      }
      final int offX = ((slideCx - cx) / 2).round();
      final int offY = ((slideCy - cy) / 2).round();

      shapes.write(
        '<p:pic>'
        '<p:nvPicPr>'
        '<p:cNvPr id="2" name="Image 1"/>'
        '<p:cNvPicPr><a:picLocks noChangeAspect="1"/></p:cNvPicPr>'
        '<p:nvPr/>'
        '</p:nvPicPr>'
        '<p:blipFill><a:blip r:embed="rId2"/><a:stretch><a:fillRect/></a:stretch></p:blipFill>'
        '<p:spPr>'
        '<a:xfrm><a:off x="$offX" y="$offY"/><a:ext cx="$cx" cy="$cy"/></a:xfrm>'
        '<a:prstGeom prst="rect"><a:avLst/></a:prstGeom>'
        '</p:spPr>'
        '</p:pic>',
      );
    } else {
      final int margin = (slideCx * 0.06).round();
      final int titleTop = (slideCy * 0.07).round();
      final int titleHeight = (slideCy * 0.18).round();
      final int bodyTop = titleTop + titleHeight + (slideCy * 0.04).round();
      final int bodyHeight = slideCy - bodyTop - (slideCy * 0.07).round();
      final int width = slideCx - 2 * margin;

      shapes.write(
        '<p:sp>'
        '<p:nvSpPr><p:cNvPr id="2" name="Titre 1"/>'
        '<p:cNvSpPr><a:spLocks noGrp="1"/></p:cNvSpPr><p:nvPr/></p:nvSpPr>'
        '<p:spPr>'
        '<a:xfrm><a:off x="$margin" y="$titleTop"/>'
        '<a:ext cx="$width" cy="$titleHeight"/></a:xfrm>'
        '<a:prstGeom prst="rect"><a:avLst/></a:prstGeom>'
        '</p:spPr>'
        '<p:txBody>'
        '<a:bodyPr wrap="square"><a:normAutofit/></a:bodyPr><a:lstStyle/>'
        '<a:p><a:r><a:rPr lang="fr-FR" sz="3200" b="1" dirty="0"/>'
        '<a:t>${_esc(slide.title)}</a:t></a:r></a:p>'
        '</p:txBody>'
        '</p:sp>',
      );

      final StringBuffer paragraphs = StringBuffer();
      for (final String bullet in slide.bullets) {
        paragraphs.write(
          '<a:p>'
          '<a:pPr marL="285750" indent="-285750"><a:buChar char="•"/></a:pPr>'
          '<a:r><a:rPr lang="fr-FR" sz="1800" dirty="0"/>'
          '<a:t>${_esc(bullet)}</a:t></a:r>'
          '</a:p>',
        );
      }
      if (paragraphs.isEmpty)
        paragraphs.write('<a:p><a:endParaRPr lang="fr-FR"/></a:p>');

      shapes.write(
        '<p:sp>'
        '<p:nvSpPr><p:cNvPr id="3" name="Contenu 2"/>'
        '<p:cNvSpPr><a:spLocks noGrp="1"/></p:cNvSpPr><p:nvPr/></p:nvSpPr>'
        '<p:spPr>'
        '<a:xfrm><a:off x="$margin" y="$bodyTop"/>'
        '<a:ext cx="$width" cy="${bodyHeight > 0 ? bodyHeight : titleHeight}"/></a:xfrm>'
        '<a:prstGeom prst="rect"><a:avLst/></a:prstGeom>'
        '</p:spPr>'
        '<p:txBody>'
        '<a:bodyPr wrap="square"><a:normAutofit/></a:bodyPr><a:lstStyle/>'
        '$paragraphs'
        '</p:txBody>'
        '</p:sp>',
      );
    }

    return '$_xmlDecl'
        '<p:sld $_pptxNs>'
        '<p:cSld>$_emptySpTree$shapes</p:spTree></p:cSld>'
        '<p:clrMapOvr><a:masterClrMapping/></p:clrMapOvr>'
        '</p:sld>';
  }

  static String _pptxThemeXml() {
    const String phFill =
        '<a:solidFill><a:schemeClr val="phClr"/></a:solidFill>';
    const String line =
        '<a:ln w="6350" cap="flat" cmpd="sng" algn="ctr">'
        '$phFill<a:prstDash val="solid"/></a:ln>';
    const String effect = '<a:effectStyle><a:effectLst/></a:effectStyle>';

    return '$_xmlDecl'
        '<a:theme xmlns:a="http://schemas.openxmlformats.org/drawingml/2006/main" name="Office">'
        '<a:themeElements>'
        '<a:clrScheme name="Office">'
        '<a:dk1><a:sysClr val="windowText" lastClr="000000"/></a:dk1>'
        '<a:lt1><a:sysClr val="window" lastClr="FFFFFF"/></a:lt1>'
        '<a:dk2><a:srgbClr val="44546A"/></a:dk2>'
        '<a:lt2><a:srgbClr val="E7E6E6"/></a:lt2>'
        '<a:accent1><a:srgbClr val="4472C4"/></a:accent1>'
        '<a:accent2><a:srgbClr val="ED7D31"/></a:accent2>'
        '<a:accent3><a:srgbClr val="A5A5A5"/></a:accent3>'
        '<a:accent4><a:srgbClr val="FFC000"/></a:accent4>'
        '<a:accent5><a:srgbClr val="5B9BD5"/></a:accent5>'
        '<a:accent6><a:srgbClr val="70AD47"/></a:accent6>'
        '<a:hlink><a:srgbClr val="0563C1"/></a:hlink>'
        '<a:folHlink><a:srgbClr val="954F72"/></a:folHlink>'
        '</a:clrScheme>'
        '<a:fontScheme name="Office">'
        '<a:majorFont><a:latin typeface="Calibri Light"/><a:ea typeface=""/><a:cs typeface=""/></a:majorFont>'
        '<a:minorFont><a:latin typeface="Calibri"/><a:ea typeface=""/><a:cs typeface=""/></a:minorFont>'
        '</a:fontScheme>'
        '<a:fmtScheme name="Office">'
        '<a:fillStyleLst>$phFill$phFill$phFill</a:fillStyleLst>'
        '<a:lnStyleLst>$line$line$line</a:lnStyleLst>'
        '<a:effectStyleLst>$effect$effect$effect</a:effectStyleLst>'
        '<a:bgFillStyleLst>$phFill$phFill$phFill</a:bgFillStyleLst>'
        '</a:fmtScheme>'
        '</a:themeElements>'
        '</a:theme>';
  }

  // =========================================================================
  // LECTURE : XLSX
  // =========================================================================

  /// Lit un .xlsx : nom des feuilles (dans l'ordre du classeur) et grille de
  /// cellules sous forme de chaines telles qu'affichees.
  static List<XlsxSheet> readXlsx(Uint8List bytes) {
    final Archive archive = _openZip(bytes, 'Excel');
    final String? workbookXml = _partText(archive, 'xl/workbook.xml');
    if (workbookXml == null) {
      throw const FormatException(
        'Classeur Excel invalide : xl/workbook.xml est introuvable.',
      );
    }

    final Map<String, String> rels = _readRels(
      archive,
      'xl/_rels/workbook.xml.rels',
    );
    final List<String> shared = _readSharedStrings(archive);

    final XmlDocument doc = XmlDocument.parse(workbookXml);
    final List<XlsxSheet> sheets = <XlsxSheet>[];
    int index = 0;

    for (final XmlElement element in doc.findAllElements(
      'sheet',
      namespaceUri: '*',
    )) {
      index++;
      final String name = (element.getAttribute('name') ?? '').trim().isEmpty
          ? 'Feuille $index'
          : element.getAttribute('name')!.trim();
      // r:id -> nom de la partie via workbook.xml.rels
      final String? rid = element.getAttribute('id', namespaceUri: '*');
      final String? target = rid == null ? null : rels[rid];
      String? sheetXml;
      if (target != null) {
        sheetXml = _partText(archive, _resolvePart('xl', target));
      }
      sheetXml ??= _partText(archive, 'xl/worksheets/sheet$index.xml');

      sheets.add(
        XlsxSheet(
          name: name,
          rows: sheetXml == null
              ? const <List<String>>[]
              : _parseWorksheet(sheetXml, shared),
        ),
      );
    }

    if (sheets.isEmpty) {
      throw const FormatException(
        'Aucune feuille de calcul trouvee dans ce classeur.',
      );
    }
    return sheets;
  }

  static List<String> _readSharedStrings(Archive archive) {
    final String? xml = _partText(archive, 'xl/sharedStrings.xml');
    if (xml == null) return const <String>[];
    final XmlDocument doc = XmlDocument.parse(xml);
    return doc
        .findAllElements('si', namespaceUri: '*')
        .map(
          (XmlElement si) => si
              .findAllElements('t', namespaceUri: '*')
              .map((XmlElement t) => t.innerText)
              .join(),
        )
        .toList(growable: false);
  }

  static List<List<String>> _parseWorksheet(String xml, List<String> shared) {
    final XmlDocument doc = XmlDocument.parse(xml);
    // Grille creuse : (ligne, colonne) -> valeur. Les fichiers Excel omettent
    // souvent les cellules vides et parfois des lignes entieres.
    final Map<int, Map<int, String>> grid = <int, Map<int, String>>{};
    int maxRow = -1;
    int maxCol = -1;
    int implicitRow = 0;

    for (final XmlElement rowEl in doc.findAllElements(
      'row',
      namespaceUri: '*',
    )) {
      final int rowIndex =
          (int.tryParse(rowEl.getAttribute('r') ?? '') ?? (implicitRow + 1)) -
          1;
      implicitRow = rowIndex;
      if (rowIndex < 0) continue;

      int implicitCol = -1;
      for (final XmlElement cell in rowEl.findAllElements(
        'c',
        namespaceUri: '*',
      )) {
        final String? ref = cell.getAttribute('r');
        int colIndex = ref == null ? -1 : _colIndexFromRef(ref);
        if (colIndex < 0) colIndex = implicitCol + 1;
        implicitCol = colIndex;

        final String value = _cellValue(cell, shared);
        if (value.isEmpty) continue;

        (grid[rowIndex] ??= <int, String>{})[colIndex] = value;
        if (rowIndex > maxRow) maxRow = rowIndex;
        if (colIndex > maxCol) maxCol = colIndex;
      }
    }

    if (maxRow < 0 || maxCol < 0) return const <List<String>>[];

    // Densification en grille rectangulaire.
    return List<List<String>>.generate(maxRow + 1, (int r) {
      final Map<int, String>? row = grid[r];
      return List<String>.generate(
        maxCol + 1,
        (int c) => row?[c] ?? '',
        growable: false,
      );
    }, growable: false);
  }

  static String _cellValue(XmlElement cell, List<String> shared) {
    final String type = cell.getAttribute('t') ?? 'n';

    if (type == 'inlineStr') {
      final XmlElement? is0 = _firstChild(cell, 'is');
      if (is0 == null) return '';
      return is0
          .findAllElements('t', namespaceUri: '*')
          .map((XmlElement t) => t.innerText)
          .join();
    }

    final XmlElement? v = _firstChild(cell, 'v');
    final String raw = v?.innerText ?? '';
    if (raw.isEmpty) return '';

    switch (type) {
      case 's':
        final int? i = int.tryParse(raw);
        if (i == null || i < 0 || i >= shared.length) return '';
        return shared[i];
      case 'b':
        return raw == '1' ? 'VRAI' : 'FAUX';
      case 'str':
      case 'e':
        return raw;
      default:
        return _formatNumeric(raw);
    }
  }

  /// Evite d'afficher « 3.0 » la ou Excel affiche « 3 ».
  static String _formatNumeric(String raw) {
    final double? d = double.tryParse(raw);
    if (d == null) return raw;
    if (d.isFinite && d == d.roundToDouble() && d.abs() < 1e15) {
      return d.toInt().toString();
    }
    return raw;
  }

  /// « B7 » -> 1 (index de colonne 0-base). -1 si la reference est invalide.
  static int _colIndexFromRef(String ref) {
    int n = 0;
    int letters = 0;
    for (final int code in ref.codeUnits) {
      if (code >= 65 && code <= 90) {
        n = n * 26 + (code - 64);
        letters++;
      } else if (code >= 97 && code <= 122) {
        n = n * 26 + (code - 96);
        letters++;
      } else {
        break;
      }
    }
    return letters == 0 ? -1 : n - 1;
  }

  // =========================================================================
  // LECTURE : PPTX
  // =========================================================================

  /// Lit un .pptx : renvoie une diapositive texte par diapositive du fichier
  /// (premier texte non vide = titre, le reste = puces). Les images, tableaux
  /// et graphiques ne sont pas extraits.
  static List<PptxSlide> readPptx(Uint8List bytes) {
    final Archive archive = _openZip(bytes, 'PowerPoint');

    final List<ArchiveFile> slideParts = archive.files
        .where(
          (ArchiveFile f) =>
              f.isFile &&
              RegExp(r'^ppt/slides/slide\d+\.xml$').hasMatch(f.name),
        )
        .toList();

    if (slideParts.isEmpty) {
      throw const FormatException(
        'Aucune diapositive trouvee dans cette presentation.',
      );
    }

    // Tri NUMERIQUE : un tri alphabetique placerait slide10 avant slide2.
    slideParts.sort(
      (ArchiveFile a, ArchiveFile b) =>
          _slideNumber(a.name).compareTo(_slideNumber(b.name)),
    );

    final List<PptxSlide> slides = <PptxSlide>[];
    for (final ArchiveFile part in slideParts) {
      final String xml = utf8.decode(part.content, allowMalformed: true);
      final List<String> paragraphs = <String>[];
      XmlDocument doc;
      try {
        doc = XmlDocument.parse(xml);
      } on XmlException {
        slides.add(PptxSlide.text(title: '', bullets: const <String>[]));
        continue;
      }

      // Un paragraphe <a:p> peut etre decoupe en plusieurs <a:r>/<a:t> :
      // on recolle les morceaux avant d'en faire une puce.
      for (final XmlElement p in doc.findAllElements('p', namespaceUri: '*')) {
        final String text = p
            .findAllElements('t', namespaceUri: '*')
            .map((XmlElement t) => t.innerText)
            .join()
            .trim();
        if (text.isNotEmpty) paragraphs.add(text);
      }

      if (paragraphs.isEmpty) {
        slides.add(PptxSlide.text(title: '', bullets: const <String>[]));
      } else {
        slides.add(
          PptxSlide.text(
            title: paragraphs.first,
            bullets: paragraphs.skip(1).toList(growable: false),
          ),
        );
      }
    }

    return slides;
  }

  static int _slideNumber(String name) {
    final Match? m = RegExp(r'slide(\d+)\.xml$').firstMatch(name);
    return m == null ? 0 : int.tryParse(m.group(1)!) ?? 0;
  }

  // =========================================================================
  // Utilitaires ZIP / XML
  // =========================================================================

  /// Premier enfant direct dont le nom local vaut [localName], tous espaces
  /// de noms confondus (OOXML est entierement namespace : `c`, `w:t`, `a:t`...).
  static XmlElement? _firstChild(XmlElement parent, String localName) {
    for (final XmlElement child in parent.findElements(
      localName,
      namespaceUri: '*',
    )) {
      return child;
    }
    return null;
  }

  static void _addPart(Archive archive, String name, String xml) {
    final List<int> data = utf8.encode(xml);
    archive.addFile(ArchiveFile(name, data.length, data));
  }

  static Uint8List _zip(Archive archive) => ZipEncoder().encodeBytes(archive);

  static Archive _openZip(Uint8List bytes, String label) {
    Archive archive;
    try {
      archive = ZipDecoder().decodeBytes(bytes);
    } catch (_) {
      throw FormatException(
        "Ce fichier n'est pas un document $label valide (archive illisible).",
      );
    }
    // ZipDecoder ne leve pas toujours sur des octets quelconques : il rend
    // simplement une archive vide. On traite ce cas comme une erreur.
    if (archive.files.isEmpty) {
      throw FormatException(
        "Ce fichier n'est pas un document $label valide (archive vide).",
      );
    }
    return archive;
  }

  static ArchiveFile? _findPart(Archive archive, String path) {
    for (final ArchiveFile f in archive.files) {
      if (f.name == path) return f;
    }
    // Repli insensible a la casse : certains generateurs exotiques varient.
    final String lower = path.toLowerCase();
    for (final ArchiveFile f in archive.files) {
      if (f.name.toLowerCase() == lower) return f;
    }
    return null;
  }

  static String? _partText(Archive archive, String path) {
    final ArchiveFile? file = _findPart(archive, path);
    if (file == null) return null;
    return utf8.decode(file.content, allowMalformed: true);
  }

  /// Lit une partie .rels et renvoie { rId -> Target }.
  static Map<String, String> _readRels(Archive archive, String path) {
    final String? xml = _partText(archive, path);
    if (xml == null) return <String, String>{};
    final Map<String, String> map = <String, String>{};
    try {
      final XmlDocument doc = XmlDocument.parse(xml);
      for (final XmlElement rel in doc.findAllElements(
        'Relationship',
        namespaceUri: '*',
      )) {
        final String? id = rel.getAttribute('Id');
        final String? target = rel.getAttribute('Target');
        if (id != null && target != null) map[id] = target;
      }
    } on XmlException {
      return <String, String>{};
    }
    return map;
  }

  /// Resout une cible de relation (relative ou absolue) en chemin de partie.
  static String _resolvePart(String baseDir, String target) {
    if (target.startsWith('/')) return target.substring(1);
    final List<String> segments = <String>[
      ...baseDir.split('/'),
      ...target.split('/'),
    ];
    final List<String> out = <String>[];
    for (final String segment in segments) {
      if (segment.isEmpty || segment == '.') continue;
      if (segment == '..') {
        if (out.isNotEmpty) out.removeLast();
        continue;
      }
      out.add(segment);
    }
    return out.join('/');
  }

  /// Echappe les caracteres speciaux XML et supprime les caracteres de
  /// controle interdits : une seule esperluette brute rend tout le fichier
  /// inouvrable dans Word / Excel / PowerPoint.
  static String _esc(String input) {
    final StringBuffer buf = StringBuffer();
    for (final int rune in input.runes) {
      if (rune == 0x26) {
        buf.write('&amp;');
      } else if (rune == 0x3C) {
        buf.write('&lt;');
      } else if (rune == 0x3E) {
        buf.write('&gt;');
      } else if (rune == 0x22) {
        buf.write('&quot;');
      } else if (rune == 0x27) {
        buf.write('&apos;');
      } else if (rune == 0x09 || rune == 0x0A || rune == 0x0D) {
        buf.writeCharCode(rune);
      } else if (rune >= 0x20 && rune != 0xFFFE && rune != 0xFFFF) {
        buf.writeCharCode(rune);
      }
      // Les autres caracteres de controle sont volontairement ignores.
    }
    return buf.toString();
  }
}
