import 'dart:typed_data';

import 'package:syncfusion_flutter_pdf/pdf.dart' as sf;

enum SourceKind { pdf, image, text, docx }

/// A document added by the user, already converted internally to a
/// single-document PDF (`document`) so every downstream operation
/// (reorder, rotate, delete, merge) works on a uniform representation.
class SourceDoc {
  SourceDoc({
    required this.id,
    required this.name,
    required this.kind,
    required this.document,
    required this.thumbnail,
  }) : rotations = List<int>.filled(document.pages.count, 0),
       included = List<bool>.filled(document.pages.count, true);

  final String id;
  final String name;
  final SourceKind kind;
  final sf.PdfDocument document;

  /// Extra user-applied rotation in degrees (0/90/180/270), one per page.
  final List<int> rotations;

  /// Whether the page survives to the final merge, one per page.
  final List<bool> included;

  /// PNG bytes of the first page, used as the drag list thumbnail.
  Uint8List? thumbnail;

  int get pageCount => document.pages.count;

  int get includedPageCount => included.where((e) => e).length;

  void rotateAll(int deltaDegrees) {
    for (var i = 0; i < rotations.length; i++) {
      rotations[i] = (rotations[i] + deltaDegrees) % 360;
    }
  }

  void rotatePage(int index, int deltaDegrees) {
    rotations[index] = (rotations[index] + deltaDegrees) % 360;
  }

  void dispose() {
    document.dispose();
  }
}
