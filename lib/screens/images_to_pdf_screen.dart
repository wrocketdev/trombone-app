import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import '../core/files/file_utils.dart';
import '../core/pdf/pdf_engine.dart';
import '../l10n/l10n.dart';
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
    final L l10n = context.l10n;
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
          _showError(l10n.errorOnFile(f.name, _friendlyError(e)));
        }
      }
      if (rejected.isNotEmpty && mounted) {
        _showError(l10n.imagesToPdfRejected(rejected.join(', ')));
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
    final L l10n = context.l10n;
    final List<PageSelection> selections = [
      for (final doc in _docs) PageSelection(source: doc, pageIndex: 0),
    ];
    try {
      final bytes = await runWithProgressDialog<Uint8List>(
        context: context,
        title: l10n.imagesToPdfBuilding,
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
      if (mounted) {
        _showError(l10n.imagesToPdfBuildFailed(_friendlyError(e)));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final L l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.toolImagesToPdf)),
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
              tooltip: l10n.imagesToPdfAdd,
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
                  label: Text(l10n.imagesToPdfCreateAction(_docs.length)),
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
              tooltip: context.l10n.actionRotate,
              icon: const Icon(Icons.rotate_right),
              onPressed: () => setState(() => doc.rotateAll(90)),
            ),
            IconButton(
              tooltip: context.l10n.actionRemove,
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
    final L l10n = context.l10n;
    return EmptyState(
      icon: Icons.image_outlined,
      title: l10n.imagesToPdfEmptyTitle,
      body: l10n.imagesToPdfEmptyBody,
      accepts: const ['JPG', 'PNG', 'WebP', 'HEIC'],
      actionLabel: l10n.imagesToPdfChoose,
      onAction: onAdd,
      busy: busy,
    );
  }
}
