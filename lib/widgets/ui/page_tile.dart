import 'dart:typed_data';

import 'package:flutter/material.dart';

import '../../theme/theme.dart';
import '../page_thumb.dart';

/// Une page dans une grille de pages : vignette, état d'inclusion, numéro,
/// rotation.
///
/// **Le défaut que ce composant remplace.** L'écran Fusionner empilait, sur
/// chaque vignette, deux ronds `Colors.black45` de 24 dp portant une icône
/// blanche de 16, plus un numéro de page peint par
/// `TextStyle(backgroundColor: Colors.black45)`. Trois problèmes tenaient dans
/// ces vingt lignes :
///
/// 1. **Des couleurs en dur.** Aucun des trois éléments ne passait par
///    `context.colors` ; ils ne changeaient donc ni avec le thème ni avec la
///    palette. C'était le seul endroit visible de l'application où l'on voyait
///    du noir Material sur du papier crème.
/// 2. **Des cibles de 24 dp.** Rembourrage 4 plus icône 16 : la moitié du
///    minimum de 48. Le reste de l'application tient 48 partout — vérifié au
///    vidage `uiautomator`.
/// 3. **Des contrôles posés sur le contenu.** Les deux ronds couvraient les
///    coins hauts de la page, c'est-à-dire précisément la zone où se trouve le
///    titre d'un document. On qualifiait une page en masquant ce qui permet de
///    la reconnaître.
///
/// **La forme retenue.** La vignette entière est la cible du basculement
/// inclure/exclure — un geste, une grande cible, aucun contrôle sur le papier.
/// La coche du coin devient purement indicative. Le numéro et la rotation
/// descendent dans un bandeau sous la page, où la rotation redevient un vrai
/// bouton de 44 dp.
class PageTile extends StatelessWidget {
  const PageTile({
    super.key,
    required this.number,
    required this.bytesFuture,
    required this.included,
    required this.onToggle,
    this.rotationDegrees = 0,
    this.onRotate,
  });

  /// Numéro affiché, à partir de 1.
  final int number;

  final Future<Uint8List> bytesFuture;
  final bool included;
  final VoidCallback onToggle;
  final int rotationDegrees;

  /// Absent quand l'écran ne sait pas pivoter une page seule.
  final VoidCallback? onRotate;

  /// Largeur d'une tuile. Deux tiennent à 320 dp, trois à 384.
  static const double width = 96;

  /// Hauteur de la vignette seule — proportion proche d'une page A4.
  static const double _thumbHeight = 128;

  /// Hauteur du bandeau de contrôles.
  static const double _footer = 44;

  /// Hauteur totale, à donner au [SizedBox] parent.
  static const double height = _thumbHeight + _footer;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return SizedBox(
      width: width,
      height: height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: _thumbHeight,
            child: Semantics(
              button: true,
              selected: included,
              label: included
                  ? 'Page $number, incluse. Toucher pour l’écarter.'
                  : 'Page $number, écartée. Toucher pour l’inclure.',
              child: GestureDetector(
                onTap: onToggle,
                behavior: HitTestBehavior.opaque,
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: PageThumb(
                        bytesFuture: bytesFuture,
                        rotationDegrees: rotationDegrees,
                        included: included,
                      ),
                    ),
                    // En bas à droite, et non en haut à gauche.
                    //
                    // Le haut d'une page porte son titre : c'est la seule
                    // zone qui permet de reconnaître une page d'un coup
                    // d'œil, et c'est exactement celle que la pastille
                    // recouvrait. Le pied de page est, lui, vide dans la
                    // grande majorité des documents.
                    Positioned(
                      bottom: 4,
                      right: 4,
                      child: _IncludeMark(included: included),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: _footer,
            child: Row(
              children: [
                const SizedBox(width: Space.xxs),
                Expanded(
                  child: Text(
                    '$number',
                    style: AppTypography.microNumeric.copyWith(
                      color: included ? colors.inkMuted : colors.inkFaint,
                    ),
                    maxLines: 1,
                  ),
                ),
                if (onRotate != null)
                  // Pas de `visualDensity: compact` ici : elle retranche 4 dp
                  // à chaque côté et ramenait la cible à 40 — on aurait
                  // remplacé un bouton de 24 dp par un bouton de 40, toujours
                  // sous le seuil. Le test de ce fichier verrouille les 44.
                  IconButton(
                    tooltip: 'Pivoter la page $number',
                    onPressed: onRotate,
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(
                      minWidth: 44,
                      minHeight: 44,
                    ),
                    icon: const Icon(Icons.rotate_right, size: 19),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// La pastille d'inclusion. **Indicative, pas cliquable** — c'est la vignette
/// entière qui bascule l'état. Une pastille de 20 dp cliquable serait une
/// cible sous le seuil ; posée sur une cible de 96 × 128, elle n'a plus besoin
/// de l'être.
class _IncludeMark extends StatelessWidget {
  const _IncludeMark({required this.included});

  final bool included;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Container(
      width: 22,
      height: 22,
      decoration: BoxDecoration(
        color: included ? colors.accent : colors.paper,
        shape: BoxShape.circle,
        border: Border.all(
          color: included ? colors.accent : colors.ruleStrong,
          width: Rule.hair,
        ),
      ),
      child: Icon(
        included ? Icons.check_rounded : Icons.close_rounded,
        size: 14,
        color: included ? colors.onAccent : colors.inkFaint,
      ),
    );
  }
}
