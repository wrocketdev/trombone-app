import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:trombone/core/files/file_utils.dart';
import 'package:trombone/l10n/l10n.dart';
import 'package:trombone/screens/home_screen.dart';

/// Ce que ce fichier protège : le catalogue d'outils et les noms d'export.
///
/// Deux défauts relevés lors d'un parcours complet sur appareil, tous deux
/// invisibles à la relecture du code et évidents à l'usage.
void main() {
  group('Nom d’export dérivé de la source', () {
    // « fusion.pdf », « extrait.pdf », « protege.pdf » : des constantes. Sur un
    // téléphone d'usage, quelques allers-retours suffisaient à produire
    // `fusion.pdf` … `fusion (5).pdf`, cinq fichiers dont aucun ne disait de
    // quoi il venait.
    test('conserve le nom d’origine et suffixe le rôle', () {
      expect(
        FileUtils.derivedName('Contrat.pdf', 'fusion'),
        'Contrat-fusion.pdf',
      );
      expect(
        FileUtils.derivedName('Contrat.pdf', 'protege'),
        'Contrat-protege.pdf',
      );
    });

    test('accepte un chemin complet et une casse d’extension quelconque', () {
      expect(
        FileUtils.derivedName('/sdcard/Download/Rapport.PDF', 'rogne'),
        'Rapport-rogne.pdf',
      );
      expect(
        FileUtils.derivedName(r'C:\docs\Rapport final.pdf', 'ocr'),
        'Rapport final-ocr.pdf',
      );
    });

    test('change d’extension quand le résultat n’est pas un PDF', () {
      expect(
        FileUtils.derivedName('Contrat.pdf', 'texte', extension: 'docx'),
        'Contrat-texte.docx',
      );
    });

    test('se replie sur le rôle seul quand la source est inconnue', () {
      expect(FileUtils.derivedName(null, 'fusion'), 'fusion.pdf');
      expect(FileUtils.derivedName('   ', 'fusion'), 'fusion.pdf');
    });

    test('tronque les noms interminables sans perdre la tête du nom', () {
      // Les noms réels sont longs :
      // `2026-03-07_Facture_de_primes_n_20665240303.pdf`.
      final String long = '${'A' * 200}.pdf';
      final String out = FileUtils.derivedName(long, 'fusion');
      expect(out.length, lessThan(80));
      expect(out.startsWith('AAAA'), isTrue);
      expect(out.endsWith('-fusion.pdf'), isTrue);
    });
  });

  group('Catalogue d’outils', () {
    // Le catalogue se resout desormais dans une langue : il n'existe plus de
    // liste constante a interroger. Les tests passent donc par le francais,
    // qui est le modele et la seule langue dont les libelles sont assertes
    // nommement ici.
    final L fr = lookupL(const Locale('fr'));

    test('les vingt-quatre outils sont atteignables par la recherche', () {
      // La bande bento portait ses cinq outils en dur dans le `build` : une
      // recherche qui les ignorerait laisserait de cote les cinq plus utilises.
      final tools = ToolCatalog.of(fr).all;
      expect(tools.length, 24);
      expect(
        tools.map((t) => t.label).toSet().length,
        24,
        reason: 'deux outils portent le meme libelle',
      );
    });

    // Le catalogue est reconstruit par langue : un libelle oublie dans une
    // traduction, ou deux outils qui se retrouvent homonymes une fois traduits,
    // ne se verraient nulle part ailleurs qu'ici.
    test('chaque langue servie rend vingt-quatre outils distincts', () {
      for (final locale in kSupportedLocales) {
        final L l10n = lookupL(locale);
        final tools = ToolCatalog.of(l10n).all;
        expect(
          tools.length,
          24,
          reason: 'catalogue incomplet en ${locale.languageCode}',
        );
        expect(
          tools.map((t) => t.label).toSet().length,
          24,
          reason: 'deux outils homonymes en ${locale.languageCode}',
        );
        for (final tool in tools) {
          expect(
            tool.label.trim(),
            isNotEmpty,
            reason: 'libelle vide en ${locale.languageCode}',
          );
          expect(
            tool.section.trim(),
            isNotEmpty,
            reason:
                '${tool.label} n’a pas de famille en '
                '${locale.languageCode}',
          );
          expect(
            tool.keywords.trim(),
            isNotEmpty,
            reason:
                '${tool.label} n’a aucun mot-cle en '
                '${locale.languageCode} : il ne sera trouvable que par son nom',
          );
        }
      }
    });

    test('une requete vide rend tout le catalogue', () {
      final tools = ToolCatalog.of(fr).all;
      expect(tools.where((t) => t.matches('')).length, tools.length);
    });

    // Le point de la recherche : trouver un outil avec les mots qu'on a en
    // tete, pas avec ceux que l'application a choisis.
    test('trouve un outil par un mot qui n’est pas dans son libelle', () {
      List<String> hits(String q) => ToolCatalog.of(
        fr,
      ).all.where((t) => t.matches(q)).map((t) => t.label).toList();

      expect(hits('cadenas'), contains('Protéger PDF'));
      expect(hits('signature'), contains('Signer'));
      expect(hits('watermark'), contains('Filigrane'));
      expect(hits('tableur'), contains('PDF vers Excel'));
      expect(hits('assembler'), contains('Fusionner'));
      expect(hits('diviser'), contains('Organiser un PDF'));
    });

    test('la recherche ignore accents et casse', () {
      final tools = ToolCatalog.of(fr).all;
      expect(
        tools.where((t) => t.matches('proteger')).map((t) => t.label),
        contains('Protéger PDF'),
      );
      expect(
        tools.where((t) => t.matches('SÉCURITÉ')).map((t) => t.label),
        contains('Réparer PDF'),
      );
    });

    // Le repli couvrait le seul francais. Une recherche polonaise ou tcheque
    // tapee sans signes diacritiques — ce que produit un clavier presse — ne
    // trouvait rien.
    test('le repli des diacritiques couvre le latin etendu', () {
      expect(foldDiacritics('Złóż'), 'zloz');
      expect(foldDiacritics('Převést'), 'prevest');
      expect(foldDiacritics('Összefűz'), 'osszefuz');
      expect(foldDiacritics('Birłeştir'), 'birlestir');
      expect(foldDiacritics('Aprākstīt'), 'aprakstit');
      expect(foldDiacritics('Größe'), 'grosse');
    });

    test('une requete sans correspondance ne rend rien', () {
      expect(ToolCatalog.of(fr).all.where((t) => t.matches('zzzz')), isEmpty);
    });
  });
}
