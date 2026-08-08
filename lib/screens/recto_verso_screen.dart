import 'dart:typed_data';

import 'package:flutter/material.dart';

import '../core/files/file_utils.dart';
import '../core/pdf/pdf_engine.dart';
import '../core/pdf/recto_verso.dart';
import '../models/page_selection.dart';
import '../models/source_doc.dart';
import '../widgets/page_thumb.dart';
import '../widgets/progress_dialog.dart';
import 'preview_screen.dart';

class RectoVersoScreen extends StatefulWidget {
  const RectoVersoScreen({super.key});

  @override
  State<RectoVersoScreen> createState() => _RectoVersoScreenState();
}

class _RectoVersoScreenState extends State<RectoVersoScreen> {
  SourceDoc? _oddDoc;
  SourceDoc? _evenDoc;
  bool _evenReversed = true;
  bool _busy = false;

  @override
  void dispose() {
    _oddDoc?.dispose();
    _evenDoc?.dispose();
    super.dispose();
  }

  Future<void> _pick({required bool odd}) async {
    setState(() => _busy = true);
    try {
      final files = await FileUtils.pickFiles(allowMultiple: false);
      if (files.isEmpty) return;
      final doc = await FileUtils.buildSourceDoc(files.first);
      setState(() {
        if (odd) {
          _oddDoc?.dispose();
          _oddDoc = doc;
        } else {
          _evenDoc?.dispose();
          _evenDoc = doc;
        }
      });
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Impossible d\'ouvrir : $e')));
      }
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  List<PageSelection>? get _interleaved {
    final odd = _oddDoc;
    final even = _evenDoc;
    if (odd == null || even == null) return null;
    return RectoVerso.interleave(
      oddDoc: odd,
      evenDoc: even,
      evenIsReversed: _evenReversed,
    );
  }

  Future<void> _export() async {
    final selections = _interleaved;
    if (selections == null || selections.isEmpty) return;
    try {
      final bytes = await runWithProgressDialog<Uint8List>(
        context: context,
        title: 'Entrelacement en cours…',
        task: (token, onProgress) => PdfEngine.buildPdf(
          selections,
          onProgress: onProgress,
          cancelToken: token,
        ),
      );
      if (bytes == null || !mounted) return;
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) =>
              PreviewScreen(pdfBytes: bytes, suggestedName: 'recto-verso.pdf'),
        ),
      );
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Échec : $e')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final selections = _interleaved;
    return Scaffold(
      appBar: AppBar(title: const Text('Recto-verso')),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 96),
        children: [
          const Text(
            'Un chargeur simple face donne deux fichiers : les pages '
            'impaires dans l\'ordre, les pages paires souvent dans l\'ordre '
            'inverse. Choisissez les deux pour les recomposer.',
          ),
          const SizedBox(height: 20),
          _slot(
            title: 'Fichier des pages impaires (recto)',
            doc: _oddDoc,
            onPick: () => _pick(odd: true),
            onClear: () => setState(() {
              _oddDoc?.dispose();
              _oddDoc = null;
            }),
          ),
          const SizedBox(height: 12),
          _slot(
            title: 'Fichier des pages paires (verso)',
            doc: _evenDoc,
            onPick: () => _pick(odd: false),
            onClear: () => setState(() {
              _evenDoc?.dispose();
              _evenDoc = null;
            }),
          ),
          const SizedBox(height: 12),
          SwitchListTile(
            contentPadding: EdgeInsets.zero,
            title: const Text('Le second fichier est en ordre inverse'),
            subtitle: const Text(
              'C\'est le cas le plus courant, coché par défaut',
            ),
            value: _evenReversed,
            onChanged: (v) => setState(() => _evenReversed = v),
          ),
          if (selections != null) ...[
            const SizedBox(height: 20),
            Text(
              'Aperçu de l\'entrelacement (${selections.length} pages)',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            SizedBox(
              height: 130,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: selections.length,
                separatorBuilder: (_, _) => const SizedBox(width: 8),
                itemBuilder: (context, i) {
                  final sel = selections[i];
                  return SizedBox(
                    width: 90,
                    child: PageThumb(
                      bytesFuture: FileUtils.cachedPdfBytes(sel.source).then(
                        (b) => FileUtils.renderPdfPageThumbnail(
                          b,
                          pageNumber: sel.pageIndex + 1,
                          targetWidth: 160,
                        ),
                      ),
                      rotationDegrees: sel.extraRotationDegrees,
                    ),
                  );
                },
              ),
            ),
          ],
        ],
      ),
      bottomNavigationBar: selections == null
          ? null
          : SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: FilledButton.icon(
                  onPressed: _busy ? null : _export,
                  icon: const Icon(Icons.remove_red_eye_outlined),
                  label: const Text('Aperçu et export', maxLines: 1),
                ),
              ),
            ),
    );
  }

  Widget _slot({
    required String title,
    required SourceDoc? doc,
    required VoidCallback onPick,
    required VoidCallback onClear,
  }) {
    return Card(
      child: ListTile(
        leading: Icon(
          doc == null ? Icons.upload_file : Icons.picture_as_pdf_outlined,
        ),
        title: Text(title),
        subtitle: Text(
          doc == null
              ? 'Aucun fichier choisi'
              : '${doc.name} · ${doc.pageCount} pages',
        ),
        trailing: doc == null
            ? TextButton(
                onPressed: _busy ? null : onPick,
                child: const Text('Choisir'),
              )
            : IconButton(icon: const Icon(Icons.close), onPressed: onClear),
        onTap: doc == null ? onPick : null,
      ),
    );
  }
}
