import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

import '../core/ads/ad_service.dart';
import '../core/files/export_service.dart';
import '../core/files/file_utils.dart';
import '../core/pdf/image_export_engine.dart';
import '../l10n/l10n.dart';
import '../widgets/progress_dialog.dart';
import '../widgets/ui/empty_state.dart';
import '../widgets/ui/export_outcome.dart';

class PdfToImagesScreen extends StatefulWidget {
  const PdfToImagesScreen({super.key});

  @override
  State<PdfToImagesScreen> createState() => _PdfToImagesScreenState();
}

class _PdfToImagesScreenState extends State<PdfToImagesScreen> {
  Uint8List? _pdfBytes;
  String? _pdfName;
  int? _pageCount;
  bool _busy = false;

  ImageExportFormat _format = ImageExportFormat.jpg;
  ImageExportQuality _quality = ImageExportQuality.standard;

  List<ExportedImagePage>? _results;

  String _friendlyError(Object e) {
    final s = e.toString();
    return s.length > 140 ? '${s.substring(0, 140)}…' : s;
  }

  void _showError(String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  Future<void> _pickFile() async {
    final L l10n = context.l10n;
    setState(() => _busy = true);
    try {
      final files = await FileUtils.pickFiles(allowMultiple: false);
      if (files.isEmpty) return;
      final file = files.first;
      final String name = file.name;
      final int dot = name.lastIndexOf('.');
      final String ext = dot == -1
          ? (file.extension ?? '').toLowerCase()
          : name.substring(dot + 1).toLowerCase();
      if (ext != 'pdf') {
        _showError(l10n.pdfToImagesNotAPdf(file.name));
        return;
      }
      final doc = await FileUtils.buildSourceDoc(file);
      final bytes = await FileUtils.cachedPdfBytes(doc);
      final pageCount = await FileUtils.pdfPageCount(bytes);
      doc.dispose();
      FileUtils.forgetCache(doc.id);
      if (!mounted) return;
      setState(() {
        _pdfBytes = bytes;
        _pdfName = file.name;
        _pageCount = pageCount;
        _results = null;
      });
    } catch (e) {
      if (mounted) _showError(l10n.errorLoadFailed(_friendlyError(e)));
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  Future<void> _export() async {
    final bytes = _pdfBytes;
    if (bytes == null) return;
    final L l10n = context.l10n;
    try {
      final results = await runWithProgressDialog<List<ExportedImagePage>>(
        context: context,
        title: l10n.pdfToImagesProgress,
        task: (token, onProgress) => ImageExportEngine.exportPdfToImages(
          bytes,
          format: _format,
          quality: _quality,
          onProgress: onProgress,
          cancelToken: token,
        ),
      );
      if (results == null || !mounted) return;
      setState(() => _results = results);
    } catch (e) {
      if (mounted) _showError(l10n.errorExportFailed(_friendlyError(e)));
    }
  }

  Future<void> _shareAll() async {
    final results = _results;
    if (results == null || results.isEmpty) return;
    final L l10n = context.l10n;
    setState(() => _busy = true);
    try {
      await Share.shareXFiles([
        for (final r in results) XFile(r.file.path, mimeType: _format.mimeType),
      ]);
      unawaited(AdService.instance.showAfterSuccessfulExport());
    } catch (e) {
      if (mounted) _showError(l10n.errorShareFailed(_friendlyError(e)));
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  Future<void> _saveAll() async {
    final results = _results;
    if (results == null || results.isEmpty) return;
    final L l10n = context.l10n;
    setState(() => _busy = true);
    try {
      int saved = 0;
      for (final r in results) {
        final Uint8List bytes = await r.file.readAsBytes();
        final String fileName = 'page_${r.pageNumber}.${_format.extension}';
        final bool ok = await ExportService.saveToDevice(
          bytes,
          fileName,
          dialogTitle: l10n.exportSaveDialogTitle,
        );
        if (ok) saved++;
      }
      if (saved > 0 && mounted) {
        // Ici le résultat n'est pas un fichier mais un lot : c'est le nombre
        // d'images qui rend compte, pas le nom de la dernière.
        await showExportSuccess(
          context,
          what: l10n.pdfToImagesExportWhat(saved, _format.label),
          onShare: _shareAll,
        );
      }
    } catch (e) {
      if (mounted) {
        _showError(l10n.errorSaveFailed(_friendlyError(e)));
      }
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.toolPdfToImages)),
      body: _pdfBytes == null
          ? _EmptyState(busy: _busy, onPick: _pickFile)
          : _results != null
          ? _buildResults(context)
          : _buildConfig(context),
    );
  }

  Widget _buildConfig(BuildContext context) {
    final L l10n = context.l10n;
    final int n = _pageCount ?? 0;
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              child: ListTile(
                leading: const Icon(Icons.picture_as_pdf_outlined),
                title: Text(
                  _pdfName ?? '',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                subtitle: Text(l10n.pageCount(n)),
                trailing: TextButton(
                  onPressed: _busy ? null : _pickFile,
                  child: Text(l10n.actionChange),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              l10n.formatLabel,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              children: [
                for (final f in ImageExportFormat.values)
                  ChoiceChip(
                    label: Text(f.label),
                    selected: _format == f,
                    onSelected: (_) => setState(() => _format = f),
                  ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              l10n.qualityLabel,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                for (final q in ImageExportQuality.values)
                  ChoiceChip(
                    label: Text(q.label(l10n)),
                    selected: _quality == q,
                    onSelected: (_) => setState(() => _quality = q),
                  ),
              ],
            ),
            const SizedBox(height: 28),
            FilledButton.icon(
              onPressed: _busy ? null : _export,
              icon: const Icon(Icons.image_outlined),
              label: Text(l10n.actionExport, maxLines: 1),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildResults(BuildContext context) {
    final results = _results!;
    return Column(
      children: [
        Expanded(
          child: GridView.builder(
            padding: const EdgeInsets.all(12),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 0.72,
            ),
            itemCount: results.length,
            itemBuilder: (context, i) {
              final r = results[i];
              return Column(
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Theme.of(context).dividerColor,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Image.file(r.file, fit: BoxFit.contain),
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${r.pageNumber}',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              );
            },
          ),
        ),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(12, 8, 12, 12),
            child: Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: _busy ? null : _shareAll,
                    icon: const Icon(Icons.share_outlined),
                    label: Text(context.l10n.actionShare, maxLines: 1),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: FilledButton.icon(
                    onPressed: _busy ? null : _saveAll,
                    icon: const Icon(Icons.save_alt),
                    label: Text(context.l10n.actionSave, maxLines: 1),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState({required this.onPick, required this.busy});
  final VoidCallback onPick;
  final bool busy;

  @override
  Widget build(BuildContext context) {
    final L l10n = context.l10n;
    return EmptyState(
      icon: Icons.collections_outlined,
      title: l10n.pdfToImagesEmptyTitle,
      body: l10n.pdfToImagesEmptyBody,
      accepts: [l10n.formatPdf],
      actionLabel: l10n.actionChoosePdf,
      onAction: onPick,
      busy: busy,
    );
  }
}
