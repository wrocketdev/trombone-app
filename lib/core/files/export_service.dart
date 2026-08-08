import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

/// Writing the finished PDF out to the world: either the user picks a
/// destination via the Storage Access Framework, or we hand it to the
/// system share sheet. Both paths only ever touch the bytes the user
/// already has in hand — nothing is uploaded anywhere.
class ExportService {
  ExportService._();

  /// Ouvre la boîte « enregistrer sous » du système. Renvoie `true` si le
  /// fichier a été écrit.
  ///
  /// **Le nom final n'est pas récupérable, et c'est délibéré de ne pas le
  /// deviner.** L'utilisateur peut renommer le fichier dans cette boîte, et
  /// c'est courant. J'ai voulu que la confirmation d'export affiche ce nom —
  /// c'est le mot qu'on cherchera plus tard dans son gestionnaire de fichiers.
  /// Sur l'appareil, `saveFile` renvoie `/document/1024` : l'identifiant SAF du
  /// document créé, sans trace du nom. Le lire demanderait une requête au
  /// `ContentResolver`, donc du code natif.
  ///
  /// Faute de nom vérifiable, la feuille de confirmation décrit ce qui a été
  /// produit (« PDF · 8 pages ») au lieu de le nommer. Afficher le nom
  /// *suggéré* aurait été pire que de n'en afficher aucun : il contredit ce que
  /// l'utilisateur vient de taper, avec l'aplomb d'une confirmation.
  static Future<bool> saveToDevice(Uint8List bytes, String fileName) async {
    final String? path = await FilePicker.saveFile(
      dialogTitle: 'Enregistrer le PDF',
      fileName: fileName,
      type: FileType.custom,
      allowedExtensions: const ['pdf'],
      bytes: bytes,
    );
    return path != null;
  }

  static Future<void> share(Uint8List bytes, String fileName) async {
    final Directory dir = await getTemporaryDirectory();
    final File file = File('${dir.path}/$fileName');
    await file.writeAsBytes(bytes, flush: true);
    await Share.shareXFiles([XFile(file.path, mimeType: 'application/pdf')]);
  }
}
