import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:trombone/l10n/l10n.dart';
import 'package:trombone/theme/theme.dart';
import 'package:trombone/widgets/ui/section_header.dart';

import 'app_fonts.dart';

/// L'en-tête de section cassait dans les deux sens à la fois, et personne ne
/// le mesurait.
///
/// `Flexible` pour le titre, `Expanded` pour le filet : la rangée coupait
/// l'espace en deux parts égales. « Sécurité » n'utilisait pas la sienne et
/// laissait un vide mort d'un quart de rangée derrière la pastille ;
/// « Convertir vers PDF » débordait de la sienne et passait à la ligne. Les
/// deux défauts étaient visibles sur le téléphone de l'utilisateur et
/// invisibles pour le harnais.
///
/// Ces mesures les rendent impossibles à réintroduire.
void main() {
  setUpAll(loadAppFonts);

  // Les titres réels de l'écran d'accueil. Ceux-là doivent tenir en entier :
  // ni repli, ni ellipse.
  const titles = <String>['Vers le PDF', 'Depuis le PDF', 'Sécurité', 'Éditer'];

  /// Hauteur au-delà de laquelle le titre est forcément passé à la ligne.
  /// Le style `title` fait 19 px ; une ligne n'atteint pas 32.
  const double oneLineCeiling = 32;

  const widths = <double>[320, 384, 412, 480];

  Future<void> pumpHeader(
    WidgetTester tester,
    String title,
    double width,
  ) async {
    tester.view.physicalSize = Size(width, 200);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.reset);

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
          body: Padding(
            // La gouttière réelle de l'écran d'accueil.
            padding: const EdgeInsets.symmetric(horizontal: Space.md),
            child: SectionHeader(
              title: title,
              count: 12,
              ink: AppColors.light.inks.first,
            ),
          ),
        ),
      ),
    );
  }

  group('Les titres réels tiennent en entier', () {
    for (final title in titles) {
      for (final width in widths) {
        testWidgets('« $title » à ${width.toInt()} dp', (tester) async {
          await pumpHeader(tester, title, width);

          final RenderParagraph p = tester.renderObject(find.text(title));
          expect(
            p.size.height,
            lessThan(oneLineCeiling),
            reason: 'le titre passe à la ligne',
          );
          // `didExceedMaxLines` est vrai dès qu'il y a ellipse, pas seulement
          // au repli : pour un titre réel, l'un comme l'autre est un échec.
          expect(
            p.didExceedMaxLines,
            isFalse,
            reason: 'le titre est tronqué alors qu’il devrait tenir',
          );
          expect(tester.takeException(), isNull);
        });
      }
    }
  });

  group('Un titre déraisonnable s’abrège au lieu de se replier', () {
    const absurd = 'Un titre de section déraisonnablement long';
    for (final width in widths) {
      testWidgets('à ${width.toInt()} dp', (tester) async {
        await pumpHeader(tester, absurd, width);

        final RenderParagraph p = tester.renderObject(find.text(absurd));
        expect(
          p.size.height,
          lessThan(oneLineCeiling),
          reason: 'le titre se replie au lieu de s’abréger',
        );
        // Il doit rester de la place pour la pastille de compte.
        expect(find.text('12'), findsOneWidget);
        expect(tester.takeException(), isNull);
      });
    }
  });

  group('Le filet court jusqu’au bord', () {
    // Un titre court ne doit pas laisser d'espace mort : la pastille de compte
    // termine la rangée, comme pour un titre long.
    for (final title in <String>['Éditer', 'Depuis le PDF']) {
      testWidgets('« $title » — la pastille finit la rangée', (tester) async {
        await pumpHeader(tester, title, 384);

        final double rowRight = tester
            .getRect(find.byType(SectionHeader))
            .right;
        final double countRight = tester.getRect(find.text('12')).right;

        // La pastille a 7 dp de rembourrage à droite ; au-delà, c'est du vide.
        expect(
          rowRight - countRight,
          lessThanOrEqualTo(9.0),
          reason:
              'espace mort de ${(rowRight - countRight).toStringAsFixed(1)} dp '
              'après la pastille — le filet ne va pas au bout',
        );
      });
    }
  });
}
