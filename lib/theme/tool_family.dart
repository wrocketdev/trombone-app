import 'package:flutter/material.dart';

import 'app_colors.dart';

/// L'encre de la famille à laquelle appartient l'écran courant.
///
/// **Le défaut que ce widget corrige.** L'accueil code quatre familles d'outils
/// par la couleur — bleu, prune, vert, violet — et le commentaire de
/// [AppColors.inks] explique pourquoi : on retrouve un élément dans une liste
/// nettement plus vite quand les repères varient par la forme *et* par la
/// couleur. Puis on tapait sur « Protéger PDF », tuile verte, et l'écran qui
/// s'ouvrait était orange de bout en bout : pastille neutre, glyphe accent,
/// bouton accent. L'encre ne survivait pas à la navigation. Un codage couleur
/// qui s'arrête au premier écran ne code rien : il décore la grille.
///
/// **Ce qui est teinté, et ce qui ne l'est pas.** L'encre est un repère de
/// *lieu*, pas un signal d'*action*. Elle prend donc le porte-icône de l'état
/// vide et le filet sous la barre de titre — deux surfaces qui disent « vous
/// êtes ici ». Le bouton d'action principal reste à l'accent dans toute
/// l'application : quatre couleurs de bouton principal selon la famille
/// apprendraient à l'utilisateur que la couleur du bouton ne veut rien dire.
///
/// **Pourquoi un `InheritedWidget` plutôt qu'un paramètre.** Toute la
/// navigation vers un outil passe par un point unique — `HomeScreen._open` —
/// qui connaît déjà la famille de l'outil qu'il ouvre. Envelopper la route à
/// cet endroit couvre les vingt-quatre écrans d'un coup, sans toucher aux
/// vingt-quatre fichiers, et sans qu'un écran ajouté plus tard puisse oublier
/// de transmettre son encre.
class ToolFamily extends InheritedWidget {
  const ToolFamily({super.key, required this.ink, required super.child});

  final InkTone ink;

  /// L'encre de l'écran courant, ou `null` hors d'un outil.
  static InkTone? maybeOf(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<ToolFamily>()?.ink;

  /// L'encre de l'écran courant, avec repli sur l'accent.
  ///
  /// Le repli n'est pas un pis-aller : un écran atteint hors de la grille
  /// d'accueil — l'aperçu poussé depuis un outil, un écran ouvert par la
  /// recherche sans famille connue — n'a légitimement pas de famille, et
  /// l'accent est alors la bonne réponse.
  static InkTone of(BuildContext context) {
    final InkTone? ink = maybeOf(context);
    if (ink != null) return ink;
    final AppColors colors =
        Theme.of(context).extension<AppColors>() ?? AppColors.light;
    return InkTone(stroke: colors.accent, wash: colors.accentWash);
  }

  @override
  bool updateShouldNotify(ToolFamily oldWidget) => oldWidget.ink != ink;
}
