// On-device correctness tests for the whole PDF pipeline, run against
// genuinely valid fixtures (a hand-built PDF with real xref offsets, a real
// PNG rendered through Skia, a hand-built BMP, and a minimal but real
// OOXML .docx) rather than mocks — this is the same code path the app uses
// when the user picks real files.
import 'dart:convert';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:archive/archive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:pdfx/pdfx.dart' as pdfx;
import 'package:syncfusion_flutter_pdf/pdf.dart' as sf;

import 'package:trombone/app.dart';
import 'package:trombone/core/pdf/compressor.dart';
import 'package:trombone/core/pdf/converters.dart';
import 'package:trombone/core/pdf/pdf_engine.dart';
import 'package:trombone/core/pdf/recto_verso.dart';
import 'package:trombone/models/page_selection.dart';
import 'package:trombone/models/source_doc.dart';

Uint8List buildMinimalPdf({
  required String text,
  int width = 200,
  int height = 200,
}) {
  final List<String> objects = [
    '<< /Type /Catalog /Pages 2 0 R >>',
    '<< /Type /Pages /Kids [3 0 R] /Count 1 >>',
    '<< /Type /Page /Parent 2 0 R /MediaBox [0 0 $width $height] '
        '/Resources << /Font << /F1 4 0 R >> >> /Contents 5 0 R >>',
    '<< /Type /Font /Subtype /Type1 /BaseFont /Helvetica >>',
  ];
  final String content = 'BT /F1 18 Tf 20 ${height - 40} Td ($text) Tj ET';
  objects.add('<< /Length ${content.length} >>\nstream\n$content\nendstream');

  final StringBuffer buffer = StringBuffer('%PDF-1.4\n');
  final List<int> offsets = [];
  for (var i = 0; i < objects.length; i++) {
    offsets.add(buffer.length);
    buffer.write('${i + 1} 0 obj\n${objects[i]}\nendobj\n');
  }
  final int xrefStart = buffer.length;
  buffer.write('xref\n0 ${objects.length + 1}\n');
  buffer.write('0000000000 65535 f \n');
  for (final off in offsets) {
    buffer.write('${off.toString().padLeft(10, '0')} 00000 n \n');
  }
  buffer.write(
    'trailer\n<< /Size ${objects.length + 1} /Root 1 0 R >>\n'
    'startxref\n$xrefStart\n%%EOF',
  );
  return Uint8List.fromList(latin1.encode(buffer.toString()));
}

Uint8List buildMinimalDocx(List<String> paragraphs) {
  final Archive archive = Archive();
  void addFile(String name, String content) {
    final List<int> bytes = utf8.encode(content);
    archive.addFile(ArchiveFile(name, bytes.length, bytes));
  }

  addFile('[Content_Types].xml', '''<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<Types xmlns="http://schemas.openxmlformats.org/package/2006/content-types">
<Default Extension="rels" ContentType="application/vnd.openxmlformats-package.relationships+xml"/>
<Default Extension="xml" ContentType="application/xml"/>
<Override PartName="/word/document.xml" ContentType="application/vnd.openxmlformats-officedocument.wordprocessingml.document.main+xml"/>
</Types>''');
  addFile('_rels/.rels', '''<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<Relationships xmlns="http://schemas.openxmlformats.org/package/2006/relationships">
<Relationship Id="rId1" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/officeDocument" Target="word/document.xml"/>
</Relationships>''');
  final String body = paragraphs
      .map((p) => '<w:p><w:r><w:t>$p</w:t></w:r></w:p>')
      .join();
  addFile('word/document.xml', '''<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<w:document xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main">
<w:body>$body</w:body>
</w:document>''');
  final List<int>? zipBytes = ZipEncoder().encode(archive);
  return Uint8List.fromList(zipBytes!);
}

Uint8List buildMinimalBmp() {
  const int width = 4;
  const int height = 4;
  const int rowSize = ((width * 3 + 3) ~/ 4) * 4;
  final int pixelDataSize = rowSize * height;
  final int fileSize = 14 + 40 + pixelDataSize;
  final BytesBuilder b = BytesBuilder();
  void u16(int v) {
    b.addByte(v & 0xFF);
    b.addByte((v >> 8) & 0xFF);
  }

  void u32(int v) {
    b.addByte(v & 0xFF);
    b.addByte((v >> 8) & 0xFF);
    b.addByte((v >> 16) & 0xFF);
    b.addByte((v >> 24) & 0xFF);
  }

  b.addByte(0x42);
  b.addByte(0x4D);
  u32(fileSize);
  u32(0);
  u32(54);
  u32(40);
  u32(width);
  u32(height);
  u16(1);
  u16(24);
  u32(0);
  u32(pixelDataSize);
  u32(2835);
  u32(2835);
  u32(0);
  u32(0);
  for (var row = 0; row < height; row++) {
    for (var col = 0; col < width; col++) {
      b.addByte(0);
      b.addByte(0);
      b.addByte(255);
    }
    for (var pad = 0; pad < rowSize - width * 3; pad++) {
      b.addByte(0);
    }
  }
  return b.toBytes();
}

Future<Uint8List> buildRealPng({int size = 40}) async {
  final ui.PictureRecorder recorder = ui.PictureRecorder();
  final Canvas canvas = Canvas(recorder);
  canvas.drawRect(
    Rect.fromLTWH(0, 0, size.toDouble(), size.toDouble()),
    Paint()..color = const Color(0xFF3366CC),
  );
  canvas.drawCircle(
    Offset(size / 2, size / 2),
    size / 4,
    Paint()..color = const Color(0xFFFFFFFF),
  );
  final ui.Picture picture = recorder.endRecording();
  final ui.Image image = await picture.toImage(size, size);
  final ByteData? data = await image.toByteData(format: ui.ImageByteFormat.png);
  image.dispose();
  return data!.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
}

SourceDoc sourceDocFromSf(String id, String name, SourceKind kind, sf.PdfDocument doc) {
  return SourceDoc(id: id, name: name, kind: kind, document: doc, thumbnail: null);
}

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('image (PNG + BMP) converts to a valid one-page PDF', (
    tester,
  ) async {
    final Uint8List png = await buildRealPng();
    final sf.PdfDocument pngDoc = await Converters.imageToPdfDocument(png);
    expect(pngDoc.pages.count, 1);
    final List<int> pngPdfBytes = await pngDoc.save();
    expect(pngPdfBytes.take(4), '%PDF'.codeUnits);
    pngDoc.dispose();

    final Uint8List bmp = buildMinimalBmp();
    final sf.PdfDocument bmpDoc = await Converters.imageToPdfDocument(bmp);
    expect(bmpDoc.pages.count, 1, reason: 'BMP is an explicit spec requirement');
    bmpDoc.dispose();
  });

  testWidgets('long text paginates across several pages', (tester) async {
    final String longText = List.generate(
      120,
      (i) => 'Ligne de test numéro $i pour forcer la pagination automatique.',
    ).join('\n');
    final sf.PdfDocument doc = Converters.textToPdfDocument(longText);
    expect(doc.pages.count, greaterThan(1));
    doc.dispose();
  });

  testWidgets('docx text is actually extracted and rendered', (tester) async {
    final Uint8List docx = buildMinimalDocx([
      'Premier paragraphe du contrat.',
      'Deuxième paragraphe avec des détails importants.',
    ]);
    final sf.PdfDocument doc = Converters.docxToPdfDocument(docx);
    // Mirror what the app actually does: save, then read back — a freshly
    // authored (not-yet-serialized) document's text isn't queryable via
    // PdfTextExtractor until its content stream is flushed to bytes.
    final List<int> bytes = await doc.save();
    doc.dispose();
    final sf.PdfDocument reloaded = sf.PdfDocument(inputBytes: bytes);
    final String extracted = sf.PdfTextExtractor(reloaded).extractText();
    expect(extracted, contains('Premier paragraphe du contrat'));
    expect(extracted, contains('Deuxième paragraphe'));
    reloaded.dispose();
  });

  testWidgets('a hand-authored real PDF (non-Syncfusion) loads correctly', (
    tester,
  ) async {
    final Uint8List pdfBytes = buildMinimalPdf(text: 'Facture 2026');
    final sf.PdfDocument doc = Converters.pdfFromBytes(pdfBytes);
    expect(doc.pages.count, 1);
    final String text = sf.PdfTextExtractor(doc).extractText();
    expect(text, contains('Facture 2026'));
    doc.dispose();
  });

  testWidgets('merge combines pages from different formats and rotates them', (
    tester,
  ) async {
    final sf.PdfDocument pdfA = Converters.pdfFromBytes(
      buildMinimalPdf(text: 'Page A1', width: 300, height: 400),
    );
    final sf.PdfDocument pdfB = Converters.pdfFromBytes(
      buildMinimalPdf(text: 'Page B1', width: 300, height: 400),
    );
    final sf.PdfDocument imgDoc = await Converters.imageToPdfDocument(
      await buildRealPng(),
    );
    // A freshly-authored (never independently saved/reloaded) source, just
    // like what a real .txt or .docx pick produces — this is the important
    // case: does createTemplate() actually capture live, unsaved content?
    final sf.PdfDocument textDoc = Converters.textToPdfDocument(
      'Contenu texte fusionné',
    );

    final SourceDoc docA = sourceDocFromSf('a', 'a.pdf', SourceKind.pdf, pdfA);
    final SourceDoc docB = sourceDocFromSf('b', 'b.pdf', SourceKind.pdf, pdfB);
    final SourceDoc docImg = sourceDocFromSf(
      'i',
      'photo.png',
      SourceKind.image,
      imgDoc,
    );
    final SourceDoc docText = sourceDocFromSf(
      't',
      'note.txt',
      SourceKind.text,
      textDoc,
    );
    docA.rotatePage(0, 90);

    final selections = [
      PageSelection(source: docA, pageIndex: 0),
      PageSelection(source: docImg, pageIndex: 0),
      PageSelection(source: docText, pageIndex: 0),
      PageSelection(source: docB, pageIndex: 0),
    ];

    final Uint8List merged = await PdfEngine.buildPdf(selections);
    expect(String.fromCharCodes(merged.take(4)), '%PDF');

    final pdfx.PdfDocument reopened = await pdfx.PdfDocument.openData(merged);
    expect(reopened.pagesCount, 4);
    await reopened.close();

    // Confirm the rotation actually landed on page 1 of the output, and
    // that every page's real content (not just a blank canvas) survived
    // the createTemplate()/drawPdfTemplate() copy.
    final sf.PdfDocument reopenedSf = sf.PdfDocument(inputBytes: merged);
    expect(
      reopenedSf.pages[0].rotation,
      sf.PdfPageRotateAngle.rotateAngle90,
    );
    final String fullText = sf.PdfTextExtractor(reopenedSf).extractText();
    expect(fullText, contains('Page A1'));
    expect(fullText, contains('Contenu texte fusionné'));
    expect(fullText, contains('Page B1'));
    reopenedSf.dispose();

    docA.dispose();
    docB.dispose();
    docImg.dispose();
    docText.dispose();
  });

  testWidgets('recto-verso interleaving matches the real scanner pattern', (
    tester,
  ) async {
    final sf.PdfDocument oddSf = Converters.pdfFromBytes(
      buildMinimalPdf(text: 'x'),
    );
    for (var i = 0; i < 2; i++) {
      oddSf.pages.add();
    }
    final sf.PdfDocument evenSf = Converters.pdfFromBytes(
      buildMinimalPdf(text: 'y'),
    );
    for (var i = 0; i < 2; i++) {
      evenSf.pages.add();
    }
    final SourceDoc odd = sourceDocFromSf('odd', 'odd.pdf', SourceKind.pdf, oddSf);
    final SourceDoc even = sourceDocFromSf(
      'even',
      'even.pdf',
      SourceKind.pdf,
      evenSf,
    );
    expect(odd.pageCount, 3);
    expect(even.pageCount, 3);

    final List<PageSelection> result = RectoVerso.interleave(
      oddDoc: odd,
      evenDoc: even,
      evenIsReversed: true,
    );

    final List<String> tags = result
        .map((s) => '${s.source.id}${s.pageIndex}')
        .toList();
    expect(tags, ['odd0', 'even2', 'odd1', 'even1', 'odd2', 'even0']);

    odd.dispose();
    even.dispose();
  });

  testWidgets('compression re-encodes pages and stays a valid PDF', (
    tester,
  ) async {
    final sf.PdfDocument base = Converters.pdfFromBytes(
      buildMinimalPdf(text: 'Compression test', width: 400, height: 500),
    );
    final List<int> baseBytes = await base.save();
    base.dispose();
    final Uint8List original = Uint8List.fromList(baseBytes);

    final int estimate = await Compressor.estimateSize(
      original,
      CompressionLevel.medium,
    );
    expect(estimate, greaterThan(0));

    final Uint8List compressed = await Compressor.compress(
      original,
      CompressionLevel.medium,
    );
    final pdfx.PdfDocument reopened = await pdfx.PdfDocument.openData(
      compressed,
    );
    expect(reopened.pagesCount, 1);
    await reopened.close();
  });

  testWidgets('the app boots and its three main flows are reachable', (
    tester,
  ) async {
    await tester.pumpWidget(const FusionPdfApp());
    await tester.pumpAndSettle();
    expect(find.text('Fusionner'), findsOneWidget);
    expect(find.text('Recto-verso'), findsOneWidget);
    expect(find.text('Organiser un PDF'), findsOneWidget);

    await tester.tap(find.text('Fusionner'));
    await tester.pumpAndSettle();
    expect(find.text('Choisir des fichiers'), findsOneWidget);
    await tester.pageBack();
    await tester.pumpAndSettle();

    await tester.tap(find.text('Recto-verso'));
    await tester.pumpAndSettle();
    expect(
      find.text('Le second fichier est en ordre inverse'),
      findsOneWidget,
    );
    await tester.pageBack();
    await tester.pumpAndSettle();

    await tester.tap(find.text('Organiser un PDF'));
    await tester.pumpAndSettle();
    expect(find.text('Ouvrir un fichier'), findsOneWidget);
  });
}
