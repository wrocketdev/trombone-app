import 'dart:typed_data';

import 'package:flutter/material.dart';

import 'package:pdfx/pdfx.dart' as pdfx;
import 'package:syncfusion_flutter_pdf/pdf.dart' as sf;

import '../core/files/file_utils.dart';
import '../core/pdf/pdf_engine.dart';
import '../core/pdf/security_engine.dart';
import '../l10n/l10n.dart';
import '../widgets/progress_dialog.dart';
import '../widgets/ui/empty_state.dart';
import '../widgets/ui/picked_file_card.dart';
import 'preview_screen.dart';

/// Résolution de rastérisation. 200 dpi est le compromis habituel pour de
/// l'archivage : nettement au-dessus des 150 dpi d'un scan courant, sans
/// exploser la taille du fichier comme le ferait du 300 dpi.
const int _kArchiveDpi = 200;

/// Une variante de la norme. Le libellé (« PDF/A-1b ») est un nom de norme
/// ISO et ne se traduit pas ; l'explication, si.
class _ConformanceOption {
  const _ConformanceOption(this.label, this.level, this.detail);
  final String label;
  final sf.PdfConformanceLevel level;
  final String Function(L) detail;
}

const List<_ConformanceOption> _kOptions = <_ConformanceOption>[
  _ConformanceOption('PDF/A-1b', sf.PdfConformanceLevel.a1b, _a1bDetail),
  _ConformanceOption('PDF/A-2b', sf.PdfConformanceLevel.a2b, _a2bDetail),
  _ConformanceOption('PDF/A-3b', sf.PdfConformanceLevel.a3b, _a3bDetail),
];

String _a1bDetail(L l10n) => l10n.pdfaA1bDetail;
String _a2bDetail(L l10n) => l10n.pdfaA2bDetail;
String _a3bDetail(L l10n) => l10n.pdfaA3bDetail;

class PdfAScreen extends StatefulWidget {
  const PdfAScreen({super.key});

  @override
  State<PdfAScreen> createState() => _PdfAScreenState();
}

class _PdfAScreenState extends State<PdfAScreen> {
  PickedPdf? _picked;
  int _pageCount = 0;
  int _optionIndex = 0;
  bool _busy = false;

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
      final pdfx.PdfDocument doc = await pdfx.PdfDocument.openData(
        picked.bytes,
      );
      final int count = doc.pagesCount;
      await doc.close();
      if (!mounted) return;
      setState(() {
        _picked = picked;
        _pageCount = count;
      });
    } catch (e) {
      _showError(l10n.pdfaOpenFailed('$e'));
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  Future<void> _convert() async {
    final PickedPdf? picked = _picked;
    if (picked == null) return;
    final sf.PdfConformanceLevel level = _kOptions[_optionIndex].level;
    final L l10n = context.l10n;
    try {
      final Uint8List? bytes = await runWithProgressDialog<Uint8List>(
        context: context,
        title: l10n.pdfaConvertingTo(_kOptions[_optionIndex].label),
        task: (token, onProgress) => _convertToPdfA(
          picked.bytes,
          level: level,
          onProgress: onProgress,
          cancelToken: token,
        ),
      );
      if (bytes == null || !mounted) return;
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => PreviewScreen(
            pdfBytes: bytes,
            suggestedName: FileUtils.derivedName(_picked?.name, 'pdfa'),
          ),
        ),
      );
    } catch (e) {
      _showError(l10n.errorConversionFailed('$e'));
    }
  }

  @override
  Widget build(BuildContext context) {
    final PickedPdf? picked = _picked;
    final L l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.toolPdfA)),
      body: picked == null
          ? EmptyState(
              icon: Icons.inventory_2_outlined,
              title: l10n.pdfaEmptyTitle,
              body: l10n.pdfaEmptyBody,
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
                  subtitle: l10n.pageCount(_pageCount),
                  busy: _busy,
                  onChange: _pick,
                ),
                const SizedBox(height: 24),
                Text(
                  l10n.pdfaConformanceLevel,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    for (var i = 0; i < _kOptions.length; i++)
                      ChoiceChip(
                        label: Text(_kOptions[i].label),
                        selected: _optionIndex == i,
                        onSelected: (_) => setState(() => _optionIndex = i),
                      ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  _kOptions[_optionIndex].detail(l10n),
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(height: 20),
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
                            Text(l10n.pdfaCaveatTitle),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          l10n.pdfaCaveat(_kArchiveDpi),
                          style: const TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
      bottomNavigationBar: picked == null
          ? null
          : SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: FilledButton.icon(
                  onPressed: _busy ? null : _convert,
                  icon: const Icon(Icons.inventory_2_outlined),
                  label: Text(l10n.actionConvert, maxLines: 1),
                ),
              ),
            ),
    );
  }
}

/// Reconstruit le document en PDF/A : chaque page source est rastérisée puis
/// redessinée pleine page dans un document neuf créé avec le niveau de
/// conformité demandé.
///
/// Passer par une image évite l'exception « All the fonts must be embedded »
/// que Syncfusion lève dès qu'un document PDF/A contient du texte dessiné
/// avec une police non embarquée — on ne maîtrise pas les polices des PDF
/// que l'utilisateur ouvre.
Future<Uint8List> _convertToPdfA(
  Uint8List sourceBytes, {
  required sf.PdfConformanceLevel level,
  void Function(int done, int total)? onProgress,
  CancelToken? cancelToken,
}) async {
  final pdfx.PdfDocument src = await pdfx.PdfDocument.openData(sourceBytes);
  final sf.PdfDocument dest = sf.PdfDocument(conformanceLevel: level);
  try {
    final int total = src.pagesCount;
    if (total == 0) {
      throw StateError('Ce document ne contient aucune page.');
    }
    final double scale = _kArchiveDpi / 72.0;
    for (var i = 1; i <= total; i++) {
      if (cancelToken?.isCancelled ?? false) {
        throw CancelledException();
      }
      final pdfx.PdfPage page = await src.getPage(i);
      final double widthPt = page.width;
      final double heightPt = page.height;
      final Uint8List pngBytes;
      try {
        // backgroundColor obligatoire : pdfx rend sur fond transparent par
        // défaut, ce qui donnerait des pages « vides » une fois archivées.
        final pdfx.PdfPageImage? image = await page.render(
          width: widthPt * scale,
          height: heightPt * scale,
          format: pdfx.PdfPageImageFormat.png,
          backgroundColor: '#FFFFFF',
        );
        if (image == null) {
          throw StateError('Rendu de la page $i impossible');
        }
        pngBytes = image.bytes;
      } finally {
        await page.close();
      }

      // Une section par page : la taille en points de la page source est
      // conservée, et dest.pages.insert() ne fonctionne pas sur un document
      // neuf.
      final sf.PdfSection section = dest.sections!.add();
      section.pageSettings.margins.all = 0;
      section.pageSettings.size = Size(widthPt, heightPt);
      final sf.PdfPage newPage = section.pages.add();
      newPage.graphics.drawImage(
        sf.PdfBitmap(pngBytes),
        Rect.fromLTWH(0, 0, widthPt, heightPt),
      );

      onProgress?.call(i, total);
      // Rendre la main : une page à 200 dpi est lourde, sans ce yield la
      // barre de progression et le bouton Annuler seraient gelés.
      await Future<void>.delayed(Duration.zero);
    }
    final List<int> bytes = await dest.save();
    return Uint8List.fromList(bytes);
  } finally {
    dest.dispose();
    await src.close();
  }
}
