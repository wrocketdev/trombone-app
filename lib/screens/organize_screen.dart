import 'dart:typed_data';

import 'package:flutter/material.dart';

import '../core/ads/ad_service.dart';
import '../core/files/export_service.dart';
import '../core/files/file_utils.dart';
import '../core/pdf/pdf_engine.dart';
import '../models/page_selection.dart';
import '../models/source_doc.dart';
import '../theme/theme.dart';
import '../widgets/page_thumb.dart';
import '../widgets/progress_dialog.dart';
import 'preview_screen.dart';
import '../widgets/ui/empty_state.dart';
import '../widgets/ui/export_outcome.dart';
import '../widgets/ui/picked_file_card.dart';

class OrganizeScreen extends StatefulWidget {
  const OrganizeScreen({super.key});

  @override
  State<OrganizeScreen> createState() => _OrganizeScreenState();
}

class _OrganizeScreenState extends State<OrganizeScreen> {
  SourceDoc? _doc;
  List<int> _order = [];
  bool _busy = false;

  @override
  void dispose() {
    _doc?.dispose();
    super.dispose();
  }

  Future<void> _pick() async {
    setState(() => _busy = true);
    try {
      final files = await FileUtils.pickFiles(allowMultiple: false);
      if (files.isEmpty) return;
      final doc = await FileUtils.buildSourceDoc(files.first);
      setState(() {
        _doc?.dispose();
        _doc = doc;
        _order = List.generate(doc.pageCount, (i) => i);
      });
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Impossible d\'ouvrir : $e')));
      }
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  List<PageSelection> _selectionsFor(Iterable<int> originalIndices) {
    final doc = _doc!;
    return [
      for (final i in originalIndices)
        if (doc.included[i]) PageSelection(source: doc, pageIndex: i),
    ];
  }

  Future<void> _exportAndPush(
    List<PageSelection> selections,
    String name,
  ) async {
    if (selections.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Aucune page à exporter.')));
      return;
    }
    try {
      final bytes = await runWithProgressDialog<Uint8List>(
        context: context,
        title: 'Préparation…',
        task: (token, onProgress) => PdfEngine.buildPdf(
          selections,
          onProgress: onProgress,
          cancelToken: token,
        ),
      );
      if (bytes == null || !mounted) return;
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => PreviewScreen(pdfBytes: bytes, suggestedName: name),
        ),
      );
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Échec : $e')));
      }
    }
  }

  Future<void> _extractRange() async {
    final range = await showDialog<RangeValues>(
      context: context,
      builder: (context) => _RangeDialog(maxPage: _order.length),
    );
    if (range == null) return;
    final start = range.start.round() - 1;
    final end = range.end.round() - 1;
    final selected = _order.sublist(start, end + 1);
    await _exportAndPush(
      _selectionsFor(selected),
      // Le nom porte la plage extraite : « Contrat-p3-7.pdf » se retrouve
      // dans un gestionnaire de fichiers, « extrait.pdf » non.
      FileUtils.derivedName(_doc?.name, 'p${start + 1}-${end + 1}'),
    );
  }

  Future<void> _splitIntoParts() async {
    final parts = await showDialog<int>(
      context: context,
      builder: (context) => _SplitDialog(maxParts: _order.length),
    );
    if (parts == null || parts < 2) return;
    final int total = _order.length;
    final int base = total ~/ parts;
    final int extra = total % parts;
    final List<List<int>> groups = [];
    int cursor = 0;
    for (var p = 0; p < parts; p++) {
      final int size = base + (p < extra ? 1 : 0);
      if (size == 0) continue;
      groups.add(_order.sublist(cursor, cursor + size));
      cursor += size;
    }
    if (!mounted) return;
    final List<Uint8List> results = [];
    try {
      for (final g in groups) {
        final bytes = await PdfEngine.buildPdf(_selectionsFor(g));
        results.add(bytes);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Échec de la division : $e')));
      }
      return;
    }
    if (!mounted) return;
    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (context) =>
          _SplitResultsSheet(parts: results, sourceName: _doc?.name),
    );
  }

  /// « 8 pages », ou « 6 pages sur 8 » quand on en a écarté.
  String _sourceSummary(SourceDoc doc) {
    final int kept = doc.included.where((i) => i).length;
    final int total = doc.pageCount;
    final String plural = total > 1 ? 's' : '';
    if (kept == total) return '$total page$plural';
    return '$kept page${kept > 1 ? 's' : ''} sur $total retenue'
        '${kept > 1 ? 's' : ''}';
  }

  Widget? _pageNote({
    required bool moved,
    required int from,
    required bool included,
  }) {
    final List<String> parts = [
      if (!included) 'Écartée',
      if (moved) 'Déplacée depuis la position $from',
    ];
    if (parts.isEmpty) return null;
    return Text(
      parts.join(' · '),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: AppTypography.small.copyWith(
        color: included ? context.colors.inkMuted : context.colors.inkFaint,
      ),
    );
  }

  void _reorder(int oldIndex, int newIndex) {
    setState(() {
      if (newIndex > oldIndex) newIndex--;
      final v = _order.removeAt(oldIndex);
      _order.insert(newIndex, v);
    });
  }

  @override
  Widget build(BuildContext context) {
    final doc = _doc;
    return Scaffold(
      appBar: AppBar(title: const Text('Organiser un PDF')),
      body: doc == null
          ? EmptyState(
              icon: Icons.dashboard_customize_outlined,
              title: 'Reprendre un PDF en main',
              body:
                  'Ouvrez un document pour le diviser, en extraire des '
                  'pages ou en changer l’ordre.',
              accepts: const ['PDF', 'Word', 'Images', 'Texte'],
              actionLabel: 'Ouvrir un fichier',
              onAction: _pick,
              busy: _busy,
            )
          : Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(
                    Space.md,
                    Space.sm,
                    Space.md,
                    Space.xxs,
                  ),
                  // Le fichier en cours était rendu ici par une rangée nue —
                  // un titre et un lien « Changer » — alors que huit autres
                  // écrans utilisaient déjà [PickedFileCard]. Même objet, deux
                  // dessins : c'est ce qui empêchait l'application de se lire
                  // comme un tout.
                  child: PickedFileCard(
                    name: doc.name,
                    subtitle: _sourceSummary(doc),
                    onChange: _busy ? null : _pick,
                    busy: _busy,
                  ),
                ),
                Expanded(
                  child: ReorderableListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: Space.sm),
                    itemCount: _order.length,
                    onReorder: _reorder,
                    itemBuilder: (context, listIndex) {
                      final originalIndex = _order[listIndex];
                      final bool included = doc.included[originalIndex];
                      final bool moved = originalIndex != listIndex;
                      return Card(
                        key: ValueKey('page_$originalIndex'),
                        child: ListTile(
                          leading: SizedBox(
                            width: 44,
                            height: 60,
                            child: PageThumb(
                              bytesFuture: FileUtils.cachedPdfBytes(doc).then(
                                (b) => FileUtils.renderPdfPageThumbnail(
                                  b,
                                  pageNumber: originalIndex + 1,
                                  targetWidth: 120,
                                ),
                              ),
                              rotationDegrees: doc.rotations[originalIndex],
                              included: included,
                            ),
                          ),
                          title: Text('Page ${listIndex + 1}'),
                          // « Position d'origine : 3 » s'affichait sur chaque
                          // rangée, y compris quand rien n'avait bougé — donc
                          // le plus souvent en répétant le titre. La ligne ne
                          // paraît plus que lorsqu'elle apprend quelque chose :
                          // la page a été déplacée, ou elle est écartée.
                          subtitle: _pageNote(
                            moved: moved,
                            from: originalIndex + 1,
                            included: included,
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                tooltip: 'Pivoter la page ${listIndex + 1}',
                                icon: const Icon(Icons.rotate_right),
                                onPressed: () => setState(
                                  () => doc.rotatePage(originalIndex, 90),
                                ),
                              ),
                              IconButton(
                                tooltip: included
                                    ? 'Écarter la page ${listIndex + 1}'
                                    : 'Inclure la page ${listIndex + 1}',
                                icon: Icon(
                                  included
                                      ? Icons.check_circle
                                      : Icons.remove_circle_outline,
                                  color: included
                                      ? context.colors.accent
                                      : context.colors.inkFaint,
                                ),
                                onPressed: () => setState(
                                  () => doc.included[originalIndex] = !included,
                                ),
                              ),
                              // Quatre boutons d'icône n'avaient aucun libellé
                              // d'accessibilité : TalkBack annonçait
                              // « bouton », quatre fois, sans dire lequel.
                              ReorderableDragStartListener(
                                index: listIndex,
                                child: Semantics(
                                  label: 'Déplacer la page ${listIndex + 1}',
                                  child: const Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: Space.xxs,
                                    ),
                                    child: Icon(Icons.drag_handle),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
      bottomNavigationBar: doc == null
          ? null
          : SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: _extractRange,
                        icon: const Icon(Icons.content_cut),
                        label: const Text('Extraire', maxLines: 1),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: _splitIntoParts,
                        icon: const Icon(Icons.call_split),
                        label: const Text('Diviser', maxLines: 1),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: FilledButton.icon(
                        onPressed: () => _exportAndPush(
                          _selectionsFor(_order),
                          FileUtils.derivedName(_doc?.name, 'reorganise'),
                        ),
                        icon: const Icon(Icons.remove_red_eye_outlined),
                        // « Exporter » sous une icône d'œil promettait un
                        // export et menait à l'aperçu. Le libellé dit
                        // maintenant ce que le bouton fait, et rejoint celui
                        // de l'écran Fusionner, qui mène au même endroit.
                        label: const Text('Aperçu', maxLines: 1),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}

class _RangeDialog extends StatefulWidget {
  const _RangeDialog({required this.maxPage});
  final int maxPage;

  @override
  State<_RangeDialog> createState() => _RangeDialogState();
}

class _RangeDialogState extends State<_RangeDialog> {
  late RangeValues _values = RangeValues(
    1,
    widget.maxPage.toDouble().clamp(1, double.infinity),
  );

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Extraire une plage de pages'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Pages ${_values.start.round()} à ${_values.end.round()}'),
          RangeSlider(
            min: 1,
            max: widget.maxPage.toDouble(),
            divisions: widget.maxPage > 1 ? widget.maxPage - 1 : 1,
            values: _values,
            onChanged: (v) => setState(() => _values = v),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Annuler'),
        ),
        FilledButton(
          onPressed: () => Navigator.of(context).pop(_values),
          child: const Text('Extraire'),
        ),
      ],
    );
  }
}

class _SplitDialog extends StatefulWidget {
  const _SplitDialog({required this.maxParts});
  final int maxParts;

  @override
  State<_SplitDialog> createState() => _SplitDialogState();
}

class _SplitDialogState extends State<_SplitDialog> {
  double _parts = 2;

  @override
  Widget build(BuildContext context) {
    final maxParts = widget.maxParts.clamp(2, 20);
    return AlertDialog(
      title: const Text('Diviser en plusieurs fichiers'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('${_parts.round()} fichiers'),
          Slider(
            min: 2,
            max: maxParts.toDouble(),
            divisions: maxParts - 2 > 0 ? maxParts - 2 : 1,
            value: _parts.clamp(2, maxParts.toDouble()),
            onChanged: (v) => setState(() => _parts = v),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Annuler'),
        ),
        FilledButton(
          onPressed: () => Navigator.of(context).pop(_parts.round()),
          child: const Text('Diviser'),
        ),
      ],
    );
  }
}

class _SplitResultsSheet extends StatelessWidget {
  const _SplitResultsSheet({required this.parts, this.sourceName});
  final List<Uint8List> parts;

  /// Nom du document divisé, pour que les parties le portent en tête.
  final String? sourceName;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${parts.length} fichiers créés',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 12),
            for (var i = 0; i < parts.length; i++)
              ListTile(
                leading: const Icon(Icons.picture_as_pdf_outlined),
                title: Text('Partie ${i + 1}'),
                subtitle: Text(
                  '${(parts[i].length / 1024).toStringAsFixed(0)} Ko',
                ),
                trailing: Wrap(
                  spacing: 4,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.share_outlined),
                      onPressed: () async {
                        await ExportService.share(
                          parts[i],
                          sourceName == null
                              ? 'partie-${i + 1}.pdf'
                              : FileUtils.derivedName(
                                  sourceName,
                                  'partie-${i + 1}',
                                ),
                        );
                        AdService.instance.showAfterSuccessfulExport();
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.save_alt),
                      onPressed: () async {
                        final bool ok = await ExportService.saveToDevice(
                          parts[i],
                          sourceName == null
                              ? 'partie-${i + 1}.pdf'
                              : FileUtils.derivedName(
                                  sourceName,
                                  'partie-${i + 1}',
                                ),
                        );
                        if (ok && context.mounted) {
                          await showExportSuccess(
                            context,
                            what: 'Partie ${i + 1}',
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
