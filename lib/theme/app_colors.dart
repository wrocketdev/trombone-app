import 'package:flutter/material.dart';

/// Une encre de l'encrier.
///
/// Chaque famille d'outils reçoit la sienne. Ce n'est pas de la décoration :
/// on retrouve un élément dans une liste nettement plus vite quand les repères
/// varient à la fois par la forme **et** par la couleur, plutôt que par la
/// forme seule. La première version de cette grille présentait 21 tuiles
/// rigoureusement identiques — même surface, même glyphe gris — ce qui coûtait
/// à la fois en vitesse de repérage et en envie d'y toucher.
@immutable
class InkTone {
  const InkTone({required this.stroke, required this.wash});

  /// Le trait : glyphe d'icône, chiffre de section, soulignement.
  final Color stroke;

  /// Le lavis : fond du porte-icône. Une teinte à 10 % du trait dans le
  /// papier, assez présente pour se voir, assez discrète pour que cinq
  /// familles cohabitent sans virer au nuancier.
  final Color wash;

  static InkTone lerp(InkTone a, InkTone b, double t) => InkTone(
    stroke: Color.lerp(a.stroke, b.stroke, t)!,
    wash: Color.lerp(a.wash, b.wash, t)!,
  );
}

/// Palette « Bento ».
///
/// Une seule source de vérité pour la couleur. Aucune valeur hexadécimale ne
/// doit être écrite ailleurs dans l'application : les écrans passent tous par
/// `context.colors`.
///
/// Chaque rôle de texte a été vérifié WCAG AA (≥ 4.5:1) sur **les deux**
/// surfaces où il peut apparaître — le fond (`paper`) et la carte (`linen`) —
/// dans le thème clair comme dans le thème sombre.
///
/// **Il y a une teinte « danger », et il en faut une.** La version précédente
/// faisait porter l'erreur par l'accent, au motif que la seule action
/// destructrice de l'application était de retirer un fichier d'une liste. Ce
/// raisonnement ne couvrait pas le cas qui se présente réellement : la
/// validation de formulaire. Sur l'écran « Protéger PDF », deux mots de passe
/// qui ne concordent pas allument le champ en `accentDeep` — c'est-à-dire dans
/// la couleur exacte du lien « Changer » posé trois centimètres plus haut, et
/// du bouton d'action principal. Rien ne distingue alors « voici notre
/// couleur » de « vous vous êtes trompé ».
///
/// La teinte retenue est un carmin, séparé de l'accent d'au moins 30° sur la
/// roue dans les deux thèmes (voir `theme_contrast_test.dart`). L'orangé de
/// marque et le rouge d'erreur ne se lisent pas comme la même famille.
///
/// Le vert continue de porter le succès et la sécurité.
@immutable
class AppColors extends ThemeExtension<AppColors> {
  const AppColors({
    required this.paper,
    required this.paperSunken,
    required this.linen,
    required this.linenStrong,
    required this.rule,
    required this.ruleStrong,
    required this.ink,
    required this.inkMuted,
    required this.inkFaint,
    required this.accent,
    required this.accentDeep,
    required this.accentWash,
    required this.accentBorder,
    required this.onAccent,
    required this.sage,
    required this.sageDeep,
    required this.sageWash,
    required this.danger,
    required this.dangerWash,
    required this.dangerBorder,
    required this.onDanger,
    required this.shadow,
    required this.scrim,
    required this.inks,
  });

  /// Fond de page.
  final Color paper;

  /// Fond légèrement enfoncé — barres d'action, zones inertes.
  final Color paperSunken;

  /// Surface des cartes et tuiles.
  final Color linen;

  /// Surface des cartes au repos accentué — pastilles d'icône.
  final Color linenStrong;

  /// Filet capillaire — séparateurs, contours de carte.
  final Color rule;

  /// Filet appuyé — contours de champ, éléments focalisables.
  final Color ruleStrong;

  /// Texte primaire.
  final Color ink;

  /// Texte secondaire — sous-titres, descriptions.
  final Color inkMuted;

  /// Texte tertiaire — légendes, métadonnées.
  final Color inkFaint;

  /// Accent de marque — appels à l'action, sélection.
  final Color accent;

  /// Accent lisible en texte sur une carte.
  final Color accentDeep;

  /// Fond teinté d'accent — bandeaux, états sélectionnés.
  final Color accentWash;

  /// Contour teinté d'accent.
  final Color accentBorder;

  /// Texte posé sur un remplissage d'accent.
  final Color onAccent;

  /// Sauge — succès, sécurité, confirmation.
  final Color sage;

  /// Sauge lisible en texte.
  final Color sageDeep;

  /// Fond teinté de sauge.
  final Color sageWash;

  /// Carmin — erreur de saisie, échec, action destructrice.
  ///
  /// Lisible en texte sur le papier **et** sur la carte : contrairement à
  /// l'accent, qui a une variante « deep » pour ça, le danger n'a qu'un seul
  /// ton, choisi d'emblée assez sombre (clair) ou assez lumineux (sombre) pour
  /// tenir les deux. Un rôle d'erreur qui demande de choisir entre deux jetons
  /// selon la surface finit toujours par se tromper de jeton.
  final Color danger;

  /// Fond teinté de carmin — bandeaux d'erreur, confirmation destructrice.
  final Color dangerWash;

  /// Contour teinté de carmin — champ en erreur.
  final Color dangerBorder;

  /// Texte posé sur un remplissage de carmin.
  final Color onDanger;

  /// Teinte des ombres — chaude, jamais un gris neutre.
  final Color shadow;

  /// Voile des modales.
  final Color scrim;

  /// L'encrier — une encre par famille d'outils, dans l'ordre des sections de
  /// l'accueil : convertir vers PDF, convertir depuis un PDF, sécurité,
  /// éditer.
  ///
  /// Les quatre encres sont froides, et ce n'est pas un hasard : le papier est
  /// crème. Une ocre ou un safran posés dessus disparaissent — c'était le cas
  /// du premier jeu, dont le lavis safran était à peine distinguable de la
  /// tuile neutre. Une encre doit trancher avec son papier.
  ///
  /// Chaque teinte est séparée des trois autres d'au moins 40° sur la roue :
  /// sans écart, le codage couleur ne code plus rien. Le test de contraste
  /// vérifie les deux propriétés.
  final List<InkTone> inks;

  static const AppColors light = AppColors(
    paper: Color(0xFFFDFBF6),
    paperSunken: Color(0xFFF7F3EA),
    linen: Color(0xFFF2EDE3),
    linenStrong: Color(0xFFE9E2D4),
    rule: Color(0xFFE6DFD1),
    ruleStrong: Color(0xFFD2C8B5),
    ink: Color(0xFF191A1F),
    inkMuted: Color(0xFF5C574C),
    inkFaint: Color(0xFF6B6456),
    accent: Color(0xFFBE410C),
    accentDeep: Color(0xFFA33608),
    accentWash: Color(0xFFF5E5DA),
    accentBorder: Color(0xFFEBC7B4),
    onAccent: Color(0xFFFDFBF6),
    sage: Color(0xFF1B7A54),
    sageDeep: Color(0xFF1B7A54),
    sageWash: Color(0xFFEDF2EB),
    danger: Color(0xFF9E0F31),
    dangerWash: Color(0xFFF9E3E6),
    dangerBorder: Color(0xFFEBBFC6),
    onDanger: Color(0xFFFDFBF6),
    shadow: Color(0xFF2B2418),
    scrim: Color(0xFF191A1F),
    inks: [
      InkTone(stroke: Color(0xFF1769D3), wash: Color(0xFFE4EBF2)), // bleu
      InkTone(stroke: Color(0xFFB9368D), wash: Color(0xFFF6E5EA)), // prune
      InkTone(stroke: Color(0xFF1B7A54), wash: Color(0xFFE4EDE4)), // vert
      InkTone(stroke: Color(0xFF824FCF), wash: Color(0xFFEFE8F2)), // violet
    ],
  );

  static const AppColors dark = AppColors(
    paper: Color(0xFF191813),
    paperSunken: Color(0xFF131209),
    linen: Color(0xFF242118),
    linenStrong: Color(0xFF2E2A20),
    rule: Color(0xFF3B372C),
    ruleStrong: Color(0xFF4C4737),
    ink: Color(0xFFF6F2E9),
    inkMuted: Color(0xFFBBB4A4),
    inkFaint: Color(0xFF9A9385),
    // Le thème sombre était une désaturation du thème clair, pas sa
    // traduction : la brique franche de l'accent clair (#BE410C, chroma haute)
    // y devenait un saumon pastel (#D4825F, chroma presque de moitié). Sur
    // l'appareil, le bloc « Fusionner » — le seul élément plein accent de
    // l'accueil — perdait toute autorité, et les deux thèmes ne se lisaient
    // plus comme le même produit. La chroma est remontée ; le rapport de
    // contraste avec `onAccent` reste au-dessus de 4,5:1.
    accent: Color(0xFFE8703A),
    accentDeep: Color(0xFFF2946B),
    accentWash: Color(0xFF50250F),
    accentBorder: Color(0xFF6E3E1F),
    onAccent: Color(0xFF191813),
    sage: Color(0xFF6DAA92),
    sageDeep: Color(0xFF6DAA92),
    sageWash: Color(0xFF1A3124),
    danger: Color(0xFFFF8FAA),
    dangerWash: Color(0xFF4A1420),
    dangerBorder: Color(0xFF6B2231),
    onDanger: Color(0xFF191813),
    shadow: Color(0xFF000000),
    scrim: Color(0xFF0B0A08),
    inks: [
      InkTone(stroke: Color(0xFF6B9FE3), wash: Color(0xFF182D45)), // bleu
      InkTone(stroke: Color(0xFFD27EB6), wash: Color(0xFF432033)), // prune
      InkTone(stroke: Color(0xFF6DAA92), wash: Color(0xFF1A3124)), // vert
      InkTone(stroke: Color(0xFFAF8EE0), wash: Color(0xFF342644)), // violet
    ],
  );

  @override
  AppColors copyWith({
    Color? paper,
    Color? paperSunken,
    Color? linen,
    Color? linenStrong,
    Color? rule,
    Color? ruleStrong,
    Color? ink,
    Color? inkMuted,
    Color? inkFaint,
    Color? accent,
    Color? accentDeep,
    Color? accentWash,
    Color? accentBorder,
    Color? onAccent,
    Color? sage,
    Color? sageDeep,
    Color? sageWash,
    Color? danger,
    Color? dangerWash,
    Color? dangerBorder,
    Color? onDanger,
    Color? shadow,
    Color? scrim,
    List<InkTone>? inks,
  }) {
    return AppColors(
      paper: paper ?? this.paper,
      paperSunken: paperSunken ?? this.paperSunken,
      linen: linen ?? this.linen,
      linenStrong: linenStrong ?? this.linenStrong,
      rule: rule ?? this.rule,
      ruleStrong: ruleStrong ?? this.ruleStrong,
      ink: ink ?? this.ink,
      inkMuted: inkMuted ?? this.inkMuted,
      inkFaint: inkFaint ?? this.inkFaint,
      accent: accent ?? this.accent,
      accentDeep: accentDeep ?? this.accentDeep,
      accentWash: accentWash ?? this.accentWash,
      accentBorder: accentBorder ?? this.accentBorder,
      onAccent: onAccent ?? this.onAccent,
      sage: sage ?? this.sage,
      sageDeep: sageDeep ?? this.sageDeep,
      sageWash: sageWash ?? this.sageWash,
      danger: danger ?? this.danger,
      dangerWash: dangerWash ?? this.dangerWash,
      dangerBorder: dangerBorder ?? this.dangerBorder,
      onDanger: onDanger ?? this.onDanger,
      shadow: shadow ?? this.shadow,
      scrim: scrim ?? this.scrim,
      inks: inks ?? this.inks,
    );
  }

  @override
  AppColors lerp(ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) return this;
    Color mix(Color a, Color b) => Color.lerp(a, b, t)!;
    return AppColors(
      paper: mix(paper, other.paper),
      paperSunken: mix(paperSunken, other.paperSunken),
      linen: mix(linen, other.linen),
      linenStrong: mix(linenStrong, other.linenStrong),
      rule: mix(rule, other.rule),
      ruleStrong: mix(ruleStrong, other.ruleStrong),
      ink: mix(ink, other.ink),
      inkMuted: mix(inkMuted, other.inkMuted),
      inkFaint: mix(inkFaint, other.inkFaint),
      accent: mix(accent, other.accent),
      accentDeep: mix(accentDeep, other.accentDeep),
      accentWash: mix(accentWash, other.accentWash),
      accentBorder: mix(accentBorder, other.accentBorder),
      onAccent: mix(onAccent, other.onAccent),
      sage: mix(sage, other.sage),
      sageDeep: mix(sageDeep, other.sageDeep),
      sageWash: mix(sageWash, other.sageWash),
      danger: mix(danger, other.danger),
      dangerWash: mix(dangerWash, other.dangerWash),
      dangerBorder: mix(dangerBorder, other.dangerBorder),
      onDanger: mix(onDanger, other.onDanger),
      shadow: mix(shadow, other.shadow),
      scrim: mix(scrim, other.scrim),
      inks: [
        for (var i = 0; i < inks.length; i++)
          InkTone.lerp(inks[i], other.inks[i], t),
      ],
    );
  }
}
