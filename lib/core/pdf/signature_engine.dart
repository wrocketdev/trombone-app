import 'dart:typed_data';
import 'dart:ui';

import 'package:syncfusion_flutter_pdf/pdf.dart' as sf;

/// Stamps a hand-drawn signature image onto one page of an existing PDF.
/// This is a casual visual stamp, not a cryptographic signature: it just
/// draws the signature PNG onto the page's content stream.
class SignatureEngine {
  SignatureEngine._();

  static Future<Uint8List> stampSignature({
    required Uint8List pdfBytes,
    required Uint8List signaturePngBytes,
    required int pageIndex,
    required Rect placement,
  }) async {
    final sf.PdfDocument doc = sf.PdfDocument(inputBytes: pdfBytes);
    try {
      final sf.PdfPage page = doc.pages[pageIndex];
      page.graphics.drawImage(sf.PdfBitmap(signaturePngBytes), placement);
      final List<int> outBytes = await doc.save();
      return Uint8List.fromList(outBytes);
    } finally {
      doc.dispose();
    }
  }
}
