import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import '../core/files/file_utils.dart';
import '../core/pdf/pdf_engine.dart';
import '../models/page_selection.dart';
import '../models/source_doc.dart';
import '../widgets/progress_dialog.dart';
import 'preview_screen.dart';
import '../widgets/ui/empty_state.dart';

const List<String> _kImageExtensions = [
  'jpg',
  'jpeg',
  'png',
  'bmp',
  'webp',
  'heic',
  'heif',
];

class ImagesToPdfScreen extends StatefulWidget {
  const ImagesToPdfScreen({super.key});

  @override
  State<ImagesToPdfScreen> createState() => _ImagesToPdfScreenState();
}

class _ImagesToPdfScreenState extends State<ImagesToPdfScreen> {
  final List<SourceDoc> _docs = [];
  bool _busy = false;

  @override
  void dispose() {
    for (final d in _docs) {
      d.dispose();
    }
    super.dispose();
  }

  String _extensionOf(PlatformFile file) {
    final String name = file.name;
    final int dot = name.lastIndexOf('.');
    if (dot == -1) return (file.extension ?? '').toLowerCase();
    return name.substring(dot + 1).toLowerCase();
  }

  String _friendlyError(Object e) {
    final s = e.toString();
    return s.length > 140 ? '${s.substring(0, 140)}…' : s;
  }

  void _showError(String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  Future<void> _addFiles() async {
    setState(() => _busy = true);
    try {
      final files = await FileUtils.pickFiles();
      final List<String> rejected = [];
      for (final f in files) {
        final ext = _extensionOf(f);
        if (!_kImageExtensions.contains(ext)) {
          rejected.add(f.name);
          continue;
        }
        try {
          final doc = await FileUtils.buildSourceDoc(f);
          if (!mounted) return;
          setState(() => _docs.add(doc));
        } catch (e) {
          if (!mounted) return;
          _showError('${f.name} : ${_friendlyError(e)}');
        }
      }
      if (rejected.isNotEmpty && mounted) {
        _showError('Ignoré (pas une image) : ${rejected.join(', ')}');
      }
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  void _removeDoc(SourceDoc doc) {
    setState(() => _docs.remove(doc));
    doc.dispose();
    FileUtils.forgetCache(doc.id);
  }

  Future<void> _build() async {
    if (_docs.isEmpty) return;
    final List<PageSelection> selections = [
      for (final doc in _docs) PageSelection(source: doc, pageIndex: 0),
    ];
    try {
      final bytes = await runWithProgressDialog<Uint8List>(
        context: context,
        title: 'Création du PDF…',
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
              PreviewScreen(pdfBytes: bytes, suggestedName: 'images.pdf'),
        ),
      );
    } catch (e) {
      if (mounted) _showError('Échec de la création : ${_friendlyError(e)}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Images vers PDF')),
      body: _docs.isEmpty
          ? _EmptyState(busy: _busy, onAdd: _addFiles)
          : ReorderableListView.builder(
              padding: const EdgeInsets.fromLTRB(8, 8, 8, 96),
              itemCount: _docs.length,
              onReorder: (oldIndex, newIndex) {
                setState(() {
                  if (newIndex > oldIndex) newIndex--;
                  final d = _docs.removeAt(oldIndex);
                  _docs.insert(newIndex, d);
                });
              },
              itemBuilder: (context, index) =>
                  _buildDocTile(context, _docs[index], index),
            ),
      floatingActionButton: _docs.isEmpty
          ? null
          : FloatingActionButton(
              onPressed: _busy ? null : _addFiles,
              tooltip: 'Ajouter des images',
              child: const Icon(Icons.add),
            ),
      bottomNavigationBar: _docs.isEmpty
          ? null
          : SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: FilledButton.icon(
                  onPressed: _build,
                  icon: const Icon(Icons.picture_as_pdf_outlined),
                  label: Text(
                    'Créer le PDF (${_docs.length} image${_docs.length > 1 ? 's' : ''})',
                  ),
                ),
              ),
            ),
    );
  }

  Widget _buildDocTile(BuildContext context, SourceDoc doc, int index) {
    return Card(
      key: ValueKey(doc.id),
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: ListTile(
        leading: SizedBox(
          width: 40,
          height: 52,
          child: doc.thumbnail != null && doc.thumbnail!.isNotEmpty
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: Image.memory(doc.thumbnail!, fit: BoxFit.cover),
                )
              : const Icon(Icons.image_outlined),
        ),
        title: Text(doc.name, maxLines: 1, overflow: TextOverflow.ellipsis),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              tooltip: 'Pivoter',
              icon: const Icon(Icons.rotate_right),
              onPressed: () => setState(() => doc.rotateAll(90)),
            ),
            IconButton(
              tooltip: 'Retirer',
              icon: const Icon(Icons.delete_outline),
              onPressed: () => _removeDoc(doc),
            ),
            ReorderableDragStartListener(
              index: index,
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 4),
                child: Icon(Icons.drag_handle),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState({required this.onAdd, required this.busy});
  final VoidCallback onAdd;
  final bool busy;

  @override
  Widget build(BuildContext context) {
    return EmptyState(
      icon: Icons.image_outlined,
      title: 'Des images, un PDF',
      body:
          'JPG, PNG, WebP, HEIC — ajoutez vos images et elles seront '
          'assemblées dans l’ordre que vous choisissez.',
      accepts: const ['JPG', 'PNG', 'WebP', 'HEIC'],
      actionLabel: 'Choisir des images',
      onAction: onAdd,
      busy: busy,
    );
  }
}
