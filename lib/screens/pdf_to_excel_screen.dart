import 'dart:typed_data';

import 'package:flutter/material.dart';

import '../core/ads/ad_service.dart';
import '../core/files/export_service.dart';
import '../core/office/pdf_to_excel.dart';
import '../core/pdf/security_engine.dart';
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
      _showMessage('Impossible d\'ouvrir le fichier : $e');
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  Future<void> _analyze() async {
    final PickedPdf? picked = _picked;
    if (picked == null || !mounted) return;
    try {
      final PdfToExcelAnalysis? analysis =
          await runWithProgressDialog<PdfToExcelAnalysis>(
            context: context,
            title: 'Analyse du document…',
            task: (token, onProgress) => PdfToExcel.analyze(
              picked.bytes,
              cancelToken: token,
              onProgress: onProgress,
            ),
          );
      if (analysis == null || !mounted) return;
      setState(() => _analysis = analysis);
    } catch (e) {
      _showMessage(
        'Analyse impossible. Le PDF est peut-être protégé par un mot de '
        'passe ou endommagé. ($e)',
      );
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
    if (!analysis.canExport(includeParagraphs: _includeParagraphs)) {
      // Garde-fou : on ne genere jamais un classeur vide.
      _showMessage('Rien à exporter : aucun tableau détecté.');
      return;
    }
    try {
      final Uint8List? bytes = await runWithProgressDialog<Uint8List>(
        context: context,
        title: 'Création du classeur…',
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
      _showMessage('Échec de la conversion : $e');
    }
  }

  Future<void> _save() async {
    final Uint8List? bytes = _result;
    if (bytes == null) return;
    setState(() => _busy = true);
    try {
      final bool ok = await ExportService.saveToDevice(bytes, _resultName);
      if (ok && mounted) {
        await showExportSuccess(
          context,
          what: 'Classeur Excel',
          onShare: _share,
        );
      }
    } catch (e) {
      _showMessage('Enregistrement impossible : $e');
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  Future<void> _share() async {
    final Uint8List? bytes = _result;
    if (bytes == null) return;
    setState(() => _busy = true);
    try {
      await ExportService.share(bytes, _resultName);
      AdService.instance.showAfterSuccessfulExport();
    } catch (e) {
      _showMessage('Partage impossible : $e');
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final PickedPdf? picked = _picked;
    final PdfToExcelAnalysis? analysis = _analysis;
    final ThemeData theme = Theme.of(context);
    final bool canExport =
        analysis != null &&
        analysis.canExport(includeParagraphs: _includeParagraphs);

    return Scaffold(
      appBar: AppBar(title: const Text('PDF vers Excel')),
      body: picked == null
          ? EmptyState(
              icon: Icons.table_chart_outlined,
              title: 'Récupérer les tableaux',
              body:
                  'Les tableaux d’un PDF sont extraits vers un classeur Excel. La mise en forme n’est pas conservée, les valeurs le sont.',
              accepts: const ['PDF'],
              actionLabel: 'Choisir un PDF',
              onAction: _pick,
              busy: _busy,
            )
          : ListView(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 96),
              children: [
                PickedFileCard(
                  name: picked.name,
                  subtitle: analysis == null
                      ? 'Analyse en attente'
                      : '${analysis.pageCount} pages analysées',
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
                      title: const Text(
                        'Inclure aussi le texte hors tableaux '
                        '(une ligne par paragraphe)',
                      ),
                      subtitle: const Text(
                        'Utile pour un document semi-structuré : le texte est placé '
                        'dans la colonne A, après les tableaux de la page.',
                      ),
                      isThreeLine: true,
                    ),
                  ),
                  if (!canExport) ...[
                    const SizedBox(height: 8),
                    _NoTableCard(analysis: analysis),
                  ],
                  const SizedBox(height: 16),
                  Text(
                    'Ce que la conversion ne conserve pas',
                    style: theme.textTheme.titleSmall,
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    'La détection repose sur la position du texte dans la page : '
                    'les tableaux sans bordure régulière, les cellules fusionnées '
                    'et les colonnes très irrégulières peuvent être mal découpés. '
                    'Un PDF scanné (image) ne contient aucun texte extractible et '
                    'ne donnera rien. Les couleurs, formules et images ne sont '
                    'jamais reprises : seules les valeurs texte le sont.',
                  ),
                  if (_result != null) ...[
                    const SizedBox(height: 16),
                    ResultCard(
                      title: 'Classeur prêt',
                      detail:
                          '$_resultName — '
                          '${(_result!.lengthInBytes / 1024).toStringAsFixed(0)} Ko',
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
                  label: const Text('Convertir en Excel', maxLines: 1),
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
                    '${analysis.tableCount} '
                    '${analysis.tableCount > 1 ? 'tableaux détectés' : 'tableau détecté'}'
                    ' sur ${analysis.pageCount} '
                    '${analysis.pageCount > 1 ? 'pages' : 'page'}',
                    style: theme.textTheme.titleMedium,
                  ),
                ),
              ],
            ),
            if (analysis.hasTables) ...[
              const SizedBox(height: 8),
              Text(
                'Pages concernées : $pagesLabel',
                style: theme.textTheme.bodySmall,
              ),
            ],
            const SizedBox(height: 4),
            Text(
              '${analysis.paragraphCount} paragraphes hors tableaux',
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
        ? 'Aucun texte n\'a pu être extrait de ce PDF : il s\'agit très '
              'probablement d\'un document scanné (des images de pages). Un '
              'tableur ne peut rien en tirer ; utilisez d\'abord l\'outil de '
              'reconnaissance de texte (OCR).'
        : 'Aucune structure de tableau n\'a été reconnue dans ce document. '
              'Le texte est bien là, mais il n\'est pas disposé en colonnes '
              'régulières. Plutôt que de produire un classeur illisible, '
              'activez « Inclure aussi le texte hors tableaux » ci-dessus, ou '
              'utilisez « PDF vers Word » qui conserve mieux les paragraphes.';
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
