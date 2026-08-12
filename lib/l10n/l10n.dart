import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../core/office/pdf_to_pptx.dart';
import '../core/pdf/compressor.dart';
import '../core/pdf/image_export_engine.dart';
import 'gen/app_localizations.dart';

export 'gen/app_localizations.dart';

/// Accès court aux libellés traduits, sur le modèle de `context.colors`.
///
/// `context.l10n.actionSave` plutôt que `L.of(context).actionSave`. Le
/// raccourci compte pour la même raison que celui des couleurs : plus l'accès
/// est court, moins la tentation d'écrire une chaîne en dur est forte — et une
/// chaîne en dur, ici, c'est un écran qui reste en français dans les
/// vingt-quatre autres langues.
extension AppL10nContext on BuildContext {
  L get l10n => L.of(this);
}

/// Les libellés des niveaux de compression.
///
/// Ils vivaient dans `Compressor`, c'est-à-dire dans le moteur qui rastérise
/// les pages. Un moteur n'a pas à savoir dans quelle langue on l'affiche, et
/// tant qu'il le savait, ses trois libellés échappaient à la traduction.
extension CompressionLevelL10n on CompressionLevel {
  String label(L l10n) => switch (this) {
    CompressionLevel.light => l10n.compressLevelLight,
    CompressionLevel.medium => l10n.compressLevelMedium,
    CompressionLevel.strong => l10n.compressLevelStrong,
  };
}

/// Les libellés des résolutions d'export PowerPoint. Même raison que
/// ci-dessus : ils vivaient sur l'énumération du convertisseur.
extension PptxQualityL10n on PptxQuality {
  String label(L l10n) => switch (this) {
    PptxQuality.standard => l10n.pptxQualityStandard,
    PptxQuality.high => l10n.pptxQualityHigh,
  };
}

/// Les libellés des résolutions d'export en images. Même raison que ci-dessus.
extension ImageExportQualityL10n on ImageExportQuality {
  String label(L l10n) => switch (this) {
    ImageExportQuality.web => l10n.imageQualityWeb,
    ImageExportQuality.standard => l10n.imageQualityStandard,
    ImageExportQuality.high => l10n.imageQualityHigh,
  };
}

/// Le poids d'un fichier, écrit dans la langue et les conventions de [l10n].
///
/// Deux choses varient et non une seule. L'abréviation d'abord — « Ko » en
/// français, « KB » ailleurs — mais aussi le **séparateur décimal** : la même
/// valeur s'écrit « 1,20 Mo » en français, en allemand et en polonais, et
/// « 1.20 MB » en anglais. `toStringAsFixed`, qui produisait ces chaînes
/// jusqu'ici, ne connaît que le point ; un utilisateur allemand y lisait donc
/// un séparateur de milliers.
///
/// Le seuil est à un mébioctet : en dessous, les décimales n'apprennent rien
/// et le nombre entier se lit mieux.
///
/// Trois écrans portaient chacun leur copie de cette fonction, dont deux
/// s'accordaient sur deux décimales et la troisième sur une seule.
String formatFileSize(L l10n, int bytes) {
  final String locale = Intl.getCurrentLocale();
  if (bytes < 1024) return l10n.sizeBytes('$bytes');
  if (bytes < 1024 * 1024) {
    return l10n.sizeKb(
      NumberFormat.decimalPatternDigits(
        locale: locale,
        decimalDigits: 0,
      ).format(bytes / 1024),
    );
  }
  return l10n.sizeMb(
    NumberFormat.decimalPatternDigits(
      locale: locale,
      decimalDigits: 2,
    ).format(bytes / (1024 * 1024)),
  );
}

/// Les langues servies.
///
/// **Elle est dérivée et non écrite à la main**, et c'est la seule forme sûre.
/// Une liste saisie à part de `L.supportedLocales` peut annoncer une langue
/// dont le fichier `.arb` n'existe pas encore ; la résolution de `MaterialApp`
/// la retiendrait, le délégué refuserait de la charger, `L.of` rendrait nul et
/// l'application planterait au démarrage — sur les appareils mêmes qu'on
/// croyait servir. Le décalage entre les deux listes ne se voit pas à la
/// compilation. Ici il ne peut pas exister.
///
/// Le périmètre visé reste les vingt-cinq langues que le sous-ensemble des
/// fontes embarquées sait composer : Inter et Plus Jakarta Sans sont livrées
/// sous-ensemblées au latin étendu-A, et y ajouter le russe, l'arabe ou le
/// japonais ferait tomber ces écrans sur la fonte système. Ajouter une langue
/// se fait donc en déposant `lib/l10n/app_xx.arb` — jamais en touchant à cette
/// liste. Le test `test/l10n_coverage_test.dart` vérifie ensuite glyphe par
/// glyphe que chaque caractère employé existe dans les fontes.
List<Locale> get kSupportedLocales => L.supportedLocales;

/// Les langues dont l'écriture n'est **pas** dans les fontes embarquées, et
/// qui sont donc composées par la pile de repli d'Android — Roboto, puis la
/// famille Noto installée sur l'appareil.
///
/// **Ce n'est pas une avarie, c'est un arbitrage, et il est ici pour être
/// relu.** Inter et Plus Jakarta Sans sont livrées sous-ensemblées : 636 et
/// 471 glyphes, 432 Ko à elles sept. Embarquer le cyrillique coûterait
/// quelques dizaines de kilo-octets ; embarquer une écriture idéographique en
/// coûterait plusieurs millions, par graisse. Aucune application ne fait cela
/// pour tout le monde : on livre soit un repli système, soit un lot d'assets
/// conditionné à la langue de l'appareil.
///
/// Ce qui se perd est réel mais étroit : la signature typographique de
/// l'application sur ces écrans. Ce qui ne se perd pas : le texte s'affiche,
/// il est lisible, et l'utilisateur concerné ne voit aucune incohérence
/// puisqu'il ne compare pas deux langues.
///
/// Ce qui s'y gagne : la langue existe. Une application absente d'un marché
/// est bien plus mal servie qu'une application au titrage un peu différent.
///
/// Toute langue ajoutée ici doit l'être **sciemment** : le test
/// `test/l10n_coverage_test.dart` refuse un glyphe manquant dans toute langue
/// qui n'y figure pas, et refuse une entrée superflue dans celles qui sont
/// entièrement couvertes.
const Set<String> kSystemFallbackLanguages = <String>{
  // Cyrillique. Inter le porte en amont : un re-sous-ensemblage suffirait pour
  // le corps de texte, mais Plus Jakarta Sans ne le porte pas et c'est elle
  // qui compose les titres.
  'ru', 'uk', 'bg', 'sr',
  // Grec. Même situation qu'au-dessus.
  'el',
  // Latin étendu additionnel — les voyelles vietnamiennes à double signe
  // manquent au sous-ensemble.
  'vi',
  // Écritures qu'aucune des deux familles ne porte, ni ne portera.
  'zh', 'ja', 'ko', 'hi', 'bn', 'ta', 'te', 'th', 'he',
};
