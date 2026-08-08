import 'dart:typed_data';

import 'package:flutter/material.dart';

import '../core/ads/ad_service.dart';
import '../core/files/export_service.dart';
import '../core/office/pdf_to_word.dart';
import '../core/pdf/security_engine.dart';
import '../widgets/progress_dialog.dart';
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
      _snack('Impossible d\'ouvrir ce fichier : $e');
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
            title: 'Analyse du document…',
            task: (token, onProgress) => PdfToWord.analyze(
              picked.bytes,
              onProgress: onProgress,
              cancelToken: token,
            ),
          );
      if (analysis == null || !mounted) return;
      setState(() => _analysis = analysis);
    } on PdfLockedException {
      _snack(
        'Ce PDF est protégé par un mot de passe. Déverrouillez-le d\'abord.',
      );
      _reset();
    } catch (e) {
      _snack('Analyse impossible : $e');
      _reset();
    }
  }

  Future<void> _convert() async {
    final PdfToWordAnalysis? analysis = _analysis;
    if (analysis == null || !analysis.hasText) return;
    try {
      final Uint8List? bytes = await runWithProgressDialog<Uint8List>(
        context: context,
        title: 'Conversion en Word…',
        task: (token, onProgress) => PdfToWord.buildDocx(
          analysis,
          onProgress: onProgress,
          cancelToken: token,
        ),
      );
      if (bytes == null || !mounted) return;
      setState(() => _docxBytes = bytes);
    } catch (e) {
      _snack('Échec de la conversion : $e');
    }
  }

  Future<void> _save() async {
    final Uint8List? bytes = _docxBytes;
    if (bytes == null) return;
    setState(() => _busy = true);
    try {
      final bool ok = await ExportService.saveToDevice(bytes, _fileName);
      if (!mounted) return;
      if (ok) {
        await showExportSuccess(
          context,
          what: 'Document Word',
          onShare: _share,
        );
      }
    } catch (e) {
      _snack('Enregistrement impossible : $e');
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
      _snack('Partage impossible : $e');
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final PickedPdf? picked = _picked;
    final PdfToWordAnalysis? analysis = _analysis;
    final Uint8List? docx = _docxBytes;

    return Scaffold(
      appBar: AppBar(title: const Text('PDF vers Word')),
      body: picked == null
          ? EmptyState(
              icon: Icons.description_outlined,
              title: 'Un Word modifiable',
              body:
                  'Le texte et la structure du PDF sont transposés dans un document .docx que vous pourrez rouvrir et corriger.',
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
                      : '${analysis.pageCount} pages',
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
                      'La conversion reproduit le texte, la mise en forme et les '
                      'tableaux, mais pas la mise en page exacte : la position des '
                      'images et des colonnes n\'est pas conservée, et les images '
                      'ne sont pas reprises dans le document Word.',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: context.colors.inkMuted,
                      ),
                    ),
                  ],
                ],
                if (docx != null) ...[
                  const SizedBox(height: Space.lg),
                  ResultCard(
                    title: 'Document Word prêt',
                    detail: '$_fileName — ${_formatSize(docx.length)}',
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
                        label: const Text('Convertir en Word', maxLines: 1),
                      )
                    : OutlinedButton.icon(
                        onPressed: _busy ? null : _convert,
                        icon: const Icon(Icons.refresh),
                        label: const Text('Convertir à nouveau', maxLines: 1),
                      ),
              ),
            ),
    );
  }

  static String _formatSize(int bytes) {
    if (bytes < 1024) return '$bytes o';
    if (bytes < 1024 * 1024) return '${(bytes / 1024).toStringAsFixed(0)} Ko';
    return '${(bytes / (1024 * 1024)).toStringAsFixed(1)} Mo';
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
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Contenu détecté', style: theme.textTheme.titleMedium),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                _Chip(
                  icon: Icons.description_outlined,
                  label: _plural(analysis.pageCount, 'page', 'pages'),
                ),
                _Chip(
                  icon: Icons.notes_outlined,
                  label: _plural(
                    analysis.paragraphCount,
                    'paragraphe',
                    'paragraphes',
                  ),
                ),
                _Chip(
                  icon: Icons.title_outlined,
                  label: _plural(analysis.headingCount, 'titre', 'titres'),
                ),
                _Chip(
                  icon: Icons.table_chart_outlined,
                  label: _plural(analysis.tableCount, 'tableau', 'tableaux'),
                ),
              ],
            ),
            if (analysis.tableCount == 0) ...[
              const SizedBox(height: 12),
              Text(
                'Aucun tableau détecté : si votre PDF en contient, ses lignes '
                'seront converties en paragraphes.',
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

  static String _plural(int count, String one, String many) =>
      '$count ${count > 1 ? many : one}';
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
                'Ce PDF semble être un scan : aucun texte n\'a été trouvé. '
                'Utilisez d\'abord l\'outil Texte cherchable (OCR), puis '
                'revenez convertir le PDF obtenu.',
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
