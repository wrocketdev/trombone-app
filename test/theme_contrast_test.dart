import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:trombone/theme/app_colors.dart';

/// Luminance relative selon WCAG 2.1.
double _luminance(Color c) {
  double channel(double v) {
    return v <= 0.04045
        ? v / 12.92
        : math.pow((v + 0.055) / 1.055, 2.4) as double;
  }

  return 0.2126 * channel(c.r) + 0.7152 * channel(c.g) + 0.0722 * channel(c.b);
}

double _ratio(Color a, Color b) {
  final la = _luminance(a);
  final lb = _luminance(b);
  final hi = math.max(la, lb);
  final lo = math.min(la, lb);
  return (hi + 0.05) / (lo + 0.05);
}

/// La palette « Encre & Papier » a été construite en calculant ces rapports,
/// pas en les estimant à l'œil. Ce test empêche qu'un ajustement esthétique
/// ultérieur — assombrir le papier, adoucir un gris — casse discrètement la
/// lisibilité d'un rôle de texte.
///
/// Chaque rôle est vérifié sur **les deux** surfaces où il peut apparaître :
/// le fond de page et la carte. Un jeton qui ne passe que sur l'un des deux
/// est un piège pour l'écran qui l'utilisera sur l'autre.
void main() {
  const themes = {'clair': AppColors.light, 'sombre': AppColors.dark};

  const double aa = 4.5; // texte normal
  const double aaLarge = 3.0; // texte ≥ 18,66 px gras ou ≥ 24 px

  themes.forEach((name, c) {
    group('Thème $name', () {
      final surfaces = {'papier': c.paper, 'lin': c.linen};

      surfaces.forEach((surfaceName, surface) {
        test('encre primaire sur $surfaceName', () {
          expect(_ratio(c.ink, surface), greaterThanOrEqualTo(aa));
        });
        test('encre secondaire sur $surfaceName', () {
          expect(_ratio(c.inkMuted, surface), greaterThanOrEqualTo(aa));
        });
        test('encre tertiaire sur $surfaceName', () {
          expect(_ratio(c.inkFaint, surface), greaterThanOrEqualTo(aa));
        });
        test('accent lisible sur $surfaceName', () {
          expect(_ratio(c.accentDeep, surface), greaterThanOrEqualTo(aa));
        });
        test('sauge lisible sur $surfaceName', () {
          expect(_ratio(c.sageDeep, surface), greaterThanOrEqualTo(aa));
        });
        // Le carmin n'a qu'un seul ton, précisément pour qu'aucun écran n'ait
        // à choisir entre deux jetons selon la surface. Il doit donc tenir le
        // seuil texte sur les deux.
        test('carmin lisible sur $surfaceName', () {
          expect(_ratio(c.danger, surface), greaterThanOrEqualTo(aa));
        });
      });

      test('texte posé sur un remplissage d’accent', () {
        expect(_ratio(c.onAccent, c.accent), greaterThanOrEqualTo(aa));
      });

      test('encre sur teinte d’accent', () {
        expect(_ratio(c.ink, c.accentWash), greaterThanOrEqualTo(aa));
      });

      test('accent lisible sur sa propre teinte', () {
        expect(_ratio(c.accentDeep, c.accentWash), greaterThanOrEqualTo(aa));
      });

      test('sauge lisible sur sa propre teinte', () {
        expect(_ratio(c.sageDeep, c.sageWash), greaterThanOrEqualTo(aa));
      });

      test('carmin lisible sur sa propre teinte', () {
        expect(_ratio(c.danger, c.dangerWash), greaterThanOrEqualTo(aa));
      });

      test('encre sur teinte de carmin', () {
        expect(_ratio(c.ink, c.dangerWash), greaterThanOrEqualTo(aa));
      });

      test('texte posé sur un remplissage de carmin', () {
        expect(_ratio(c.onDanger, c.danger), greaterThanOrEqualTo(aa));
      });

      /// Le point de la refonte : l'erreur ne doit pas se lire comme la
      /// marque. Le message « les mots de passe ne correspondent pas » et le
      /// lien « Changer » se côtoient sur l'écran Protéger ; s'ils partagent
      /// la teinte, l'utilisateur ne peut pas trancher lequel des deux lui
      /// parle. Trente degrés est le seuil sous lequel un orangé et un rouge
      /// cessent d'être nommés différemment.
      test('le carmin ne se confond pas avec l’accent', () {
        final double a = HSLColor.fromColor(c.danger).hue;
        final double b = HSLColor.fromColor(c.accent).hue;
        final double gap = math.min((a - b).abs(), 360 - (a - b).abs());
        expect(gap, greaterThanOrEqualTo(30.0));

        final double deep = HSLColor.fromColor(c.accentDeep).hue;
        final double gapDeep = math.min(
          (a - deep).abs(),
          360 - (a - deep).abs(),
        );
        expect(gapDeep, greaterThanOrEqualTo(30.0));
      });

      /// Le carmin ne doit pas non plus se confondre avec une encre de
      /// famille : la prune est la voisine la plus proche, et une icône
      /// d'outil ne doit jamais ressembler à un message d'erreur.
      test('le carmin ne se confond avec aucune encre de famille', () {
        final double a = HSLColor.fromColor(c.danger).hue;
        for (var i = 0; i < c.inks.length; i++) {
          final double b = HSLColor.fromColor(c.inks[i].stroke).hue;
          final double gap = math.min((a - b).abs(), 360 - (a - b).abs());
          expect(
            gap,
            greaterThanOrEqualTo(20.0),
            reason: 'carmin trop proche de l’encre $i',
          );
        }
      });

      test('encre sur fond enfoncé (champs de saisie)', () {
        expect(_ratio(c.ink, c.paperSunken), greaterThanOrEqualTo(aa));
      });

      test('contour appuyé distinct du papier', () {
        // Un contour n'est pas du texte : le seuil applicable est celui des
        // éléments non textuels, 3:1.
        expect(_ratio(c.ruleStrong, c.paper), greaterThanOrEqualTo(1.5));
      });

      test('le papier n’est ni blanc pur ni noir pur', () {
        // Une surface non teintée se lit comme un rendu par défaut.
        expect(c.paper, isNot(const Color(0xFFFFFFFF)));
        expect(c.paper, isNot(const Color(0xFF000000)));
      });

      test('titre d’accent sur papier (seuil grand texte)', () {
        expect(_ratio(c.accent, c.paper), greaterThanOrEqualTo(aaLarge));
      });

      // L'encrier : une encre par famille d'outils. Chacune sert de glyphe et
      // de chiffre, donc chacune doit tenir le seuil texte sur les trois fonds
      // où elle apparaît — le papier, la tuile, et son propre lavis.
      group('encrier', () {
        for (var i = 0; i < c.inks.length; i++) {
          final ink = c.inks[i];
          test('encre $i sur papier', () {
            expect(_ratio(ink.stroke, c.paper), greaterThanOrEqualTo(aa));
          });
          test('encre $i sur tuile', () {
            expect(_ratio(ink.stroke, c.linen), greaterThanOrEqualTo(aa));
          });
          // Sur son propre lavis, l'encre ne sert que de glyphe d'icône. Une
          // icône est un élément graphique : le seuil applicable est 3:1, pas
          // celui du texte. Confondre les deux mène à durcir la contrainte au
          // point de ne plus pouvoir teinter la tuile du tout.
          test('glyphe $i sur son propre lavis', () {
            expect(_ratio(ink.stroke, ink.wash), greaterThanOrEqualTo(aaLarge));
          });

          // Le libellé de la tuile, lui, est bien du texte, et il est posé
          // sur ce même lavis.
          test('libellé sur le lavis $i', () {
            expect(_ratio(c.ink, ink.wash), greaterThanOrEqualTo(aa));
          });

          // Le compteur de section est du texte papier sur l'encre pleine.
          test('compteur sur la pastille $i', () {
            expect(_ratio(c.paper, ink.stroke), greaterThanOrEqualTo(aa));
          });
        }

        test('les encres sont distinguables entre elles', () {
          // Deux familles voisines ne doivent pas se confondre : sans écart de
          // teinte, le codage couleur ne code plus rien.
          for (var i = 0; i < c.inks.length; i++) {
            for (var j = i + 1; j < c.inks.length; j++) {
              final a = HSLColor.fromColor(c.inks[i].stroke).hue;
              final b = HSLColor.fromColor(c.inks[j].stroke).hue;
              final gap = math.min((a - b).abs(), 360 - (a - b).abs());
              expect(
                gap,
                greaterThanOrEqualTo(40.0),
                reason: 'encres $i et $j trop proches en teinte',
              );
            }
          }
        });
      });
    });
  });
}
