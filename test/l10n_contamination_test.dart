import 'dart:convert';
import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:trombone/l10n/l10n.dart';

/// Ce que ce fichier protège : qu'aucune traduction ne contienne un morceau
/// d'une autre langue.
///
/// **Le défaut qu'il a réellement attrapé.** En écrivant `app_ja.arb`, une
/// valeur russe — « открытие… » — s'est glissée dans le fichier japonais. Rien
/// ne l'aurait signalée : le JSON est valide, la clé est présente, le décompte
/// est bon, l'analyse statique passe, et l'application se serait affichée en
/// japonais avec un mot russe au milieu d'un bouton. Seul un lecteur japonais
/// l'aurait vu, après publication.
///
/// C'est le risque propre à la traduction en série : trente fichiers de même
/// forme, écrits à la suite, où l'on copie la structure du précédent.
///
/// **Le principe retenu.** On ne cherche pas à deviner la langue d'une chaîne,
/// ce qui serait fragile. On compte les écritures employées dans chaque
/// fichier : une écriture qui n'apparaît que dans une ou deux entrées sur
/// quatre cent cinquante n'est pas un choix de traduction, c'est un résidu.
/// Une écriture réellement employée par la langue est partout.
void main() {
  /// Le nom de l'écriture d'un caractère, ou `null` si elle est commune à
  /// toutes les langues (chiffres, ponctuation, latin de base — « PDF »,
  /// « Word » et « 16:9 » apparaissent dans toutes les traductions).
  String? scriptOf(int rune) {
    if (rune < 0x0250) return null; // latin de base et latin-1
    if (rune >= 0x0400 && rune <= 0x04FF) return 'cyrillique';
    if (rune >= 0x0370 && rune <= 0x03FF) return 'grec';
    if (rune >= 0x0590 && rune <= 0x05FF) return 'hébreu';
    if (rune >= 0x0600 && rune <= 0x06FF) return 'arabe';
    if (rune >= 0x0900 && rune <= 0x097F) return 'devanagari';
    if (rune >= 0x0E00 && rune <= 0x0E7F) return 'thaï';
    if (rune >= 0x3040 && rune <= 0x30FF) return 'kana';
    if (rune >= 0x4E00 && rune <= 0x9FFF) return 'idéogrammes';
    if (rune >= 0xAC00 && rune <= 0xD7AF) return 'hangûl';
    return null;
  }

  /// En dessous de ce nombre d'entrées, une écriture est tenue pour un résidu
  /// et non pour un choix. Trois plutôt qu'un : une langue peut légitimement
  /// citer un mot étranger une ou deux fois — le japonais écrit « PDF » en
  /// latin, le russe garde « Word » — mais pas au-delà sans que ce soit son
  /// écriture propre.
  const int seuil = 3;

  test('aucune traduction ne contient de résidu d’une autre langue', () {
    final List<String> faults = <String>[];

    for (final Locale locale in kSupportedLocales) {
      final File arb = File('lib/l10n/app_${locale.languageCode}.arb');
      if (!arb.existsSync()) continue;

      final Map<String, dynamic> entries =
          jsonDecode(arb.readAsStringSync()) as Map<String, dynamic>;
      final Map<String, List<String>> keysByScript = <String, List<String>>{};

      entries.forEach((String key, dynamic value) {
        if (key.startsWith('@') || value is! String) return;
        final Set<String> scripts = <String>{};
        for (final int rune in value.runes) {
          final String? script = scriptOf(rune);
          if (script != null) scripts.add(script);
        }
        for (final String script in scripts) {
          keysByScript.putIfAbsent(script, () => <String>[]).add(key);
        }
      });

      keysByScript.forEach((String script, List<String> keys) {
        if (keys.length >= seuil) return;
        faults.add(
          '${locale.languageCode} : écriture « $script » dans seulement '
          '${keys.length} entrée(s) — ${keys.join(', ')}',
        );
      });
    }

    expect(
      faults,
      isEmpty,
      reason:
          'Une écriture employée par une poignée d’entrées seulement est '
          'presque toujours un copier-coller venu d’un autre fichier de '
          'traduction. Relisez ces entrées.\n${faults.join('\n')}',
    );
  });
}
