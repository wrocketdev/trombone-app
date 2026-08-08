import 'dart:convert';
import 'dart:io';
import 'dart:math' as math;
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:pdfx/pdfx.dart' as pdfx;
import 'package:syncfusion_flutter_pdf/pdf.dart' as sf;

import '../../models/source_doc.dart';
import '../office/docx_renderer.dart';
import '../pdf/converters.dart';

const List<String> kSupportedExtensions = [
  'pdf',
  'doc',
  'docx',
  'jpg',
  'jpeg',
  'png',
  'bmp',
  'webp',
  'heic',
  'heif',
  'txt',
];

class UnsupportedFormatException implements Exception {
  UnsupportedFormatException(this.fileName, this.extension);
  final String fileName;
  final String extension;

  @override
  String toString() => 'Format non pris en charge : $fileName (.$extension)';
}

class FileUtils {
  FileUtils._();

  static int _idCounter = 0;
  static final Map<String, Uint8List> _bytesCache = <String, Uint8List>{};

  /// Bytes of a [SourceDoc]'s current PDF representation, cached per doc id
  /// so repeated per-page thumbnail renders don't re-serialize the whole
  /// document every time.
  static Future<Uint8List> cachedPdfBytes(SourceDoc doc) async {
    final Uint8List? cached = _bytesCache[doc.id];
    if (cached != null) return cached;
    final Uint8List bytes = Uint8List.fromList(await doc.document.save());
    _bytesCache[doc.id] = bytes;
    return bytes;
  }

  static void forgetCache(String id) => _bytesCache.remove(id);

  /// Nom proposé pour un export, dérivé du fichier d'origine.
  ///
  /// **Ce que ça corrige.** Tous les écrans proposaient un nom constant :
  /// `fusion.pdf`, `extrait.pdf`, `protege.pdf`. Sur un téléphone d'usage, un
  /// aller-retour de tests suffit à produire `fusion.pdf`, `fusion (1).pdf`,
  /// jusqu'à `fusion (5).pdf` — cinq fichiers dont aucun ne dit de quoi il
  /// vient. Le nom est pourtant le seul mot que l'utilisateur cherchera plus
  /// tard dans son gestionnaire de fichiers.
  ///
  /// Le nom d'origine est conservé en tête, le rôle en suffixe :
  /// `Contrat.pdf` + `fusion` → `Contrat-fusion.pdf`. Il reste modifiable dans
  /// la boîte système ; ce n'est qu'une proposition, mais une proposition qui
  /// renseigne.
  ///
  /// [extension] est donnée sans point.
  static String derivedName(
    String? sourceName,
    String suffix, {
    String extension = 'pdf',
  }) {
    final String base = _baseName(sourceName);
    if (base.isEmpty) return '$suffix.$extension';
    // Les gestionnaires de fichiers Android tronquent au-delà d'une centaine
    // de caractères ; les noms réels sont longs (`2026-03-07_Facture_de_
    // primes_n_20665240303.pdf`). On garde la tête, qui porte le sens.
    final String head = base.length > 60 ? base.substring(0, 60) : base;
    return '$head-$suffix.$extension';
  }

  static String _baseName(String? name) {
    if (name == null) return '';
    final int slash = math.max(name.lastIndexOf('/'), name.lastIndexOf(r'\'));
    String out = slash == -1 ? name : name.substring(slash + 1);
    final int dot = out.lastIndexOf('.');
    if (dot > 0) out = out.substring(0, dot);
    return out.trim();
  }

  /// Opens the system file picker (Storage Access Framework) — the app
  /// never asks for broad storage permission, only the files the user
  /// explicitly selects.
  static Future<List<PlatformFile>> pickFiles({
    bool allowMultiple = true,
  }) async {
    final FilePickerResult? result = await FilePicker.pickFiles(
      allowMultiple: allowMultiple,
      type: FileType.custom,
      allowedExtensions: kSupportedExtensions,
      withData: false,
    );
    return result?.files ?? const <PlatformFile>[];
  }

  static Future<Uint8List> _readBytes(PlatformFile file) async {
    if (file.bytes != null) return file.bytes!;
    if (file.path != null) return File(file.path!).readAsBytes();
    throw StateError('Fichier illisible : ${file.name}');
  }

  static String _extensionOf(PlatformFile file) {
    final String name = file.name;
    final int dot = name.lastIndexOf('.');
    if (dot == -1) return (file.extension ?? '').toLowerCase();
    return name.substring(dot + 1).toLowerCase();
  }

  /// Converts a picked file into a [SourceDoc]: bytes are read, the file is
  /// converted to an in-memory PDF (if it isn't one already), and a
  /// thumbnail of its first page is rendered for the reorder list.
  static Future<SourceDoc> buildSourceDoc(PlatformFile file) async {
    final Uint8List bytes = await _readBytes(file);
    final String ext = _extensionOf(file);

    final SourceKind kind;
    final sf.PdfDocument doc;
    if (ext == 'pdf') {
      kind = SourceKind.pdf;
      doc = Converters.pdfFromBytes(bytes);
    } else if (const [
      'jpg',
      'jpeg',
      'png',
      'bmp',
      'webp',
      'heic',
      'heif',
    ].contains(ext)) {
      kind = SourceKind.image;
      doc = await Converters.imageToPdfDocument(bytes);
    } else if (ext == 'txt') {
      kind = SourceKind.text;
      doc = Converters.textToPdfDocument(
        utf8.decode(bytes, allowMalformed: true),
      );
    } else if (ext == 'docx') {
      kind = SourceKind.docx;
      // The full renderer keeps bold/italic, headings, lists and tables.
      // Converters.docxToPdfDocument is the plain-text fallback if a
      // document trips the renderer up.
      doc = await _renderDocx(bytes);
    } else {
      throw UnsupportedFormatException(file.name, ext);
    }

    Uint8List thumb;
    try {
      final List<int> pdfBytes = await doc.save();
      thumb = await renderPdfPageThumbnail(Uint8List.fromList(pdfBytes));
    } catch (_) {
      thumb = Uint8List(0);
    }

    return SourceDoc(
      id: '${DateTime.now().microsecondsSinceEpoch}_${_idCounter++}',
      name: file.name,
      kind: kind,
      document: doc,
      thumbnail: thumb,
    );
  }

  static Future<sf.PdfDocument> _renderDocx(Uint8List bytes) async {
    try {
      return await DocxRenderer.renderToDocument(bytes);
    } catch (_) {
      return Converters.docxToPdfDocument(bytes);
    }
  }

  static Future<int> pdfPageCount(Uint8List pdfBytes) async {
    final pdfx.PdfDocument doc = await pdfx.PdfDocument.openData(pdfBytes);
    try {
      return doc.pagesCount;
    } finally {
      await doc.close();
    }
  }

  /// Renders page [pageNumber] (1-based) of a PDF given as bytes into a PNG
  /// thumbnail roughly [targetWidth] pixels wide.
  static Future<Uint8List> renderPdfPageThumbnail(
    Uint8List pdfBytes, {
    int pageNumber = 1,
    double targetWidth = 260,
  }) async {
    final pdfx.PdfDocument doc = await pdfx.PdfDocument.openData(pdfBytes);
    try {
      final pdfx.PdfPage page = await doc.getPage(pageNumber);
      try {
        final double scale = page.width > 0 ? targetWidth / page.width : 1;
        // Without an explicit background, pdfx renders PNG on transparency,
        // so pages show the app's surface colour through them — dark grey
        // sheets with invisible black text in dark mode instead of paper.
        final pdfx.PdfPageImage? image = await page.render(
          width: page.width * scale,
          height: page.height * scale,
          format: pdfx.PdfPageImageFormat.png,
          backgroundColor: '#FFFFFF',
        );
        if (image == null) {
          throw StateError('Rendu de la vignette impossible');
        }
        return image.bytes;
      } finally {
        await page.close();
      }
    } finally {
      await doc.close();
    }
  }
}
