import 'package:flutter/material.dart';

import '../../theme/theme.dart';
import 'pressable.dart';

/// Bloc d'une grille bento.
///
/// La macrostructure tient en une règle : **le rythme naît de la variation de
/// taille, pas de l'uniformité des cartes**. C'est la correction de fond de la
/// version précédente — une grille de 21 tuiles identiques ne pouvait produire
/// aucune hiérarchie, et j'avais tenté de compenser en inondant chaque tuile
/// de couleur. Ici la couleur redevient un accent : c'est la surface du bloc
/// qui dit son importance.
///
/// Trois hauteurs, trois emphases, aucun filet entre les blocs : la gouttière
/// constante de 12 dp est la seule séparation.
enum BentoEmphasis {
  /// Bloc plein, à l'accent. Un seul par écran.
  primary,

  /// Bloc teinté de l'encre de sa famille.
  tinted,

  /// Bloc neutre.
  plain,
}

class BentoBlock extends StatelessWidget {
  const BentoBlock({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
    this.subtitle,
    this.emphasis = BentoEmphasis.plain,
    this.ink,
    this.minHeight,
    this.large = false,
  });

  final IconData icon;
  final String title;
  final String? subtitle;
  final VoidCallback onTap;
  final BentoEmphasis emphasis;

  /// L'encre de famille, requise pour [BentoEmphasis.tinted].
  final InkTone? ink;

  /// Hauteur **minimale** du bloc, pas sa hauteur fixe.
  ///
  /// La distinction est tout sauf cosmétique : une hauteur fixe fait déborder
  /// le bloc dès qu'un sous-titre passe sur deux lignes ou que l'utilisateur
  /// agrandit la police. Une hauteur minimale conserve le rythme de la grille
  /// à l'échelle par défaut — c'est là que le lecteur le perçoit — et laisse
  /// le bloc grandir plutôt que rogner son contenu.
  final double? minHeight;

  /// Titre à l'échelle du display plutôt qu'à celle du corps. Réservé au bloc
  /// phare : deux titres de cette taille sur un écran annulent la hiérarchie
  /// que la grille vient d'établir.
  final bool large;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    final (
      Color surface,
      Color border,
      Color glyph,
      Color titleColor,
      Color subColor,
    ) = switch (emphasis) {
      BentoEmphasis.primary => (
        colors.accent,
        colors.accent,
        colors.onAccent,
        colors.onAccent,
        colors.onAccent.withValues(alpha: 0.84),
      ),
      BentoEmphasis.tinted => (
        ink!.wash,
        ink!.stroke.withValues(alpha: 0.18),
        ink!.stroke,
        colors.ink,
        colors.inkMuted,
      ),
      BentoEmphasis.plain => (
        colors.linen,
        colors.rule,
        colors.inkMuted,
        colors.ink,
        colors.inkMuted,
      ),
    };

    return Pressable(
      onTap: onTap,
      borderRadius: Radii.allXl,
      semanticLabel: subtitle == null ? title : '$title. $subtitle',
      child: Container(
        constraints: BoxConstraints(minHeight: minHeight ?? 0),
        padding: const EdgeInsets.all(Space.md),
        decoration: BoxDecoration(
          color: surface,
          borderRadius: Radii.allXl,
          border: Border.all(color: border, width: Rule.hair),
          boxShadow: emphasis == BentoEmphasis.primary
              ? Shadows.raised(colors.shadow)
              : Shadows.resting(colors.shadow),
        ),
        // Glyphe en haut, texte en bas : c'est la forme d'un bloc bento, et
        // c'est `spaceBetween` qui la produit. Avec un alignement en tête, un
        // bloc plus haut que son contenu laissait un vide sous le texte et le
        // bloc paraissait inachevé.
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Icon(icon, size: large ? 24 : 21, color: glyph),
                const Spacer(),
                if (large)
                  Container(
                    width: 34,
                    height: 34,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: Radii.allSm,
                      border: Border.all(
                        color: glyph.withValues(alpha: 0.38),
                        width: Rule.hair,
                      ),
                    ),
                    child: Icon(Icons.arrow_forward, size: 18, color: glyph),
                  ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: Space.lg),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title,
                    style:
                        (large
                                ? AppTypography.headline
                                : AppTypography.tileLabel)
                            .copyWith(color: titleColor),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  if (subtitle != null) ...[
                    const SizedBox(height: Space.xxs),
                    Text(
                      subtitle!,
                      style: AppTypography.small.copyWith(color: subColor),
                      // Deux lignes sur les blocs secondaires, trois sur le
                      // bloc phare. Une rangée de deux blocs s'aligne en tête
                      // (voir [BentoRow]) : si l'un prend trois lignes de
                      // sous-titre et l'autre deux, leurs bas ne coïncident
                      // plus et la grille se décale d'une trentaine de pixels
                      // — assez pour se voir, pas assez pour passer pour une
                      // intention.
                      maxLines: large ? 3 : 2,
                      overflow: TextOverflow.ellipsis,
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

/// Une rangée de la grille : deux colonnes égales séparées par la gouttière.
///
/// L'alignement est `start`, jamais `stretch` : la rangée vit dans une liste à
/// hauteur non bornée, et `stretch` y exige une hauteur que personne ne fournit
/// — l'erreur de contrainte est immédiate. Chaque bloc porte sa propre hauteur,
/// et c'est l'appelant qui les fait coïncider, ce qui rend la correspondance
/// explicite plutôt que magique.
class BentoRow extends StatelessWidget {
  const BentoRow({super.key, required this.left, required this.right});

  final Widget left;
  final Widget right;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: left),
        const SizedBox(width: Bento.gap),
        Expanded(child: right),
      ],
    );
  }
}
