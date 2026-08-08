import 'dart:convert';
import 'dart:math' as math;
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:archive/archive.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart' as sf;
import 'package:xml/xml.dart';

/// Converts every format the app accepts (PDF, images, text, Word) into a
/// standalone [sf.PdfDocument] so the rest of the app only ever deals with
/// PDFs. Nothing here calls out to a server — everything runs on-device.
class Converters {
  Converters._();

  static const double _a4Width = 595.0;
  static const double _a4Height = 842.0;

  static sf.PdfDocument pdfFromBytes(Uint8List bytes) {
    return sf.PdfDocument(inputBytes: bytes);
  }

  /// `PdfPage.createTemplate()` — which the merge engine relies on for
  /// every page it copies — only works reliably on a *loaded* document
  /// (one parsed from bytes). A freshly authored, never-serialized
  /// document's pages aren't safe to template yet. Every converter below
  /// builds its document, then round-trips it through bytes once so the
  /// [SourceDoc] the rest of the app receives always behaves like a real,
  /// loaded PDF — the same case that already works for a plain .pdf pick.
  static sf.PdfDocument _finalize(sf.PdfDocument doc) {
    final List<int> bytes = doc.saveSync();
    doc.dispose();
    return sf.PdfDocument(inputBytes: bytes);
  }

  /// Decodes any raster format the platform codec understands (JPEG, PNG,
  /// BMP, WebP, and HEIC on devices whose OS image codec supports it) and
  /// places it, centered and scaled to fit, on a single A4 page.
  static Future<sf.PdfDocument> imageToPdfDocument(Uint8List bytes) async {
    final ui.Codec codec = await ui.instantiateImageCodec(bytes);
    final ui.FrameInfo frame = await codec.getNextFrame();
    final ui.Image image = frame.image;
    final int width = image.width;
    final int height = image.height;
    final ByteData? pngData = await image.toByteData(
      format: ui.ImageByteFormat.png,
    );
    image.dispose();
    codec.dispose();
    if (pngData == null || width == 0 || height == 0) {
      throw const FormatException('Image illisible');
    }
    final Uint8List png = pngData.buffer.asUint8List(
      pngData.offsetInBytes,
      pngData.lengthInBytes,
    );

    final sf.PdfDocument doc = sf.PdfDocument();
    doc.pageSettings.margins.all = 0;
    doc.pageSettings.size = const ui.Size(_a4Width, _a4Height);
    const double margin = 24.0;
    final double maxW = _a4Width - margin * 2;
    final double maxH = _a4Height - margin * 2;
    final double scale = math.min(maxW / width, maxH / height);
    final double drawW = width * scale;
    final double drawH = height * scale;
    final double offsetX = (_a4Width - drawW) / 2;
    final double offsetY = (_a4Height - drawH) / 2;

    final sf.PdfPage page = doc.pages.add();
    final sf.PdfBitmap bitmap = sf.PdfBitmap(png);
    page.graphics.drawImage(
      bitmap,
      ui.Rect.fromLTWH(offsetX, offsetY, drawW, drawH),
    );
    return _finalize(doc);
  }

  static sf.PdfDocument textToPdfDocument(String text) {
    final sf.PdfDocument doc = sf.PdfDocument();
    doc.pageSettings.size = const ui.Size(_a4Width, _a4Height);
    doc.pageSettings.margins.all = 40;
    final sf.PdfPage page = doc.pages.add();
    final sf.PdfStandardFont font = sf.PdfStandardFont(
      sf.PdfFontFamily.helvetica,
      11,
    );
    sf.PdfTextElement(text: text.isEmpty ? ' ' : text, font: font).draw(
      page: page,
      bounds: ui.Rect.fromLTWH(
        0,
        0,
        page.getClientSize().width,
        page.getClientSize().height,
      ),
      format: sf.PdfLayoutFormat(layoutType: sf.PdfLayoutType.paginate),
    );
    return _finalize(doc);
  }

  /// Best-effort .docx -> PDF conversion. Word's format is a zip of XML;
  /// we unzip it, pull the plain text out of word/document.xml (paragraph
  /// and line breaks preserved) and lay it out as a simple text document.
  /// Rich formatting, tables, and images inside the .docx are not
  /// reproduced — this covers the "I need this content merged" case, not
  /// pixel-perfect Word rendering, which would require a layout engine
  /// far beyond what an offline mobile app can carry.
  static sf.PdfDocument docxToPdfDocument(Uint8List bytes) {
    final Archive archive = ZipDecoder().decodeBytes(bytes);
    final ArchiveFile? docXml = archive.files.cast<ArchiveFile?>().firstWhere(
      (f) => f!.name == 'word/document.xml',
      orElse: () => null,
    );
    if (docXml == null) {
      throw const FormatException('Fichier .docx invalide');
    }
    final String xmlString = utf8.decode(docXml.content, allowMalformed: true);
    final XmlDocument xml = XmlDocument.parse(xmlString);

    final StringBuffer buffer = StringBuffer();
    for (final XmlElement paragraph in xml.findAllElements(
      'p',
      namespaceUri: '*',
    )) {
      final StringBuffer paraText = StringBuffer();
      for (final XmlNode node in paragraph.descendants) {
        if (node is XmlElement) {
          if (node.name.local == 't') {
            paraText.write(node.innerText);
          } else if (node.name.local == 'tab') {
            paraText.write('\t');
          } else if (node.name.local == 'br') {
            paraText.write('\n');
          }
        }
      }
      buffer.writeln(paraText.toString());
    }
    final String text = buffer.toString().trim();
    return textToPdfDocument(
      text.isEmpty ? '(Document Word vide ou illisible)' : text,
    );
  }
}
