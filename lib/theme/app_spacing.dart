import 'package:flutter/material.dart';

/// Grille de 4 pt. Toute marge, tout écart, tout rembourrage de l'application
/// sort d'ici. Un `SizedBox(height: 20)` écrit à la main est un bug de design.
abstract final class Space {
  /// 4 — écart intra-composant (icône ↔ label serré).
  static const double xxs = 4;

  /// 8 — écart entre éléments liés.
  static const double xs = 8;

  /// 12 — rembourrage interne des petits contrôles.
  static const double sm = 12;

  /// 16 — gouttière de page, rembourrage de tuile.
  static const double md = 16;

  /// 20 — rembourrage interne des cartes.
  static const double lg = 20;

  /// 24 — écart entre blocs d'un même groupe.
  static const double xl = 24;

  /// 32 — écart entre groupes.
  static const double xxl = 32;

  /// 48 — respiration de section.
  static const double xxxl = 48;
}

/// Rayons.
///
/// Le genre playful demande des surfaces adoucies, mais garde une limite : au
/// delà, les blocs cessent d'être des blocs. La pilule intégrale reste
/// réservée aux puces — l'appliquer partout est la signature Material par
/// défaut dont cette refonte cherche à sortir.
abstract final class Radii {
  /// 6 — vignettes, pastilles.
  static const Radius xs = Radius.circular(6);

  /// 12 — petits contrôles, champs.
  static const Radius sm = Radius.circular(12);

  /// 16 — boutons.
  static const Radius md = Radius.circular(16);

  /// 20 — tuiles d'outil.
  static const Radius lg = Radius.circular(20);

  /// 26 — blocs bento et feuilles modales. Les grands blocs supportent —
  /// et demandent — un rayon plus généreux que les petites tuiles : à taille
  /// égale de rayon, un grand bloc paraît plus anguleux qu'un petit.
  static const Radius xl = Radius.circular(26);

  /// Pilule. Réservée aux puces — l'appliquer aux boutons et aux cartes est
  /// la signature Material par défaut.
  static const Radius pill = Radius.circular(999);

  static const BorderRadius allXs = BorderRadius.all(xs);
  static const BorderRadius allSm = BorderRadius.all(sm);
  static const BorderRadius allMd = BorderRadius.all(md);
  static const BorderRadius allLg = BorderRadius.all(lg);
  static const BorderRadius allXl = BorderRadius.all(xl);
  static const BorderRadius allPill = BorderRadius.all(pill);
}

/// Gouttière de la grille bento.
///
/// La macrostructure impose un écart constant de 12 à 24 px et aucun filet :
/// c'est la grille elle-même qui fait le rythme, et le rythme vient de la
/// variation de taille des blocs, jamais de leur couleur. C'est la règle qui
/// répare la version précédente, où j'avais compensé une grille uniforme en
/// inondant chaque tuile de teinte.
abstract final class Bento {
  static const double gap = 12;

  /// Hauteurs de bloc, en dp, avant mise à l'échelle typographique.
  static const double blockTall = 168;
  static const double blockMedium = 116;
  static const double blockShort = 92;
}

/// Épaisseurs de filet. Le trait capillaire est l'unité de séparation par
/// défaut de cette interface — pas l'ombre portée.
abstract final class Rule {
  static const double hair = 1;
  static const double thick = 2;
}

/// Durées et courbes. Deux primitives de mouvement seulement dans toute
/// l'application : `stagger-rise` à l'entrée, `press-sink` au toucher.
abstract final class Motion {
  static const Duration instant = Duration(milliseconds: 90);
  static const Duration quick = Duration(milliseconds: 160);
  static const Duration base = Duration(milliseconds: 260);
  static const Duration slow = Duration(milliseconds: 420);

  /// Décalage entre deux éléments d'une même cascade d'entrée.
  static const Duration stagger = Duration(milliseconds: 45);

  static const Curve easeOut = Curves.easeOutCubic;
  static const Curve easeIn = Curves.easeInCubic;
  static const Curve easeInOut = Curves.easeInOutCubic;

  /// `true` si le système demande de réduire les animations. Toute animation
  /// spatiale doit alors se replier sur un fondu court, voire rien.
  static bool reduced(BuildContext context) =>
      MediaQuery.maybeDisableAnimationsOf(context) ?? false;
}

/// Ombres. Teintées chaud pour rester dans le monde du papier — une ombre
/// grise neutre sur un fond crème se lit immédiatement comme une erreur.
abstract final class Shadows {
  static List<BoxShadow> resting(Color shadow) => [
    BoxShadow(
      color: shadow.withValues(alpha: 0.05),
      blurRadius: 2,
      offset: const Offset(0, 1),
    ),
  ];

  static List<BoxShadow> raised(Color shadow) => [
    BoxShadow(
      color: shadow.withValues(alpha: 0.06),
      blurRadius: 3,
      offset: const Offset(0, 1),
    ),
    BoxShadow(
      color: shadow.withValues(alpha: 0.05),
      blurRadius: 12,
      offset: const Offset(0, 6),
    ),
  ];

  static List<BoxShadow> lifted(Color shadow) => [
    BoxShadow(
      color: shadow.withValues(alpha: 0.10),
      blurRadius: 28,
      offset: const Offset(0, 12),
    ),
  ];
}

/// Points de rupture. L'application doit tenir de 320 dp (petits Android) à la
/// tablette sans jamais provoquer de débordement horizontal.
abstract final class Breakpoints {
  static const double compact = 360;
  static const double medium = 600;
  static const double expanded = 900;

  /// Nombre de colonnes de la grille d'outils selon la largeur disponible.
  static int toolColumns(double width) {
    if (width >= expanded) return 4;
    if (width >= medium) return 3;
    return 2;
  }
}
