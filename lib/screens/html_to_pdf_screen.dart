import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';

import '../core/office/html_to_pdf.dart';
import '../core/pdf/pdf_engine.dart';
import '../widgets/progress_dialog.dart';
import 'preview_screen.dart';

enum _SourceMode { url, html }

class HtmlToPdfScreen extends StatefulWidget {
  const HtmlToPdfScreen({super.key});

  @override
  State<HtmlToPdfScreen> createState() => _HtmlToPdfScreenState();
}

class _HtmlToPdfScreenState extends State<HtmlToPdfScreen> {
  _SourceMode _mode = _SourceMode.url;
  bool _busy = false;

  final TextEditingController _urlController = TextEditingController(
    text: 'https://',
  );
  final TextEditingController _htmlController = TextEditingController();

  @override
  void dispose() {
    _urlController.dispose();
    _htmlController.dispose();
    super.dispose();
  }

  void _showError(String message) {
    if (!mounted) return;
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  /// La conversion se fait entierement cote Android et n'est pas
  /// interruptible : on laisse quand meme le bouton Annuler fermer la boite
  /// de dialogue en surveillant le jeton, le travail natif restant est
  /// simplement ignore.
  Future<Uint8List> _withCancel(Future<Uint8List> work, CancelToken token) {
    final Completer<Uint8List> completer = Completer<Uint8List>();
    work.then(
      (v) {
        if (!completer.isCompleted) completer.complete(v);
      },
      onError: (Object e, StackTrace s) {
        if (!completer.isCompleted) completer.completeError(e, s);
      },
    );
    Timer.periodic(const Duration(milliseconds: 200), (timer) {
      if (completer.isCompleted) {
        timer.cancel();
      } else if (token.isCancelled) {
        timer.cancel();
        completer.completeError(CancelledException());
      }
    });
    return completer.future;
  }

  Future<void> _convert() async {
    final bool isUrl = _mode == _SourceMode.url;
    final String url = _urlController.text.trim();
    final String html = _htmlController.text;

    if (isUrl) {
      if (!url.startsWith('http://') && !url.startsWith('https://')) {
        _showError('L\'adresse doit commencer par http:// ou https://.');
        return;
      }
      if (url == 'http://' || url == 'https://') {
        _showError('Entrez une adresse web complete.');
        return;
      }
    } else if (html.trim().isEmpty) {
      _showError('Collez du code HTML a convertir.');
      return;
    }

    setState(() => _busy = true);
    try {
      final Uint8List? bytes = await runWithProgressDialog<Uint8List>(
        context: context,
        title: isUrl
            ? 'Chargement de la page et conversion…'
            : 'Conversion du HTML en cours…',
        task: (token, onProgress) async {
          onProgress(0, 0); // duree inconnue : barre indeterminee
          final Uint8List out = await _withCancel(
            isUrl ? HtmlToPdf.fromUrl(url) : HtmlToPdf.fromHtml(html),
            token,
          );
          onProgress(1, 1);
          return out;
        },
      );
      if (bytes == null || !mounted) return;
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) =>
              PreviewScreen(pdfBytes: bytes, suggestedName: 'page-web.pdf'),
        ),
      );
    } catch (e) {
      _showError('Echec : $e');
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool isUrl = _mode == _SourceMode.url;
    return Scaffold(
      appBar: AppBar(title: const Text('HTML / page web en PDF')),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 96),
        children: [
          const Text(
            'Transformez une page web ou du code HTML en PDF A4. Le rendu est '
            'realise par le navigateur integre a Android, la mise en page est '
            'donc celle d\'une impression depuis Chrome.',
          ),
          const SizedBox(height: 20),
          Center(
            child: SegmentedButton<_SourceMode>(
              segments: const [
                ButtonSegment<_SourceMode>(
                  value: _SourceMode.url,
                  icon: Icon(Icons.link),
                  label: Text('Adresse web', maxLines: 1),
                ),
                ButtonSegment<_SourceMode>(
                  value: _SourceMode.html,
                  icon: Icon(Icons.code),
                  label: Text('Code HTML', maxLines: 1),
                ),
              ],
              selected: <_SourceMode>{_mode},
              onSelectionChanged: _busy
                  ? null
                  : (s) => setState(() => _mode = s.first),
            ),
          ),
          const SizedBox(height: 20),
          if (isUrl) ...[
            TextField(
              controller: _urlController,
              keyboardType: TextInputType.url,
              autocorrect: false,
              decoration: const InputDecoration(
                labelText: 'Adresse de la page',
                hintText: 'https://exemple.fr/article',
                prefixIcon: Icon(Icons.public),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            Card(
              color: Theme.of(context).colorScheme.surfaceContainerHighest,
              child: const Padding(
                padding: EdgeInsets.all(14),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.wifi_tethering, size: 20),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        'Une connexion internet est necessaire : c\'est le seul '
                        'outil de l\'application qui doit telecharger la page. '
                        'Les pages qui exigent une connexion a un compte, un '
                        'bandeau de cookies ou beaucoup de JavaScript peuvent '
                        'sortir incompletes.',
                        style: TextStyle(fontSize: 13),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ] else ...[
            TextField(
              controller: _htmlController,
              minLines: 8,
              maxLines: 16,
              keyboardType: TextInputType.multiline,
              autocorrect: false,
              style: const TextStyle(fontFamily: 'monospace', fontSize: 13),
              decoration: const InputDecoration(
                labelText: 'Code HTML',
                hintText: '<h1>Titre</h1>\n<p>Texte…</p>',
                alignLabelWithHint: true,
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            Card(
              color: Theme.of(context).colorScheme.surfaceContainerHighest,
              child: const Padding(
                padding: EdgeInsets.all(14),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.info_outline, size: 20),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        'Le HTML et le CSS ecrits directement dans la page sont '
                        'rendus hors ligne. En revanche, les images, feuilles '
                        'de style ou polices appelees par une adresse web '
                        'externe necessitent une connexion internet.',
                        style: TextStyle(fontSize: 13),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: FilledButton.icon(
            onPressed: _busy ? null : _convert,
            icon: const Icon(Icons.picture_as_pdf_outlined),
            label: const Text('Convertir', maxLines: 1),
          ),
        ),
      ),
    );
  }
}
