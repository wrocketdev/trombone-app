import 'package:flutter/material.dart';

import '../../theme/theme.dart';

/// État vide d'un écran outil.
///
/// C'est le premier contact avec chaque outil, et la version précédente en
/// faisait un temps mort : une icône grise de 72 px et une phrase plate.
/// Trois choses le rendent utile ici — une consigne qui dit quoi faire, une
/// action évidente, et une note de réassurance qui répète la promesse du
/// produit à l'endroit exact où l'utilisateur s'apprête à confier un fichier.
///
/// **Deux corrections faites après un passage sur appareil.**
///
/// La première est le vide. Le bloc était centré verticalement par un
/// [Center] ; sur un S24 Ultra, cela laissait 37 % de l'écran vide au-dessus
/// du porte-icône avant que l'œil ne rencontre quoi que ce soit. Le bloc
/// s'ancre maintenant dans le tiers supérieur — assez bas pour ne pas coller à
/// la barre de titre, assez haut pour que le regard tombe tout de suite sur la
/// consigne.
///
/// La seconde est le contenu. Un état vide n'a rien à dire tant qu'il ne
/// répond pas à la question que l'utilisateur se pose vraiment devant un outil
/// qu'il ouvre pour la première fois : « est-ce que ça accepte mon fichier ? »
/// Les puces de format y répondent, et ce faisant occupent l'espace avec de
/// l'information plutôt qu'avec du remplissage.
class EmptyState extends StatelessWidget {
  const EmptyState({
    super.key,
    required this.icon,
    required this.title,
    required this.body,
    this.actionLabel,
    this.onAction,
    this.busy = false,
    this.note,
    this.accepts = const [],
  });

  final IconData icon;
  final String title;
  final String body;

  /// Certains outils déclenchent leur action depuis la barre du bas plutôt que
  /// depuis l'état vide ; le bouton est alors omis.
  final String? actionLabel;
  final VoidCallback? onAction;
  final bool busy;

  /// Note de réassurance. Par défaut, la promesse qui compte pour ce marché :
  /// pas de mur au moment d'enregistrer.
  final String? note;

  /// Formats que l'outil sait ouvrir — « PDF », « Word », « Images »…
  ///
  /// Rendu en puces sous la consigne. Vide, la rangée disparaît : mieux vaut
  /// rien qu'une liste devinée, un format annoncé et refusé étant pire qu'un
  /// format tu.
  final List<String> accepts;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final ink = ToolFamily.of(context);

    return LayoutBuilder(
      builder: (context, constraints) {
        // Le bloc s'ancre dans le tiers supérieur, mais seulement quand il y a
        // de la place. Sur un écran court — police à 200 %, petit téléphone —
        // le décalage s'annule et le contenu défile normalement.
        final double lead = (constraints.maxHeight * 0.14).clamp(
          Space.md,
          Space.xxxl,
        );
        return SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(Space.xl, lead, Space.xl, Space.xl),
          child: Align(
            alignment: Alignment.topCenter,
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 420),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      width: 52,
                      height: 52,
                      decoration: BoxDecoration(
                        // Le porte-icône porte l'encre de la famille : c'est
                        // le fil visible entre la tuile qu'on vient de toucher
                        // et l'écran qui s'ouvre.
                        color: ink.wash,
                        borderRadius: Radii.allMd,
                        border: Border.all(
                          color: ink.stroke.withValues(alpha: 0.22),
                          width: Rule.hair,
                        ),
                      ),
                      child: Icon(icon, size: 24, color: ink.stroke),
                    ),
                  ),
                  const SizedBox(height: Space.lg),
                  Text(
                    title,
                    style: AppTypography.headline.copyWith(color: colors.ink),
                  ),
                  const SizedBox(height: Space.xs),
                  Text(
                    body,
                    style: AppTypography.body.copyWith(color: colors.inkMuted),
                  ),
                  if (accepts.isNotEmpty) ...[
                    const SizedBox(height: Space.md),
                    _AcceptedFormats(formats: accepts),
                  ],
                  if (onAction != null) ...[
                    const SizedBox(height: Space.xl),
                    FilledButton.icon(
                      onPressed: busy ? null : onAction,
                      icon: busy
                          ? SizedBox(
                              width: 16,
                              height: 16,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: colors.inkFaint,
                              ),
                            )
                          : const Icon(Icons.add),
                      label: Text(
                        busy ? 'Ouverture…' : actionLabel ?? 'Continuer',
                      ),
                    ),
                  ],
                  const SizedBox(height: Space.md),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.check_circle_outline,
                        size: 13,
                        color: colors.sage,
                      ),
                      const SizedBox(width: Space.xxs),
                      Flexible(
                        child: Text(
                          note ?? 'Export gratuit, sans filigrane ni limite.',
                          style: AppTypography.micro.copyWith(
                            color: colors.sage,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

/// « Ce que cet outil sait ouvrir », en puces.
class _AcceptedFormats extends StatelessWidget {
  const _AcceptedFormats({required this.formats});

  final List<String> formats;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Formats acceptés',
          style: AppTypography.micro.copyWith(color: colors.inkFaint),
        ),
        const SizedBox(height: Space.xs),
        Wrap(
          spacing: Space.xs,
          runSpacing: Space.xs,
          children: [
            for (final f in formats)
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: Space.sm,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: colors.linen,
                  borderRadius: Radii.allSm,
                  border: Border.all(color: colors.rule, width: Rule.hair),
                ),
                child: Text(
                  f,
                  style: AppTypography.micro.copyWith(color: colors.inkMuted),
                ),
              ),
          ],
        ),
      ],
    );
  }
}
