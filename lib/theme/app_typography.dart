import 'package:flutter/material.dart';

/// Typographie « Bento » — deux familles, deux rôles.
///
/// **Plus Jakarta Sans** porte la voix : titres de blocs, masthead, chiffres
/// mis en avant. C'est un humaniste chaud — terminaisons adoucies, `a` et `g`
/// caractériels — qui lit comme amical sans virer au rond enfantin. Le genre
/// playful demande « friendly, not childish » : un Nunito ou un Comic-quelque
/// chose franchirait la ligne, un géométrique froid ne l'atteindrait pas.
///
/// **Inter** porte le fonctionnel : corps, libellés, boutons, champs. Sa
/// neutralité est un atout ici — elle laisse Plus Jakarta Sans porter seul la
/// personnalité, et elle tient la densité à 13 px mieux que n'importe quel
/// display.
///
/// L'échelle compte six degrés — 34 / 24 / 19 / 15 / 13 / 11. Le degré
/// d'affichage a grandi de 32 à 34 : une grille bento tire sa hiérarchie de la
/// taille des blocs, pas de leur couleur, et le masthead doit dominer la plus
/// grande tuile.
abstract final class AppFonts {
  /// Famille d'affichage — titres de blocs uniquement.
  static const String display = 'Plus Jakarta Sans';

  /// Famille d'interface — tout le reste.
  static const String ui = 'Inter';

  /// Chiffres à chasse fixe : les compteurs de pages et de progression ne
  /// doivent pas gigoter quand la valeur change.
  static const List<FontFeature> tabular = [FontFeature.tabularFigures()];
}

abstract final class AppTypography {
  /// Masthead d'accueil. Un seul par écran, jamais deux.
  ///
  /// L'approche est resserrée (-1,0) : le genre playful demande un display
  /// « avec un tracking plus serré », faute de quoi un humaniste large paraît
  /// mou aux grandes tailles.
  static const TextStyle masthead = TextStyle(
    fontFamily: AppFonts.display,
    fontSize: 34,
    height: 40 / 34,
    fontWeight: FontWeight.w800,
    letterSpacing: -1.0,
  );

  /// Titre du bloc phare d'une grille bento.
  static const TextStyle headline = TextStyle(
    fontFamily: AppFonts.display,
    fontSize: 24,
    height: 29 / 24,
    fontWeight: FontWeight.w800,
    letterSpacing: -0.6,
  );

  /// En-tête de section, titre de barre d'application, titre de bloc moyen.
  static const TextStyle title = TextStyle(
    fontFamily: AppFonts.display,
    fontSize: 19,
    height: 24 / 19,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.3,
  );

  /// Titre de tuile, corps appuyé.
  static const TextStyle bodyStrong = TextStyle(
    fontFamily: AppFonts.ui,
    fontSize: 15,
    height: 21 / 15,
    fontWeight: FontWeight.w600,
    letterSpacing: -0.1,
  );

  /// Corps de texte.
  static const TextStyle body = TextStyle(
    fontFamily: AppFonts.ui,
    fontSize: 15,
    height: 22 / 15,
    fontWeight: FontWeight.w400,
  );

  /// Texte secondaire, descriptions.
  static const TextStyle small = TextStyle(
    fontFamily: AppFonts.ui,
    fontSize: 13,
    height: 19 / 13,
    fontWeight: FontWeight.w400,
  );

  /// Libellé de bouton, de tuile, d'onglet.
  static const TextStyle label = TextStyle(
    fontFamily: AppFonts.ui,
    fontSize: 13,
    height: 17 / 13,
    fontWeight: FontWeight.w600,
  );

  /// Libellé de tuile bento — porté par le display, pas par l'UI : dans une
  /// grille de blocs, le nom de l'outil *est* le titre du bloc.
  static const TextStyle tileLabel = TextStyle(
    fontFamily: AppFonts.display,
    fontSize: 13,
    height: 17 / 13,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.1,
  );

  /// Métadonnée, puce, compteur.
  static const TextStyle micro = TextStyle(
    fontFamily: AppFonts.ui,
    fontSize: 11,
    height: 15 / 11,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.2,
  );

  /// Métadonnée chiffrée — chasse fixe pour ne pas sautiller.
  static const TextStyle microNumeric = TextStyle(
    fontFamily: AppFonts.ui,
    fontSize: 11,
    height: 15 / 11,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.2,
    fontFeatures: AppFonts.tabular,
  );

  /// Construit le `TextTheme` Material à partir de l'échelle ci-dessus, pour
  /// que les composants du framework héritent de la bonne voix sans que chaque
  /// écran ait à le demander.
  static TextTheme textTheme(Color ink, Color inkMuted) {
    TextStyle on(TextStyle s, [Color? c]) => s.copyWith(color: c ?? ink);
    return TextTheme(
      displayLarge: on(masthead),
      displayMedium: on(masthead),
      displaySmall: on(masthead),
      headlineLarge: on(headline),
      headlineMedium: on(headline),
      headlineSmall: on(title),
      titleLarge: on(title),
      titleMedium: on(bodyStrong),
      titleSmall: on(label),
      bodyLarge: on(body),
      bodyMedium: on(small, inkMuted),
      bodySmall: on(small, inkMuted),
      labelLarge: on(label),
      labelMedium: on(label),
      labelSmall: on(micro, inkMuted),
    );
  }
}
