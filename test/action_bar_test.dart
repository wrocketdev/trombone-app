import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_test/flutter_test.dart';

import 'app_fonts.dart';

import 'package:trombone/l10n/l10n.dart';
import 'package:trombone/theme/theme.dart';
import 'package:trombone/widgets/ui/export_action_bar.dart';

/// Aucun libellé cliquable ne doit passer sur deux lignes.
///
/// C'est la règle que la barre d'export violait : sur un Galaxy S24 Ultra —
/// 384 dp de large, densité 600 — « Enregistrer » se coupait en
/// « Enregist / rer ». Le défaut avait échappé à tous les contrôles précédents
/// parce que l'écran d'aperçu exige un PDF chargé, ce qu'un test unitaire ne
/// fournit pas. La barre est donc devenue un composant qu'on peut monter seul.
void main() {
  setUpAll(loadAppFonts);

  /// Hauteur d'une ligne de libellé, marge de sécurité comprise. Au delà, le
  /// texte s'est replié.
  const double singleLineCeiling = 24;

  final widths = <String, double>{
    'très petit téléphone 320': 320,
    'Galaxy S24 Ultra 384': 384,
    'téléphone courant 412': 412,
    'grand téléphone 480': 480,
  };

  widths.forEach((name, width) {
    testWidgets('barre d’export sur une seule ligne — $name', (tester) async {
      tester.view.physicalSize = Size(width, 800);
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
            bottomNavigationBar: ExportActionBar(
              onSave: () {},
              onShare: () {},
              onCompress: () {},
            ),
          ),
        ),
      );
      await tester.pump();

      expect(tester.takeException(), isNull);

      for (final label in ['Enregistrer', 'Partager', 'Compresser']) {
        final paragraph = tester.renderObject<RenderParagraph>(
          find.text(label),
        );
        expect(
          paragraph.size.height,
          lessThan(singleLineCeiling),
          reason: '« $label » se replie sur deux lignes à $width dp',
        );
        expect(
          paragraph.didExceedMaxLines,
          isFalse,
          reason: '« $label » est tronqué à $width dp',
        );
      }
    });
  });
}
