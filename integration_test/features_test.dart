// On-device correctness tests for the 9 new iLovePDF-style tools built by
// the parallel-agent workflow: watermark, page numbers, protect/unlock,
// compare (diff), and OCR (the trickiest — pixel-to-point coordinate
// mapping and ML Kit's on-device recognizer). These reuse the same
// hand-authored-PDF-fixture technique as integration_test/app_test.dart —
// real, spec-compliant bytes, not mocks.
import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:pdfx/pdfx.dart' as pdfx;
import 'package:syncfusion_flutter_pdf/pdf.dart' as sf;

import 'package:trombone/core/pdf/compare_engine.dart';
import 'package:trombone/core/pdf/ocr_engine.dart';
import 'package:trombone/core/pdf/page_numbers_engine.dart';
import 'package:trombone/core/pdf/pdf_engine.dart';
import 'package:trombone/core/pdf/watermark_engine.dart';
import 'package:trombone/models/page_selection.dart';
import 'package:trombone/models/source_doc.dart';

import 'app_test.dart' show buildMinimalPdf;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('CompareEngine LCS diff is exact for a simple edit', (
    tester,
  ) async {
    final a = ['Alpha', 'Beta', 'Gamma', 'Delta'];
    final b = ['Alpha', 'Gamma', 'Delta', 'Epsilon'];
    final diff = CompareEngine.diffLines(a, b);
    final types = diff.map((d) => '${d.type.name}:${d.text}').toList();
    expect(types, [
      'same:Alpha',
      'removed:Beta',
      'same:Gamma',
      'same:Delta',
      'added:Epsilon',
    ]);
  });

  testWidgets('Watermark draws real, extractable, rotated-safe text', (
    tester,
  ) async {
    final Uint8List original = buildMinimalPdf(text: 'Contrat original');

    final Uint8List watermarked = await WatermarkEngine.apply(
      original,
      text: 'CONFIDENTIEL',
      opacity: 0.35,
      rotationDegrees: -45,
      fontSize: 60,
      color: sf.PdfColor(128, 128, 128),
    );

    expect(String.fromCharCodes(watermarked.take(4)), '%PDF');
    final pdfx.PdfDocument reopened = await pdfx.PdfDocument.openData(
      watermarked,
    );
    expect(reopened.pagesCount, 1);
    await reopened.close();

    final sf.PdfDocument reopenedSf = sf.PdfDocument(inputBytes: watermarked);
    final String text = sf.PdfTextExtractor(reopenedSf).extractText();
    expect(text, contains('Contrat original'));
    expect(text, contains('CONFIDENTIEL'));
    reopenedSf.dispose();
  });

  testWidgets('Page numbers land the right label on the right page', (
    tester,
  ) async {
    final sf.PdfDocument doc = sf.PdfDocument(
      inputBytes: buildMinimalPdf(text: 'Page A'),
    );
    doc.pages.add();
    doc.pages.add();
    final List<int> raw = doc.saveSync();
    doc.dispose();
    final Uint8List threePage = Uint8List.fromList(raw);

    final Uint8List numbered = await PageNumbersEngine.apply(
      pdfBytes: threePage,
      position: PageNumberPosition.bottomCenter,
      format: PageNumberFormat.pageOfTotal,
      startNumber: 1,
    );

    final sf.PdfDocument reopened = sf.PdfDocument(inputBytes: numbered);
    expect(reopened.pages.count, 3);
    for (var i = 0; i < 3; i++) {
      final String pageText = sf.PdfTextExtractor(
        reopened,
      ).extractText(startPageIndex: i, endPageIndex: i);
      expect(pageText, contains('${i + 1} / 3'));
    }
    reopened.dispose();
  });

  testWidgets('Protect then unlock round-trips the original content', (
    tester,
  ) async {
    final sf.PdfDocument doc = sf.PdfDocument(
      inputBytes: buildMinimalPdf(text: 'Bulletin de salaire'),
    );

    doc.security.algorithm = sf.PdfEncryptionAlgorithm.aesx256BitRevision6;
    doc.security.userPassword = 'secret123';
    doc.security.ownerPassword = 'secret123';
    final Uint8List protectedBytes = Uint8List.fromList(await doc.save());
    doc.dispose();

    expect(
      () => sf.PdfDocument(inputBytes: protectedBytes),
      throwsA(anything),
      reason: 'opening protected bytes without a password must fail',
    );

    final sf.PdfDocument unlocked = sf.PdfDocument(
      inputBytes: protectedBytes,
      password: 'secret123',
    );
    final SourceDoc source = SourceDoc(
      id: 'unlock-test',
      name: 'test.pdf',
      kind: SourceKind.pdf,
      document: unlocked,
      thumbnail: null,
    );
    final List<PageSelection> selections = [
      for (var i = 0; i < source.pageCount; i++)
        PageSelection(source: source, pageIndex: i),
    ];
    final Uint8List unlockedBytes = await PdfEngine.buildPdf(selections);
    source.dispose();

    // Must now open with NO password.
    final sf.PdfDocument finalDoc = sf.PdfDocument(inputBytes: unlockedBytes);
    final String text = sf.PdfTextExtractor(finalDoc).extractText();
    expect(text, contains('Bulletin de salaire'));
    finalDoc.dispose();
  });

  testWidgets(
    'OCR recognizes real text and embeds it as extractable content',
    (tester) async {
      final Uint8List source = buildMinimalPdf(
        text: 'FACTURE 2026',
        width: 400,
        height: 500,
      );

      // ML Kit downloads its model via Play Services on first use and
      // returns empty (rather than throwing) until it's ready, so retry a
      // few times before believing a blank result.
      OcrResult? result;
      String recognized = '';
      for (var attempt = 0; attempt < 6; attempt++) {
        result = await OcrEngine.run(
          source,
          onProgress: (done, total) {},
          cancelToken: CancelToken(),
        );
        recognized = result.pages.first.text.toUpperCase();
        if (recognized.trim().isNotEmpty) break;
        await Future<void>.delayed(const Duration(seconds: 5));
      }

      expect(result!.pages, hasLength(1));
      // A real recognizer on a real rasterized page — allow character-level
      // noise but require the gist to come through.
      expect(
        recognized,
        contains('FACTURE'),
        reason:
            'ML Kit returned "$recognized" — if blank, the on-device model '
            'never finished downloading (needs network once).',
      );

      final pdfx.PdfDocument reopened = await pdfx.PdfDocument.openData(
        result.pdfBytes,
      );
      expect(reopened.pagesCount, 1);
      await reopened.close();

      final sf.PdfDocument reopenedSf = sf.PdfDocument(
        inputBytes: result.pdfBytes,
      );
      final String embedded = sf.PdfTextExtractor(reopenedSf).extractText();
      expect(embedded.toUpperCase(), contains('FACTURE'));
      reopenedSf.dispose();
    },
    timeout: const Timeout(Duration(minutes: 2)),
  );
}
