import 'package:flutter/material.dart';

import '../../theme/theme.dart';
import 'pressable.dart';

/// Tuile d'outil de la grille d'accueil.
///
/// Trois écarts délibérés avec la version précédente :
///
/// 1. **Alignement à gauche**, pas au centre. Une pastille ronde centrée
///    au-dessus d'un libellé centré est la forme par défaut que produit
///    n'importe quel générateur d'interface ; le fer à gauche donne une
///    colonne de lecture nette et laisse la place au texte.
/// 2. **Carré arrondi** plutôt que cercle pour le porte-icône — il fait écho
///    au format d'une page, ce qui est le sujet de l'application.
/// 3. **Deux colonnes** par défaut au lieu de trois, ce qui double la largeur
///    disponible pour le libellé. « PowerPoint vers PDF » et « Texte
///    cherchable (OCR) » débordaient sur trois colonnes.
class ToolTile extends StatelessWidget {
  const ToolTile({
    super.key,
    required this.icon,
    required this.label,
    required this.ink,
    required this.onTap,
  });

  final IconData icon;
  final String label;

  /// L'encre de la famille à laquelle l'outil appartient.
  final InkTone ink;

  final VoidCallback onTap;

  /// Diamètre du porte-icône.
  static const double _glyphBox = 34;

  /// Hauteur exacte d'une tuile.
  ///
  /// Le calcul vit ici, à côté de la mise en page qu'il mesure, et pas dans
  /// l'écran qui construit la grille : c'est ce qui empêche les deux de
  /// diverger. La grille l'utilise comme `mainAxisExtent` plutôt qu'un
  /// `childAspectRatio`, ce qui garantit qu'aucun libellé ne déborde quelle
  /// que soit la largeur de l'écran ou la taille de police du système.
  ///
  /// La bordure compte : un `Border.all` de 1 px prend 1 px en haut **et** en
  /// bas à l'intérieur des contraintes. Les avoir oubliés faisait déborder la
  /// colonne de 2 px exactement.
  static double heightFor(BuildContext context) {
    final scaler = MediaQuery.textScalerOf(context);
    const double borders = Rule.hair * 2; // haute et basse
    const double padding = Space.sm * 3; // haut, écart médian, bas
    final double label = scaler.scale(17) * 2; // deux lignes
    return borders + padding + _glyphBox + label;
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Pressable(
      onTap: onTap,
      semanticLabel: label,
      child: Container(
        padding: const EdgeInsets.all(Space.sm),
        decoration: BoxDecoration(
          // Surface neutre, encre au glyphe seul.
          //
          // La version qui inondait chaque tuile de lavis a été retirée : la
          // grille bento au-dessus porte désormais la hiérarchie par la taille
          // de ses blocs, et la macrostructure est explicite là-dessus — le
          // rythme naît de la variation de taille, jamais de la couleur.
          // Repeindre en plus les 19 tuiles de famille produisait deux
          // systèmes de hiérarchie concurrents, et un écran qui criait.
          color: colors.linen,
          borderRadius: Radii.allLg,
          border: Border.all(color: colors.rule, width: Rule.hair),
          boxShadow: Shadows.resting(colors.shadow),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: _glyphBox,
              height: _glyphBox,
              decoration: BoxDecoration(
                color: ink.wash,
                borderRadius: Radii.allXs,
              ),
              child: Icon(icon, size: 19, color: ink.stroke),
            ),
            const SizedBox(height: Space.sm),
            Text(
              label,
              style: AppTypography.tileLabel.copyWith(color: colors.ink),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
