import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:trombone/theme/theme.dart';
import 'package:trombone/widgets/ui/export_outcome.dart';

import 'app_fonts.dart';

/// Ce que ce fichier protège.
///
/// Sur le S24, enregistrer un PDF fusionné écrivait bien le fichier — et ne le
/// disait jamais. Le `SnackBar` de confirmation naissait derrière l'interstitiel
/// plein écran levé dans la même milliseconde, et expirait avant qu'on le
/// revoie. Une fois la publicité fermée, l'écran était identique à ce qu'il
/// était avant : rien ne distinguait l'export réussi de l'export jamais tenté.
///
/// La correction est un ordre : confirmer, laisser acquitter, puis seulement
/// laisser la publicité se lever. Le test central est donc temporel — il
/// vérifie que la fonction *attend* l'acquittement.
void main() {
  setUpAll(loadAppFonts);

  Future<void> pumpHost(
    WidgetTester tester, {
    required void Function(BuildContext) onTap,
    double width = 384,
  }) async {
    tester.view.physicalSize = Size(width, 800);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.reset);

    await tester.pumpWidget(
      MaterialApp(
        theme: AppTheme.light(),
        home: Scaffold(
          body: Builder(
            builder: (context) => Center(
              child: ElevatedButton(
                onPressed: () => onTap(context),
                child: const Text('exporter'),
              ),
            ),
          ),
        ),
      ),
    );
  }

  testWidgets('La feuille décrit ce qui a été écrit', (tester) async {
    await pumpHost(
      tester,
      onTap: (context) => showExportSuccess(context, what: 'PDF · 8 pages'),
    );
    await tester.tap(find.text('exporter'));
    await tester.pumpAndSettle();

    expect(find.text('C’est enregistré.'), findsOneWidget);
    expect(find.text('PDF · 8 pages'), findsOneWidget);
    expect(find.text('Terminé'), findsOneWidget);
  });

  testWidgets(
    'La publicité attend l’acquittement — la fonction ne rend pas la main '
    'tant que la feuille est ouverte',
    (tester) async {
      bool done = false;
      await pumpHost(
        tester,
        onTap: (context) async {
          await showExportSuccess(context, what: 'PDF · 8 pages');
          done = true;
        },
      );

      await tester.tap(find.text('exporter'));
      await tester.pumpAndSettle();

      // La feuille est à l'écran : tout ce qui suit l'export — publicité
      // comprise — doit encore être en attente.
      expect(find.text('C’est enregistré.'), findsOneWidget);
      expect(
        done,
        isFalse,
        reason:
            'la suite de l’export s’est exécutée pendant que la confirmation '
            'était encore affichée — c’est exactement le défaut d’origine',
      );

      await tester.tap(find.text('Terminé'));
      await tester.pumpAndSettle();

      expect(find.text('C’est enregistré.'), findsNothing);
      expect(done, isTrue, reason: 'la suite ne reprend jamais');
    },
  );

  /// « Terminé » ne terminait rien.
  ///
  /// Sur appareil, l'enchaînement était : enregistrer → feuille → « Terminé »
  /// → publicité → **retour sur l'écran d'aperçu**, bouton « Enregistrer »
  /// intact. Le seul geste qui dit « j'ai fini » reposait l'utilisateur là où
  /// il était. La feuille rend maintenant la nuance à l'appelant : `true` pour
  /// « Terminé », `false` pour une fermeture au doigt — et [PreviewScreen] sort
  /// du flux sur `true`.
  testWidgets('« Terminé » se distingue d’une fermeture au doigt', (
    tester,
  ) async {
    bool? outcome;
    await pumpHost(
      tester,
      onTap: (context) async {
        outcome = await showExportSuccess(context, what: 'PDF · 8 pages');
      },
    );

    await tester.tap(find.text('exporter'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Terminé'));
    await tester.pumpAndSettle();
    expect(outcome, isTrue);

    outcome = null;
    await tester.tap(find.text('exporter'));
    await tester.pumpAndSettle();
    // Fermeture par le voile, comme un glissement vers le bas.
    await tester.tapAt(const Offset(10, 10));
    await tester.pumpAndSettle();
    expect(
      outcome,
      isFalse,
      reason:
          'une feuille refermée sans acquitter ne doit pas faire sortir du flux',
    );
  });

  testWidgets('« Partager » ferme la feuille et déclenche le partage', (
    tester,
  ) async {
    int shared = 0;
    await pumpHost(
      tester,
      onTap: (context) => showExportSuccess(
        context,
        what: 'PDF · 8 pages',
        onShare: () => shared++,
      ),
    );
    await tester.tap(find.text('exporter'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Partager'));
    await tester.pumpAndSettle();

    expect(shared, 1);
    expect(find.text('C’est enregistré.'), findsNothing);
  });

  testWidgets('Sans action de partage, le bouton n’apparaît pas', (
    tester,
  ) async {
    await pumpHost(
      tester,
      onTap: (context) => showExportSuccess(context, what: 'PDF · 8 pages'),
    );
    await tester.tap(find.text('exporter'));
    await tester.pumpAndSettle();

    expect(find.text('Partager'), findsNothing);
  });

  // La feuille ne prétend jamais nommer le fichier : `saveFile` rend
  // `/document/1024` sur Android, le nom final n'est pas récupérable, et le nom
  // suggéré contredirait ce que l'utilisateur vient de taper dans la boîte
  // système. Elle décrit — et ces descriptions doivent tenir à toute largeur.
  group('La feuille ne déborde pas', () {
    const descriptions = <String>[
      'PDF · 8 pages',
      'Présentation PowerPoint · 24 diapositives',
    ];
    for (final width in <double>[320, 384, 412]) {
      for (final what in descriptions) {
        testWidgets('${width.toInt()} dp — ${what.substring(0, 12)}…', (
          tester,
        ) async {
          await pumpHost(
            tester,
            width: width,
            onTap: (context) =>
                showExportSuccess(context, what: what, onShare: () {}),
          );
          await tester.tap(find.text('exporter'));
          await tester.pumpAndSettle();

          expect(tester.takeException(), isNull);
          expect(find.text('Terminé'), findsOneWidget);
          expect(find.text('Partager'), findsOneWidget);
        });
      }
    }
  });
}
