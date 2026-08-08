import 'dart:io';
import 'dart:typed_data';

import 'package:path_provider/path_provider.dart';
import 'package:pdfx/pdfx.dart' as pdfx;

import 'pdf_engine.dart';

enum ImageExportFormat { jpg, png }

extension ImageExportFormatX on ImageExportFormat {
  String get extension => this == ImageExportFormat.jpg ? 'jpg' : 'png';
  String get mimeType =>
      this == ImageExportFormat.jpg ? 'image/jpeg' : 'image/png';
  String get label => this == ImageExportFormat.jpg ? 'JPG' : 'PNG';
}

enum ImageExportQuality { web, standard, high }

extension ImageExportQualityX on ImageExportQuality {
  int get dpi {
    switch (this) {
      case ImageExportQuality.web:
        return 72;
      case ImageExportQuality.standard:
        return 150;
      case ImageExportQuality.high:
        return 300;
    }
  }

  String get label {
    switch (this) {
      case ImageExportQuality.web:
        return 'Web (72 dpi)';
      case ImageExportQuality.standard:
        return 'Standard (150 dpi)';
      case ImageExportQuality.high:
        return 'Haute qualité (300 dpi)';
    }
  }
}

/// One page rendered to an image file on disk, ready to be shared or saved.
class ExportedImagePage {
  ExportedImagePage({required this.file, required this.pageNumber});
  final File file;
  final int pageNumber;
}

/// Renders every page of a PDF to standalone raster images at a chosen
/// format and resolution — the reverse of [Converters.imageToPdfDocument].
class ImageExportEngine {
  ImageExportEngine._();

  static Future<List<ExportedImagePage>> exportPdfToImages(
    Uint8List pdfBytes, {
    required ImageExportFormat format,
    required ImageExportQuality quality,
    void Function(int done, int total)? onProgress,
    CancelToken? cancelToken,
  }) async {
    final pdfx.PdfDocument doc = await pdfx.PdfDocument.openData(pdfBytes);
    final List<ExportedImagePage> results = [];
    try {
      final int total = doc.pagesCount;
      final double scale = quality.dpi / 72.0;
      final pdfx.PdfPageImageFormat pdfxFormat = format == ImageExportFormat.jpg
          ? pdfx.PdfPageImageFormat.jpeg
          : pdfx.PdfPageImageFormat.png;
      final Directory dir = await getTemporaryDirectory();

      for (var i = 1; i <= total; i++) {
        if (cancelToken?.isCancelled ?? false) {
          throw CancelledException();
        }
        final pdfx.PdfPage page = await doc.getPage(i);
        try {
          // pdfx defaults PNG to a transparent background, which would hand
          // the user "blank" images in any viewer that composites on dark.
          final pdfx.PdfPageImage? image = await page.render(
            width: page.width * scale,
            height: page.height * scale,
            format: pdfxFormat,
            quality: 92,
            backgroundColor: '#FFFFFF',
          );
          if (image == null) {
            throw StateError('Rendu de la page $i impossible');
          }
          final File file = File('${dir.path}/page_$i.${format.extension}');
          await file.writeAsBytes(image.bytes, flush: true);
          results.add(ExportedImagePage(file: file, pageNumber: i));
        } finally {
          await page.close();
        }
        onProgress?.call(i, total);
        if (i % 2 == 0) {
          await Future<void>.delayed(Duration.zero);
        }
      }
      return results;
    } finally {
      await doc.close();
    }
  }
}
