import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:trombone/l10n/l10n.dart';
import 'package:trombone/theme/theme.dart';
import 'package:trombone/widgets/ui/page_tile.dart';

import 'app_fonts.dart';

/// Ce que ce fichier protège : les contrôles d'une page dans la grille de
/// fusion.
///
/// Le vidage `uiautomator` d'un parcours sur S24 Ultra donnait 48 × 48 dp
/// partout — sauf sur cet écran, où les deux ronds posés sur chaque vignette
/// mesuraient 24 dp : rembourrage 4 plus icône 16, la moitié du minimum. Ils
/// étaient de surcroît peints en `Colors.black45`, hors du système de couleur,
/// et couvraient le coin haut de la page, c'est-à-dire l'endroit où se trouve
/// son titre.
void main() {
  setUpAll(loadAppFonts);

  Future<void> pump(
    WidgetTester tester, {
    bool included = true,
    VoidCallback? onRotate,
    ThemeData? theme,
  }) async {
    await tester.pumpWidget(
      MaterialApp(
        // Sans les delegues, `L.of(context)` rend nul et tout widget qui lit
        // un libelle jette. La langue est fixee au francais : c'est le
        // modele, et une mesure de largeur n'a de sens que dans une langue
        // connue.
        locale: const Locale('fr'),
        localizationsDelegates: L.localizationsDelegates,
        // `supportedLocales` vaut en_US par defaut ; la resolution y
        // retomberait et le delegue ne saurait pas la servir.
        supportedLocales: L.supportedLocales,
        theme: theme ?? AppTheme.light(),
        home: Scaffold(
          body: Center(
            child: PageTile(
              number: 3,
              bytesFuture: Future<Uint8List>.value(Uint8List(0)),
              included: included,
              onToggle: () {},
              onRotate: onRotate ?? () {},
            ),
          ),
        ),
      ),
    );
    await tester.pump();
  }

  testWidgets('le bouton de rotation tient le minimum tactile', (tester) async {
    await pump(tester);

    final Size size = tester.getSize(find.byType(IconButton));
    expect(
      size.width,
      greaterThanOrEqualTo(44),
      reason: 'cible sous le seuil : c’est le défaut d’origine, à 24 dp',
    );
    expect(size.height, greaterThanOrEqualTo(44));
  });

  testWidgets('la vignette entière bascule l’inclusion', (tester) async {
    int toggles = 0;
    await tester.pumpWidget(
      MaterialApp(
        // Sans les delegues, `L.of(context)` rend nul et tout widget qui lit
        // un libelle jette. La langue est fixee au francais : c'est le
        // modele, et une mesure de largeur n'a de sens que dans une langue
        // connue.
        locale: const Locale('fr'),
        localizationsDelegates: L.localizationsDelegates,
        // `supportedLocales` vaut en_US par defaut ; la resolution y
        // retomberait et le delegue ne saurait pas la servir.
        supportedLocales: L.supportedLocales,
        theme: AppTheme.light(),
        home: Scaffold(
          body: Center(
            child: PageTile(
              number: 1,
              bytesFuture: Future<Uint8List>.value(Uint8List(0)),
              included: true,
              onToggle: () => toggles++,
              onRotate: () {},
            ),
          ),
        ),
      ),
    );
    await tester.pump();

    // Au centre de la vignette, loin de tout contrôle : c'est bien la surface
    // entière qui est la cible, et non une pastille de 20 dp.
    await tester.tapAt(
      tester.getTopLeft(find.byType(PageTile)) + const Offset(48, 60),
    );
    expect(toggles, 1);
  });

  testWidgets('l’état d’inclusion est annoncé aux lecteurs d’écran', (
    tester,
  ) async {
    await pump(tester);
    expect(find.bySemanticsLabel(RegExp('incluse')), findsOneWidget);

    await pump(tester, included: false);
    expect(find.bySemanticsLabel(RegExp('écartée')), findsOneWidget);
  });

  testWidgets('la rotation est nommée, pas une icône nue', (tester) async {
    await pump(tester);
    expect(
      tester.widget<IconButton>(find.byType(IconButton)).tooltip,
      contains('Pivoter'),
    );
  });

  // La tuile doit tenir sa hauteur annoncée : c'est elle que le `Wrap` de
  // l'écran de fusion utilise pour caler ses rangées.
  testWidgets('la tuile respecte ses dimensions déclarées', (tester) async {
    for (final theme in <ThemeData>[AppTheme.light(), AppTheme.dark()]) {
      await pump(tester, theme: theme);
      final Size size = tester.getSize(find.byType(PageTile));
      expect(size.width, PageTile.width);
      expect(size.height, PageTile.height);
      expect(tester.takeException(), isNull);
    }
  });
}
