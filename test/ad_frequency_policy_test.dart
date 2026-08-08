import 'package:flutter_test/flutter_test.dart';

import 'package:trombone/core/ads/ad_frequency_policy.dart';

/// La règle de fréquence est la seule chose qui sépare une régie supportable
/// d'une régie qui coûte des étoiles. Sur les 1 888 avis dépouillés, aucun avis
/// négatif ne reproche une publicité *après* un export réussi ; 53 % de ceux
/// qui citent la publicité disent « sans arrêt / à chaque action ». Ces tests
/// vérifient qu'aucun réglage ne peut reproduire ce motif.
void main() {
  // Un instant fixe : la politique prend l'heure en paramètre précisément pour
  // que les tests n'aient pas à dépendre de l'horloge.
  final DateTime t0 = DateTime(2026, 8, 8, 14, 0);

  AdFrequencyPolicy fresh({
    Duration interval = const Duration(minutes: 3),
    int cap = 2,
    bool skipFirst = true,
    bool alreadyExported = true,
  }) {
    final p = AdFrequencyPolicy(
      minInterval: interval,
      maxPerSession: cap,
      skipFirstEverExport: skipFirst,
    );
    p.hasExportedBefore = alreadyExported;
    return p;
  }

  group('Le tout premier export est épargné', () {
    test('aucune publicité au premier succès de la vie de l’application', () {
      final p = fresh(alreadyExported: false);
      expect(p.refusalFor(t0), AdRefusal.firstEverExport);
    });

    test('le deuxième export, lui, peut en porter une', () {
      final p = fresh(alreadyExported: false);
      expect(p.allows(t0), isFalse);
      p.recordExport(); // le premier export a eu lieu
      expect(p.allows(t0), isTrue);
    });

    test('c’est l’export qui consomme l’exemption, pas la publicité', () {
      // Sans cela, un premier export suivi d'un long silence garderait son
      // exemption indéfiniment et l'application ne montrerait jamais rien.
      final p = fresh(alreadyExported: false);
      p.recordExport();
      expect(p.hasExportedBefore, isTrue);
    });

    test('le drapeau est monotone : il se lève et ne retombe jamais', () {
      // `AdService.init()` est lancé sans être attendu au démarrage. Un export
      // peut aboutir avant que les préférences soient lues. Si la lecture
      // *assignait* le drapeau au lieu de le lever, elle rendrait l'exemption à
      // un utilisateur qui vient tout juste de l'épuiser.
      final p = fresh(alreadyExported: false);
      p.recordExport(); // export pendant que les préférences se chargent
      p.recordExport(); // la lecture arrive et ne doit rien annuler
      expect(p.hasExportedBefore, isTrue);
      expect(p.allows(t0), isTrue);
    });
  });

  group('Le plafond de session', () {
    test('deux publicités passent, la troisième non', () {
      final p = fresh();
      expect(p.allows(t0), isTrue);
      p.recordShown(t0);

      final t1 = t0.add(const Duration(minutes: 10));
      expect(p.allows(t1), isTrue);
      p.recordShown(t1);

      final t2 = t1.add(const Duration(minutes: 10));
      expect(p.refusalFor(t2), AdRefusal.sessionCapReached);
    });

    test('le plafond tient même après des heures d’utilisation', () {
      // C'est le cas que le seul délai de trois minutes laissait passer :
      // huit documents traités en une demi-heure donnaient huit publicités.
      final p = fresh();
      DateTime t = t0;
      int shown = 0;
      for (int i = 0; i < 20; i++) {
        if (p.allows(t)) {
          p.recordShown(t);
          shown++;
        }
        t = t.add(const Duration(minutes: 5));
      }
      expect(shown, 2, reason: 'le plafond de session n’a pas tenu');
    });
  });

  group('Le délai minimal', () {
    test('deux exports rapprochés ne valent qu’une publicité', () {
      // Enregistrer puis partager le même document, à quelques secondes
      // d'intervalle : un seul interstitiel.
      final p = fresh();
      p.recordShown(t0);
      final t1 = t0.add(const Duration(seconds: 20));
      expect(p.refusalFor(t1), AdRefusal.tooSoon);
    });

    test('passé le délai, la publicité est de nouveau permise', () {
      final p = fresh();
      p.recordShown(t0);
      expect(p.allows(t0.add(const Duration(minutes: 3))), isTrue);
    });

    test('la limite est franche à la seconde près', () {
      final p = fresh();
      p.recordShown(t0);
      expect(
        p.allows(t0.add(const Duration(minutes: 3) - Duration(seconds: 1))),
        isFalse,
      );
    });
  });

  group('Ordre des refus', () {
    test('l’exemption du premier export prime sur tout le reste', () {
      final p = fresh(alreadyExported: false);
      p.recordShown(t0); // même en ayant déjà « montré » quelque chose
      expect(p.refusalFor(t0), AdRefusal.firstEverExport);
    });
  });

  group('Le scénario réel du marché', () {
    test('un nouvel utilisateur qui traite six documents d’affilée ne voit '
        'jamais « une pub à chaque action »', () {
      // Le motif exact des avis à une étoile : « publicité à chaque click »,
      // « Bourée de pub vidéo à chaque découpe ».
      final p = fresh(alreadyExported: false);
      DateTime t = t0;
      int shown = 0;
      for (int i = 0; i < 6; i++) {
        if (p.allows(t)) {
          p.recordShown(t);
          shown++;
        }
        p.recordExport();
        t = t.add(const Duration(minutes: 4));
      }
      expect(
        shown,
        lessThanOrEqualTo(2),
        reason: 'six exports ont produit $shown publicités',
      );
    });
  });
}
