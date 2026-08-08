import 'package:flutter/material.dart';

import '../../core/ads/ad_service.dart';
import '../../theme/theme.dart';

/// Confirmation d'export — et point de passage obligé de la publicité.
///
/// **Le défaut que ce composant corrige.** Chaque écran d'export appelait
/// `showAfterSuccessfulExport()` et affichait un `SnackBar` dans la foulée.
/// L'interstitiel plein écran se levait aussitôt : le bandeau naissait
/// derrière lui et expirait avant qu'on le revoie. Vérifié sur un S24 —
/// le fichier était bien écrit, et l'utilisateur n'en apprenait rien. Le
/// sommet du parcours ne rendait aucun compte.
///
/// **Pourquoi une fonction et pas un widget.** L'ordre est ici la correction :
/// on confirme, l'utilisateur acquitte, *ensuite* la publicité peut se lever.
/// En faisant de [showExportSuccess] le seul chemin qui appelle
/// [AdService.showAfterSuccessfulExport] *sur la branche « enregistrer »*,
/// l'ordre cesse d'être une convention que chaque écran doit se rappeler de
/// tenir — il devient structurel.
///
/// La branche « partager » garde son propre appel et n'ouvre pas cette feuille :
/// la fenêtre de partage du système est elle-même la confirmation, l'utilisateur
/// voit l'application destinataire recevoir le fichier. Rien n'y est détruit par
/// l'interstitiel, et une feuille « c'est enregistré » y mentirait.
///
/// La régie n'est pas retirée : c'est le modèle économique de l'application, et
/// une publicité après coup ne trahit aucune des promesses affichées à
/// l'accueil. Ce qui est retiré, c'est son droit de passer avant la réponse à
/// la seule question que l'utilisateur se pose à cet instant : est-ce que mon
/// fichier est enregistré ?
/// Renvoie `true` quand l'utilisateur a acquitté par « Terminé », `false`
/// s'il a refermé la feuille au doigt.
///
/// La distinction sert au parcours : « Terminé » veut dire *j'en ai fini avec
/// cet export*, et l'écran appelant doit alors sortir du flux. Refermer d'un
/// glissement veut dire *je reste ici*. Voir [PreviewScreen] pour le seul cas
/// où la nuance change quelque chose.
Future<bool> showExportSuccess(
  BuildContext context, {

  /// Ce qui vient d'être écrit, décrit — « PDF · 8 pages », « Classeur
  /// Excel », « 12 images ». **Pas un nom de fichier** : le nom final n'est
  /// pas récupérable depuis la boîte système (voir
  /// [ExportService.saveToDevice]), et afficher le nom suggéré contredirait ce
  /// que l'utilisateur vient de taper.
  required String what,

  /// Proposé en action secondaire quand l'écran sait partager le résultat.
  VoidCallback? onShare,
}) async {
  if (!context.mounted) return false;

  final bool? done = await showModalBottomSheet<bool>(
    context: context,
    isScrollControlled: true,
    builder: (sheetContext) =>
        _ExportSuccessSheet(what: what, onShare: onShare),
  );

  // Après l'acquittement, jamais avant.
  await AdService.instance.showAfterSuccessfulExport();
  return done ?? false;
}

class _ExportSuccessSheet extends StatefulWidget {
  const _ExportSuccessSheet({required this.what, required this.onShare});

  final String what;
  final VoidCallback? onShare;

  @override
  State<_ExportSuccessSheet> createState() => _ExportSuccessSheetState();
}

class _ExportSuccessSheetState extends State<_ExportSuccessSheet>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: Motion.slow,
  )..forward();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final bool reduced = Motion.reduced(context);

    // La coche est le seul moment célébré de l'application. Elle monte en
    // échelle sur la première moitié de la durée ; le texte suit. Sous
    // « réduire les animations », tout se réduit à un fondu — la célébration
    // ne vaut pas une nausée.
    final Animation<double> mark = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0, 0.55, curve: Curves.easeOutBack),
    );
    final Animation<double> rest = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.35, 1, curve: Motion.easeOut),
    );

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(
          Space.lg,
          Space.xl,
          Space.lg,
          Space.md,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: ScaleTransition(
                scale: reduced ? const AlwaysStoppedAnimation(1.0) : mark,
                child: FadeTransition(
                  opacity: _controller,
                  child: Container(
                    width: 64,
                    height: 64,
                    decoration: BoxDecoration(
                      color: colors.sageWash,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.check_rounded,
                      size: 34,
                      color: colors.sage,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: Space.md),
            FadeTransition(
              opacity: reduced ? const AlwaysStoppedAnimation(1.0) : rest,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'C’est enregistré.',
                    textAlign: TextAlign.center,
                    style: AppTypography.headline.copyWith(color: colors.ink),
                  ),
                  const SizedBox(height: Space.xs),
                  // Ce qui a été produit, décrit et non nommé — le nom final
                  // n'est pas récupérable, et un nom faux serait pire que pas
                  // de nom du tout.
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: Space.sm,
                      vertical: Space.xs,
                    ),
                    decoration: BoxDecoration(
                      color: colors.linen,
                      borderRadius: Radii.allSm,
                      border: Border.all(color: colors.rule, width: Rule.hair),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.description_outlined,
                          size: 16,
                          color: colors.inkMuted,
                        ),
                        const SizedBox(width: Space.xs),
                        Flexible(
                          child: Text(
                            widget.what,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: AppTypography.small.copyWith(
                              color: colors.ink,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: Space.sm),
                  Text(
                    'Sous le nom et dans le dossier que vous venez de choisir. '
                    'Sans filigrane, sans limite, rien à débloquer.',
                    textAlign: TextAlign.center,
                    style: AppTypography.small.copyWith(color: colors.inkMuted),
                  ),
                  const SizedBox(height: Space.xl),
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton(
                      onPressed: () => Navigator.of(context).pop(true),
                      child: const Text('Terminé', maxLines: 1),
                    ),
                  ),
                  if (widget.onShare != null) ...[
                    const SizedBox(height: Space.xs),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton.icon(
                        onPressed: () {
                          Navigator.of(context).pop(false);
                          widget.onShare!();
                        },
                        icon: const Icon(Icons.share_outlined),
                        label: const Text('Partager', maxLines: 1),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
