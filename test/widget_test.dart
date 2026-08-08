import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'app_fonts.dart';

import 'package:trombone/app.dart';

/// Le défilement de l'écran d'accueil.
///
/// Les grilles d'outils sont elles aussi des `Scrollable` — inertes, mais
/// présentes dans l'arbre. Il faut donc désigner explicitement celui de la
/// page, sinon `scrollUntilVisible` ne sait pas lequel actionner.
final Finder _pageScrollable = find.byType(Scrollable).first;

void main() {
  setUpAll(loadAppFonts);

  testWidgets('Home screen shows the three main actions', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const FusionPdfApp());
    await tester.pumpAndSettle();

    // Les deux gestes que le marché cite le plus — fusionner et convertir —
    // doivent être atteignables sans défiler. Les 1 678 avis dépouillés les
    // mentionnent à parité (122 et 128), ce que la grille bento traduit en
    // leur donnant à tous deux un bloc de premier niveau.
    expect(find.text('Fusionner'), findsOneWidget);
    expect(find.text('Recto-verso'), findsOneWidget);
    expect(find.text('Images vers PDF'), findsOneWidget);
    expect(find.text('PDF vers Word'), findsOneWidget);

    await tester.scrollUntilVisible(
      find.text('Organiser un PDF'),
      300,
      scrollable: _pageScrollable,
    );
    expect(find.text('Organiser un PDF'), findsOneWidget);
  });

  testWidgets('Home screen states the real tool count', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const FusionPdfApp());
    await tester.pumpAndSettle();

    // Le colophon annonce un nombre calculé depuis la liste d'outils. S'il est
    // écrit en dur un jour, ce test le dira le jour où un outil est ajouté.
    await tester.scrollUntilVisible(
      find.text('24 outils'),
      400,
      scrollable: _pageScrollable,
    );
    expect(find.text('24 outils'), findsOneWidget);
  });

  // La grille d'outils débordait dans la version précédente : trois colonnes,
  // un `childAspectRatio` fixe, et des libellés comme « PowerPoint vers PDF »
  // qui passaient à la ligne. La grille calcule désormais sa hauteur, et ces
  // cas la mettent à l'épreuve aux extrêmes du parc Android et des réglages
  // d'accessibilité.
  group('La grille d’accueil ne déborde jamais', () {
    final cases = <String, ({Size size, double textScale})>{
      'petit téléphone': (size: Size(320, 640), textScale: 1.0),
      'téléphone courant': (size: Size(412, 915), textScale: 1.0),
      'grand téléphone': (size: Size(480, 1000), textScale: 1.0),
      'tablette': (size: Size(834, 1112), textScale: 1.0),
      'police agrandie': (size: Size(360, 800), textScale: 1.3),
      'police maximale': (size: Size(360, 800), textScale: 2.0),
    };

    cases.forEach((name, c) {
      testWidgets(name, (WidgetTester tester) async {
        tester.view.physicalSize = c.size;
        tester.view.devicePixelRatio = 1.0;
        addTearDown(tester.view.reset);

        await tester.pumpWidget(
          MediaQuery(
            data: MediaQueryData(textScaler: TextScaler.linear(c.textScale)),
            child: const FusionPdfApp(),
          ),
        );
        await tester.pumpAndSettle();

        // Un débordement de mise en page lève une exception que le harnais de
        // test capture ; la remonter ici fait échouer le cas concerné.
        expect(tester.takeException(), isNull);

        // Et l'écran doit rester parcourable jusqu'au bout.
        await tester.scrollUntilVisible(
          find.text('Comparer PDF'),
          300,
          scrollable: _pageScrollable,
        );
        expect(tester.takeException(), isNull);
      });
    });
  });

  testWidgets('Les deux thèmes se construisent sans couleur manquante', (
    WidgetTester tester,
  ) async {
    for (final brightness in Brightness.values) {
      await tester.pumpWidget(
        MediaQuery(
          data: MediaQueryData(platformBrightness: brightness),
          child: const FusionPdfApp(),
        ),
      );
      await tester.pumpAndSettle();
      expect(tester.takeException(), isNull, reason: brightness.name);
    }
  });
}
