// The OOXML tests that matter: a .docx/.xlsx/.pptx that Word or Excel
// refuses to open is worthless no matter how clean the Dart looks, and
// `dart analyze` cannot see that. These verify the generated archives are
// structurally valid, correctly escaped, and round-trip faithfully — plus
// that the PDF->Office direction reconstructs real structure rather than
// dumping raw text.
import 'dart:convert';
import 'dart:typed_data';
import 'dart:ui';

import 'package:archive/archive.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart' as sf;
import 'package:xml/xml.dart';

import 'package:trombone/core/office/docx_renderer.dart';
import 'package:trombone/core/office/ooxml.dart';
import 'package:trombone/core/pdf/layout_analyzer.dart';

import 'app_test.dart' show buildMinimalDocx;

/// Every part of an OOXML package must be well-formed XML, and the parts
/// Office requires to exist must actually be present.
void assertValidPackage(
  Uint8List bytes,
  List<String> requiredParts, {
  required String label,
}) {
  final Archive archive = ZipDecoder().decodeBytes(bytes);
  final Set<String> names = archive.files.map((f) => f.name).toSet();
  for (final part in requiredParts) {
    expect(
      names,
      contains(part),
      reason: '$label: missing required part $part',
    );
  }
  for (final file in archive.files) {
    if (!file.name.endsWith('.xml') && !file.name.endsWith('.rels')) continue;
    final String content = utf8.decode(file.content, allowMalformed: true);
    expect(
      () => XmlDocument.parse(content),
      returnsNormally,
      reason: '$label: ${file.name} is not well-formed XML',
    );
  }
}

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  // The classic killer: one unescaped & or < and Word shows
  // "we're sorry, we can't open this file".
  const String nasty = 'Marie & Cie <Directrice> "Ventes" \'2026\' — 50% ↑';

  testWidgets('docx is a valid package and survives hostile characters', (
    tester,
  ) async {
    final Uint8List docx = Ooxml.buildDocx([
      DocxBlock.paragraph(
        runs: const [DocxRun('Rapport annuel', bold: true)],
        style: DocxStyle.heading1,
      ),
      DocxBlock.paragraph(
        runs: const [
          DocxRun(nasty),
          DocxRun(' suite en italique', italic: true),
        ],
      ),
      DocxBlock.table(
        rows: const [
          ['Client', 'Montant'],
          [nasty, '1 200 €'],
        ],
      ),
      DocxBlock.pageBreak(),
      DocxBlock.paragraph(runs: const [DocxRun('Page deux')]),
    ]);

    assertValidPackage(
      docx,
      const [
        '[Content_Types].xml',
        '_rels/.rels',
        'word/document.xml',
        'word/styles.xml',
      ],
      label: 'docx',
    );

    final Archive a = ZipDecoder().decodeBytes(docx);
    final String doc = utf8.decode(
      a.files.firstWhere((f) => f.name == 'word/document.xml').content,
    );
    // The raw ampersand must never appear unescaped in the XML source.
    expect(doc.contains('Marie & Cie'), isFalse);
    expect(doc, contains('Marie &amp; Cie'));
    expect(doc, contains('Heading1'));
    expect(doc, contains('<w:b/>'));
    expect(doc, contains('<w:i/>'));
    expect(doc, contains('<w:tbl>'));
    expect(doc, contains('w:type="page"'));
  });

  testWidgets('xlsx round-trips values, including empties and wide grids', (
    tester,
  ) async {
    final List<List<String>> rows = [
      const ['Nom', 'Note', 'Commentaire'],
      [nasty, '18,5', ''],
      const ['', '', 'ligne partielle'],
      List<String>.generate(30, (i) => 'C$i'),
    ];
    final Uint8List xlsx = Ooxml.buildXlsx([
      XlsxSheet(name: 'Résultats', rows: rows),
      XlsxSheet(name: 'Vide', rows: const []),
    ]);

    assertValidPackage(
      xlsx,
      const ['[Content_Types].xml', '_rels/.rels', 'xl/workbook.xml'],
      label: 'xlsx',
    );

    final List<XlsxSheet> back = Ooxml.readXlsx(xlsx);
    expect(back, hasLength(2));
    expect(back.first.name, 'Résultats');
    expect(back.first.rows[0][0], 'Nom');
    expect(back.first.rows[1][0], nasty, reason: 'escaping must round-trip');
    expect(back.first.rows[1][2], '');
    expect(back.first.rows[2][2], 'ligne partielle');
    // 30 columns exercises the AA/AB column-letter path.
    expect(back.first.rows[3][29], 'C29');
  });

  testWidgets('pptx is valid and keeps slide order past slide 10', (
    tester,
  ) async {
    final List<PptxSlide> slides = List.generate(
      12,
      (i) => PptxSlide.text(
        title: 'Diapositive ${i + 1}',
        bullets: ['Point A ${i + 1}', nasty],
      ),
    );
    final Uint8List pptx = Ooxml.buildPptx(slides);

    assertValidPackage(
      pptx,
      const [
        '[Content_Types].xml',
        '_rels/.rels',
        'ppt/presentation.xml',
        'ppt/slides/slide1.xml',
      ],
      label: 'pptx',
    );

    final List<PptxSlide> back = Ooxml.readPptx(pptx);
    expect(back, hasLength(12));
    // Lexicographic sorting would put slide10 second — this guards that.
    expect(back[1].title, 'Diapositive 2');
    expect(back[9].title, 'Diapositive 10');
    expect(back[11].title, 'Diapositive 12');
  });

  testWidgets('pptx embeds real image bytes for image slides', (tester) async {
    // A 1x1 PNG — enough to prove the binary survives the zip intact.
    final Uint8List png = base64Decode(
      'iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mP8z8BQDwAEhQGAhKmMIQAAAABJRU5ErkJggg==',
    );
    final Uint8List pptx = Ooxml.buildPptx([
      PptxSlide.image(pngBytes: png, widthPt: 595, heightPt: 842),
    ]);
    final Archive a = ZipDecoder().decodeBytes(pptx);
    final media = a.files.where((f) => f.name.startsWith('ppt/media/')).toList();
    expect(media, isNotEmpty, reason: 'image slide must embed its PNG');
    expect(media.first.content, equals(png));
  });

  testWidgets('LayoutAnalyzer recovers paragraphs and heading levels', (
    tester,
  ) async {
    // Build a PDF with a big heading and smaller body text, then check the
    // analyzer classifies them by relative size the way Word will need.
    final sf.PdfDocument doc = sf.PdfDocument();
    final section = doc.sections!.add();
    section.pageSettings.size = const Size(595, 842);
    section.pageSettings.margins.all = 0;
    final sf.PdfPage page = section.pages.add();
    page.graphics.drawString(
      'Titre principal',
      sf.PdfStandardFont(sf.PdfFontFamily.helvetica, 24, style: sf.PdfFontStyle.bold),
      brush: sf.PdfSolidBrush(sf.PdfColor(0, 0, 0)),
      bounds: const Rect.fromLTWH(50, 60, 500, 40),
    );
    page.graphics.drawString(
      'Ceci est un paragraphe de corps de texte normal.',
      sf.PdfStandardFont(sf.PdfFontFamily.helvetica, 11),
      brush: sf.PdfSolidBrush(sf.PdfColor(0, 0, 0)),
      bounds: const Rect.fromLTWH(50, 140, 500, 20),
    );
    final List<int> raw = doc.saveSync();
    doc.dispose();

    final sf.PdfDocument loaded = sf.PdfDocument(
      inputBytes: Uint8List.fromList(raw),
    );
    final List<PageLayout> layout = LayoutAnalyzer.analyze(loaded);
    loaded.dispose();

    expect(layout, hasLength(1));
    final blocks = layout.first.blocks;
    expect(blocks, isNotEmpty, reason: 'analyzer found no text at all');

    final allText = blocks
        .expand((b) => b.runs.map((r) => r.text))
        .join(' ');
    expect(allText, contains('Titre principal'));
    expect(allText, contains('corps de texte'));

    final heading = blocks.firstWhere(
      (b) => b.runs.any((r) => r.text.contains('Titre principal')),
    );
    final body = blocks.firstWhere(
      (b) => b.runs.any((r) => r.text.contains('corps de texte')),
    );
    expect(
      heading.headingLevel,
      greaterThan(0),
      reason: '24pt against an 11pt body must be detected as a heading',
    );
    expect(body.headingLevel, 0);
  });

  testWidgets('a scanned PDF yields no text, so PDF->Word can warn', (
    tester,
  ) async {
    // Page with no text objects at all — the case where the app must send
    // the user to OCR instead of writing an empty .docx.
    final sf.PdfDocument doc = sf.PdfDocument();
    final section = doc.sections!.add();
    section.pageSettings.size = const Size(400, 400);
    section.pageSettings.margins.all = 0;
    section.pages.add();
    final List<int> raw = doc.saveSync();
    doc.dispose();

    final sf.PdfDocument loaded = sf.PdfDocument(
      inputBytes: Uint8List.fromList(raw),
    );
    final layout = LayoutAnalyzer.analyze(loaded);
    loaded.dispose();

    final int runCount = layout
        .expand((p) => p.blocks)
        .expand((b) => b.runs)
        .length;
    expect(runCount, 0);
  });

  testWidgets('docx renderer keeps formatting through the merge pipeline', (
    tester,
  ) async {
    final Uint8List docx = buildMinimalDocx([
      'Premier paragraphe du contrat.',
      'Deuxième paragraphe avec des détails.',
    ]);
    // Goes through the same path as a user picking a .docx to merge.
    final sf.PdfDocument rendered = await DocxRenderer.renderToDocument(docx);
    final String text = sf.PdfTextExtractor(rendered).extractText();
    expect(text, contains('Premier paragraphe'));
    expect(text, contains('Deuxième paragraphe'));
    rendered.dispose();
  });
}
