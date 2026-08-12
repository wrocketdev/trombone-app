import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'l10n/l10n.dart';
import 'screens/home_screen.dart';
import 'theme/theme.dart';

class FusionPdfApp extends StatelessWidget {
  const FusionPdfApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Le titre que le sélecteur de tâches d'Android affiche au-dessus de
      // l'aperçu. Il se traduit comme le reste, d'où la variante calculée
      // depuis la locale plutôt qu'une chaîne fixe.
      onGenerateTitle: (context) => context.l10n.appTitle,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      localizationsDelegates: L.localizationsDelegates,
      supportedLocales: kSupportedLocales,
      // Android annonce parfois une locale que l'application ne sert pas —
      // `de_AT` quand seul `de` existe, ou `sr` qui n'est pas de la liste.
      // Sans cette résolution, Flutter retiendrait la première locale
      // déclarée, c'est-à-dire le français, pour un appareil autrichien.
      localeResolutionCallback: _resolveLocale,
      home: const HomeScreen(),
      // Les barres système empruntent la couleur du papier : sur un fond
      // crème, la barre d'état blanche par défaut d'Android trahit
      // immédiatement le placage.
      builder: (context, child) {
        final colors = context.colors;
        final dark = context.isDark;
        return AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: dark ? Brightness.light : Brightness.dark,
            statusBarBrightness: dark ? Brightness.dark : Brightness.light,
            systemNavigationBarColor: colors.paper,
            systemNavigationBarDividerColor: colors.rule,
            systemNavigationBarIconBrightness: dark
                ? Brightness.light
                : Brightness.dark,
          ),
          child: child ?? const SizedBox.shrink(),
        );
      },
    );
  }

  /// La langue vers laquelle retombe une locale que l'application ne sert pas.
  ///
  /// L'anglais et non le français : le français n'est la langue de personne
  /// hors de son aire, alors que l'anglais est la seconde langue par défaut de
  /// la plupart des utilisateurs d'Android.
  ///
  /// **Ce repli n'est valable que tant que `app_en.arb` existe et est
  /// complet.** Y désigner une langue dont le fichier manque ferait jeter
  /// `lookupL` au démarrage, sur les appareils mêmes qu'on cherchait à servir.
  /// Le test `test/tool_catalog_test.dart` vérifie que chacune des locales
  /// déclarées se charge — c'est ce qui empêche ce repli de devenir un piège.
  static const Locale _fallback = Locale('en');

  /// Choisit la langue servie à partir de celle de l'appareil.
  ///
  /// On ne retient que le code de langue : `pt_BR` et `pt_PT` reçoivent la
  /// même traduction, faute d'avoir deux variantes à leur offrir.
  static Locale _resolveLocale(Locale? device, Iterable<Locale> supported) {
    if (device == null) return _fallback;
    for (final Locale locale in supported) {
      if (locale.languageCode == device.languageCode) return locale;
    }
    // Le tagalog remonte d'Android sous deux codes selon la version, et le
    // norvégien sous trois — `nb`, `nn` et l'ancien `no`.
    if (device.languageCode == 'tl') return const Locale('fil');
    if (device.languageCode == 'nn' || device.languageCode == 'no') {
      return const Locale('nb');
    }
    return _fallback;
  }
}
