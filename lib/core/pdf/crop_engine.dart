import 'dart:typed_data';
import 'dart:ui';

import 'package:syncfusion_flutter_pdf/pdf.dart' as sf;

import 'pdf_engine.dart';

/// Rognage exprimé en fractions (0..1) des bords de la page **telle qu'elle
/// est affichée** (rotation appliquée), origine en haut à gauche.
///
/// Des fractions plutôt que des points : le rectangle dessiné par le doigt
/// sur l'aperçu de la page 1 reste valable pour des pages de tailles
/// différentes dans le même document.
class CropRect {
  const CropRect({
    required this.left,
    required this.top,
    required this.right,
    required this.bottom,
  });

  static const CropRect full = CropRect(left: 0, top: 0, right: 1, bottom: 1);

  final double left;
  final double top;
  final double right;
  final double bottom;

  double get width => right - left;
  double get height => bottom - top;

  /// Un rectangle plus petit que 5 % d'un côté est presque toujours un appui
  /// accidentel plutôt qu'une vraie sélection.
  bool get isUsable => width >= 0.05 && height >= 0.05;

  CropRect clamped() {
    final double l = left.clamp(0.0, 1.0);
    final double t = top.clamp(0.0, 1.0);
    final double r = right.clamp(0.0, 1.0);
    final double b = bottom.clamp(0.0, 1.0);
    return CropRect(
      left: l < r ? l : r,
      top: t < b ? t : b,
      right: l < r ? r : l,
      bottom: t < b ? b : t,
    );
  }

  @override
  bool operator ==(Object other) =>
      other is CropRect &&
      other.left == left &&
      other.top == top &&
      other.right == right &&
      other.bottom == bottom;

  @override
  int get hashCode => Object.hash(left, top, right, bottom);

  @override
  String toString() => 'CropRect($left, $top, $right, $bottom)';
}

/// Informations affichables sur la première page d'un PDF, sans avoir à
/// garder le document ouvert côté écran.
class PdfFirstPageInfo {
  const PdfFirstPageInfo({
    required this.pageCount,
    required this.displayedSize,
  });

  final int pageCount;

  /// Taille en points, rotation de page appliquée — c'est le format que
  /// l'utilisateur voit dans l'aperçu.
  final Size displayedSize;

  double get aspectRatio => displayedSize.height <= 0
      ? 1
      : displayedSize.width / displayedSize.height;
}

/// Rogne un PDF en reconstruisant chaque page dans un document neuf dont la
/// boîte de page est réduite à la zone conservée : le contenu est dessiné
/// décalé, donc les marges indésirables tombent en dehors de la page.
class CropEngine {
  CropEngine._();

  static PdfFirstPageInfo firstPageInfo(Uint8List sourceBytes) {
    final sf.PdfDocument doc = sf.PdfDocument(inputBytes: sourceBytes);
    try {
      final sf.PdfPage page = doc.pages[0];
      final Size size = page.size;
      // page.size est la MediaBox/CropBox brute : elle ignore /Rotate, alors
      // que l'aperçu rendu par pdfx, lui, applique la rotation.
      final bool quarterTurn = page.rotation.index.isOdd;
      return PdfFirstPageInfo(
        pageCount: doc.pages.count,
        displayedSize: quarterTurn ? Size(size.height, size.width) : size,
      );
    } finally {
      doc.dispose();
    }
  }

  /// Convertit un rectangle exprimé dans l'espace *affiché* vers l'espace du
  /// contenu non pivoté, seul espace dans lequel un PdfTemplate se dessine.
  static CropRect _toContentSpace(CropRect r, sf.PdfPageRotateAngle rotation) {
    switch (rotation) {
      case sf.PdfPageRotateAngle.rotateAngle0:
        return r;
      case sf.PdfPageRotateAngle.rotateAngle90:
        return CropRect(
          left: r.top,
          top: 1 - r.right,
          right: r.bottom,
          bottom: 1 - r.left,
        );
      case sf.PdfPageRotateAngle.rotateAngle180:
        return CropRect(
          left: 1 - r.right,
          top: 1 - r.bottom,
          right: 1 - r.left,
          bottom: 1 - r.top,
        );
      case sf.PdfPageRotateAngle.rotateAngle270:
        return CropRect(
          left: 1 - r.bottom,
          top: r.left,
          right: 1 - r.top,
          bottom: r.right,
        );
    }
  }

  static Future<Uint8List> crop(
    Uint8List sourceBytes, {
    required CropRect rect,
    required bool allPages,
    void Function(int done, int total)? onProgress,
    CancelToken? cancelToken,
  }) async {
    final CropRect safeRect = rect.clamped();
    final sf.PdfDocument src = sf.PdfDocument(inputBytes: sourceBytes);
    final sf.PdfDocument dest = sf.PdfDocument();
    try {
      final int total = src.pages.count;
      for (var i = 0; i < total; i++) {
        if (cancelToken?.isCancelled ?? false) {
          throw CancelledException();
        }
        final sf.PdfPage srcPage = src.pages[i];
        final sf.PdfTemplate template = srcPage.createTemplate();
        final Size pageSize = template.size;

        double width = pageSize.width;
        double height = pageSize.height;
        Offset offset = Offset.zero;

        if (allPages || i == 0) {
          final CropRect c = _toContentSpace(safeRect, srcPage.rotation);
          width = c.width * pageSize.width;
          height = c.height * pageSize.height;
          offset = Offset(-c.left * pageSize.width, -c.top * pageSize.height);
        }
        if (width < 1 || height < 1) {
          width = pageSize.width;
          height = pageSize.height;
          offset = Offset.zero;
        }

        // Une section par page : dest.pages.insert() plante sur un document
        // neuf, et c'est le seul moyen de donner à chaque page sa propre
        // taille (les pages rognées et les pages entières cohabitent).
        final sf.PdfSection section = dest.sections!.add();
        section.pageSettings.margins.all = 0;
        section.pageSettings.size = Size(width, height);
        section.pageSettings.rotate = srcPage.rotation;
        final sf.PdfPage newPage = section.pages.add();
        newPage.graphics.drawPdfTemplate(template, offset);

        onProgress?.call(i + 1, total);
        if (i % 2 == 1) {
          await Future<void>.delayed(Duration.zero);
        }
      }
      final List<int> bytes = await dest.save();
      return Uint8List.fromList(bytes);
    } finally {
      dest.dispose();
      src.dispose();
    }
  }
}
