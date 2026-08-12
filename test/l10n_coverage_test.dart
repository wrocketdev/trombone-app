import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:trombone/l10n/l10n.dart';

/// Ce que ce fichier protège : l'accord entre les langues servies et ce que
/// les fontes embarquées savent réellement composer.
///
/// **Le défaut qu'il empêche.** Inter et Plus Jakarta Sans sont livrées
/// sous-ensemblées — 636 et 471 glyphes, 432 Ko à elles sept. C'est un choix
/// délibéré, et c'est ce qui rend l'ajout d'une langue moins anodin qu'il n'y
/// paraît : déposer `app_ru.arb` ne casse rien à la compilation, ne lève
/// aucune exception, et ne se voit que sur l'appareil.
///
/// Le repli d'Android est légitime et l'application s'en sert. Ce qui ne l'est
/// pas, c'est de s'y trouver **sans le savoir**. Les deux derniers tests
/// tiennent donc les deux bords : aucune langue ne tombe sur la fonte système
/// par accident, et aucune n'y reste alors que les fontes la couvrent.
void main() {
  /// Les points de code que les deux familles savent toutes deux dessiner.
  ///
  /// L'intersection et non l'union : un titre est composé en Plus Jakarta, un
  /// corps de texte en Inter, et rien ne dit d'avance laquelle des deux portera
  /// une chaîne donnée. Un glyphe présent dans une seule des deux est un glyphe
  /// qui manquera quelque part.
  late final Set<int> covered;

  setUpAll(() {
    Set<int> codePointsOf(String path) {
      final File file = File(path);
      if (!file.existsSync()) {
        throw StateError(
          'Fonte introuvable : $path — sans elle ce test ne mesure rien.',
        );
      }
      return _cmapCodePoints(file.readAsBytesSync());
    }

    covered = codePointsOf(
      'assets/fonts/Inter-400.ttf',
    ).intersection(codePointsOf('assets/fonts/PlusJakartaSans-700.ttf'));
  });

  /// Les chaînes réellement affichées d'un fichier de traduction.
  Iterable<MapEntry<String, String>> displayed(Locale locale) {
    final File arb = File('lib/l10n/app_${locale.languageCode}.arb');
    if (!arb.existsSync()) return const <MapEntry<String, String>>[];
    final Map<String, dynamic> entries =
        jsonDecode(arb.readAsStringSync()) as Map<String, dynamic>;
    // Les clés « @… » portent les consignes de traduction et « @@locale » la
    // langue : rien de tout cela n'est affiché.
    return entries.entries
        .where((e) => !e.key.startsWith('@') && e.value is String)
        .map((e) => MapEntry(e.key, e.value as String));
  }

  /// Les caractères de mise en forme n'ont pas de glyphe à dessiner.
  bool isFormatting(int rune) => rune == 0x0A || rune == 0x09;

  test('les fontes embarquées portent bien le latin étendu', () {
    // Garde-fou du garde-fou : si la lecture de la table `cmap` échouait en
    // silence, l'ensemble serait vide et tous les tests ci-dessous passeraient
    // pour de mauvaises raisons.
    expect(covered.length, greaterThan(200));
    // « ș » (virgule souscrite roumaine) est volontairement absent de cette
    // liste : il manque au sous-ensemble, et c'est la raison pour laquelle le
    // roumain s'écrit ici avec les cédilles « ş » et « ţ ».
    for (final String sample in const ['A', 'é', 'ł', 'ő', 'ş', 'ğ', 'ū']) {
      expect(
        covered.contains(sample.runes.first),
        isTrue,
        reason: '« $sample » manque au sous-ensemble',
      );
    }
  });

  test('chaque langue servie déclare son fichier de traduction', () {
    for (final Locale locale in kSupportedLocales) {
      expect(
        File('lib/l10n/app_${locale.languageCode}.arb').existsSync(),
        isTrue,
        reason:
            '${locale.languageCode} est servie mais '
            'lib/l10n/app_${locale.languageCode}.arb n’existe pas — le '
            'délégué jetterait au démarrage sur ces appareils',
      );
    }
  });

  test('aucune langue ne tombe sur la fonte système par accident', () {
    final List<String> faults = <String>[];

    for (final Locale locale in kSupportedLocales) {
      // Les langues servies par la pile de repli d'Android sont hors sujet :
      // on sait déjà qu'elles sortent du sous-ensemble, c'est l'arbitrage
      // déclaré dans kSystemFallbackLanguages.
      if (kSystemFallbackLanguages.contains(locale.languageCode)) continue;

      for (final MapEntry<String, String> entry in displayed(locale)) {
        for (final int rune in entry.value.runes) {
          if (isFormatting(rune) || covered.contains(rune)) continue;
          faults.add(
            '${locale.languageCode}/${entry.key} : '
            'U+${rune.toRadixString(16).toUpperCase().padLeft(4, '0')} '
            '« ${String.fromCharCode(rune)} »',
          );
        }
      }
    }

    expect(
      faults,
      isEmpty,
      reason:
          'Ces caractères ne sont dans aucune des deux fontes embarquées, et '
          'leur langue ne figure pas dans kSystemFallbackLanguages. Soit la '
          'traduction les évite, soit la langue rejoint cette liste — '
          'sciemment, en connaissance du prix.',
    );
  });

  // L'autre bord, qui compte tout autant : une langue déclarée en repli
  // système alors que les fontes la couvrent parfaitement est une identité
  // abandonnée pour rien. Ce cas se produira le jour où l'on re-sous-ensemble
  // les fontes plus large — et où l'on oubliera de retirer l'entrée devenue
  // inutile.
  test('aucune langue n’est déclarée en repli système sans raison', () {
    final List<String> useless = <String>[];

    for (final Locale locale in kSupportedLocales) {
      if (!kSystemFallbackLanguages.contains(locale.languageCode)) continue;
      final Iterable<MapEntry<String, String>> entries = displayed(locale);
      if (entries.isEmpty) continue;

      final bool everyGlyphCovered = entries
          .expand((e) => e.value.runes)
          .where((r) => !isFormatting(r))
          .every(covered.contains);
      if (everyGlyphCovered) useless.add(locale.languageCode);
    }

    expect(
      useless,
      isEmpty,
      reason:
          'Ces langues sont entièrement composables par les fontes embarquées '
          'mais sont déclarées en repli système : elles perdent la typographie '
          'de l’application sans contrepartie. Retirez-les de '
          'kSystemFallbackLanguages.',
    );
  });
}

/// Les points de code couverts par une fonte, lus dans sa table `cmap`.
///
/// Seuls les formats 4 (BMP, deux octets) et 12 (plans supérieurs) sont
/// interprétés : ce sont ceux qu'emploient les fontes de l'application, et les
/// autres formats sont soit obsolètes soit réservés à des écritures qu'un
/// sous-ensemble latin ne contient pas.
Set<int> _cmapCodePoints(List<int> bytes) {
  final ByteData data = ByteData.sublistView(Uint8List.fromList(bytes));
  final int tableCount = data.getUint16(4);

  int? cmapOffset;
  for (int i = 0; i < tableCount; i++) {
    final int record = 12 + i * 16;
    final String tag = String.fromCharCodes(bytes.sublist(record, record + 4));
    if (tag == 'cmap') {
      cmapOffset = data.getUint32(record + 8);
      break;
    }
  }
  if (cmapOffset == null) return const <int>{};

  final int subtableCount = data.getUint16(cmapOffset + 2);
  final Set<int> out = <int>{};

  for (int i = 0; i < subtableCount; i++) {
    final int record = cmapOffset + 4 + i * 8;
    final int subtable = cmapOffset + data.getUint32(record + 4);
    final int format = data.getUint16(subtable);

    if (format == 4) {
      final int segCountX2 = data.getUint16(subtable + 6);
      final int segCount = segCountX2 ~/ 2;
      final int endBase = subtable + 14;
      final int startBase = endBase + segCountX2 + 2;
      final int deltaBase = startBase + segCountX2;
      final int rangeBase = deltaBase + segCountX2;

      for (int s = 0; s < segCount; s++) {
        final int end = data.getUint16(endBase + s * 2);
        final int start = data.getUint16(startBase + s * 2);
        if (start > end || start == 0xFFFF) continue;
        final int rangeOffset = data.getUint16(rangeBase + s * 2);
        for (int c = start; c <= end; c++) {
          if (rangeOffset == 0) {
            out.add(c);
            continue;
          }
          // Le décalage est relatif à sa propre position dans la table.
          final int glyphAddr =
              rangeBase + s * 2 + rangeOffset + (c - start) * 2;
          if (glyphAddr + 1 >= data.lengthInBytes) continue;
          if (data.getUint16(glyphAddr) != 0) out.add(c);
        }
      }
    } else if (format == 12) {
      final int groups = data.getUint32(subtable + 12);
      for (int g = 0; g < groups; g++) {
        final int base = subtable + 16 + g * 12;
        final int start = data.getUint32(base);
        final int end = data.getUint32(base + 4);
        for (int c = start; c <= end; c++) {
          out.add(c);
        }
      }
    }
  }
  return out;
}
