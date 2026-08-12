import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';

import '../core/ads/ad_service.dart';
import '../core/files/export_service.dart';
import '../core/files/file_utils.dart';
import '../core/office/pdf_to_pptx.dart';
import '../core/pdf/security_engine.dart';
import '../l10n/l10n.dart';
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

  Future<void> _pick() async {
    final L l10n = context.l10n;
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
      _showError(l10n.pdfToPptxOpenFailed(_friendlyError(e)));
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  Future<void> _convert() async {
    final Uint8List? bytes = _pdfBytes;
    if (bytes == null) return;
    final L l10n = context.l10n;
    try {
      final Uint8List? out = await runWithProgressDialog<Uint8List>(
        context: context,
        title: l10n.pdfToPptxConverting,
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
      _showError(l10n.errorConversionFailed(_friendlyError(e)));
    }
  }

  Future<void> _save() async {
    final Uint8List? out = _result;
    if (out == null) return;
    final L l10n = context.l10n;
    setState(() => _busy = true);
    try {
      final bool ok = await ExportService.saveToDevice(
        out,
        _resultName,
        dialogTitle: l10n.exportSaveDialogTitle,
      );
      if (!ok || !mounted) return;
      await showExportSuccess(
        context,
        what: l10n.pdfToPptxExportWhat(_pageCount),
        onShare: _share,
      );
    } catch (e) {
      _showError(l10n.errorSaveFailed(_friendlyError(e)));
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  Future<void> _share() async {
    final Uint8List? out = _result;
    if (out == null) return;
    final L l10n = context.l10n;
    setState(() => _busy = true);
    try {
      await ExportService.share(out, _resultName);
      unawaited(AdService.instance.showAfterSuccessfulExport());
    } catch (e) {
      _showError(l10n.errorShareFailed(_friendlyError(e)));
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.toolPdfToPptx)),
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
                  label: Text(context.l10n.pdfToPptxConvertAction, maxLines: 1),
                ),
              ),
            ),
    );
  }

  Widget _buildConfig(BuildContext context) {
    final L l10n = context.l10n;
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
                  ? l10n.pdfToPptxPagesToSlides(n)
                  : l10n.pdfToPptxEmptyDocument,
            ),
            trailing: TextButton(
              onPressed: _busy ? null : _pick,
              child: Text(l10n.actionChange),
            ),
          ),
        ),
        const SizedBox(height: 20),
        Text(l10n.qualityLabel, style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            for (final q in PptxQuality.values)
              ChoiceChip(
                label: Text(q.label(l10n)),
                selected: _quality == q,
                onSelected: (_) => setState(() => _quality = q),
              ),
          ],
        ),
        const SizedBox(height: 12),
        Text(
          heavy ? l10n.pdfToPptxHeavyWarning(n) : l10n.pdfToPptxQualityHint,
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
                      l10n.goodToKnow,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(l10n.pdfToPptxCaveat),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildResult(BuildContext context) {
    final L l10n = context.l10n;
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
                  title: l10n.pdfToPptxResultTitle,
                  detail: l10n.pdfToPptxResultDetail(
                    _resultName,
                    _pageCount,
                    formatFileSize(l10n, out.length),
                    _quality.label(l10n),
                  ),
                  busy: _busy,
                  onSave: _save,
                  onShare: _share,
                ),
                const SizedBox(height: Space.sm),
                Text(
                  l10n.notSavedYet,
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
                  label: Text(l10n.pdfToPptxChangeQuality, maxLines: 1),
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
    final L l10n = context.l10n;
    return EmptyState(
      icon: Icons.slideshow_outlined,
      title: l10n.pdfToPptxEmptyTitle,
      body: l10n.pdfToPptxEmptyBody,
      accepts: [l10n.formatPdf],
      actionLabel: l10n.actionChoosePdf,
      onAction: onPick,
      busy: busy,
    );
  }
}
