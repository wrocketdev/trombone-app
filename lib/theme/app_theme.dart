// Hallmark · macrostructure: Bento Grid · genre: playful
// theme: custom « Bento » · vibe: enjoué et rassurant, utilitaire du quotidien
// paper #FDFBF6 (bande claire) · accent #BE410C (chaud, ~18°, saturation 88 %)
// danger #9E0F31 (carmin, ~346°, ≥ 30° de l'accent dans les deux thèmes)
// display: Plus Jakarta Sans (humaniste arrondi) · body: Inter
// axes: clair / rounded-sans / accent-chaud   (≠ Workbench : style d'affichage)
// enrichment: aucun — typographie et variation de taille
// motion: stagger-rise · press-sink (2 primitives, prefers-reduced-motion géré)
// copie: ton et hiérarchie établis après dépouillement de 1 678 avis français
//        du marché (recherche/2026-08-07-fusionner-les-documents/reviews.json)
// pre-emit critique: P5 H5 E5 S5 R5 V5
//
// ── Passe de correction, après parcours complet sur appareil (S24 Ultra) ──
// Le tour ADB a montré que la refonte s'arrêtait à l'accueil. Corrigé depuis :
//   · une teinte danger distincte — l'accent portait l'erreur, donc le message
//     « les mots de passe ne correspondent pas » avait la couleur du lien
//     « Changer » posé au-dessus ;
//   · la chroma du thème sombre remontée — il était une désaturation du clair,
//     pas sa traduction ;
//   · l'encre de famille propagée dans les 24 outils via [ToolFamily], au lieu
//     de s'arrêter à la grille d'accueil ;
//   · les contrôles de page de Fusionner sortis du `Colors.black45` en dur et
//     remontés de 24 à 44 dp ([PageTile]) ;
//   · [PageThumb] ramené dans `context.colors` — c'était la dernière fuite du
//     système de couleur, et elle rendait une page écartée plus lumineuse que
//     les pages retenues ;
//   · une grammaire par objet : [PickedFileCard] (« Changer »), [ResultCard],
//     [AddSourceCard], [PageTile].
//
// Prochain passage Hallmark : changer de macrostructure (Bento Grid et
// Workbench sont pris) et différer sur au moins un des trois axes.

import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_spacing.dart';
import 'app_typography.dart';

/// Construction du thème « Bento ».
///
/// L'essentiel de la refonte tient ici : chaque composant Material utilisé
/// dans l'application est habillé une fois, à cet endroit, pour que les 26
/// écrans changent de peau sans être réécrits un par un. C'est ce qui a permis
/// de passer d'une direction éditoriale à une direction enjouée en changeant
/// trois fichiers de thème plutôt que vingt-six écrans.
abstract final class AppTheme {
  static ThemeData light() => _build(AppColors.light, Brightness.light);

  static ThemeData dark() => _build(AppColors.dark, Brightness.dark);

  static ThemeData _build(AppColors c, Brightness brightness) {
    final TextTheme text = AppTypography.textTheme(c.ink, c.inkMuted);

    final ColorScheme scheme = ColorScheme(
      brightness: brightness,
      primary: c.accent,
      onPrimary: c.onAccent,
      primaryContainer: c.accentWash,
      onPrimaryContainer: c.accentDeep,
      secondary: c.sage,
      onSecondary: c.onAccent,
      secondaryContainer: c.sageWash,
      onSecondaryContainer: c.sageDeep,
      tertiary: c.ink,
      onTertiary: c.paper,
      tertiaryContainer: c.linenStrong,
      onTertiaryContainer: c.ink,
      error: c.danger,
      onError: c.onDanger,
      errorContainer: c.dangerWash,
      onErrorContainer: c.danger,
      surface: c.paper,
      onSurface: c.ink,
      surfaceContainerLowest: c.paper,
      surfaceContainerLow: c.paperSunken,
      surfaceContainer: c.linen,
      surfaceContainerHigh: c.linen,
      surfaceContainerHighest: c.linenStrong,
      onSurfaceVariant: c.inkMuted,
      outline: c.ruleStrong,
      outlineVariant: c.rule,
      shadow: c.shadow,
      scrim: c.scrim,
      inverseSurface: c.ink,
      onInverseSurface: c.paper,
      inversePrimary: c.accentDeep,
    );

    final BorderSide hairline = BorderSide(color: c.rule, width: Rule.hair);

    OutlineInputBorder field(Color color, double width) => OutlineInputBorder(
      borderRadius: Radii.allSm,
      borderSide: BorderSide(color: color, width: width),
    );

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: scheme,
      extensions: <ThemeExtension<dynamic>>[c],
      scaffoldBackgroundColor: c.paper,
      canvasColor: c.paper,
      dividerColor: c.rule,
      textTheme: text,
      primaryTextTheme: text,
      fontFamily: AppFonts.ui,
      visualDensity: VisualDensity.standard,
      materialTapTargetSize: MaterialTapTargetSize.padded,
      splashColor: c.accent.withValues(alpha: 0.08),
      highlightColor: c.accent.withValues(alpha: 0.05),

      // ── Barre d'application ────────────────────────────────────────────
      // Pas d'ombre : la séparation se fait au filet capillaire, comme un
      // filet de tête dans une mise en page imprimée.
      appBarTheme: AppBarTheme(
        backgroundColor: c.paper,
        foregroundColor: c.ink,
        surfaceTintColor: Colors.transparent,
        shadowColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
        titleSpacing: Space.xs,
        titleTextStyle: AppTypography.title.copyWith(color: c.ink),
        toolbarTextStyle: AppTypography.body.copyWith(color: c.ink),
        iconTheme: IconThemeData(color: c.ink, size: 22),
        actionsIconTheme: IconThemeData(color: c.inkMuted, size: 22),
        shape: Border(bottom: hairline),
      ),

      // ── Surfaces ───────────────────────────────────────────────────────
      cardTheme: CardThemeData(
        color: c.linen,
        surfaceTintColor: Colors.transparent,
        shadowColor: c.shadow,
        elevation: 0,
        margin: EdgeInsets.zero,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: Radii.allLg,
          side: hairline,
        ),
      ),
      dividerTheme: DividerThemeData(
        color: c.rule,
        thickness: Rule.hair,
        space: Rule.hair,
      ),
      listTileTheme: ListTileThemeData(
        iconColor: c.inkMuted,
        textColor: c.ink,
        titleTextStyle: AppTypography.bodyStrong.copyWith(color: c.ink),
        subtitleTextStyle: AppTypography.small.copyWith(color: c.inkMuted),
        leadingAndTrailingTextStyle: AppTypography.label.copyWith(
          color: c.inkMuted,
        ),
        shape: const RoundedRectangleBorder(borderRadius: Radii.allMd),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: Space.md,
          vertical: Space.xxs,
        ),
        minVerticalPadding: Space.sm,
        selectedColor: c.accentDeep,
        selectedTileColor: c.accentWash,
      ),
      expansionTileTheme: ExpansionTileThemeData(
        backgroundColor: Colors.transparent,
        collapsedBackgroundColor: Colors.transparent,
        iconColor: c.accent,
        collapsedIconColor: c.inkMuted,
        textColor: c.ink,
        collapsedTextColor: c.ink,
        shape: const RoundedRectangleBorder(borderRadius: Radii.allLg),
        collapsedShape: const RoundedRectangleBorder(borderRadius: Radii.allLg),
      ),

      // ── Boutons ────────────────────────────────────────────────────────
      // Rayon 16 : assez arrondi pour le registre enjoué, pas assez pour la
      // pilule intégrale de Material — laquelle est le premier signe visible
      // d'une application Flutter non stylée.
      filledButtonTheme: FilledButtonThemeData(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.disabled)) return c.linenStrong;
            if (states.contains(WidgetState.pressed)) return c.accentDeep;
            return c.accent;
          }),
          foregroundColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.disabled)) return c.inkFaint;
            return c.onAccent;
          }),
          overlayColor: WidgetStateProperty.all(
            c.onAccent.withValues(alpha: 0.10),
          ),
          // Le bouton désactivé se remplissait de `linenStrong` sans contour :
          // sur le papier crème, il devenait indiscernable d'un champ de
          // saisie inerte. Un contour appuyé lui rend sa silhouette de bouton
          // — désactivé, mais reconnaissable comme le geste à venir.
          side: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.disabled)) {
              return BorderSide(color: c.ruleStrong, width: Rule.hair);
            }
            return BorderSide.none;
          }),
          elevation: WidgetStateProperty.all(0),
          shadowColor: WidgetStateProperty.all(Colors.transparent),
          textStyle: WidgetStateProperty.all(AppTypography.label),
          padding: WidgetStateProperty.all(
            const EdgeInsets.symmetric(
              horizontal: Space.md,
              vertical: Space.md,
            ),
          ),
          minimumSize: WidgetStateProperty.all(const Size(0, 52)),
          shape: WidgetStateProperty.all(
            const RoundedRectangleBorder(borderRadius: Radii.allMd),
          ),
          iconSize: WidgetStateProperty.all(19),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
          foregroundColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.disabled)) return c.inkFaint;
            return c.ink;
          }),
          backgroundColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.pressed)) return c.linen;
            return Colors.transparent;
          }),
          overlayColor: WidgetStateProperty.all(c.ink.withValues(alpha: 0.05)),
          side: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.disabled)) {
              return BorderSide(color: c.rule, width: Rule.hair);
            }
            return BorderSide(color: c.ruleStrong, width: Rule.hair);
          }),
          textStyle: WidgetStateProperty.all(AppTypography.label),
          padding: WidgetStateProperty.all(
            const EdgeInsets.symmetric(
              horizontal: Space.md,
              vertical: Space.md,
            ),
          ),
          minimumSize: WidgetStateProperty.all(const Size(0, 52)),
          shape: WidgetStateProperty.all(
            const RoundedRectangleBorder(borderRadius: Radii.allMd),
          ),
          iconSize: WidgetStateProperty.all(19),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.disabled)) return c.inkFaint;
            return c.accentDeep;
          }),
          overlayColor: WidgetStateProperty.all(
            c.accent.withValues(alpha: 0.08),
          ),
          textStyle: WidgetStateProperty.all(AppTypography.label),
          padding: WidgetStateProperty.all(
            const EdgeInsets.symmetric(
              horizontal: Space.md,
              vertical: Space.sm,
            ),
          ),
          minimumSize: WidgetStateProperty.all(const Size(0, 44)),
          shape: WidgetStateProperty.all(
            const RoundedRectangleBorder(borderRadius: Radii.allSm),
          ),
          iconSize: WidgetStateProperty.all(18),
        ),
      ),
      iconButtonTheme: IconButtonThemeData(
        style: ButtonStyle(
          foregroundColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.disabled)) return c.inkFaint;
            return c.inkMuted;
          }),
          overlayColor: WidgetStateProperty.all(c.ink.withValues(alpha: 0.06)),
          iconSize: WidgetStateProperty.all(21),
          minimumSize: WidgetStateProperty.all(const Size(44, 44)),
          shape: WidgetStateProperty.all(
            const RoundedRectangleBorder(borderRadius: Radii.allSm),
          ),
        ),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: c.accent,
        foregroundColor: c.onAccent,
        splashColor: c.onAccent.withValues(alpha: 0.12),
        elevation: 3,
        focusElevation: 3,
        hoverElevation: 4,
        highlightElevation: 1,
        shape: const RoundedRectangleBorder(borderRadius: Radii.allMd),
        extendedTextStyle: AppTypography.label,
      ),
      segmentedButtonTheme: SegmentedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) return c.ink;
            return Colors.transparent;
          }),
          foregroundColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) return c.paper;
            return c.inkMuted;
          }),
          side: WidgetStateProperty.all(
            BorderSide(color: c.ruleStrong, width: Rule.hair),
          ),
          textStyle: WidgetStateProperty.all(AppTypography.label),
          shape: WidgetStateProperty.all(
            const RoundedRectangleBorder(borderRadius: Radii.allSm),
          ),
        ),
      ),

      // ── Saisie ─────────────────────────────────────────────────────────
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: c.paperSunken,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: Space.md,
          vertical: Space.md,
        ),
        border: field(c.rule, Rule.hair),
        enabledBorder: field(c.rule, Rule.hair),
        focusedBorder: field(c.accent, Rule.thick),
        errorBorder: field(c.danger, Rule.hair),
        focusedErrorBorder: field(c.danger, Rule.thick),
        disabledBorder: field(c.rule, Rule.hair),
        labelStyle: AppTypography.small.copyWith(color: c.inkMuted),
        floatingLabelStyle: AppTypography.label.copyWith(color: c.accentDeep),
        hintStyle: AppTypography.body.copyWith(color: c.inkFaint),
        helperStyle: AppTypography.micro.copyWith(color: c.inkFaint),
        errorStyle: AppTypography.micro.copyWith(color: c.danger),
        prefixIconColor: c.inkMuted,
        suffixIconColor: c.inkMuted,
      ),
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: c.accent,
        selectionColor: c.accent.withValues(alpha: 0.22),
        selectionHandleColor: c.accent,
      ),

      // ── Contrôles ──────────────────────────────────────────────────────
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) return c.paper;
          return c.paper;
        }),
        trackColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.disabled)) return c.linenStrong;
          if (states.contains(WidgetState.selected)) return c.accent;
          return c.ruleStrong;
        }),
        trackOutlineColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) return c.accent;
          return c.ruleStrong;
        }),
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) return c.accent;
          return Colors.transparent;
        }),
        checkColor: WidgetStateProperty.all(c.onAccent),
        side: BorderSide(color: c.ruleStrong, width: 1.5),
        shape: const RoundedRectangleBorder(borderRadius: Radii.allXs),
      ),
      radioTheme: RadioThemeData(
        fillColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) return c.accent;
          return c.ruleStrong;
        }),
      ),
      sliderTheme: SliderThemeData(
        activeTrackColor: c.accent,
        inactiveTrackColor: c.linenStrong,
        thumbColor: c.accent,
        overlayColor: c.accent.withValues(alpha: 0.12),
        valueIndicatorColor: c.ink,
        valueIndicatorTextStyle: AppTypography.micro.copyWith(color: c.paper),
        trackHeight: 3,
      ),
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: c.accent,
        linearTrackColor: c.linenStrong,
        circularTrackColor: c.linenStrong,
        linearMinHeight: 3,
      ),
      chipTheme: ChipThemeData(
        backgroundColor: c.linen,
        selectedColor: c.accentWash,
        disabledColor: c.paperSunken,
        checkmarkColor: c.accentDeep,
        labelStyle: AppTypography.label.copyWith(color: c.ink),
        secondaryLabelStyle: AppTypography.label.copyWith(color: c.accentDeep),
        side: BorderSide(color: c.rule, width: Rule.hair),
        shape: const RoundedRectangleBorder(borderRadius: Radii.allSm),
        padding: const EdgeInsets.symmetric(
          horizontal: Space.sm,
          vertical: Space.xs,
        ),
        showCheckmark: true,
      ),
      tabBarTheme: TabBarThemeData(
        labelColor: c.ink,
        unselectedLabelColor: c.inkFaint,
        labelStyle: AppTypography.label,
        unselectedLabelStyle: AppTypography.label,
        indicatorColor: c.accent,
        indicatorSize: TabBarIndicatorSize.label,
        dividerColor: c.rule,
      ),

      // ── Retours et surcouches ──────────────────────────────────────────
      snackBarTheme: SnackBarThemeData(
        backgroundColor: c.ink,
        contentTextStyle: AppTypography.small.copyWith(color: c.paper),
        actionTextColor: c.accentDeep,
        behavior: SnackBarBehavior.floating,
        elevation: 2,
        insetPadding: const EdgeInsets.all(Space.md),
        shape: const RoundedRectangleBorder(borderRadius: Radii.allMd),
      ),
      dialogTheme: DialogThemeData(
        backgroundColor: c.paper,
        surfaceTintColor: Colors.transparent,
        shadowColor: c.shadow,
        elevation: 6,
        titleTextStyle: AppTypography.title.copyWith(color: c.ink),
        contentTextStyle: AppTypography.body.copyWith(color: c.inkMuted),
        shape: RoundedRectangleBorder(
          borderRadius: Radii.allXl,
          side: hairline,
        ),
      ),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: c.paper,
        surfaceTintColor: Colors.transparent,
        modalBackgroundColor: c.paper,
        elevation: 0,
        modalElevation: 0,
        showDragHandle: true,
        dragHandleColor: c.ruleStrong,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radii.xl),
        ),
      ),
      popupMenuTheme: PopupMenuThemeData(
        color: c.paper,
        surfaceTintColor: Colors.transparent,
        elevation: 4,
        textStyle: AppTypography.body.copyWith(color: c.ink),
        shape: RoundedRectangleBorder(
          borderRadius: Radii.allMd,
          side: hairline,
        ),
      ),
      tooltipTheme: TooltipThemeData(
        decoration: BoxDecoration(color: c.ink, borderRadius: Radii.allSm),
        textStyle: AppTypography.micro.copyWith(color: c.paper),
        padding: const EdgeInsets.symmetric(
          horizontal: Space.sm,
          vertical: Space.xs,
        ),
        waitDuration: const Duration(milliseconds: 800),
      ),
      bannerTheme: MaterialBannerThemeData(
        backgroundColor: c.accentWash,
        contentTextStyle: AppTypography.small.copyWith(color: c.ink),
        elevation: 0,
      ),
    );
  }
}
