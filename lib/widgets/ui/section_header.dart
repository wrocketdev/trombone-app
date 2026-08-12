import 'package:flutter/material.dart';

import '../../l10n/l10n.dart';
import '../../theme/theme.dart';

/// En-tête de section : titre, filet de liaison, compte.
///
/// Le filet qui court du titre jusqu'au compte est le geste éditorial central
/// de la direction — c'est un filet de séparation de revue, pas une bordure de
/// carte. Il donne une ligne de lecture horizontale sans ajouter une seconde
/// couleur.
///
/// Pas de numérotation de section (`01 · CONVERTIR`) : ces sections ne sont pas
/// ordinales, on ne les parcourt pas dans l'ordre, et les numéroter serait un
/// tic décoratif qui détruirait la hiérarchie qu'il prétend créer.
///
/// [count] n'est jamais décoratif : c'est le nombre réel d'outils de la
/// section, calculé depuis la liste elle-même.
class SectionHeader extends StatelessWidget {
  const SectionHeader({
    super.key,
    required this.title,
    required this.count,
    required this.ink,
  });

  final String title;
  final int count;

  /// L'encre de la section. Elle teinte le filet et le compte, ce qui annonce
  /// la couleur de la grille qui suit avant même qu'on l'ait atteinte.
  final InkTone ink;

  /// Ce que le titre doit laisser derrière lui, dans le pire des cas : un filet
  /// encore lisible (24), la pastille de compte à deux chiffres (~30) et les
  /// deux écarts (20). En dessous de 320 dp le titre s'abrège plutôt que de
  /// pousser la pastille hors de l'écran.
  static const double _reservedForRuleAndCount = 74;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Semantics(
      header: true,
      label: context.l10n.sectionHeaderSemantics(title, count),
      child: ExcludeSemantics(
        child: LayoutBuilder(
          builder: (context, constraints) => Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Le titre n'est **pas** flexible, et c'est la correction.
              //
              // Avec `Flexible` d'un côté et `Expanded` de l'autre, la rangée
              // partageait l'espace en deux parts égales : le titre recevait la
              // moitié, qu'il en ait besoin ou non. « Sécurité » n'en prenait
              // qu'un tiers et laissait le reste en vide mort après la pastille ;
              // « Convertir vers PDF » n'y tenait pas et passait à la ligne. Le
              // même réglage cassait donc dans les deux sens à la fois.
              //
              // Un enfant non flexible se mesure d'abord, à sa largeur
              // naturelle ; le filet, seul flexible, prend exactement ce qui
              // reste. Le plafond ci-dessous n'est là que pour un titre
              // déraisonnable : il laisse toujours de quoi dessiner un filet
              // lisible et la pastille.
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: (constraints.maxWidth - _reservedForRuleAndCount)
                      .clamp(64.0, double.infinity),
                ),
                child: Text(
                  title,
                  style: AppTypography.title.copyWith(color: colors.ink),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(width: Space.sm),
              Expanded(
                child: Container(
                  height: Rule.thick,
                  margin: const EdgeInsets.only(bottom: 3),
                  decoration: BoxDecoration(
                    color: ink.stroke.withValues(alpha: 0.28),
                    borderRadius: BorderRadius.circular(Rule.thick),
                  ),
                ),
              ),
              const SizedBox(width: Space.xs),
              // Pastille pleine plutôt que teintée : le chiffre est du texte, il
              // doit tenir 4,5:1. Posé sur le lavis il n'y arrivait pas ; posé
              // sur l'encre elle-même, en papier, il passe largement — et la
              // touche de couleur est plus franche.
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
                decoration: BoxDecoration(
                  color: ink.stroke,
                  borderRadius: Radii.allXs,
                ),
                child: Text(
                  '$count',
                  style: AppTypography.microNumeric.copyWith(
                    color: colors.paper,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
