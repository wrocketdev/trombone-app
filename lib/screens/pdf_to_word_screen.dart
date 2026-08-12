import 'dart:typed_data';

import 'package:flutter/material.dart';

import '../core/ads/ad_service.dart';
import '../core/files/export_service.dart';
import '../core/office/pdf_to_word.dart';
import '../core/pdf/security_engine.dart';
import '../widgets/progress_dialog.dart';
import '../l10n/l10n.dart';
import '../theme/theme.dart';
import '../widgets/ui/empty_state.dart';
import '../widgets/ui/picked_file_card.dart';
import '../widgets/ui/result_card.dart';
import '../widgets/ui/export_outcome.dart';

class PdfToWordScreen extends StatefulWidget {
  const PdfToWordScreen({super.key});

  @override
  State<PdfToWordScreen> createState() => _PdfToWordScreenState();
}

class _PdfToWordScreenState extends State<PdfToWordScreen> {
  PickedPdf? _picked;
  PdfToWordAnalysis? _analysis;
  Uint8List? _docxBytes;
  String _fileName = 'document.docx';
  bool _busy = false;

  void _snack(String message) {
    if (!mounted) return;
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  void _reset() {
    setState(() {
      _picked = null;
      _analysis = null;
      _docxBytes = null;
      _fileName = 'document.docx';
    });
  }

  Future<void> _pick() async {
    // Les libelles sont lus avant tout await : `context` ne se traverse pas
    // en toute securite une fois la frontiere asynchrone franchie.
    final L l10n = context.l10n;
    setState(() => _busy = true);
    try {
      final PickedPdf? picked = await SecurityEngine.pickPdfFile();
      if (picked == null || !mounted) return;
      setState(() {
        _picked = picked;
        _analysis = null;
        _docxBytes = null;
        _fileName = PdfToWord.suggestedFileName(picked.name);
      });
      await _analyze();
    } catch (e) {
      _snack(l10n.errorOpenFailed('$e'));
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  Future<void> _analyze() async {
    final PickedPdf? picked = _picked;
    if (picked == null || !mounted) return;
    try {
      final PdfToWordAnalysis? analysis =
          await runWithProgressDialog<PdfToWordAnalysis>(
            context: context,
            title: context.l10n.pdfToWordAnalyzing,
            task: (token, onProgress) => PdfToWord.analyze(
              picked.bytes,
              onProgress: onProgress,
              cancelToken: token,
            ),
          );
      if (analysis == null || !mounted) return;
      setState(() => _analysis = analysis);
    } on PdfLockedException {
      _snack(context.l10n.pdfLocked);
      _reset();
    } catch (e) {
      _snack(context.l10n.pdfToWordAnalysisFailed('$e'));
      _reset();
    }
  }

  Future<void> _convert() async {
    final PdfToWordAnalysis? analysis = _analysis;
    if (analysis == null || !analysis.hasText) return;
    try {
      final Uint8List? bytes = await runWithProgressDialog<Uint8List>(
        context: context,
        title: context.l10n.pdfToWordConverting,
        task: (token, onProgress) => PdfToWord.buildDocx(
          analysis,
          onProgress: onProgress,
          cancelToken: token,
        ),
      );
      if (bytes == null || !mounted) return;
      setState(() => _docxBytes = bytes);
    } catch (e) {
      _snack(context.l10n.errorConversionFailed('$e'));
    }
  }

  Future<void> _save() async {
    final Uint8List? bytes = _docxBytes;
    if (bytes == null) return;
    final L l10n = context.l10n;
    setState(() => _busy = true);
    try {
      final bool ok = await ExportService.saveToDevice(
        bytes,
        _fileName,
        dialogTitle: l10n.exportSaveDialogTitle,
      );
      if (!mounted) return;
      if (ok) {
        await showExportSuccess(
          context,
          what: l10n.pdfToWordExportWhat,
          onShare: _share,
        );
      }
    } catch (e) {
      _snack(l10n.errorSaveFailed('$e'));
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  Future<void> _share() async {
    final Uint8List? bytes = _docxBytes;
    if (bytes == null) return;
    setState(() => _busy = true);
    try {
      await ExportService.share(bytes, _fileName);
      if (!mounted) return;
      AdService.instance.showAfterSuccessfulExport();
    } catch (e) {
      _snack(context.l10n.errorShareFailed('$e'));
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final L l10n = context.l10n;
    final PickedPdf? picked = _picked;
    final PdfToWordAnalysis? analysis = _analysis;
    final Uint8List? docx = _docxBytes;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.toolPdfToWord)),
      body: picked == null
          ? EmptyState(
              icon: Icons.description_outlined,
              title: l10n.pdfToWordEmptyTitle,
              body: l10n.pdfToWordEmptyBody,
              accepts: [l10n.formatPdf],
              actionLabel: l10n.actionChoosePdf,
              onAction: _pick,
              busy: _busy,
            )
          : ListView(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 96),
              children: [
                PickedFileCard(
                  name: picked.name,
                  subtitle: analysis == null
                      ? l10n.pdfToWordAnalysisPending
                      : l10n.pageCount(analysis.pageCount),
                  busy: _busy,
                  onChange: _pick,
                ),
                if (analysis != null) ...[
                  const SizedBox(height: 16),
                  if (!analysis.hasText)
                    _ScanWarningCard(theme: theme)
                  else ...[
                    _SummaryCard(analysis: analysis, theme: theme),
                    const SizedBox(height: 12),
                    Text(
                      l10n.pdfToWordCaveat,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: context.colors.inkMuted,
                      ),
                    ),
                  ],
                ],
                if (docx != null) ...[
                  const SizedBox(height: Space.lg),
                  ResultCard(
                    title: l10n.pdfToWordResultTitle,
                    detail: l10n.pdfToWordResultDetail(
                      _fileName,
                      formatFileSize(l10n, docx.length),
                    ),
                    busy: _busy,
                    onSave: _save,
                    onShare: _share,
                  ),
                ],
              ],
            ),
      // Une fois le document produit, « Convertir à nouveau » restait un
      // bouton plein accent, pleine largeur, en bas de l'écran — donc l'objet
      // le plus voyant de la page, pendant que « Enregistrer », le geste qui
      // reste à faire, tenait dans un bouton deux fois plus petit à
      // l'intérieur de la carte de résultat. Le travail était fini et
      // l'application criait « recommencez ». Refaire la conversion redevient
      // ce que c'est : une reprise, en action secondaire.
      bottomNavigationBar: analysis == null || !analysis.hasText
          ? null
          : SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(Space.sm),
                child: _docxBytes == null
                    ? FilledButton.icon(
                        onPressed: _busy ? null : _convert,
                        icon: const Icon(Icons.description_outlined),
                        label: Text(l10n.pdfToWordConvertAction, maxLines: 1),
                      )
                    : OutlinedButton.icon(
                        onPressed: _busy ? null : _convert,
                        icon: const Icon(Icons.refresh),
                        label: Text(l10n.actionConvertAgain, maxLines: 1),
                      ),
              ),
            ),
    );
  }
}

/// Resume de ce que l'analyse a reellement trouve, pour que l'utilisateur
/// sache a quoi s'attendre avant de lancer la conversion.
class _SummaryCard extends StatelessWidget {
  const _SummaryCard({required this.analysis, required this.theme});

  final PdfToWordAnalysis analysis;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    final L l10n = context.l10n;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              l10n.pdfToWordSummaryTitle,
              style: theme.textTheme.titleMedium,
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                _Chip(
                  icon: Icons.description_outlined,
                  label: l10n.pageCount(analysis.pageCount),
                ),
                _Chip(
                  icon: Icons.notes_outlined,
                  label: l10n.pdfToWordParagraphCount(analysis.paragraphCount),
                ),
                _Chip(
                  icon: Icons.title_outlined,
                  label: l10n.pdfToWordHeadingCount(analysis.headingCount),
                ),
                _Chip(
                  icon: Icons.table_chart_outlined,
                  label: l10n.pdfToWordTableCount(analysis.tableCount),
                ),
              ],
            ),
            if (analysis.tableCount == 0) ...[
              const SizedBox(height: 12),
              Text(
                l10n.pdfToWordNoTables,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: context.colors.inkMuted,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _Chip extends StatelessWidget {
  const _Chip({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Chip(
      avatar: Icon(icon, size: 18),
      label: Text(label),
      visualDensity: VisualDensity.compact,
    );
  }
}

/// Aucun texte extractible : le PDF est presque surement un scan.
class _ScanWarningCard extends StatelessWidget {
  const _ScanWarningCard({required this.theme});

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: theme.colorScheme.errorContainer,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              Icons.warning_amber_outlined,
              color: theme.colorScheme.onErrorContainer,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                context.l10n.pdfToWordScanWarning,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onErrorContainer,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
