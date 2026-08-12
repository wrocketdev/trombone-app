import 'dart:typed_data';

import 'package:flutter/material.dart';

import '../core/ads/ad_service.dart';
import '../core/files/export_service.dart';
import '../core/office/pdf_to_excel.dart';
import '../core/pdf/security_engine.dart';
import '../l10n/l10n.dart';
import '../widgets/progress_dialog.dart';
import '../widgets/ui/empty_state.dart';
import '../widgets/ui/result_card.dart';
import '../widgets/ui/picked_file_card.dart';
import '../widgets/ui/export_outcome.dart';

class PdfToExcelScreen extends StatefulWidget {
  const PdfToExcelScreen({super.key});

  @override
  State<PdfToExcelScreen> createState() => _PdfToExcelScreenState();
}

class _PdfToExcelScreenState extends State<PdfToExcelScreen> {
  PickedPdf? _picked;
  PdfToExcelAnalysis? _analysis;
  bool _includeParagraphs = false;
  bool _busy = false;

  Uint8List? _result;
  String _resultName = 'tableaux.xlsx';

  void _showMessage(String message) {
    if (!mounted) return;
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  String _xlsxNameFor(String pdfName) {
    final String base = pdfName.toLowerCase().endsWith('.pdf')
        ? pdfName.substring(0, pdfName.length - 4)
        : pdfName;
    return '${base.isEmpty ? 'document' : base}.xlsx';
  }

  Future<void> _pick() async {
    final L l10n = context.l10n;
    setState(() => _busy = true);
    try {
      final PickedPdf? picked = await SecurityEngine.pickPdfFile();
      if (picked == null) return;
      setState(() {
        _picked = picked;
        _analysis = null;
        _result = null;
        _resultName = _xlsxNameFor(picked.name);
      });
      await _analyze();
    } catch (e) {
      _showMessage(l10n.errorOpenFailed('$e'));
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  Future<void> _analyze() async {
    final PickedPdf? picked = _picked;
    if (picked == null || !mounted) return;
    final L l10n = context.l10n;
    try {
      final PdfToExcelAnalysis? analysis =
          await runWithProgressDialog<PdfToExcelAnalysis>(
            context: context,
            title: l10n.pdfToWordAnalyzing,
            task: (token, onProgress) => PdfToExcel.analyze(
              picked.bytes,
              cancelToken: token,
              onProgress: onProgress,
            ),
          );
      if (analysis == null || !mounted) return;
      setState(() => _analysis = analysis);
    } catch (e) {
      _showMessage(l10n.pdfToExcelAnalysisFailed('$e'));
      if (mounted) {
        setState(() {
          _picked = null;
          _analysis = null;
        });
      }
    }
  }

  Future<void> _convert() async {
    final PdfToExcelAnalysis? analysis = _analysis;
    if (analysis == null) return;
    final L l10n = context.l10n;
    if (!analysis.canExport(includeParagraphs: _includeParagraphs)) {
      // Garde-fou : on ne genere jamais un classeur vide.
      _showMessage(l10n.pdfToExcelNothingToExport);
      return;
    }
    try {
      final Uint8List? bytes = await runWithProgressDialog<Uint8List>(
        context: context,
        title: l10n.pdfToExcelBuilding,
        task: (token, onProgress) async {
          onProgress(0, 1);
          final Uint8List? built = PdfToExcel.build(
            analysis,
            includeParagraphs: _includeParagraphs,
          );
          onProgress(1, 1);
          if (built == null) {
            throw StateError('aucun contenu exploitable');
          }
          return built;
        },
      );
      if (bytes == null || !mounted) return;
      setState(() => _result = bytes);
    } catch (e) {
      _showMessage(l10n.errorConversionFailed('$e'));
    }
  }

  Future<void> _save() async {
    final Uint8List? bytes = _result;
    if (bytes == null) return;
    final L l10n = context.l10n;
    setState(() => _busy = true);
    try {
      final bool ok = await ExportService.saveToDevice(
        bytes,
        _resultName,
        dialogTitle: l10n.exportSaveDialogTitle,
      );
      if (ok && mounted) {
        await showExportSuccess(
          context,
          what: l10n.pdfToExcelExportWhat,
          onShare: _share,
        );
      }
    } catch (e) {
      _showMessage(l10n.errorSaveFailed('$e'));
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  Future<void> _share() async {
    final Uint8List? bytes = _result;
    if (bytes == null) return;
    final L l10n = context.l10n;
    setState(() => _busy = true);
    try {
      await ExportService.share(bytes, _resultName);
      AdService.instance.showAfterSuccessfulExport();
    } catch (e) {
      _showMessage(l10n.errorShareFailed('$e'));
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final PickedPdf? picked = _picked;
    final PdfToExcelAnalysis? analysis = _analysis;
    final ThemeData theme = Theme.of(context);
    final L l10n = context.l10n;
    final bool canExport =
        analysis != null &&
        analysis.canExport(includeParagraphs: _includeParagraphs);

    return Scaffold(
      appBar: AppBar(title: Text(l10n.toolPdfToExcel)),
      body: picked == null
          ? EmptyState(
              icon: Icons.table_chart_outlined,
              title: l10n.pdfToExcelEmptyTitle,
              body: l10n.pdfToExcelEmptyBody,
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
                      : l10n.pdfToExcelPagesAnalyzed(analysis.pageCount),
                  busy: _busy,
                  onChange: _pick,
                ),
                if (analysis != null) ...[
                  const SizedBox(height: 16),
                  _AnalysisCard(analysis: analysis),
                  const SizedBox(height: 8),
                  Card(
                    child: SwitchListTile(
                      value: _includeParagraphs,
                      onChanged: (bool v) => setState(() {
                        _includeParagraphs = v;
                        _result = null;
                      }),
                      title: Text(l10n.pdfToExcelIncludeParagraphs),
                      subtitle: Text(l10n.pdfToExcelIncludeParagraphsHint),
                      isThreeLine: true,
                    ),
                  ),
                  if (!canExport) ...[
                    const SizedBox(height: 8),
                    _NoTableCard(analysis: analysis),
                  ],
                  const SizedBox(height: 16),
                  Text(
                    l10n.pdfToExcelCaveatTitle,
                    style: theme.textTheme.titleSmall,
                  ),
                  const SizedBox(height: 6),
                  Text(l10n.pdfToExcelCaveat),
                  if (_result != null) ...[
                    const SizedBox(height: 16),
                    ResultCard(
                      title: l10n.pdfToExcelResultTitle,
                      detail: l10n.resultNameAndSize(
                        _resultName,
                        formatFileSize(l10n, _result!.lengthInBytes),
                      ),
                      busy: _busy,
                      onSave: _save,
                      onShare: _share,
                    ),
                  ],
                ],
              ],
            ),
      bottomNavigationBar: analysis == null
          ? null
          : SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: FilledButton.icon(
                  onPressed: (_busy || !canExport) ? null : _convert,
                  icon: const Icon(Icons.table_chart_outlined),
                  label: Text(l10n.pdfToExcelConvertAction, maxLines: 1),
                ),
              ),
            ),
    );
  }
}

/// Resume honnete de ce qui a ete trouve dans le document.
class _AnalysisCard extends StatelessWidget {
  const _AnalysisCard({required this.analysis});

  final PdfToExcelAnalysis analysis;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final L l10n = context.l10n;
    final List<int> pages = analysis.pagesWithTables;
    final String pagesLabel = pages.length > 12
        ? '${pages.take(12).join(', ')}…'
        : pages.join(', ');
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  analysis.hasTables
                      ? Icons.grid_on_outlined
                      : Icons.search_off_outlined,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    l10n.pdfToExcelTablesFound(
                      analysis.tableCount,
                      analysis.pageCount,
                    ),
                    style: theme.textTheme.titleMedium,
                  ),
                ),
              ],
            ),
            if (analysis.hasTables) ...[
              const SizedBox(height: 8),
              Text(
                l10n.pdfToExcelPagesConcerned(pagesLabel),
                style: theme.textTheme.bodySmall,
              ),
            ],
            const SizedBox(height: 4),
            Text(
              l10n.pdfToExcelParagraphsOutside(analysis.paragraphCount),
              style: theme.textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}

/// Message affiche quand il n'y a rien a exporter avec les reglages actuels.
class _NoTableCard extends StatelessWidget {
  const _NoTableCard({required this.analysis});

  final PdfToExcelAnalysis analysis;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final String message = analysis.isScanned
        ? context.l10n.pdfToExcelScannedWarning
        : context.l10n.pdfToExcelNoTableWarning;
    return Card(
      color: theme.colorScheme.errorContainer,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(Icons.info_outline, color: theme.colorScheme.onErrorContainer),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                message,
                style: TextStyle(color: theme.colorScheme.onErrorContainer),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
