import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';

import '../core/office/html_to_pdf.dart';
import '../core/pdf/pdf_engine.dart';
import '../l10n/l10n.dart';
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
    final L l10n = context.l10n;
    final String url = _urlController.text.trim();
    final String html = _htmlController.text;

    if (isUrl) {
      if (!url.startsWith('http://') && !url.startsWith('https://')) {
        _showError(l10n.htmlUrlBadScheme);
        return;
      }
      if (url == 'http://' || url == 'https://') {
        _showError(l10n.htmlUrlIncomplete);
        return;
      }
    } else if (html.trim().isEmpty) {
      _showError(l10n.htmlCodeEmpty);
      return;
    }

    setState(() => _busy = true);
    try {
      final Uint8List? bytes = await runWithProgressDialog<Uint8List>(
        context: context,
        title: isUrl ? l10n.htmlLoadingUrl : l10n.htmlConverting,
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
      _showError(l10n.errorGeneric('$e'));
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool isUrl = _mode == _SourceMode.url;
    final L l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.htmlTitle)),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 96),
        children: [
          Text(l10n.htmlIntro),
          const SizedBox(height: 20),
          Center(
            child: SegmentedButton<_SourceMode>(
              segments: [
                ButtonSegment<_SourceMode>(
                  value: _SourceMode.url,
                  icon: const Icon(Icons.link),
                  label: Text(l10n.htmlModeUrl, maxLines: 1),
                ),
                ButtonSegment<_SourceMode>(
                  value: _SourceMode.html,
                  icon: const Icon(Icons.code),
                  label: Text(l10n.htmlModeCode, maxLines: 1),
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
              decoration: InputDecoration(
                labelText: l10n.htmlUrlLabel,
                hintText: l10n.htmlUrlHint,
                prefixIcon: const Icon(Icons.public),
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            Card(
              color: Theme.of(context).colorScheme.surfaceContainerHighest,
              child: Padding(
                padding: const EdgeInsets.all(14),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.wifi_tethering, size: 20),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        l10n.htmlNetworkNotice,
                        style: const TextStyle(fontSize: 13),
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
              decoration: InputDecoration(
                labelText: l10n.htmlCodeLabel,
                hintText: l10n.htmlCodeHint,
                alignLabelWithHint: true,
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            Card(
              color: Theme.of(context).colorScheme.surfaceContainerHighest,
              child: Padding(
                padding: const EdgeInsets.all(14),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.info_outline, size: 20),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        l10n.htmlOfflineNotice,
                        style: const TextStyle(fontSize: 13),
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
            label: Text(l10n.actionConvert, maxLines: 1),
          ),
        ),
      ),
    );
  }
}
