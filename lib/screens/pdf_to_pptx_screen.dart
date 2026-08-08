import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';

import '../core/ads/ad_service.dart';
import '../core/files/export_service.dart';
import '../core/files/file_utils.dart';
import '../core/office/pdf_to_pptx.dart';
import '../core/pdf/security_engine.dart';
import '../widgets/progress_dialog.dart';
import '../theme/theme.dart';
import '../widgets/ui/empty_state.dart';
import '../widgets/ui/result_card.dart';
import '../widgets/ui/export_outcome.dart';

class PdfToPptxScreen extends StatefulWidget {
  const PdfToPptxScreen({super.key});

  @override
  State<PdfToPptxScreen> createState() => _PdfToPptxScreenState();
}

class _PdfToPptxScreenState extends State<PdfToPptxScreen> {
  Uint8List? _pdfBytes;
  String? _pdfName;
  int _pageCount = 0;
  bool _busy = false;

  PptxQuality _quality = PptxQuality.standard;

  Uint8List? _result;
  String _resultName = 'presentation.pptx';

  String _friendlyError(Object e) {
    final String s = e.toString();
    return s.length > 140 ? '${s.substring(0, 140)}…' : s;
  }

  void _showError(String message) {
    if (!mounted) return;
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  static String _formatSize(int bytes) {
    if (bytes < 1024) return '$bytes o';
    if (bytes < 1024 * 1024) return '${(bytes / 1024).round()} Ko';
    return '${(bytes / (1024 * 1024)).toStringAsFixed(1)} Mo';
  }

  Future<void> _pick() async {
    setState(() => _busy = true);
    try {
      final PickedPdf? picked = await SecurityEngine.pickPdfFile();
      if (picked == null) return;
      final int pages = await FileUtils.pdfPageCount(picked.bytes);
      if (!mounted) return;
      setState(() {
        _pdfBytes = picked.bytes;
        _pdfName = picked.name;
        _pageCount = pages;
        _result = null;
      });
    } catch (e) {
      _showError('Impossible d\'ouvrir ce PDF : ${_friendlyError(e)}');
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  Future<void> _convert() async {
    final Uint8List? bytes = _pdfBytes;
    if (bytes == null) return;
    try {
      final Uint8List? out = await runWithProgressDialog<Uint8List>(
        context: context,
        title: 'Conversion en PowerPoint…',
        task: (token, onProgress) => PdfToPptx.convert(
          bytes,
          quality: _quality,
          onProgress: onProgress,
          cancelToken: token,
        ),
      );
      if (out == null || !mounted) return;
      setState(() {
        _result = out;
        _resultName = PdfToPptx.suggestedName(_pdfName ?? 'presentation.pdf');
      });
    } catch (e) {
      _showError('Échec de la conversion : ${_friendlyError(e)}');
    }
  }

  Future<void> _save() async {
    final Uint8List? out = _result;
    if (out == null) return;
    setState(() => _busy = true);
    try {
      final bool ok = await ExportService.saveToDevice(out, _resultName);
      if (!ok || !mounted) return;
      await showExportSuccess(
        context,
        what:
            'Présentation PowerPoint · $_pageCount '
            'diapositive${_pageCount > 1 ? 's' : ''}',
        onShare: _share,
      );
    } catch (e) {
      _showError('Échec de l\'enregistrement : ${_friendlyError(e)}');
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  Future<void> _share() async {
    final Uint8List? out = _result;
    if (out == null) return;
    setState(() => _busy = true);
    try {
      await ExportService.share(out, _resultName);
      unawaited(AdService.instance.showAfterSuccessfulExport());
    } catch (e) {
      _showError('Échec du partage : ${_friendlyError(e)}');
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('PDF vers PowerPoint')),
      body: _pdfBytes == null
          ? _EmptyState(busy: _busy, onPick: _pick)
          : _result != null
          ? _buildResult(context)
          : _buildConfig(context),
      bottomNavigationBar: (_pdfBytes == null || _result != null)
          ? null
          : SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: FilledButton.icon(
                  onPressed: _busy ? null : _convert,
                  icon: const Icon(Icons.slideshow_outlined),
                  label: const Text('Convertir en PowerPoint', maxLines: 1),
                ),
              ),
            ),
    );
  }

  Widget _buildConfig(BuildContext context) {
    final int n = _pageCount;
    final bool heavy = _quality == PptxQuality.high && n > 15;
    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
      children: [
        Card(
          child: ListTile(
            leading: const Icon(Icons.picture_as_pdf_outlined),
            title: Text(
              _pdfName ?? '',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            subtitle: Text(
              n > 0
                  ? '$n page${n > 1 ? 's' : ''} → $n diapositive${n > 1 ? 's' : ''}'
                  : 'Document vide',
            ),
            trailing: TextButton(
              onPressed: _busy ? null : _pick,
              child: const Text('Changer'),
            ),
          ),
        ),
        const SizedBox(height: 20),
        Text('Qualité', style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            for (final q in PptxQuality.values)
              ChoiceChip(
                label: Text(q.label),
                selected: _quality == q,
                onSelected: (_) => setState(() => _quality = q),
              ),
          ],
        ),
        const SizedBox(height: 12),
        Text(
          heavy
              ? 'Attention : en haute qualité, une présentation de $n pages '
                    'peut peser plusieurs dizaines de Mo et être longue à '
                    'ouvrir. Choisissez Standard en cas de doute.'
              : 'Une résolution plus élevée donne des diapositives plus nettes '
                    'mais un fichier nettement plus lourd.',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: heavy
                ? Theme.of(context).colorScheme.error
                : Theme.of(context).textTheme.bodySmall?.color,
          ),
        ),
        const SizedBox(height: 24),
        Card(
          color: Theme.of(context).colorScheme.surfaceContainerHighest,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.info_outline, size: 20),
                    const SizedBox(width: 8),
                    Text(
                      'À savoir',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                const Text(
                  'Chaque diapositive est une image de la page : la mise en '
                  'page est identique au PDF, mais le texte ne sera pas '
                  'modifiable dans PowerPoint.\n'
                  'Pour récupérer du texte modifiable, utilisez plutôt '
                  '« PDF vers Word ».\n'
                  'Une présentation n\'a qu\'un seul format de diapositive : '
                  'il est repris de la première page, et les pages de format '
                  'différent sont centrées à l\'intérieur.',
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildResult(BuildContext context) {
    final Uint8List out = _result!;
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
              children: [
                // Les deux actions vivaient dans une barre du bas, dans
                // l'ordre « Partager | Enregistrer » — l'inverse de tous les
                // autres écrans. Elles rejoignent la carte de résultat, où
                // l'ordre et la hiérarchie sont les mêmes partout.
                ResultCard(
                  title: 'Présentation prête',
                  detail:
                      '$_resultName — $_pageCount '
                      'diapositive${_pageCount > 1 ? 's' : ''} · '
                      '${_formatSize(out.length)} · ${_quality.label}',
                  busy: _busy,
                  onSave: _save,
                  onShare: _share,
                ),
                const SizedBox(height: Space.sm),
                Text(
                  'Le fichier n\'est pas encore sur votre appareil : '
                  'enregistrez-le ou partagez-le.',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(height: Space.sm),
                TextButton.icon(
                  onPressed: _busy
                      ? null
                      : () => setState(() {
                          _result = null;
                        }),
                  icon: const Icon(Icons.tune),
                  label: const Text('Changer la qualité', maxLines: 1),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState({required this.onPick, required this.busy});

  final VoidCallback onPick;
  final bool busy;

  @override
  Widget build(BuildContext context) {
    return EmptyState(
      icon: Icons.slideshow_outlined,
      title: 'Une diapositive par page',
      body:
          'Le PDF devient une présentation PowerPoint à l’identique. '
          'Chaque page arrive sous forme d’image : la mise en page est '
          'fidèle, mais le texte ne sera pas modifiable dans PowerPoint.',
      accepts: const ['PDF'],
      actionLabel: 'Choisir un PDF',
      onAction: onPick,
      busy: busy,
    );
  }
}
