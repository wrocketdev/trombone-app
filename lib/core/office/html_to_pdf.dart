import 'dart:async';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

/// Erreur de conversion HTML -> PDF, avec un message deja en francais et
/// pret a etre affiche dans une SnackBar.
class HtmlToPdfException implements Exception {
  HtmlToPdfException(this.message);
  final String message;

  @override
  String toString() => message;
}

/// Convertit du HTML (code colle ou page web distante) en PDF en s'appuyant
/// sur le moteur d'impression d'Android : la page est rendue par le WebView
/// systeme (Chromium) puis imprimee en PDF A4 via PrintManager. Le rendu est
/// donc celui d'un vrai navigateur, pas d'un analyseur HTML maison.
class HtmlToPdf {
  HtmlToPdf._();

  static const MethodChannel _channel = MethodChannel('trombone/html_to_pdf');

  /// Delai maximal accorde au chargement + a l'impression de la page.
  static const Duration _timeout = Duration(seconds: 60);

  /// Rend une adresse web (necessite une connexion internet).
  static Future<Uint8List> fromUrl(String url) => _convert(url: url);

  /// Rend un fragment ou un document HTML complet.
  /// [baseUrl] sert a resoudre les liens relatifs (images, CSS) ; laisser
  /// null pour du HTML autonome.
  static Future<Uint8List> fromHtml(String html, {String? baseUrl}) =>
      _convert(html: html, baseUrl: baseUrl);

  static Future<Uint8List> _convert({
    String? html,
    String? url,
    String? baseUrl,
  }) async {
    final Directory dir = await getTemporaryDirectory();
    final String outPath =
        '${dir.path}${Platform.pathSeparator}'
        'html2pdf_${DateTime.now().microsecondsSinceEpoch}.pdf';
    final File outFile = File(outPath);

    try {
      final String? resultPath = await _channel
          .invokeMethod<String>('convert', <String, dynamic>{
            'html': html,
            'url': url,
            'baseUrl': baseUrl,
            'outputPath': outPath,
          })
          .timeout(_timeout);

      if (resultPath == null) {
        throw HtmlToPdfException('La conversion n\'a produit aucun fichier.');
      }
      final File produced = File(resultPath);
      if (!await produced.exists()) {
        throw HtmlToPdfException('Le PDF genere est introuvable.');
      }
      final Uint8List bytes = await produced.readAsBytes();
      if (bytes.isEmpty) {
        throw HtmlToPdfException('Le PDF genere est vide.');
      }
      return bytes;
    } on TimeoutException {
      throw HtmlToPdfException(
        'Delai depasse (60 s). La page est trop lourde ou la connexion '
        'internet est trop lente.',
      );
    } on PlatformException catch (e) {
      throw HtmlToPdfException(
        e.message?.isNotEmpty == true
            ? 'Conversion impossible : ${e.message}'
            : 'Conversion impossible (${e.code}).',
      );
    } on MissingPluginException {
      throw HtmlToPdfException(
        'Cette fonction n\'est disponible que sur Android.',
      );
    } finally {
      // Le PDF est deja en memoire : on ne laisse rien trainer dans le cache.
      try {
        if (await outFile.exists()) await outFile.delete();
      } catch (_) {
        // Suppression best-effort, sans consequence pour l'utilisateur.
      }
    }
  }
}
