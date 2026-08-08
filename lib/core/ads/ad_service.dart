import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'ad_frequency_policy.dart';

/// ⚠️ IDENTIFIANTS DE DÉMONSTRATION — L'APPLICATION NE GAGNE RIEN ⚠️
///
/// `3940256099942544` est le compte éditeur public de Google, celui qui rend le
/// monstre rouge « This is an interstitial test ad ». Tant qu'il est ici,
/// chaque export rapporte **0 €**.
///
/// À remplacer par le bloc annonce interstitiel du compte AdMob réel — et
/// **aussi** par l'App ID dans `android/app/src/main/AndroidManifest.xml`
/// (`com.google.android.gms.ads.APPLICATION_ID`). Les deux, sinon l'application
/// refuse de démarrer ou ne sert rien.
const String kInterstitialAdUnitId = 'ca-app-pub-3940256099942544/1033173712';

/// Vrai tant que l'identifiant ci-dessus est celui de démonstration.
bool get kUsingTestAdUnit => kInterstitialAdUnitId.contains('3940256099942544');

/// La régie de l'application.
///
/// **Politique, inchangée sur le fond :** interstitiel uniquement, jamais avant
/// ni pendant un export, jamais de bannière dans les écrans d'édition, jamais
/// une fonctionnalité déverrouillée contre visionnage. La fréquence est confiée
/// à [AdFrequencyPolicy], qui porte le raisonnement et les chiffres.
///
/// **Ce que ce service ne fait pas :** il ne décide pas *quand* dans le
/// parcours. C'est `showExportSuccess` qui l'appelle, après que l'utilisateur a
/// acquitté sa confirmation d'export. Une publicité qui se lève avant la
/// confirmation détruit la confirmation — c'était le défaut observé sur
/// l'appareil.
class AdService {
  AdService._();
  static final AdService instance = AdService._();

  static const String _prefHasExported = 'ads.has_exported_before';

  final AdFrequencyPolicy policy = AdFrequencyPolicy();

  InterstitialAd? _ad;
  bool _loading = false;
  bool _initialized = false;

  Future<void> init() async {
    if (_initialized) return;
    _initialized = true;

    if (kUsingTestAdUnit) {
      debugPrint(
        'AdService : identifiant de DÉMONSTRATION actif — aucun revenu. '
        'Voir kInterstitialAdUnitId dans lib/core/ads/ad_service.dart.',
      );
    }

    // Un export antérieur, même d'une session précédente, consomme l'exemption
    // du premier succès. Une lecture ratée laisse simplement l'exemption en
    // place : au pire l'utilisateur voit une publicité de moins.
    //
    // Le drapeau est **levé, jamais assigné**. `init()` est lancé sans être
    // attendu au démarrage : un export peut très bien aboutir avant que les
    // préférences soient lues. Une assignation rendrait alors l'exemption à un
    // utilisateur qui vient de l'épuiser.
    try {
      final prefs = await SharedPreferences.getInstance();
      if (prefs.getBool(_prefHasExported) ?? false) {
        policy.recordExport();
      }
    } catch (e) {
      debugPrint('AdService : préférences illisibles ($e).');
    }

    await MobileAds.instance.initialize();
    _load();
  }

  void _load() {
    if (_loading || _ad != null) return;
    _loading = true;
    InterstitialAd.load(
      adUnitId: kInterstitialAdUnitId,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          _ad = ad;
          _loading = false;
        },
        onAdFailedToLoad: (error) {
          _ad = null;
          _loading = false;
        },
      ),
    );
  }

  /// À appeler après un export réussi **et acquitté**.
  ///
  /// Ne fait rien si la règle de fréquence s'y oppose, ou si aucune publicité
  /// n'a fini de charger : une impression manquée ne vaut jamais de retarder ou
  /// de bloquer l'utilisateur.
  Future<void> showAfterSuccessfulExport() async {
    final DateTime now = DateTime.now();
    final AdRefusal? refusal = policy.refusalFor(now);

    // L'export compte, que la publicité soit passée ou non.
    _rememberExport();

    if (refusal != null) {
      debugPrint('AdService : pas de publicité (${refusal.name}).');
      return;
    }

    final InterstitialAd? ad = _ad;
    if (ad == null) {
      _load();
      return;
    }
    _ad = null;
    ad.fullScreenContentCallback = FullScreenContentCallback(
      onAdDismissedFullScreenContent: (ad) {
        ad.dispose();
        _load();
      },
      onAdFailedToShowFullScreenContent: (ad, error) {
        ad.dispose();
        _load();
      },
    );
    policy.recordShown(now);
    await ad.show();
  }

  /// Note l'export en mémoire **tout de suite**, et persiste sans attendre.
  ///
  /// Rien dans le parcours ne dépend de cette écriture. L'attendre exposait
  /// l'utilisateur à une panne qui ne le concerne pas : si le stockage ne
  /// répond pas, `showAfterSuccessfulExport` ne rendait jamais la main, donc
  /// `showExportSuccess` non plus, donc le `finally` de l'écran appelant ne
  /// relâchait jamais son état occupé. L'écran restait figé après un export
  /// réussi — à cause de la comptabilité de la régie.
  ///
  /// Attrapé par le test d'ordonnancement de `export_outcome_test.dart`, où le
  /// canal de plateforme ne répond pas.
  void _rememberExport() {
    if (policy.hasExportedBefore) return;
    policy.recordExport();
    unawaited(_persistExported());
  }

  Future<void> _persistExported() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool(_prefHasExported, true);
    } catch (e) {
      debugPrint('AdService : préférences non enregistrables ($e).');
    }
  }
}
