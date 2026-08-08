import 'dart:typed_data';

import 'package:flutter/material.dart';

import '../core/files/file_utils.dart';
import '../core/pdf/pdf_engine.dart';
import '../models/page_selection.dart';
import '../models/source_doc.dart';
import '../theme/theme.dart';
import '../widgets/progress_dialog.dart';
import '../widgets/ui/add_source_card.dart';
import '../widgets/ui/empty_state.dart';
import '../widgets/ui/page_tile.dart';
import 'preview_screen.dart';

class MergeScreen extends StatefulWidget {
  const MergeScreen({super.key});

  @override
  State<MergeScreen> createState() => _MergeScreenState();
}

class _MergeScreenState extends State<MergeScreen> {
  final List<SourceDoc> _docs = [];
  String? _expandedDocId;
  bool _busy = false;

  /// Documents retirés dont on n'a pas encore libéré les ressources, parce que
  /// leur bandeau « Annuler » est encore à l'écran. Voir [_removeDoc].
  final List<SourceDoc> _pendingDisposal = [];

  @override
  void dispose() {
    for (final d in _docs) {
      d.dispose();
    }
    for (final d in _pendingDisposal) {
      d.dispose();
    }
    super.dispose();
  }

  Future<void> _addFiles() async {
    setState(() => _busy = true);
    try {
      final files = await FileUtils.pickFiles();
      for (final f in files) {
        try {
          final doc = await FileUtils.buildSourceDoc(f);
          if (!mounted) return;
          setState(() => _docs.add(doc));
        } catch (e) {
          if (!mounted) return;
          _showError('${f.name} : ${_friendlyError(e)}');
        }
      }
    } finally {
      if (mounted) setState(() => _busy = false);
    }
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

  /// Retire un document — **de façon réversible**.
  ///
  /// La version précédente appelait `doc.dispose()` et `forgetCache()` dans la
  /// foulée du `remove`, sans bandeau ni confirmation. Le fichier disparaissait
  /// pour de bon, et la corbeille était voisine immédiate de la poignée de
  /// glissement dans la rangée : les deux gestes qu'on confond le plus, dont
  /// l'un était irréversible.
  ///
  /// Le document est maintenant mis de côté et libéré seulement quand le
  /// bandeau se ferme sans annulation. Rien n'est reconstruit à l'annulation :
  /// c'est le même objet qui revient, à sa place, avec ses pages écartées et
  /// ses rotations.
  void _removeDoc(SourceDoc doc) {
    final int index = _docs.indexOf(doc);
    if (index == -1) return;

    setState(() {
      _docs.removeAt(index);
      if (_expandedDocId == doc.id) _expandedDocId = null;
      _pendingDisposal.add(doc);
    });

    final messenger = ScaffoldMessenger.of(context);
    messenger.hideCurrentSnackBar();
    messenger
        .showSnackBar(
          SnackBar(
            content: Text(
              '${doc.name} retiré.',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            duration: const Duration(seconds: 6),
            action: SnackBarAction(
              label: 'Annuler',
              onPressed: () {
                if (!mounted) return;
                setState(() {
                  _pendingDisposal.remove(doc);
                  _docs.insert(index.clamp(0, _docs.length), doc);
                });
              },
            ),
          ),
        )
        .closed
        .then((_) {
          if (!_pendingDisposal.remove(doc)) return;
          doc.dispose();
          FileUtils.forgetCache(doc.id);
        });
  }

  List<PageSelection> _buildSelections() {
    final List<PageSelection> sel = [];
    for (final doc in _docs) {
      for (var i = 0; i < doc.pageCount; i++) {
        if (doc.included[i]) sel.add(PageSelection(source: doc, pageIndex: i));
      }
    }
    return sel;
  }

  Future<void> _preview() async {
    final selections = _buildSelections();
    if (selections.isEmpty) {
      _showError('Ajoutez au moins un fichier avec une page à inclure.');
      return;
    }
    try {
      final bytes = await runWithProgressDialog<Uint8List>(
        context: context,
        title: 'Fusion en cours…',
        task: (token, onProgress) => PdfEngine.buildPdf(
          selections,
          onProgress: onProgress,
          cancelToken: token,
        ),
      );
      if (bytes == null || !mounted) return;
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => PreviewScreen(
            pdfBytes: bytes,
            suggestedName: FileUtils.derivedName(
              _docs.isEmpty ? null : _docs.first.name,
              'fusion',
            ),
          ),
        ),
      );
    } catch (e) {
      if (mounted) _showError('Échec de la fusion : ${_friendlyError(e)}');
    }
  }

  IconData _iconFor(SourceKind kind) {
    switch (kind) {
      case SourceKind.pdf:
        return Icons.picture_as_pdf_outlined;
      case SourceKind.image:
        return Icons.image_outlined;
      case SourceKind.text:
        return Icons.article_outlined;
      case SourceKind.docx:
        return Icons.description_outlined;
    }
  }

  @override
  Widget build(BuildContext context) {
    final int totalIncluded = _docs.fold(
      0,
      (sum, d) => sum + d.includedPageCount,
    );
    return Scaffold(
      appBar: AppBar(title: const Text('Fusionner')),
      body: _docs.isEmpty
          ? _EmptyState(busy: _busy, onAdd: _addFiles)
          // La carte « ajouter » vit **dans** la liste, en dernière position,
          // et non plus dans un bouton flottant. Trois raisons : elle ne fait
          // plus concurrence en couleur au bouton d'export — deux surfaces
          // pleines à l'accent se disputaient le coin bas de l'écran —, elle
          // occupe le vide qu'une liste de deux fichiers laissait sur les deux
          // tiers de la hauteur, et elle se lit comme la suite naturelle de la
          // liste plutôt que comme un satellite.
          : ReorderableListView.builder(
              padding: const EdgeInsets.fromLTRB(
                Space.sm,
                Space.sm,
                Space.sm,
                96,
              ),
              itemCount: _docs.length,
              footer: Padding(
                padding: const EdgeInsets.only(top: Space.xxs),
                child: AddSourceCard(
                  label: 'Ajouter un fichier',
                  hint: 'PDF, Word, images ou texte',
                  busy: _busy,
                  onTap: _busy ? null : _addFiles,
                ),
              ),
              onReorder: (oldIndex, newIndex) {
                setState(() {
                  if (newIndex > oldIndex) newIndex--;
                  final d = _docs.removeAt(oldIndex);
                  _docs.insert(newIndex, d);
                });
              },
              itemBuilder: (context, index) =>
                  _buildDocCard(context, _docs[index], index),
            ),
      bottomNavigationBar: _docs.isEmpty
          ? null
          : SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(Space.sm),
                child: FilledButton.icon(
                  onPressed: totalIncluded == 0 ? null : _preview,
                  icon: const Icon(Icons.remove_red_eye_outlined),
                  label: Text(
                    'Aperçu et export ($totalIncluded page${totalIncluded > 1 ? 's' : ''})',
                  ),
                ),
              ),
            ),
    );
  }

  Widget _buildDocCard(BuildContext context, SourceDoc doc, int index) {
    final bool expanded = _expandedDocId == doc.id;
    return Card(
      key: ValueKey(doc.id),
      margin: const EdgeInsets.symmetric(vertical: Space.xxs),
      child: Column(
        children: [
          ListTile(
            leading: SizedBox(
              width: 40,
              height: 52,
              child: doc.thumbnail != null && doc.thumbnail!.isNotEmpty
                  ? ClipRRect(
                      borderRadius: Radii.allXs,
                      child: Image.memory(doc.thumbnail!, fit: BoxFit.cover),
                    )
                  : Icon(_iconFor(doc.kind)),
            ),
            // Quatre boutons se partageaient la fin de la rangée : pivoter,
            // retirer, déplier, glisser. À 384 dp ils mangeaient 224 dp des
            // 296 disponibles, et le nom du fichier — la seule chose qui
            // permet de distinguer deux documents dans une liste de fusion —
            // était réduit à onze caractères : « zztest-alp… ». Une liste où
            // l'on ne peut pas lire ce qu'on ordonne ne sert à rien.
            //
            // Ne restent visibles que les deux gestes propres à la rangée :
            // retirer, et glisser pour réordonner. Déplier passe sur la rangée
            // elle-même, et pivoter descend dans le panneau des pages, là où
            // l'on voit ce que l'on fait tourner.
            onTap: () =>
                setState(() => _expandedDocId = expanded ? null : doc.id),
            title: Text(doc.name, maxLines: 1, overflow: TextOverflow.ellipsis),
            subtitle: Text(
              _pagesLabel(doc),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Indicateur, pas bouton : la rangée entière est la cible.
                AnimatedRotation(
                  turns: expanded ? 0.5 : 0,
                  duration: Motion.quick,
                  child: Icon(
                    Icons.expand_more,
                    size: 20,
                    color: context.colors.inkFaint,
                  ),
                ),
                IconButton(
                  tooltip: 'Retirer ${doc.name}',
                  icon: const Icon(Icons.delete_outline),
                  onPressed: () => _removeDoc(doc),
                ),
                ReorderableDragStartListener(
                  index: index,
                  child: Semantics(
                    label: 'Déplacer ${doc.name}',
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: Space.xxs),
                      child: Icon(Icons.drag_handle),
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (expanded) _buildPageGrid(doc),
        ],
      ),
    );
  }

  /// « 3 pages » quand tout est retenu, « 2 pages sur 3 » quand on en a écarté.
  ///
  /// L'ancienne forme, « 2/3 pages », demandait de deviner ce que la barre
  /// oblique sépare, et affichait « 3/3 » — une fraction qui n'apprend rien —
  /// dans le cas de loin le plus fréquent, celui où l'on n'a rien écarté.
  String _pagesLabel(SourceDoc doc) {
    final int kept = doc.includedPageCount;
    final int total = doc.pageCount;
    final String plural = total > 1 ? 's' : '';
    if (kept == total) return '$total page$plural';
    return '$kept page${kept > 1 ? 's' : ''} sur $total';
  }

  Widget _buildPageGrid(SourceDoc doc) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(Space.sm, 0, Space.sm, Space.sm),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // « Pivoter tout » vit ici plutôt que dans la rangée repliée : c'est
          // le seul endroit où l'on voit les pages sur lesquelles l'action
          // porte. Un bouton libellé, non plus une icône nue à deviner.
          Align(
            alignment: Alignment.centerLeft,
            child: TextButton.icon(
              onPressed: () => setState(() => doc.rotateAll(90)),
              icon: const Icon(Icons.rotate_right, size: 18),
              label: const Text('Pivoter toutes les pages', maxLines: 1),
            ),
          ),
          const SizedBox(height: Space.xs),
          Wrap(
            spacing: Space.xs,
            runSpacing: Space.xs,
            children: List.generate(doc.pageCount, (i) {
              return PageTile(
                number: i + 1,
                included: doc.included[i],
                rotationDegrees: doc.rotations[i],
                bytesFuture: FileUtils.cachedPdfBytes(doc).then(
                  (b) => FileUtils.renderPdfPageThumbnail(
                    b,
                    pageNumber: i + 1,
                    targetWidth: 200,
                  ),
                ),
                onToggle: () =>
                    setState(() => doc.included[i] = !doc.included[i]),
                onRotate: () => setState(() => doc.rotatePage(i, 90)),
              );
            }),
          ),
        ],
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
    return EmptyState(
      icon: Icons.merge_type,
      title: 'Un seul document',
      body:
          'Ajoutez des PDF, des fichiers Word, des images ou du texte. '
          'Vous pourrez les réordonner et écarter des pages avant l’export.',
      accepts: const ['PDF', 'Word', 'Images', 'Texte'],
      actionLabel: 'Choisir des fichiers',
      onAction: onAdd,
      busy: busy,
    );
  }
}
