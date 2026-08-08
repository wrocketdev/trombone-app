import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';

/// A single PDF file picked from the system, kept as raw bytes so each
/// screen decides for itself how (and whether, with which password) to
/// load it into a Syncfusion document.
class PickedPdf {
  const PickedPdf({required this.bytes, required this.name});

  final Uint8List bytes;
  final String name;
}

class SecurityEngine {
  SecurityEngine._();

  /// Opens the system file picker restricted to a single PDF file. Returns
  /// null if the user cancelled.
  static Future<PickedPdf?> pickPdfFile() async {
    final FilePickerResult? result = await FilePicker.pickFiles(
      allowMultiple: false,
      type: FileType.custom,
      allowedExtensions: const ['pdf'],
      withData: false,
    );
    final List<PlatformFile> files = result?.files ?? const <PlatformFile>[];
    if (files.isEmpty) return null;
    final PlatformFile file = files.first;
    final Uint8List bytes = file.bytes != null
        ? file.bytes!
        : await File(file.path!).readAsBytes();
    return PickedPdf(bytes: bytes, name: file.name);
  }
}
