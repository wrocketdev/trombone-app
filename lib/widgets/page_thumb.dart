import 'dart:math' as math;
import 'dart:typed_data';

import 'package:flutter/material.dart';

import '../theme/theme.dart';

/// Vignette d'une page : rendu paresseux via [bytesFuture], rotation visuelle
/// de [rotationDegrees] (la rotation en attente de l'utilisateur, appliquée à
/// l'export seulement — ceci n'en est que l'aperçu vivant), et traitement
/// « écartée » quand [included] vaut `false`.
///
/// **Deux défauts corrigés ici, tous deux visibles à l'œil sur appareil.**
///
/// Le premier était un contresens de hiérarchie. La page écartée était rendue
/// par un `Opacity(0.3)` posé sur un conteneur rempli de
/// `colorScheme.surfaceContainerHighest`. En thème sombre, ce jeton est un gris
/// clair : la page qu'on venait d'exclure devenait le bloc le plus lumineux de
/// la rangée, plus voyant que les pages conservées. Elle perdait de surcroît
/// toute image, donc on ne pouvait plus vérifier *ce* qu'on avait exclu — la
/// seule chose qu'on ait besoin de voir à ce moment-là.
///
/// La page écartée reste maintenant lisible : elle est désaturée et assombrie,
/// posée sur la surface de carte du thème, et son contour se creuse en trait
/// tireté. Elle recule sans disparaître.
///
/// Le second était une fuite du système de couleur. Ce fichier était le seul de
/// l'application à taper `Theme.of(context).colorScheme` en direct, alors que
/// l'en-tête de [AppColors] pose que tout passe par `context.colors`. C'est ce
/// court-circuit qui a laissé le gris clair entrer.
class PageThumb extends StatelessWidget {
  const PageThumb({
    super.key,
    required this.bytesFuture,
    this.rotationDegrees = 0,
    this.included = true,
    this.selected = false,
  });

  final Future<Uint8List> bytesFuture;
  final int rotationDegrees;
  final bool included;
  final bool selected;

  /// Matrice de désaturation. Une page écartée garde sa forme et son texte,
  /// mais perd sa couleur : c'est le signal le plus lisible sans rien masquer.
  static const List<double> _desaturate = <double>[
    0.2126, 0.7152, 0.0722, 0, 0, //
    0.2126, 0.7152, 0.0722, 0, 0, //
    0.2126, 0.7152, 0.0722, 0, 0, //
    0, 0, 0, 1, 0, //
  ];

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    final Color border = selected
        ? colors.accent
        : included
        ? colors.rule
        : colors.ruleStrong;

    Widget page = FutureBuilder<Uint8List>(
      future: bytesFuture,
      builder: (context, snap) {
        if (snap.connectionState != ConnectionState.done) {
          return Center(
            child: SizedBox(
              width: 18,
              height: 18,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: colors.inkFaint,
              ),
            ),
          );
        }
        if (snap.hasError || snap.data == null || snap.data!.isEmpty) {
          return Center(
            child: Icon(
              Icons.insert_drive_file_outlined,
              color: colors.inkFaint,
            ),
          );
        }
        return Transform.rotate(
          angle: rotationDegrees * math.pi / 180,
          child: Image.memory(
            snap.data!,
            fit: BoxFit.contain,
            gaplessPlayback: true,
          ),
        );
      },
    );

    if (!included) {
      page = ColorFiltered(
        colorFilter: const ColorFilter.matrix(_desaturate),
        child: Opacity(opacity: 0.55, child: page),
      );
    }

    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: border,
          width: selected ? Rule.thick : Rule.hair,
        ),
        borderRadius: Radii.allXs,
        // La surface de repli sous la page est la carte du thème, jamais un
        // gris système : c'est elle qu'on voit pendant le rendu et au travers
        // d'une page écartée.
        color: included ? colors.linenStrong : colors.linen,
      ),
      clipBehavior: Clip.antiAlias,
      child: page,
    );
  }
}
