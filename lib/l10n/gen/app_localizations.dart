import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_cs.dart';
import 'app_localizations_da.dart';
import 'app_localizations_de.dart';
import 'app_localizations_el.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fil.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_hr.dart';
import 'app_localizations_hu.dart';
import 'app_localizations_id.dart';
import 'app_localizations_it.dart';
import 'app_localizations_ja.dart';
import 'app_localizations_nb.dart';
import 'app_localizations_nl.dart';
import 'app_localizations_pl.dart';
import 'app_localizations_pt.dart';
import 'app_localizations_ro.dart';
import 'app_localizations_ru.dart';
import 'app_localizations_sk.dart';
import 'app_localizations_sl.dart';
import 'app_localizations_sv.dart';
import 'app_localizations_tr.dart';
import 'app_localizations_uk.dart';
import 'app_localizations_vi.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of L
/// returned by `L.of(context)`.
///
/// Applications need to include `L.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'gen/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: L.localizationsDelegates,
///   supportedLocales: L.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the L.supportedLocales
/// property.
abstract class L {
  L(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static L of(BuildContext context) {
    return Localizations.of<L>(context, L)!;
  }

  static const LocalizationsDelegate<L> delegate = _LDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('cs'),
    Locale('da'),
    Locale('de'),
    Locale('el'),
    Locale('en'),
    Locale('es'),
    Locale('fil'),
    Locale('fr'),
    Locale('hr'),
    Locale('hu'),
    Locale('id'),
    Locale('it'),
    Locale('ja'),
    Locale('nb'),
    Locale('nl'),
    Locale('pl'),
    Locale('pt'),
    Locale('ro'),
    Locale('ru'),
    Locale('sk'),
    Locale('sl'),
    Locale('sv'),
    Locale('tr'),
    Locale('uk'),
    Locale('vi'),
  ];

  /// Titre affiché par le sélecteur de tâches d'Android au-dessus de l'aperçu de l'application. La marque « Trombone » ne se traduit jamais ; seuls les mots-clés qui la suivent peuvent l'être.
  ///
  /// In fr, this message translates to:
  /// **'Trombone — PDF, Scan & Word'**
  String get appTitle;

  /// La signature de marque en haut de l'écran d'accueil. NE PAS TRADUIRE — c'est un nom propre, identique dans les vingt-cinq langues.
  ///
  /// In fr, this message translates to:
  /// **'Trombone'**
  String get appWordmark;

  /// Action principale de fin de parcours : écrire le fichier produit sur l'appareil. Bouton pleine largeur, doit tenir sur une ligne.
  ///
  /// In fr, this message translates to:
  /// **'Enregistrer'**
  String get actionSave;

  /// Ouvre la fenêtre de partage du système. Bouton de demi-largeur, doit tenir sur une ligne.
  ///
  /// In fr, this message translates to:
  /// **'Partager'**
  String get actionShare;

  /// Réduit le poids du PDF. Bouton de demi-largeur, doit tenir sur une ligne.
  ///
  /// In fr, this message translates to:
  /// **'Compresser'**
  String get actionCompress;

  /// Acquitte la feuille de confirmation d'export et sort de l'outil.
  ///
  /// In fr, this message translates to:
  /// **'Terminé'**
  String get actionDone;

  /// Interrompt une opération en cours dans la boîte de progression.
  ///
  /// In fr, this message translates to:
  /// **'Annuler'**
  String get actionCancel;

  /// Remplace le fichier choisi par un autre. Bouton texte étroit posé au bout d'une rangée — libellé court impératif.
  ///
  /// In fr, this message translates to:
  /// **'Changer'**
  String get actionChange;

  /// Libellé de repli du bouton d'un écran vide quand l'outil n'en propose pas de plus précis.
  ///
  /// In fr, this message translates to:
  /// **'Continuer'**
  String get actionContinue;

  /// État transitoire d'un bouton pendant que la boîte de sélection de fichiers du système s'ouvre. Garder le caractère de suspension final.
  ///
  /// In fr, this message translates to:
  /// **'Ouverture…'**
  String get actionOpening;

  /// Info-bulle de la croix qui ramène l'écran à son état vide.
  ///
  /// In fr, this message translates to:
  /// **'Retirer ce fichier'**
  String get actionRemoveFile;

  /// Affiché sous la barre de progression tant que le travail total n'est pas connu. Garder le caractère de suspension final.
  ///
  /// In fr, this message translates to:
  /// **'Préparation…'**
  String get progressPreparing;

  /// Avancement en pourcentage. L'espace avant le signe % est une convention française ; les langues qui collent le signe au chiffre doivent écrire « {percent}% ».
  ///
  /// In fr, this message translates to:
  /// **'{percent} %'**
  String progressPercent(int percent);

  /// Note verte sous le bouton d'un écran vide. Répond à la peur du marché : découvrir un paiement au moment d'enregistrer. Doit rester une phrase brève, tenant sur une à deux lignes.
  ///
  /// In fr, this message translates to:
  /// **'Export gratuit, sans filigrane ni limite.'**
  String get emptyReassurance;

  /// Intitulé de la rangée de puces listant les formats que l'outil sait ouvrir.
  ///
  /// In fr, this message translates to:
  /// **'Formats acceptés'**
  String get emptyAcceptedFormats;

  /// Titre de la feuille de confirmation, après écriture réussie du fichier. Ton rassurant et affirmatif ; c'est le seul moment célébré de l'application.
  ///
  /// In fr, this message translates to:
  /// **'C’est enregistré.'**
  String get exportSavedTitle;

  /// Corps de la feuille de confirmation. Rappelle que rien n'est verrouillé derrière un paiement — la promesse centrale du produit.
  ///
  /// In fr, this message translates to:
  /// **'Sous le nom et dans le dossier que vous venez de choisir. Sans filigrane, sans limite, rien à débloquer.'**
  String get exportSavedBody;

  /// Titre de la boîte système d'enregistrement de fichier.
  ///
  /// In fr, this message translates to:
  /// **'Enregistrer le PDF'**
  String get exportSaveDialogTitle;

  /// Étiquette d'accessibilité d'une vignette de page retenue. Lue à voix haute, jamais affichée.
  ///
  /// In fr, this message translates to:
  /// **'Page {number}, incluse. Toucher pour l’écarter.'**
  String pageTileIncluded(int number);

  /// Étiquette d'accessibilité d'une vignette de page écartée. Lue à voix haute, jamais affichée.
  ///
  /// In fr, this message translates to:
  /// **'Page {number}, écartée. Toucher pour l’inclure.'**
  String pageTileExcluded(int number);

  /// Info-bulle du bouton de rotation sous une vignette de page.
  ///
  /// In fr, this message translates to:
  /// **'Pivoter la page {number}'**
  String pageTileRotate(int number);

  /// Étiquette d'accessibilité d'un en-tête de section de l'accueil. Lue à voix haute, jamais affichée.
  ///
  /// In fr, this message translates to:
  /// **'{title}, {count, plural, one{{count} outil} other{{count} outils}}'**
  String sectionHeaderSemantics(String title, int count);

  /// Décompte des outils, au colophon de l'accueil. Le nombre est calculé depuis le catalogue, jamais saisi.
  ///
  /// In fr, this message translates to:
  /// **'{count, plural, one{{count} outil} other{{count} outils}}'**
  String toolCount(int count);

  /// La promesse sous la marque, en haut de l'accueil. Elle désamorce la peur relevée dans les avis du marché : découvrir un paiement obligatoire au moment d'enregistrer. Le saut de ligne est intentionnel — deux lignes exactement, la seconde plus courte que la première.
  ///
  /// In fr, this message translates to:
  /// **'Faites votre document, exportez-le.\nAucun mur à la fin.'**
  String get homePromise;

  /// Puce de garantie : aucune inscription n'est demandée. Deux ou trois mots maximum, la puce est étroite.
  ///
  /// In fr, this message translates to:
  /// **'Sans compte'**
  String get homeChipNoAccount;

  /// Puce de garantie : les fichiers exportés ne portent aucune marque apposée. Deux ou trois mots maximum.
  ///
  /// In fr, this message translates to:
  /// **'Sans filigrane'**
  String get homeChipNoWatermark;

  /// Puce de garantie : aucun quota sur le nombre d'exports. Deux ou trois mots maximum.
  ///
  /// In fr, this message translates to:
  /// **'Export illimité'**
  String get homeChipUnlimited;

  /// Info-bulle de la loupe épinglée à la barre de titre de l'accueil.
  ///
  /// In fr, this message translates to:
  /// **'Rechercher un outil'**
  String get homeSearchTooltip;

  /// Texte de pied d'accueil, sous le décompte des outils. Répète la promesse en toutes lettres.
  ///
  /// In fr, this message translates to:
  /// **'Rien ne se débloque contre paiement au moment d’enregistrer. L’export est gratuit, sans filigrane et sans limite de nombre.'**
  String get homeColophon;

  /// Famille des cinq outils mis en avant dans la bande bento. Apparaît en sous-titre des résultats de recherche. Court.
  ///
  /// In fr, this message translates to:
  /// **'À la une'**
  String get sectionFeatured;

  /// Famille des outils qui produisent un PDF depuis un autre format. Titre de section de l'accueil : doit tenir sur une ligne à côté d'un filet et d'une pastille de compte.
  ///
  /// In fr, this message translates to:
  /// **'Vers le PDF'**
  String get sectionToPdf;

  /// Famille des outils qui tirent autre chose d'un PDF. Titre de section : doit tenir sur une ligne.
  ///
  /// In fr, this message translates to:
  /// **'Depuis le PDF'**
  String get sectionFromPdf;

  /// Famille des outils de protection, déverrouillage, réparation et caviardage. Titre de section : doit tenir sur une ligne.
  ///
  /// In fr, this message translates to:
  /// **'Sécurité'**
  String get sectionSecurity;

  /// Famille des outils qui modifient un PDF en place. Titre de section, verbe à l'infinitif : doit tenir sur une ligne.
  ///
  /// In fr, this message translates to:
  /// **'Éditer'**
  String get sectionEdit;

  /// Outil : réunit plusieurs documents en un seul PDF. Libellé de tuile — verbe à l'infinitif, court, il s'affiche sur une tuile de 96 dp de large.
  ///
  /// In fr, this message translates to:
  /// **'Fusionner'**
  String get toolMerge;

  /// Mots que l'utilisateur peut taper pour trouver l'outil « Fusionner » sans en connaître le nom exact. Séparés par des espaces, sans accents ni ponctuation, en minuscules. Ce ne sont PAS des traductions mot à mot : donnez les synonymes naturels de votre langue, y compris les termes empruntés à l'anglais s'ils sont d'usage courant. Ajoutez-en ou retirez-en librement.
  ///
  /// In fr, this message translates to:
  /// **'assembler combiner joindre regrouper reunir concatener'**
  String get toolMergeKeywords;

  /// Sous-titre du grand bloc bento de l'accueil. Une ligne descriptive, deux au plus.
  ///
  /// In fr, this message translates to:
  /// **'PDF, Word, images et texte en un seul document'**
  String get toolMergeSubtitle;

  /// Outil : intercale deux scans — les pages impaires et les pages paires — pour reconstituer un document imprimé des deux côtés. Libellé de tuile, court.
  ///
  /// In fr, this message translates to:
  /// **'Recto-verso'**
  String get toolRectoVerso;

  /// Mots de recherche pour « Recto-verso ». Séparés par des espaces, sans accents, en minuscules. Donnez les synonymes naturels de votre langue plutôt qu'une traduction mot à mot.
  ///
  /// In fr, this message translates to:
  /// **'double face intercaler scan pair impair'**
  String get toolRectoVersoKeywords;

  /// Sous-titre d'un bloc bento moyen. Très court — une ligne, six mots au plus.
  ///
  /// In fr, this message translates to:
  /// **'Deux scans, remis dans l’ordre'**
  String get toolRectoVersoSubtitle;

  /// Outil : assemble des photos en un PDF. Libellé de tuile, court.
  ///
  /// In fr, this message translates to:
  /// **'Images vers PDF'**
  String get toolImagesToPdf;

  /// Mots de recherche pour « Images vers PDF ». Séparés par des espaces, sans accents, en minuscules.
  ///
  /// In fr, this message translates to:
  /// **'photo jpg jpeg png photos album appareil'**
  String get toolImagesToPdfKeywords;

  /// Sous-titre d'un bloc bento moyen. Très court — une ligne, six mots au plus.
  ///
  /// In fr, this message translates to:
  /// **'Photos et captures en un document'**
  String get toolImagesToPdfSubtitle;

  /// Outil : convertit un PDF en document Word modifiable. « Word » est une marque, elle ne se traduit pas. Libellé de tuile, court.
  ///
  /// In fr, this message translates to:
  /// **'PDF vers Word'**
  String get toolPdfToWord;

  /// Mots de recherche pour « PDF vers Word ». Séparés par des espaces, sans accents, en minuscules.
  ///
  /// In fr, this message translates to:
  /// **'docx traitement de texte editable convertir'**
  String get toolPdfToWordKeywords;

  /// Sous-titre d'un bloc bento moyen. Très court — une ligne, six mots au plus.
  ///
  /// In fr, this message translates to:
  /// **'Texte et tableaux, modifiables'**
  String get toolPdfToWordSubtitle;

  /// Outil : réordonne, extrait, divise et supprime des pages. Libellé de tuile, court.
  ///
  /// In fr, this message translates to:
  /// **'Organiser un PDF'**
  String get toolOrganize;

  /// Mots de recherche pour « Organiser un PDF ». Séparés par des espaces, sans accents, en minuscules.
  ///
  /// In fr, this message translates to:
  /// **'diviser separer extraire reordonner ordre pages supprimer'**
  String get toolOrganizeKeywords;

  /// Sous-titre d'un bloc bento moyen. Très court — trois verbes à l'infinitif.
  ///
  /// In fr, this message translates to:
  /// **'Diviser, extraire, réordonner'**
  String get toolOrganizeSubtitle;

  /// Outil : convertit un classeur en PDF. « Excel » est une marque, elle ne se traduit pas. Libellé de tuile, court.
  ///
  /// In fr, this message translates to:
  /// **'Excel vers PDF'**
  String get toolExcelToPdf;

  /// Mots de recherche pour « Excel vers PDF ». Séparés par des espaces, sans accents, en minuscules.
  ///
  /// In fr, this message translates to:
  /// **'tableur xlsx classeur feuille calcul'**
  String get toolExcelToPdfKeywords;

  /// Outil : convertit une présentation en PDF. « PowerPoint » est une marque, elle ne se traduit pas. Libellé de tuile.
  ///
  /// In fr, this message translates to:
  /// **'PowerPoint vers PDF'**
  String get toolPptxToPdf;

  /// Mots de recherche pour « PowerPoint vers PDF ». Séparés par des espaces, sans accents, en minuscules.
  ///
  /// In fr, this message translates to:
  /// **'pptx diapositive presentation slides'**
  String get toolPptxToPdfKeywords;

  /// Outil : enregistre une page web en PDF depuis son adresse. Libellé de tuile, court.
  ///
  /// In fr, this message translates to:
  /// **'Page web vers PDF'**
  String get toolHtmlToPdf;

  /// Mots de recherche pour « Page web vers PDF ». Séparés par des espaces, sans accents, en minuscules.
  ///
  /// In fr, this message translates to:
  /// **'html site internet url lien article'**
  String get toolHtmlToPdfKeywords;

  /// Outil : photographie des pages avec l'appareil et les redresse en PDF. Libellé de tuile, court.
  ///
  /// In fr, this message translates to:
  /// **'Scanner un document'**
  String get toolScan;

  /// Mots de recherche pour « Scanner un document ». Séparés par des espaces, sans accents, en minuscules.
  ///
  /// In fr, this message translates to:
  /// **'camera photo numeriser scan appareil papier'**
  String get toolScanKeywords;

  /// Outil : extrait les tableaux d'un PDF vers un classeur. « Excel » est une marque. Libellé de tuile, court.
  ///
  /// In fr, this message translates to:
  /// **'PDF vers Excel'**
  String get toolPdfToExcel;

  /// Mots de recherche pour « PDF vers Excel ». Séparés par des espaces, sans accents, en minuscules.
  ///
  /// In fr, this message translates to:
  /// **'tableur xlsx tableau extraire donnees'**
  String get toolPdfToExcelKeywords;

  /// Outil : transforme chaque page en diapositive. « PowerPoint » est une marque. Libellé de tuile.
  ///
  /// In fr, this message translates to:
  /// **'PDF vers PowerPoint'**
  String get toolPdfToPptx;

  /// Mots de recherche pour « PDF vers PowerPoint ». Séparés par des espaces, sans accents, en minuscules.
  ///
  /// In fr, this message translates to:
  /// **'pptx diapositive presentation slides'**
  String get toolPdfToPptxKeywords;

  /// Outil : exporte chaque page en fichier image. Libellé de tuile, court.
  ///
  /// In fr, this message translates to:
  /// **'PDF vers Images'**
  String get toolPdfToImages;

  /// Mots de recherche pour « PDF vers Images ». Séparés par des espaces, sans accents, en minuscules.
  ///
  /// In fr, this message translates to:
  /// **'jpg png photo exporter capture'**
  String get toolPdfToImagesKeywords;

  /// Outil : reconnaît les caractères d'un PDF scanné pour le rendre sélectionnable. « OCR » est un sigle international, à conserver tel quel entre parenthèses. Libellé de tuile.
  ///
  /// In fr, this message translates to:
  /// **'Texte recherchable (OCR)'**
  String get toolOcr;

  /// Mots de recherche pour « Texte recherchable (OCR) ». Séparés par des espaces, sans accents, en minuscules.
  ///
  /// In fr, this message translates to:
  /// **'reconnaissance caracteres scanne copier selectionner'**
  String get toolOcrKeywords;

  /// Outil : produit la variante normalisée d'archivage. « PDF/A » est une norme ISO, à conserver telle quelle. Libellé de tuile.
  ///
  /// In fr, this message translates to:
  /// **'Convertir en PDF/A'**
  String get toolPdfA;

  /// Mots de recherche pour « Convertir en PDF/A ». Séparés par des espaces, sans accents, en minuscules.
  ///
  /// In fr, this message translates to:
  /// **'archivage norme long terme conservation'**
  String get toolPdfAKeywords;

  /// Outil : chiffre le document derrière un mot de passe. Libellé de tuile, court.
  ///
  /// In fr, this message translates to:
  /// **'Protéger PDF'**
  String get toolProtect;

  /// Mots de recherche pour « Protéger PDF ». Séparés par des espaces, sans accents, en minuscules.
  ///
  /// In fr, this message translates to:
  /// **'mot de passe cadenas chiffrer verrouiller securiser'**
  String get toolProtectKeywords;

  /// Outil : retire le mot de passe d'un PDF dont on connaît le mot de passe. Libellé de tuile, court.
  ///
  /// In fr, this message translates to:
  /// **'Déverrouiller PDF'**
  String get toolUnlock;

  /// Mots de recherche pour « Déverrouiller PDF ». Séparés par des espaces, sans accents, en minuscules.
  ///
  /// In fr, this message translates to:
  /// **'retirer mot de passe ouvrir dechiffrer debloquer cadenas'**
  String get toolUnlockKeywords;

  /// Outil : récupère ce qui peut l'être d'un fichier endommagé. Libellé de tuile, court.
  ///
  /// In fr, this message translates to:
  /// **'Réparer PDF'**
  String get toolRepair;

  /// Mots de recherche pour « Réparer PDF ». Séparés par des espaces, sans accents, en minuscules.
  ///
  /// In fr, this message translates to:
  /// **'corrompu illisible endommage recuperer erreur'**
  String get toolRepairKeywords;

  /// Outil : recouvre définitivement des zones du document pour anonymiser. Le terme métier consacré en français est « caviarder » ; employez l'équivalent consacré de votre langue (anglais : redact). Libellé de tuile.
  ///
  /// In fr, this message translates to:
  /// **'Caviarder un PDF'**
  String get toolRedact;

  /// Mots de recherche pour « Caviarder un PDF ». Séparés par des espaces, sans accents, en minuscules.
  ///
  /// In fr, this message translates to:
  /// **'masquer noircir anonymiser confidentiel effacer'**
  String get toolRedactKeywords;

  /// Outil : ajoute ou corrige du texte sur les pages. Libellé de tuile, court.
  ///
  /// In fr, this message translates to:
  /// **'Éditer PDF'**
  String get toolEdit;

  /// Mots de recherche pour « Éditer PDF ». Séparés par des espaces, sans accents, en minuscules.
  ///
  /// In fr, this message translates to:
  /// **'texte modifier corriger annoter ecrire'**
  String get toolEditKeywords;

  /// Outil : appose une signature tracée au doigt. Libellé de tuile, un seul verbe.
  ///
  /// In fr, this message translates to:
  /// **'Signer'**
  String get toolSign;

  /// Mots de recherche pour « Signer ». Séparés par des espaces, sans accents, en minuscules.
  ///
  /// In fr, this message translates to:
  /// **'signature paraphe contrat main'**
  String get toolSignKeywords;

  /// Outil : appose une mention en travers des pages (« CONFIDENTIEL », « BROUILLON »). Libellé de tuile, un seul mot si possible.
  ///
  /// In fr, this message translates to:
  /// **'Filigrane'**
  String get toolWatermark;

  /// Mots de recherche pour « Filigrane ». Séparés par des espaces, sans accents, en minuscules. Gardez « watermark » : le terme anglais est cherché dans toutes les langues.
  ///
  /// In fr, this message translates to:
  /// **'watermark tampon confidentiel brouillon marque'**
  String get toolWatermarkKeywords;

  /// Outil : appose une pagination. Libellé de tuile, court.
  ///
  /// In fr, this message translates to:
  /// **'Numéros de page'**
  String get toolPageNumbers;

  /// Mots de recherche pour « Numéros de page ». Séparés par des espaces, sans accents, en minuscules.
  ///
  /// In fr, this message translates to:
  /// **'pagination folio numeroter chiffres'**
  String get toolPageNumbersKeywords;

  /// Outil : recadre les pages en retirant les marges. Libellé de tuile, court.
  ///
  /// In fr, this message translates to:
  /// **'Rogner un PDF'**
  String get toolCrop;

  /// Mots de recherche pour « Rogner un PDF ». Séparés par des espaces, sans accents, en minuscules.
  ///
  /// In fr, this message translates to:
  /// **'couper marges recadrer bords taille'**
  String get toolCropKeywords;

  /// Outil : met deux versions face à face et signale ce qui change. Libellé de tuile, court.
  ///
  /// In fr, this message translates to:
  /// **'Comparer PDF'**
  String get toolCompare;

  /// Mots de recherche pour « Comparer PDF ». Séparés par des espaces, sans accents, en minuscules.
  ///
  /// In fr, this message translates to:
  /// **'difference versions diff changements'**
  String get toolCompareKeywords;

  /// Texte d'invite du champ de recherche. Trois exemples de requêtes séparés par des virgules, suivis d'un caractère de suspension. Choisissez trois exemples naturels dans votre langue plutôt qu'une traduction littérale.
  ///
  /// In fr, this message translates to:
  /// **'Fusionner, mot de passe, filigrane…'**
  String get searchHint;

  /// Info-bulle de la croix qui vide le champ de recherche.
  ///
  /// In fr, this message translates to:
  /// **'Effacer'**
  String get searchClear;

  /// Titre affiché quand aucun outil ne correspond. Les guillemets français « » doivent être remplacés par ceux de votre langue.
  ///
  /// In fr, this message translates to:
  /// **'Aucun outil pour « {query} ».'**
  String searchNoResultTitle(String query);

  /// Conseil affiché sous le titre d'absence de résultat. Les exemples entre guillemets doivent être adaptés à votre langue, pas traduits littéralement. Employez les guillemets de votre langue.
  ///
  /// In fr, this message translates to:
  /// **'Essayez le format que vous avez sous la main — « Word », « Excel », « photo » — ou ce que vous voulez en faire : « signer », « diviser », « mot de passe ».'**
  String get searchNoResultBody;

  /// Défait la dernière action — retrait d'un fichier, compression appliquée. ATTENTION : ce n'est PAS « interrompre » (voir actionCancel). Le français emploie le même mot pour les deux, la plupart des langues non : anglais « Undo » contre « Cancel », allemand « Rückgängig » contre « Abbrechen ».
  ///
  /// In fr, this message translates to:
  /// **'Annuler'**
  String get actionUndo;

  /// Valide le réglage choisi et l'applique au document.
  ///
  /// In fr, this message translates to:
  /// **'Appliquer'**
  String get actionApply;

  /// Ouvre la boîte de sélection de fichiers du système. Libellé court, souvent au bout d'une rangée étroite.
  ///
  /// In fr, this message translates to:
  /// **'Choisir'**
  String get actionChoose;

  /// Bouton principal d'un écran vide dont l'outil ne travaille que sur des PDF.
  ///
  /// In fr, this message translates to:
  /// **'Choisir un PDF'**
  String get actionChoosePdf;

  /// Bouton principal d'un écran vide dont l'outil accepte plusieurs fichiers à la fois.
  ///
  /// In fr, this message translates to:
  /// **'Choisir des fichiers'**
  String get actionChooseFiles;

  /// Lance la conversion. Bouton pleine largeur en bas d'écran.
  ///
  /// In fr, this message translates to:
  /// **'Convertir'**
  String get actionConvert;

  /// Clôt une capture en plusieurs pages et passe à la suite.
  ///
  /// In fr, this message translates to:
  /// **'Terminer'**
  String get actionFinish;

  /// Info-bulle de la flèche qui remonte d'un écran.
  ///
  /// In fr, this message translates to:
  /// **'Retour'**
  String get actionBack;

  /// Ajoute un élément à une liste. Libellé court.
  ///
  /// In fr, this message translates to:
  /// **'Ajouter'**
  String get actionAdd;

  /// Sous-titre d'une rangée tant qu'aucun fichier n'a été retenu.
  ///
  /// In fr, this message translates to:
  /// **'Aucun fichier choisi'**
  String get noFileChosen;

  /// Bandeau d'erreur quand l'écriture du fichier échoue. {detail} est un message technique non traduit, rendu tel quel.
  ///
  /// In fr, this message translates to:
  /// **'Échec de l’export : {detail}'**
  String errorExportFailed(String detail);

  /// Bandeau d'erreur quand la fenêtre de partage échoue. {detail} est un message technique non traduit.
  ///
  /// In fr, this message translates to:
  /// **'Échec du partage : {detail}'**
  String errorShareFailed(String detail);

  /// Bandeau d'erreur quand le fichier choisi ne peut pas être lu. {detail} est un message technique non traduit.
  ///
  /// In fr, this message translates to:
  /// **'Impossible d’ouvrir le fichier : {detail}'**
  String errorOpenFailed(String detail);

  /// Bandeau d'erreur quand une conversion de format échoue. {detail} est un message technique non traduit.
  ///
  /// In fr, this message translates to:
  /// **'Échec de la conversion : {detail}'**
  String errorConversionFailed(String detail);

  /// Bandeau d'erreur rattaché à un fichier précis d'une sélection multiple. Ne traduire que la ponctuation de séparation si votre langue en emploie une autre.
  ///
  /// In fr, this message translates to:
  /// **'{name} : {detail}'**
  String errorOnFile(String name, String detail);

  /// Bandeau d'erreur quand l'outil exige un PDF et qu'on lui a donné autre chose.
  ///
  /// In fr, this message translates to:
  /// **'Veuillez choisir un fichier PDF.'**
  String get errorPickPdf;

  /// Poids d'un fichier en octets. L'abréviation est « o » en français, « B » en anglais — employez celle de votre langue.
  ///
  /// In fr, this message translates to:
  /// **'{value} o'**
  String sizeBytes(String value);

  /// Poids d'un fichier en kilo-octets. L'abréviation est « Ko » en français, « KB » en anglais et dans la plupart des langues — employez celle de la vôtre.
  ///
  /// In fr, this message translates to:
  /// **'{value} Ko'**
  String sizeKb(String value);

  /// Poids d'un fichier en méga-octets. L'abréviation est « Mo » en français, « MB » en anglais et dans la plupart des langues — employez celle de la vôtre.
  ///
  /// In fr, this message translates to:
  /// **'{value} Mo'**
  String sizeMb(String value);

  /// Taille estimée, précédée du signe « environ ». {size} est déjà formaté (« 240 Ko »). Le tilde et non le signe ≈ : ce dernier manque au sous-ensemble des fontes embarquées. Voir test/l10n_coverage_test.dart.
  ///
  /// In fr, this message translates to:
  /// **'~ {size}'**
  String sizeApprox(String size);

  /// Décompte de pages. Employez les formes plurielles de votre langue — le polonais, le tchèque, le lituanien et le letton en ont plus de deux.
  ///
  /// In fr, this message translates to:
  /// **'{count, plural, one{{count} page} other{{count} pages}}'**
  String pageCount(int count);

  /// Décompte partiel : combien de pages sont retenues sur combien au total. Affiché seulement quand on en a écarté ; « 3 pages sur 3 » n'apparaît jamais.
  ///
  /// In fr, this message translates to:
  /// **'{kept, plural, one{{kept} page} other{{kept} pages}} sur {total}'**
  String pageCountOfTotal(int kept, int total);

  /// Titre de la visionneuse plein écran : quelle page on regarde, sur combien.
  ///
  /// In fr, this message translates to:
  /// **'Page {current} sur {total}'**
  String pageOfTotal(int current, int total);

  /// Puce de format acceptable. Sigle international, à conserver tel quel dans toutes les langues.
  ///
  /// In fr, this message translates to:
  /// **'PDF'**
  String get formatPdf;

  /// Puce de format acceptable. Marque déposée, à conserver telle quelle.
  ///
  /// In fr, this message translates to:
  /// **'Word'**
  String get formatWord;

  /// Puce de format acceptable. Marque déposée, à conserver telle quelle.
  ///
  /// In fr, this message translates to:
  /// **'Excel'**
  String get formatExcel;

  /// Puce de format acceptable. Marque déposée, à conserver telle quelle.
  ///
  /// In fr, this message translates to:
  /// **'PowerPoint'**
  String get formatPowerPoint;

  /// Puce de format acceptable : les fichiers d'image en général.
  ///
  /// In fr, this message translates to:
  /// **'Images'**
  String get formatImages;

  /// Puce de format acceptable : les fichiers texte brut.
  ///
  /// In fr, this message translates to:
  /// **'Texte'**
  String get formatText;

  /// Libellé de la carte à contour tireté en fin de liste, qui ouvre la sélection de fichiers.
  ///
  /// In fr, this message translates to:
  /// **'Ajouter un fichier'**
  String get mergeAddFile;

  /// Ligne sous le libellé de la carte d'ajout, énumérant ce qui est accepté.
  ///
  /// In fr, this message translates to:
  /// **'PDF, Word, images ou texte'**
  String get mergeAddHint;

  /// Titre de l'écran vide de l'outil Fusionner : ce qu'on va obtenir, en trois mots.
  ///
  /// In fr, this message translates to:
  /// **'Un seul document'**
  String get mergeEmptyTitle;

  /// Consigne de l'écran vide de l'outil Fusionner.
  ///
  /// In fr, this message translates to:
  /// **'Ajoutez des PDF, des fichiers Word, des images ou du texte. Vous pourrez les réordonner et écarter des pages avant l’export.'**
  String get mergeEmptyBody;

  /// Bandeau d'erreur quand on demande l'aperçu sans qu'aucune page ne soit retenue.
  ///
  /// In fr, this message translates to:
  /// **'Ajoutez au moins un fichier avec une page à inclure.'**
  String get mergeNeedOnePage;

  /// Titre de la boîte de progression pendant l'assemblage. Garder le caractère de suspension final.
  ///
  /// In fr, this message translates to:
  /// **'Fusion en cours…'**
  String get mergeProgress;

  /// Bandeau d'erreur quand l'assemblage échoue. {detail} est un message technique non traduit.
  ///
  /// In fr, this message translates to:
  /// **'Échec de la fusion : {detail}'**
  String mergeFailed(String detail);

  /// Bandeau confirmant qu'un document a quitté la liste ; il porte l'action « Annuler » (actionUndo). Accordez au genre du mot « fichier » dans votre langue.
  ///
  /// In fr, this message translates to:
  /// **'{name} retiré.'**
  String mergeRemoved(String name);

  /// Info-bulle de la corbeille d'une rangée de la liste.
  ///
  /// In fr, this message translates to:
  /// **'Retirer {name}'**
  String mergeRemoveTooltip(String name);

  /// Étiquette d'accessibilité de la poignée de glissement. Lue à voix haute, jamais affichée.
  ///
  /// In fr, this message translates to:
  /// **'Déplacer {name}'**
  String mergeMoveSemantics(String name);

  /// Bouton qui fait tourner d'un quart de tour toutes les pages du document déplié.
  ///
  /// In fr, this message translates to:
  /// **'Pivoter toutes les pages'**
  String get mergeRotateAll;

  /// Bouton de bas d'écran de l'outil Fusionner, avec le nombre de pages retenues entre parenthèses.
  ///
  /// In fr, this message translates to:
  /// **'Aperçu et export ({count, plural, one{{count} page} other{{count} pages}})'**
  String mergePreviewAndExport(int count);

  /// Titre de l'écran d'aperçu, suivi du poids du fichier. {size} est déjà formaté (« 1,20 Mo »). Le point médian est un séparateur typographique, gardez-le ou remplacez-le par celui de votre langue.
  ///
  /// In fr, this message translates to:
  /// **'Aperçu · {size}'**
  String previewTitle(String size);

  /// Étiquette d'accessibilité d'une vignette d'aperçu. Lue à voix haute, jamais affichée.
  ///
  /// In fr, this message translates to:
  /// **'Page {number}, agrandir'**
  String previewZoomPage(int number);

  /// Affiché à la place d'une page dont le rendu a échoué.
  ///
  /// In fr, this message translates to:
  /// **'Page illisible.'**
  String get previewPageUnreadable;

  /// Description de ce qui vient d'être enregistré, dans la feuille de confirmation. Décrit le document, ne le nomme pas.
  ///
  /// In fr, this message translates to:
  /// **'PDF · {count, plural, one{{count} page} other{{count} pages}}'**
  String previewExportWhat(int count);

  /// Titre de la feuille de choix du niveau de compression.
  ///
  /// In fr, this message translates to:
  /// **'Compression'**
  String get compressTitle;

  /// Consigne de la feuille de compression. {size} est déjà formaté.
  ///
  /// In fr, this message translates to:
  /// **'Taille actuelle : {size}. Choisissez un niveau — la taille estimée s’affiche avant d’appliquer.'**
  String compressBody(String size);

  /// Affiché tant que la taille estimée d'un niveau n'est pas connue. Garder le caractère de suspension final.
  ///
  /// In fr, this message translates to:
  /// **'Estimation…'**
  String get compressEstimating;

  /// Titre de la boîte de progression pendant la compression. Garder le caractère de suspension final.
  ///
  /// In fr, this message translates to:
  /// **'Compression en cours…'**
  String get compressProgress;

  /// Bandeau d'erreur quand la compression échoue. {detail} est un message technique non traduit.
  ///
  /// In fr, this message translates to:
  /// **'Échec de la compression : {detail}'**
  String compressFailed(String detail);

  /// Titre de l'écran vide de l'outil Protéger.
  ///
  /// In fr, this message translates to:
  /// **'Mettre sous mot de passe'**
  String get protectEmptyTitle;

  /// Consigne de l'écran vide de l'outil Protéger. L'avertissement de la seconde phrase est essentiel — ne l'allégez pas.
  ///
  /// In fr, this message translates to:
  /// **'Le PDF ne s’ouvrira plus sans le mot de passe que vous choisissez. Gardez-le : il ne peut pas être récupéré.'**
  String get protectEmptyBody;

  /// Sous-titre de la carte du fichier choisi. « AES 256 bits » est un nom d'algorithme, à conserver tel quel.
  ///
  /// In fr, this message translates to:
  /// **'Sera chiffré en AES 256 bits'**
  String get protectSubtitle;

  /// Intitulé du premier champ de saisie.
  ///
  /// In fr, this message translates to:
  /// **'Mot de passe'**
  String get protectPassword;

  /// Intitulé du second champ, où l'on retape le mot de passe.
  ///
  /// In fr, this message translates to:
  /// **'Confirmer le mot de passe'**
  String get protectConfirmPassword;

  /// Info-bulle du bouton œil quand les caractères sont masqués.
  ///
  /// In fr, this message translates to:
  /// **'Afficher les mots de passe'**
  String get protectShowPasswords;

  /// Info-bulle du bouton œil quand les caractères sont visibles.
  ///
  /// In fr, this message translates to:
  /// **'Masquer les mots de passe'**
  String get protectHidePasswords;

  /// Message d'erreur rattaché au champ de confirmation. Court : il s'affiche sous le champ.
  ///
  /// In fr, this message translates to:
  /// **'Les deux mots de passe diffèrent.'**
  String get protectMismatch;

  /// Avertissement sous les champs de saisie. C'est le seul endroit qui dit qu'un mot de passe perdu est perdu pour de bon — ne l'allégez pas.
  ///
  /// In fr, this message translates to:
  /// **'Notez-le quelque part : sans lui, le document devient définitivement illisible. Aucune récupération n’est possible, ni par vous ni par l’application.'**
  String get protectWarning;

  /// Bandeau d'erreur quand le PDF choisi porte déjà un mot de passe. « Déverrouiller PDF » doit reprendre exactement le libellé traduit de l'outil (toolUnlock).
  ///
  /// In fr, this message translates to:
  /// **'Ce fichier est déjà protégé — utilisez d’abord Déverrouiller PDF.'**
  String get protectAlreadyProtected;

  /// Titre de la boîte de progression pendant le chiffrement. Garder le caractère de suspension final.
  ///
  /// In fr, this message translates to:
  /// **'Protection en cours…'**
  String get protectProgress;

  /// Bandeau d'erreur quand le chiffrement échoue. {detail} est un message technique non traduit.
  ///
  /// In fr, this message translates to:
  /// **'Échec de la protection : {detail}'**
  String protectFailed(String detail);

  /// Bouton de bas d'écran qui lance le chiffrement. Verbe à l'infinitif, court.
  ///
  /// In fr, this message translates to:
  /// **'Protéger'**
  String get protectAction;

  /// Titre de la carte de résultat, une fois le document chiffré.
  ///
  /// In fr, this message translates to:
  /// **'PDF protégé'**
  String get protectResultTitle;

  /// Détail de la carte de résultat. « AES 256 bits » est un nom d'algorithme, à conserver tel quel.
  ///
  /// In fr, this message translates to:
  /// **'Chiffré en AES 256 bits. Il faudra le mot de passe pour l’ouvrir.'**
  String get protectResultDetail;

  /// Description de ce qui vient d'être enregistré, dans la feuille de confirmation.
  ///
  /// In fr, this message translates to:
  /// **'PDF protégé par mot de passe'**
  String get protectExportWhat;

  /// Titre de l'écran vide de l'outil Déverrouiller.
  ///
  /// In fr, this message translates to:
  /// **'Retirer le mot de passe'**
  String get unlockEmptyTitle;

  /// Consigne de l'écran vide de l'outil Déverrouiller. La première phrase est importante : l'outil ne casse pas les mots de passe, il en délivre un document qu'on sait déjà ouvrir.
  ///
  /// In fr, this message translates to:
  /// **'Il vous faut le mot de passe actuel du document. Une fois retiré, le PDF s’ouvrira librement.'**
  String get unlockEmptyBody;

  /// Puce de format acceptable : un PDF portant un mot de passe.
  ///
  /// In fr, this message translates to:
  /// **'PDF protégé'**
  String get unlockAcceptsProtectedPdf;

  /// Bouton principal de l'écran vide de l'outil Déverrouiller.
  ///
  /// In fr, this message translates to:
  /// **'Choisir un PDF protégé'**
  String get unlockChooseProtectedPdf;

  /// Intitulé du champ où l'on saisit le mot de passe qui ouvre déjà le document.
  ///
  /// In fr, this message translates to:
  /// **'Mot de passe actuel'**
  String get unlockCurrentPassword;

  /// Bandeau d'erreur quand le mot de passe saisi n'ouvre pas le document.
  ///
  /// In fr, this message translates to:
  /// **'Mot de passe incorrect.'**
  String get unlockWrongPassword;

  /// Titre de la boîte de progression pendant le retrait du mot de passe. Garder le caractère de suspension final.
  ///
  /// In fr, this message translates to:
  /// **'Déverrouillage en cours…'**
  String get unlockProgress;

  /// Bandeau d'erreur quand le retrait du mot de passe échoue. {detail} est un message technique non traduit.
  ///
  /// In fr, this message translates to:
  /// **'Échec du déverrouillage : {detail}'**
  String unlockFailed(String detail);

  /// Bouton de bas d'écran qui retire le mot de passe. Verbe à l'infinitif, court.
  ///
  /// In fr, this message translates to:
  /// **'Déverrouiller'**
  String get unlockAction;

  /// Titre de l'écran vide de l'outil Réparer.
  ///
  /// In fr, this message translates to:
  /// **'Réparer un fichier abîmé'**
  String get repairEmptyTitle;

  /// Consigne de l'écran vide de l'outil Réparer. La seconde phrase promet peu délibérément — la réparation n'est jamais garantie.
  ///
  /// In fr, this message translates to:
  /// **'La structure interne d’un PDF endommagé est reconstruite. Ce qui est récupérable le sera.'**
  String get repairEmptyBody;

  /// Titre de la boîte de progression pendant la reconstruction. Garder le caractère de suspension final.
  ///
  /// In fr, this message translates to:
  /// **'Réparation en cours…'**
  String get repairProgress;

  /// Bandeau d'erreur quand la reconstruction échoue. Le ton reste prudent : on ne sait pas pourquoi, et on le dit.
  ///
  /// In fr, this message translates to:
  /// **'Impossible de réparer ce fichier — il est peut-être trop endommagé.'**
  String get repairFailed;

  /// Bouton de bas d'écran qui lance la reconstruction. Verbe à l'infinitif, court.
  ///
  /// In fr, this message translates to:
  /// **'Réparer'**
  String get repairAction;

  /// Titre de l'écran vide de l'outil PDF vers Word. « Word » est une marque, à conserver.
  ///
  /// In fr, this message translates to:
  /// **'Un Word modifiable'**
  String get pdfToWordEmptyTitle;

  /// Consigne de l'écran vide de l'outil PDF vers Word. « .docx » est une extension de fichier, à conserver telle quelle.
  ///
  /// In fr, this message translates to:
  /// **'Le texte et la structure du PDF sont transposés dans un document .docx que vous pourrez rouvrir et corriger.'**
  String get pdfToWordEmptyBody;

  /// Titre de la boîte de progression pendant l'inspection du PDF, avant conversion. Garder le caractère de suspension final.
  ///
  /// In fr, this message translates to:
  /// **'Analyse du document…'**
  String get pdfToWordAnalyzing;

  /// Sous-titre de la carte du fichier tant que l'inspection n'a pas rendu ses résultats.
  ///
  /// In fr, this message translates to:
  /// **'Analyse en attente'**
  String get pdfToWordAnalysisPending;

  /// Bandeau d'erreur quand l'inspection du PDF échoue. {detail} est un message technique non traduit.
  ///
  /// In fr, this message translates to:
  /// **'Analyse impossible : {detail}'**
  String pdfToWordAnalysisFailed(String detail);

  /// Bandeau d'erreur commun aux outils qui refusent un PDF chiffré. Renvoie implicitement à l'outil Déverrouiller.
  ///
  /// In fr, this message translates to:
  /// **'Ce PDF est protégé par un mot de passe. Déverrouillez-le d’abord.'**
  String get pdfLocked;

  /// Titre de la boîte de progression pendant la conversion. Garder le caractère de suspension final.
  ///
  /// In fr, this message translates to:
  /// **'Conversion en Word…'**
  String get pdfToWordConverting;

  /// Titre de la carte qui résume ce que l'inspection a trouvé dans le PDF.
  ///
  /// In fr, this message translates to:
  /// **'Contenu détecté'**
  String get pdfToWordSummaryTitle;

  /// Puce du résumé : combien de paragraphes ont été reconnus.
  ///
  /// In fr, this message translates to:
  /// **'{count, plural, one{{count} paragraphe} other{{count} paragraphes}}'**
  String pdfToWordParagraphCount(int count);

  /// Puce du résumé : combien de titres ont été reconnus.
  ///
  /// In fr, this message translates to:
  /// **'{count, plural, one{{count} titre} other{{count} titres}}'**
  String pdfToWordHeadingCount(int count);

  /// Puce du résumé : combien de tableaux ont été reconnus.
  ///
  /// In fr, this message translates to:
  /// **'{count, plural, one{{count} tableau} other{{count} tableaux}}'**
  String pdfToWordTableCount(int count);

  /// Avertissement affiché quand l'inspection n'a trouvé aucun tableau.
  ///
  /// In fr, this message translates to:
  /// **'Aucun tableau détecté : si votre PDF en contient, ses lignes seront converties en paragraphes.'**
  String get pdfToWordNoTables;

  /// Ce que la conversion ne sait pas faire, dit avant qu'on la lance. C'est le passage qui évite la déception — ne l'allégez pas.
  ///
  /// In fr, this message translates to:
  /// **'La conversion reproduit le texte, la mise en forme et les tableaux, mais pas la mise en page exacte : la position des images et des colonnes n’est pas conservée, et les images ne sont pas reprises dans le document Word.'**
  String get pdfToWordCaveat;

  /// Avertissement quand le PDF ne contient aucun texte extractible. « Texte recherchable (OCR) » doit reprendre exactement le libellé traduit de l'outil (toolOcr).
  ///
  /// In fr, this message translates to:
  /// **'Ce PDF semble être un scan : aucun texte n’a été trouvé. Utilisez d’abord l’outil Texte recherchable (OCR), puis revenez convertir le PDF obtenu.'**
  String get pdfToWordScanWarning;

  /// Titre de la carte de résultat, une fois le .docx produit.
  ///
  /// In fr, this message translates to:
  /// **'Document Word prêt'**
  String get pdfToWordResultTitle;

  /// Détail de la carte de résultat : le nom du fichier et son poids, déjà formatés.
  ///
  /// In fr, this message translates to:
  /// **'{name} — {size}'**
  String pdfToWordResultDetail(String name, String size);

  /// Description de ce qui vient d'être enregistré, dans la feuille de confirmation.
  ///
  /// In fr, this message translates to:
  /// **'Document Word'**
  String get pdfToWordExportWhat;

  /// Bouton de bas d'écran qui lance la conversion. Doit tenir sur une ligne.
  ///
  /// In fr, this message translates to:
  /// **'Convertir en Word'**
  String get pdfToWordConvertAction;

  /// Action secondaire proposée une fois le fichier produit, pour refaire la conversion. Doit tenir sur une ligne.
  ///
  /// In fr, this message translates to:
  /// **'Convertir à nouveau'**
  String get actionConvertAgain;

  /// Bandeau d'erreur quand l'écriture du fichier échoue. {detail} est un message technique non traduit.
  ///
  /// In fr, this message translates to:
  /// **'Enregistrement impossible : {detail}'**
  String errorSaveFailed(String detail);

  /// Consigne en tête de l'outil Recto-verso, qui explique d'où viennent les deux fichiers attendus.
  ///
  /// In fr, this message translates to:
  /// **'Un chargeur simple face donne deux fichiers : les pages impaires dans l’ordre, les pages paires souvent dans l’ordre inverse. Choisissez les deux pour les recomposer.'**
  String get rectoVersoIntro;

  /// Intitulé de la première case : le scan des pages 1, 3, 5…
  ///
  /// In fr, this message translates to:
  /// **'Fichier des pages impaires (recto)'**
  String get rectoVersoOddSlot;

  /// Intitulé de la seconde case : le scan des pages 2, 4, 6…
  ///
  /// In fr, this message translates to:
  /// **'Fichier des pages paires (verso)'**
  String get rectoVersoEvenSlot;

  /// Intitulé de l'interrupteur qui retourne l'ordre des pages paires.
  ///
  /// In fr, this message translates to:
  /// **'Le second fichier est en ordre inverse'**
  String get rectoVersoReversed;

  /// Sous-titre de l'interrupteur, qui justifie sa valeur par défaut.
  ///
  /// In fr, this message translates to:
  /// **'C’est le cas le plus courant, coché par défaut'**
  String get rectoVersoReversedHint;

  /// Titre de la bande de vignettes qui montre le résultat de l'entrelacement.
  ///
  /// In fr, this message translates to:
  /// **'Aperçu de l’entrelacement ({count, plural, one{{count} page} other{{count} pages}})'**
  String rectoVersoPreview(int count);

  /// Titre de la boîte de progression pendant l'entrelacement. Garder le caractère de suspension final.
  ///
  /// In fr, this message translates to:
  /// **'Entrelacement en cours…'**
  String get rectoVersoProgress;

  /// Sous-titre d'une carte de fichier : son nom, puis son nombre de pages. Le point médian est un séparateur typographique.
  ///
  /// In fr, this message translates to:
  /// **'{name} · {count, plural, one{{count} page} other{{count} pages}}'**
  String fileWithPageCount(String name, int count);

  /// Bouton de bas d'écran qui mène à l'écran d'aperçu. Doit tenir sur une ligne.
  ///
  /// In fr, this message translates to:
  /// **'Aperçu et export'**
  String get actionPreviewAndExport;

  /// Variante brève du bandeau d'erreur d'ouverture. {detail} est un message technique non traduit.
  ///
  /// In fr, this message translates to:
  /// **'Impossible d’ouvrir : {detail}'**
  String errorOpenFailedShort(String detail);

  /// Bandeau d'erreur générique, quand l'écran n'a rien de plus précis à dire. {detail} est un message technique non traduit.
  ///
  /// In fr, this message translates to:
  /// **'Échec : {detail}'**
  String errorGeneric(String detail);

  /// Bouton de bas d'écran des outils de conversion vers le PDF. Doit tenir sur une ligne.
  ///
  /// In fr, this message translates to:
  /// **'Convertir en PDF'**
  String get actionConvertToPdf;

  /// Titre de la boîte de progression pendant une conversion de format. Garder le caractère de suspension final.
  ///
  /// In fr, this message translates to:
  /// **'Conversion en cours…'**
  String get convertProgress;

  /// Titre de l'écran vide de l'outil Excel vers PDF.
  ///
  /// In fr, this message translates to:
  /// **'Un classeur en PDF'**
  String get excelEmptyTitle;

  /// Consigne de l'écran vide de l'outil Excel vers PDF. « .xlsx » est une extension de fichier, à conserver telle quelle.
  ///
  /// In fr, this message translates to:
  /// **'Les feuilles d’un fichier .xlsx deviennent des pages PDF, prêtes à envoyer ou à imprimer.'**
  String get excelEmptyBody;

  /// Bouton principal de l'écran vide de l'outil Excel vers PDF.
  ///
  /// In fr, this message translates to:
  /// **'Choisir un classeur'**
  String get excelChooseWorkbook;

  /// Intitulé de la rangée de fichier tant qu'aucun classeur n'est choisi. « .xlsx » est une extension, à conserver.
  ///
  /// In fr, this message translates to:
  /// **'Choisir un classeur .xlsx'**
  String get excelChooseXlsx;

  /// Bandeau d'erreur quand on choisit un classeur au vieux format binaire. Les extensions « .xls » et « .xlsx » sont à conserver telles quelles.
  ///
  /// In fr, this message translates to:
  /// **'Le format .xls (ancien format binaire Excel) n’est pas pris en charge. Enregistrez le fichier en .xlsx puis réessayez.'**
  String get excelLegacyFormat;

  /// Bandeau d'erreur quand le fichier choisi n'est pas un classeur.
  ///
  /// In fr, this message translates to:
  /// **'Veuillez choisir un classeur Excel .xlsx.'**
  String get excelWrongFormat;

  /// Bandeau d'erreur quand le classeur ne peut pas être décodé. {detail} est un message technique non traduit.
  ///
  /// In fr, this message translates to:
  /// **'Classeur illisible : {detail}'**
  String excelUnreadable(String detail);

  /// Sous-titre de la rangée de fichier : combien de feuilles et combien de lignes en tout. Le point médian est un séparateur typographique.
  ///
  /// In fr, this message translates to:
  /// **'{sheets, plural, one{{sheets} feuille} other{{sheets} feuilles}} · {rows, plural, one{{rows} ligne au total} other{{rows} lignes au total}}'**
  String excelSheetsAndRows(int sheets, int rows);

  /// Intitulé de la liste des feuilles trouvées dans le classeur.
  ///
  /// In fr, this message translates to:
  /// **'Feuilles détectées'**
  String get excelSheetsDetected;

  /// Sous-titre d'une feuille qui ne contient aucune ligne.
  ///
  /// In fr, this message translates to:
  /// **'Feuille vide'**
  String get excelEmptySheet;

  /// Sous-titre d'une feuille : ses dimensions. Le signe × est le symbole de multiplication.
  ///
  /// In fr, this message translates to:
  /// **'{rows, plural, one{{rows} ligne} other{{rows} lignes}} × {columns, plural, one{{columns} colonne} other{{columns} colonnes}}'**
  String excelSheetDimensions(int rows, int columns);

  /// Intitulé de l'interrupteur qui redessine la première ligne en haut de chaque page.
  ///
  /// In fr, this message translates to:
  /// **'Répéter la ligne d’en-tête sur chaque page'**
  String get excelRepeatHeader;

  /// Sous-titre de l'interrupteur de répétition d'en-tête.
  ///
  /// In fr, this message translates to:
  /// **'La première ligne de la feuille est redessinée en haut de chaque page du tableau.'**
  String get excelRepeatHeaderHint;

  /// Ce que la conversion sait et ne sait pas faire. Les deux paragraphes sont séparés par une ligne vide — gardez le double saut de ligne. C'est le passage qui évite la déception, ne l'allégez pas.
  ///
  /// In fr, this message translates to:
  /// **'Ce que la conversion reprend : le texte des cellules tel qu’il est enregistré dans le fichier (y compris le dernier résultat calculé des formules), la première ligne en gras et un quadrillage.\n\nCe qui n’est pas repris : couleurs, polices, formats de nombres, cellules fusionnées, images, graphiques et formules elles-mêmes. Les colonnes sont réduites pour tenir dans la largeur de la page ; sur les feuilles très larges, le texte des cellules trop étroites est tronqué par « … ».'**
  String get excelCaveat;

  /// Titre de l'écran vide de l'outil PowerPoint vers PDF.
  ///
  /// In fr, this message translates to:
  /// **'Une présentation en PDF'**
  String get pptxEmptyTitle;

  /// Consigne de l'écran vide de l'outil PowerPoint vers PDF. Les deux paragraphes sont séparés par une ligne vide — gardez le double saut de ligne. « 16:9 », « .pptx » et « .ppt » sont à conserver tels quels.
  ///
  /// In fr, this message translates to:
  /// **'Une page paysage 16:9 par diapositive, reprenant le titre et les puces. Le texte est repris ; les images, formes et arrière-plans d’origine ne le sont pas.\n\nFormat accepté : .pptx. Un ancien fichier .ppt doit d’abord être réenregistré en .pptx depuis PowerPoint.'**
  String get pptxEmptyBody;

  /// Bouton principal de l'écran vide de l'outil PowerPoint vers PDF.
  ///
  /// In fr, this message translates to:
  /// **'Choisir une présentation'**
  String get pptxChoosePresentation;

  /// Titre de la carte d'avertissement affichée une fois la présentation chargée.
  ///
  /// In fr, this message translates to:
  /// **'Conversion du texte uniquement'**
  String get pptxTextOnlyTitle;

  /// Corps de la carte d'avertissement. Dit clairement ce que l'outil ne fait pas — ne l'allégez pas.
  ///
  /// In fr, this message translates to:
  /// **'Le texte de chaque diapositive est repris. Les images, formes, arrière-plans, couleurs et mises en page d’origine ne sont pas conservés : le PDF obtenu est une mise en page simple et lisible, pas une copie fidèle de votre présentation.'**
  String get pptxTextOnlyBody;

  /// Sous-titre de la rangée de fichier : combien de diapositives ont été trouvées.
  ///
  /// In fr, this message translates to:
  /// **'{count, plural, one{{count} diapositive} other{{count} diapositives}}'**
  String pptxSlideCount(int count);

  /// Intitulé de la liste des diapositives trouvées dans la présentation.
  ///
  /// In fr, this message translates to:
  /// **'Diapositives détectées'**
  String get pptxSlidesDetected;

  /// Affiché sous la liste quand la présentation compte plus de trente diapositives et que l'aperçu s'arrête là. Garder le caractère de suspension final.
  ///
  /// In fr, this message translates to:
  /// **'et {count, plural, one{{count} autre diapositive} other{{count} autres diapositives}}…'**
  String pptxMoreSlides(int count);

  /// Affiché à la place du titre d'une diapositive qui n'en porte pas. Rendu en italique.
  ///
  /// In fr, this message translates to:
  /// **'Sans titre'**
  String get pptxUntitledSlide;

  /// Sous-titre d'une diapositive dont l'outil n'a extrait aucun texte.
  ///
  /// In fr, this message translates to:
  /// **'Aucun texte (image ou forme uniquement)'**
  String get pptxEmptySlide;

  /// Sous-titre d'une diapositive : combien de lignes de texte elle porte.
  ///
  /// In fr, this message translates to:
  /// **'{count, plural, one{{count} ligne de texte} other{{count} lignes de texte}}'**
  String pptxTextLineCount(int count);

  /// Bandeau d'erreur quand la présentation ne peut pas être décodée. {detail} est un message technique non traduit.
  ///
  /// In fr, this message translates to:
  /// **'Lecture impossible : {detail}'**
  String pptxReadFailed(String detail);

  /// Niveau de compression le plus doux. Adjectif accordé à « compression » ; si votre langue ne permet pas l'adjectif seul, écrivez « Compression légère ».
  ///
  /// In fr, this message translates to:
  /// **'Légère'**
  String get compressLevelLight;

  /// Niveau de compression intermédiaire. Adjectif accordé à « compression ».
  ///
  /// In fr, this message translates to:
  /// **'Moyenne'**
  String get compressLevelMedium;

  /// Niveau de compression le plus agressif. Adjectif accordé à « compression ».
  ///
  /// In fr, this message translates to:
  /// **'Forte'**
  String get compressLevelStrong;

  /// Réglage de résolution par défaut de l'export PowerPoint. « dpi » est un sigle international, à conserver.
  ///
  /// In fr, this message translates to:
  /// **'Standard (150 dpi)'**
  String get pptxQualityStandard;

  /// Réglage de résolution élevée de l'export PowerPoint. « dpi » est un sigle international, à conserver.
  ///
  /// In fr, this message translates to:
  /// **'Haute (220 dpi)'**
  String get pptxQualityHigh;

  /// Titre de l'écran vide de l'outil PDF vers Excel.
  ///
  /// In fr, this message translates to:
  /// **'Récupérer les tableaux'**
  String get pdfToExcelEmptyTitle;

  /// Consigne de l'écran vide de l'outil PDF vers Excel.
  ///
  /// In fr, this message translates to:
  /// **'Les tableaux d’un PDF sont extraits vers un classeur Excel. La mise en forme n’est pas conservée, les valeurs le sont.'**
  String get pdfToExcelEmptyBody;

  /// Sous-titre de la carte du fichier une fois l'inspection faite.
  ///
  /// In fr, this message translates to:
  /// **'{count, plural, one{{count} page analysée} other{{count} pages analysées}}'**
  String pdfToExcelPagesAnalyzed(int count);

  /// Bandeau d'erreur quand l'inspection échoue. {detail} est un message technique non traduit.
  ///
  /// In fr, this message translates to:
  /// **'Analyse impossible. Le PDF est peut-être protégé par un mot de passe ou endommagé. ({detail})'**
  String pdfToExcelAnalysisFailed(String detail);

  /// Bandeau d'erreur quand on lance la conversion sans qu'aucun tableau n'ait été reconnu.
  ///
  /// In fr, this message translates to:
  /// **'Rien à exporter : aucun tableau détecté.'**
  String get pdfToExcelNothingToExport;

  /// Titre de la boîte de progression pendant la construction du classeur. Garder le caractère de suspension final.
  ///
  /// In fr, this message translates to:
  /// **'Création du classeur…'**
  String get pdfToExcelBuilding;

  /// Intitulé de l'interrupteur qui verse le texte courant dans le classeur.
  ///
  /// In fr, this message translates to:
  /// **'Inclure aussi le texte hors tableaux (une ligne par paragraphe)'**
  String get pdfToExcelIncludeParagraphs;

  /// Sous-titre de l'interrupteur. « colonne A » désigne la première colonne du tableur.
  ///
  /// In fr, this message translates to:
  /// **'Utile pour un document semi-structuré : le texte est placé dans la colonne A, après les tableaux de la page.'**
  String get pdfToExcelIncludeParagraphsHint;

  /// Intitulé du paragraphe qui énumère les limites de l'extraction.
  ///
  /// In fr, this message translates to:
  /// **'Ce que la conversion ne conserve pas'**
  String get pdfToExcelCaveatTitle;

  /// Limites de l'extraction de tableaux, dites avant qu'on lance la conversion. Ne l'allégez pas.
  ///
  /// In fr, this message translates to:
  /// **'La détection repose sur la position du texte dans la page : les tableaux sans bordure régulière, les cellules fusionnées et les colonnes très irrégulières peuvent être mal découpés. Un PDF scanné (image) ne contient aucun texte extractible et ne donnera rien. Les couleurs, formules et images ne sont jamais reprises : seules les valeurs texte le sont.'**
  String get pdfToExcelCaveat;

  /// Résumé de l'inspection : combien de tableaux, sur combien de pages.
  ///
  /// In fr, this message translates to:
  /// **'{tables, plural, one{{tables} tableau détecté} other{{tables} tableaux détectés}} sur {pages, plural, one{{pages} page} other{{pages} pages}}'**
  String pdfToExcelTablesFound(int tables, int pages);

  /// Liste des numéros de page qui portent un tableau. {pages} est déjà formaté (« 1, 3, 7… »).
  ///
  /// In fr, this message translates to:
  /// **'Pages concernées : {pages}'**
  String pdfToExcelPagesConcerned(String pages);

  /// Résumé de l'inspection : combien de paragraphes vivent en dehors des tableaux.
  ///
  /// In fr, this message translates to:
  /// **'{count, plural, one{{count} paragraphe hors tableaux} other{{count} paragraphes hors tableaux}}'**
  String pdfToExcelParagraphsOutside(int count);

  /// Avertissement quand le PDF est un scan sans couche de texte. « OCR » est un sigle international, à conserver.
  ///
  /// In fr, this message translates to:
  /// **'Aucun texte n’a pu être extrait de ce PDF : il s’agit très probablement d’un document scanné (des images de pages). Un tableur ne peut rien en tirer ; utilisez d’abord l’outil de reconnaissance de texte (OCR).'**
  String get pdfToExcelScannedWarning;

  /// Avertissement quand le texte existe mais n'est pas tabulaire. Les deux citations entre guillemets doivent reprendre exactement les libellés traduits correspondants (pdfToExcelIncludeParagraphs et toolPdfToWord).
  ///
  /// In fr, this message translates to:
  /// **'Aucune structure de tableau n’a été reconnue dans ce document. Le texte est bien là, mais il n’est pas disposé en colonnes régulières. Plutôt que de produire un classeur illisible, activez « Inclure aussi le texte hors tableaux » ci-dessus, ou utilisez « PDF vers Word » qui conserve mieux les paragraphes.'**
  String get pdfToExcelNoTableWarning;

  /// Titre de la carte de résultat, une fois le classeur produit.
  ///
  /// In fr, this message translates to:
  /// **'Classeur prêt'**
  String get pdfToExcelResultTitle;

  /// Description de ce qui vient d'être enregistré, dans la feuille de confirmation.
  ///
  /// In fr, this message translates to:
  /// **'Classeur Excel'**
  String get pdfToExcelExportWhat;

  /// Bouton de bas d'écran qui lance la conversion. Doit tenir sur une ligne.
  ///
  /// In fr, this message translates to:
  /// **'Convertir en Excel'**
  String get pdfToExcelConvertAction;

  /// Détail d'une carte de résultat : le nom du fichier et son poids, déjà formatés.
  ///
  /// In fr, this message translates to:
  /// **'{name} — {size}'**
  String resultNameAndSize(String name, String size);

  /// Titre de l'écran vide de l'outil PDF vers PowerPoint.
  ///
  /// In fr, this message translates to:
  /// **'Une diapositive par page'**
  String get pdfToPptxEmptyTitle;

  /// Consigne de l'écran vide de l'outil PDF vers PowerPoint. Le compromis annoncé — mise en page fidèle contre texte figé — est le point essentiel.
  ///
  /// In fr, this message translates to:
  /// **'Le PDF devient une présentation PowerPoint à l’identique. Chaque page arrive sous forme d’image : la mise en page est fidèle, mais le texte ne sera pas modifiable dans PowerPoint.'**
  String get pdfToPptxEmptyBody;

  /// Bandeau d'erreur quand le PDF ne peut pas être lu. {detail} est un message technique non traduit.
  ///
  /// In fr, this message translates to:
  /// **'Impossible d’ouvrir ce PDF : {detail}'**
  String pdfToPptxOpenFailed(String detail);

  /// Titre de la boîte de progression pendant la conversion. Garder le caractère de suspension final.
  ///
  /// In fr, this message translates to:
  /// **'Conversion en PowerPoint…'**
  String get pdfToPptxConverting;

  /// Sous-titre de la carte du fichier : autant de diapositives que de pages. Le chevron simple et non une flèche → : celle-ci manque au sous-ensemble des fontes embarquées. Voir test/l10n_coverage_test.dart.
  ///
  /// In fr, this message translates to:
  /// **'{count, plural, one{{count} page} other{{count} pages}} > {count, plural, one{{count} diapositive} other{{count} diapositives}}'**
  String pdfToPptxPagesToSlides(int count);

  /// Sous-titre de la carte du fichier quand le PDF ne contient aucune page.
  ///
  /// In fr, this message translates to:
  /// **'Document vide'**
  String get pdfToPptxEmptyDocument;

  /// Intitulé du groupe de boutons qui choisit la résolution de sortie.
  ///
  /// In fr, this message translates to:
  /// **'Qualité'**
  String get qualityLabel;

  /// Explication sous le choix de qualité, dans le cas ordinaire.
  ///
  /// In fr, this message translates to:
  /// **'Une résolution plus élevée donne des diapositives plus nettes mais un fichier nettement plus lourd.'**
  String get pdfToPptxQualityHint;

  /// Avertissement affiché en rouge quand haute qualité et document long se combinent. « Standard » doit reprendre le libellé traduit de pptxQualityStandard. « Mo » est l'abréviation de méga-octet — employez celle de votre langue.
  ///
  /// In fr, this message translates to:
  /// **'Attention : en haute qualité, une présentation de {count, plural, one{{count} page} other{{count} pages}} peut peser plusieurs dizaines de Mo et être longue à ouvrir. Choisissez Standard en cas de doute.'**
  String pdfToPptxHeavyWarning(int count);

  /// Titre d'une carte d'information neutre.
  ///
  /// In fr, this message translates to:
  /// **'À savoir'**
  String get goodToKnow;

  /// Trois limites de la conversion, une par ligne — gardez les sauts de ligne simples. « PDF vers Word » doit reprendre le libellé traduit de toolPdfToWord.
  ///
  /// In fr, this message translates to:
  /// **'Chaque diapositive est une image de la page : la mise en page est identique au PDF, mais le texte ne sera pas modifiable dans PowerPoint.\nPour récupérer du texte modifiable, utilisez plutôt « PDF vers Word ».\nUne présentation n’a qu’un seul format de diapositive : il est repris de la première page, et les pages de format différent sont centrées à l’intérieur.'**
  String get pdfToPptxCaveat;

  /// Titre de la carte de résultat, une fois la présentation produite.
  ///
  /// In fr, this message translates to:
  /// **'Présentation prête'**
  String get pdfToPptxResultTitle;

  /// Détail de la carte de résultat : nom, nombre de diapositives, poids et réglage de qualité. Le point médian est un séparateur typographique.
  ///
  /// In fr, this message translates to:
  /// **'{name} — {count, plural, one{{count} diapositive} other{{count} diapositives}} · {size} · {quality}'**
  String pdfToPptxResultDetail(
    String name,
    int count,
    String size,
    String quality,
  );

  /// Rappel sous la carte de résultat : le fichier existe en mémoire mais n'a pas encore été écrit.
  ///
  /// In fr, this message translates to:
  /// **'Le fichier n’est pas encore sur votre appareil : enregistrez-le ou partagez-le.'**
  String get notSavedYet;

  /// Action secondaire qui revient au choix de résolution pour refaire la conversion.
  ///
  /// In fr, this message translates to:
  /// **'Changer la qualité'**
  String get pdfToPptxChangeQuality;

  /// Bouton de bas d'écran qui lance la conversion. Doit tenir sur une ligne.
  ///
  /// In fr, this message translates to:
  /// **'Convertir en PowerPoint'**
  String get pdfToPptxConvertAction;

  /// Description de ce qui vient d'être enregistré, dans la feuille de confirmation.
  ///
  /// In fr, this message translates to:
  /// **'Présentation PowerPoint · {count, plural, one{{count} diapositive} other{{count} diapositives}}'**
  String pdfToPptxExportWhat(int count);

  /// Intitulé du groupe de boutons qui choisit le format de sortie.
  ///
  /// In fr, this message translates to:
  /// **'Format'**
  String get formatLabel;

  /// Bouton qui lance la production des fichiers. Verbe à l'infinitif, court.
  ///
  /// In fr, this message translates to:
  /// **'Exporter'**
  String get actionExport;

  /// Résolution la plus basse de l'export en images, destinée à l'écran. « dpi » est un sigle international, à conserver.
  ///
  /// In fr, this message translates to:
  /// **'Web (72 dpi)'**
  String get imageQualityWeb;

  /// Résolution intermédiaire de l'export en images. « dpi » est un sigle international, à conserver.
  ///
  /// In fr, this message translates to:
  /// **'Standard (150 dpi)'**
  String get imageQualityStandard;

  /// Résolution la plus élevée de l'export en images, destinée à l'impression. « dpi » est un sigle international, à conserver.
  ///
  /// In fr, this message translates to:
  /// **'Haute qualité (300 dpi)'**
  String get imageQualityHigh;

  /// Titre de l'écran vide de l'outil PDF vers Images.
  ///
  /// In fr, this message translates to:
  /// **'Une image par page'**
  String get pdfToImagesEmptyTitle;

  /// Consigne de l'écran vide de l'outil PDF vers Images.
  ///
  /// In fr, this message translates to:
  /// **'Choisissez un PDF : chaque page en sortira sous forme d’image, à la définition que vous réglez ensuite.'**
  String get pdfToImagesEmptyBody;

  /// Bandeau d'erreur quand le fichier choisi n'est pas un PDF.
  ///
  /// In fr, this message translates to:
  /// **'{name} : veuillez choisir un fichier PDF.'**
  String pdfToImagesNotAPdf(String name);

  /// Bandeau d'erreur quand le fichier ne peut pas être chargé. {detail} est un message technique non traduit.
  ///
  /// In fr, this message translates to:
  /// **'Échec du chargement : {detail}'**
  String errorLoadFailed(String detail);

  /// Titre de la boîte de progression pendant le rendu des images. Garder le caractère de suspension final.
  ///
  /// In fr, this message translates to:
  /// **'Export en cours…'**
  String get pdfToImagesProgress;

  /// Description de ce qui vient d'être enregistré : combien d'images, dans quel format. {format} vaut « JPG » ou « PNG » et ne se traduit pas.
  ///
  /// In fr, this message translates to:
  /// **'{count, plural, one{{count} image} other{{count} images}} {format}'**
  String pdfToImagesExportWhat(int count, String format);

  /// Titre de l'écran vide de l'outil Convertir en PDF/A.
  ///
  /// In fr, this message translates to:
  /// **'Archiver pour longtemps'**
  String get pdfaEmptyTitle;

  /// Consigne de l'écran vide de l'outil Convertir en PDF/A. « PDF/A » est une norme ISO, à conserver telle quelle.
  ///
  /// In fr, this message translates to:
  /// **'Le PDF/A est le format d’archivage exigé par de nombreuses administrations. Le document est converti sans perdre son apparence.'**
  String get pdfaEmptyBody;

  /// Intitulé du groupe de boutons qui choisit la variante de la norme.
  ///
  /// In fr, this message translates to:
  /// **'Niveau de conformité'**
  String get pdfaConformanceLevel;

  /// Explication de la variante PDF/A-1b, affichée sous le choix.
  ///
  /// In fr, this message translates to:
  /// **'Le niveau le plus strict et le plus universellement accepté. À choisir en cas de doute.'**
  String get pdfaA1bDetail;

  /// Explication de la variante PDF/A-2b. « PDF 1.7 » est un numéro de version, à conserver.
  ///
  /// In fr, this message translates to:
  /// **'Basé sur PDF 1.7 : compression plus efficace, fichiers un peu plus légers.'**
  String get pdfaA2bDetail;

  /// Explication de la variante PDF/A-3b. « A-2b » désigne la variante précédente, à conserver.
  ///
  /// In fr, this message translates to:
  /// **'Comme le A-2b, mais autorise les pièces jointes (souvent demandé pour la facturation électronique).'**
  String get pdfaA3bDetail;

  /// Titre de la boîte de progression. {level} vaut « PDF/A-1b » et ne se traduit pas. Garder le caractère de suspension final.
  ///
  /// In fr, this message translates to:
  /// **'Conversion en {level}…'**
  String pdfaConvertingTo(String level);

  /// Titre de la carte qui énumère les effets de la conversion.
  ///
  /// In fr, this message translates to:
  /// **'Ce que la conversion change'**
  String get pdfaCaveatTitle;

  /// Le compromis de la conversion PDF/A, dit avant qu'on la lance. « dpi » est un sigle international. Ne l'allégez pas.
  ///
  /// In fr, this message translates to:
  /// **'Chaque page est redessinée en image à {dpi} dpi : le texte devient une image, la mise en page est figée. C’est ce qui rend le fichier réellement conforme sans dépendre des polices du document d’origine, mais en contrepartie le texte n’est plus sélectionnable ni recherchable, les liens et les formulaires disparaissent, et le fichier devient plus lourd.'**
  String pdfaCaveat(int dpi);

  /// Bandeau d'erreur quand le PDF ne peut pas être lu. {detail} est un message technique non traduit.
  ///
  /// In fr, this message translates to:
  /// **'Impossible d’ouvrir ce PDF : {detail}'**
  String pdfaOpenFailed(String detail);

  /// Titre de l'écran vide de l'outil Images vers PDF.
  ///
  /// In fr, this message translates to:
  /// **'Des images, un PDF'**
  String get imagesToPdfEmptyTitle;

  /// Consigne de l'écran vide de l'outil Images vers PDF. Les quatre noms de format ne se traduisent pas.
  ///
  /// In fr, this message translates to:
  /// **'JPG, PNG, WebP, HEIC — ajoutez vos images et elles seront assemblées dans l’ordre que vous choisissez.'**
  String get imagesToPdfEmptyBody;

  /// Bouton principal de l'écran vide de l'outil Images vers PDF.
  ///
  /// In fr, this message translates to:
  /// **'Choisir des images'**
  String get imagesToPdfChoose;

  /// Info-bulle du bouton flottant qui ajoute d'autres images à la liste.
  ///
  /// In fr, this message translates to:
  /// **'Ajouter des images'**
  String get imagesToPdfAdd;

  /// Bandeau signalant les fichiers écartés parce qu'ils ne sont pas des images. {names} est une liste de noms séparés par des virgules.
  ///
  /// In fr, this message translates to:
  /// **'Ignoré (pas une image) : {names}'**
  String imagesToPdfRejected(String names);

  /// Titre de la boîte de progression pendant l'assemblage. Garder le caractère de suspension final.
  ///
  /// In fr, this message translates to:
  /// **'Création du PDF…'**
  String get imagesToPdfBuilding;

  /// Bandeau d'erreur quand l'assemblage échoue. {detail} est un message technique non traduit.
  ///
  /// In fr, this message translates to:
  /// **'Échec de la création : {detail}'**
  String imagesToPdfBuildFailed(String detail);

  /// Bouton de bas d'écran, avec le nombre d'images retenues entre parenthèses.
  ///
  /// In fr, this message translates to:
  /// **'Créer le PDF ({count, plural, one{{count} image} other{{count} images}})'**
  String imagesToPdfCreateAction(int count);

  /// Info-bulle du bouton qui fait tourner une image d'un quart de tour.
  ///
  /// In fr, this message translates to:
  /// **'Pivoter'**
  String get actionRotate;

  /// Info-bulle du bouton qui retire un élément de la liste.
  ///
  /// In fr, this message translates to:
  /// **'Retirer'**
  String get actionRemove;

  /// Titre de la barre de l'outil Page web vers PDF. « HTML » est un sigle, à conserver.
  ///
  /// In fr, this message translates to:
  /// **'HTML / page web en PDF'**
  String get htmlTitle;

  /// Consigne en tête de l'outil. « A4 » est un format de papier, « Android » et « Chrome » des marques — à conserver.
  ///
  /// In fr, this message translates to:
  /// **'Transformez une page web ou du code HTML en PDF A4. Le rendu est réalisé par le navigateur intégré à Android, la mise en page est donc celle d’une impression depuis Chrome.'**
  String get htmlIntro;

  /// Onglet du sélecteur : fournir une adresse à télécharger. Court, il tient dans un segment.
  ///
  /// In fr, this message translates to:
  /// **'Adresse web'**
  String get htmlModeUrl;

  /// Onglet du sélecteur : coller du code source. Court, il tient dans un segment.
  ///
  /// In fr, this message translates to:
  /// **'Code HTML'**
  String get htmlModeCode;

  /// Intitulé du champ où l'on saisit l'adresse.
  ///
  /// In fr, this message translates to:
  /// **'Adresse de la page'**
  String get htmlUrlLabel;

  /// Exemple d'adresse affiché en filigrane dans le champ. Adaptez le domaine à votre langue (« example.com », « beispiel.de »…).
  ///
  /// In fr, this message translates to:
  /// **'https://exemple.fr/article'**
  String get htmlUrlHint;

  /// Intitulé du champ où l'on colle le code source.
  ///
  /// In fr, this message translates to:
  /// **'Code HTML'**
  String get htmlCodeLabel;

  /// Exemple de code affiché en filigrane. Les balises <h1> et <p> ne se traduisent pas ; seuls les mots entre elles le sont. Gardez le saut de ligne.
  ///
  /// In fr, this message translates to:
  /// **'<h1>Titre</h1>\n<p>Texte…</p>'**
  String get htmlCodeHint;

  /// Bandeau d'erreur quand l'adresse ne porte pas de protocole. « http:// » et « https:// » ne se traduisent pas.
  ///
  /// In fr, this message translates to:
  /// **'L’adresse doit commencer par http:// ou https://.'**
  String get htmlUrlBadScheme;

  /// Bandeau d'erreur quand le champ ne contient que le protocole.
  ///
  /// In fr, this message translates to:
  /// **'Entrez une adresse web complète.'**
  String get htmlUrlIncomplete;

  /// Bandeau d'erreur quand le champ de code est vide.
  ///
  /// In fr, this message translates to:
  /// **'Collez du code HTML à convertir.'**
  String get htmlCodeEmpty;

  /// Titre de la boîte de progression pendant le téléchargement puis le rendu. Garder le caractère de suspension final.
  ///
  /// In fr, this message translates to:
  /// **'Chargement de la page et conversion…'**
  String get htmlLoadingUrl;

  /// Titre de la boîte de progression pendant le rendu du code collé. Garder le caractère de suspension final.
  ///
  /// In fr, this message translates to:
  /// **'Conversion du HTML en cours…'**
  String get htmlConverting;

  /// Avertissement affiché en mode adresse. Il signale la seule exception au fonctionnement hors ligne de l'application — ne l'allégez pas. « JavaScript » est une marque, à conserver.
  ///
  /// In fr, this message translates to:
  /// **'Une connexion internet est nécessaire : c’est le seul outil de l’application qui doit télécharger la page. Les pages qui exigent une connexion à un compte, un bandeau de cookies ou beaucoup de JavaScript peuvent sortir incomplètes.'**
  String get htmlNetworkNotice;

  /// Avertissement affiché en mode code. « HTML » et « CSS » sont des sigles, à conserver.
  ///
  /// In fr, this message translates to:
  /// **'Le HTML et le CSS écrits directement dans la page sont rendus hors ligne. En revanche, les images, feuilles de style ou polices appelées par une adresse web externe nécessitent une connexion internet.'**
  String get htmlOfflineNotice;

  /// Titre de l'écran vide de l'outil Filigrane.
  ///
  /// In fr, this message translates to:
  /// **'Apposer un filigrane'**
  String get watermarkEmptyTitle;

  /// Consigne de l'écran vide de l'outil Filigrane.
  ///
  /// In fr, this message translates to:
  /// **'Un texte de votre choix est répété en fond sur toutes les pages — pour marquer un document comme confidentiel ou brouillon.'**
  String get watermarkEmptyBody;

  /// Note verte de l'écran vide, propre à cet outil. La note habituelle promet « sans filigrane » — sur l'outil qui en appose un, elle se contredirait. Ne réintroduisez donc pas la mention du filigrane ici.
  ///
  /// In fr, this message translates to:
  /// **'Export gratuit et sans limite de nombre.'**
  String get watermarkEmptyNote;

  /// Intitulé du champ où l'on saisit la mention à répéter.
  ///
  /// In fr, this message translates to:
  /// **'Texte du filigrane'**
  String get watermarkTextLabel;

  /// Mention proposée par défaut dans le champ, en capitales. Employez le mot consacré de votre langue (anglais : CONFIDENTIAL, allemand : VERTRAULICH).
  ///
  /// In fr, this message translates to:
  /// **'CONFIDENTIEL'**
  String get watermarkDefaultText;

  /// Bandeau d'erreur quand on applique sans avoir saisi de texte.
  ///
  /// In fr, this message translates to:
  /// **'Entrez un texte pour le filigrane.'**
  String get watermarkNeedText;

  /// Intitulé du curseur d'opacité. L'espace avant le signe % est une convention française ; collez-le au chiffre si votre langue le veut.
  ///
  /// In fr, this message translates to:
  /// **'Opacité : {percent} %'**
  String watermarkOpacity(int percent);

  /// Intitulé du curseur d'inclinaison. Le signe degré est international.
  ///
  /// In fr, this message translates to:
  /// **'Angle de rotation : {degrees}°'**
  String watermarkRotation(int degrees);

  /// Intitulé du curseur de corps. « pt » est l'abréviation typographique de point, internationale.
  ///
  /// In fr, this message translates to:
  /// **'Taille du texte : {points} pt'**
  String watermarkFontSize(int points);

  /// Intitulé de la rangée de pastilles de couleur.
  ///
  /// In fr, this message translates to:
  /// **'Couleur'**
  String get watermarkColor;

  /// Nom d'une couleur de filigrane, sous sa pastille. Très court.
  ///
  /// In fr, this message translates to:
  /// **'Gris'**
  String get colorGrey;

  /// Nom d'une couleur de filigrane, sous sa pastille. Très court.
  ///
  /// In fr, this message translates to:
  /// **'Rouge'**
  String get colorRed;

  /// Nom d'une couleur de filigrane, sous sa pastille. Très court.
  ///
  /// In fr, this message translates to:
  /// **'Bleu'**
  String get colorBlue;

  /// Nom d'une couleur de filigrane, sous sa pastille. Très court.
  ///
  /// In fr, this message translates to:
  /// **'Noir'**
  String get colorBlack;

  /// Titre de la boîte de progression. Garder le caractère de suspension final.
  ///
  /// In fr, this message translates to:
  /// **'Application du filigrane en cours…'**
  String get watermarkProgress;

  /// Valeur en pourcentage affichée sur la pastille d'un curseur. L'espace avant le signe % est une convention française.
  ///
  /// In fr, this message translates to:
  /// **'{percent} %'**
  String percentValue(int percent);

  /// Valeur en degrés affichée sur la pastille d'un curseur.
  ///
  /// In fr, this message translates to:
  /// **'{degrees}°'**
  String degreesValue(int degrees);

  /// Valeur en points typographiques affichée sur la pastille d'un curseur.
  ///
  /// In fr, this message translates to:
  /// **'{points} pt'**
  String pointsValue(int points);

  /// Titre de l'écran vide de l'outil Numéros de page.
  ///
  /// In fr, this message translates to:
  /// **'Numéroter les pages'**
  String get pageNumbersEmptyTitle;

  /// Consigne de l'écran vide de l'outil Numéros de page.
  ///
  /// In fr, this message translates to:
  /// **'Choisissez un PDF, puis la position et le format des numéros qui seront ajoutés sur chaque page.'**
  String get pageNumbersEmptyBody;

  /// Intitulé du groupe de boutons qui choisit où poser le numéro.
  ///
  /// In fr, this message translates to:
  /// **'Position'**
  String get positionLabel;

  /// Position du numéro : en bas, au milieu. Très court, il tient dans une pastille.
  ///
  /// In fr, this message translates to:
  /// **'Bas centre'**
  String get positionBottomCenter;

  /// Position du numéro : en bas, à droite. Très court.
  ///
  /// In fr, this message translates to:
  /// **'Bas droite'**
  String get positionBottomRight;

  /// Position du numéro : en haut, au milieu. Très court.
  ///
  /// In fr, this message translates to:
  /// **'Haut centre'**
  String get positionTopCenter;

  /// Position du numéro : en haut, à droite. Très court.
  ///
  /// In fr, this message translates to:
  /// **'Haut droite'**
  String get positionTopRight;

  /// Format de numérotation : le numéro seul. « N » est l'initiale de « numéro » — employez celle de votre langue si elle diffère (anglais : N, allemand : N).
  ///
  /// In fr, this message translates to:
  /// **'N'**
  String get pageNumbersFormatPlain;

  /// Format de numérotation : le numéro suivi du total, « 3 / 12 ». Traduisez « total » ; « N » suit la même règle que ci-dessus. Doit rester très court, c'est un segment de bouton.
  ///
  /// In fr, this message translates to:
  /// **'N / total'**
  String get pageNumbersFormatOfTotal;

  /// Intitulé du champ où l'on choisit à quel chiffre la numérotation commence.
  ///
  /// In fr, this message translates to:
  /// **'Numéro de départ'**
  String get pageNumbersStart;

  /// Titre de la boîte de progression. Garder le caractère de suspension final.
  ///
  /// In fr, this message translates to:
  /// **'Numérotation en cours…'**
  String get pageNumbersProgress;

  /// Titre de l'écran vide de l'outil Organiser.
  ///
  /// In fr, this message translates to:
  /// **'Reprendre un PDF en main'**
  String get organizeEmptyTitle;

  /// Consigne de l'écran vide de l'outil Organiser.
  ///
  /// In fr, this message translates to:
  /// **'Ouvrez un document pour le diviser, en extraire des pages ou en changer l’ordre.'**
  String get organizeEmptyBody;

  /// Bouton principal de l'écran vide de l'outil Organiser.
  ///
  /// In fr, this message translates to:
  /// **'Ouvrir un fichier'**
  String get organizeOpenFile;

  /// Bandeau d'erreur quand toutes les pages ont été écartées.
  ///
  /// In fr, this message translates to:
  /// **'Aucune page à exporter.'**
  String get organizeNothingToExport;

  /// Sous-titre du document : combien de pages restent retenues sur combien. Affiché seulement quand on en a écarté.
  ///
  /// In fr, this message translates to:
  /// **'{kept, plural, one{{kept} page retenue} other{{kept} pages retenues}} sur {total}'**
  String organizePagesKept(int kept, int total);

  /// Mention sous une rangée de page mise de côté. Accordé au féminin de « page ». Court.
  ///
  /// In fr, this message translates to:
  /// **'Écartée'**
  String get organizePageExcluded;

  /// Mention sous une rangée de page qu'on a fait glisser ailleurs. Accordé au féminin de « page ».
  ///
  /// In fr, this message translates to:
  /// **'Déplacée depuis la position {from}'**
  String organizePageMoved(int from);

  /// Titre d'une rangée de la liste des pages.
  ///
  /// In fr, this message translates to:
  /// **'Page {number}'**
  String organizePageTitle(int number);

  /// Info-bulle du bouton qui met une page de côté.
  ///
  /// In fr, this message translates to:
  /// **'Écarter la page {number}'**
  String organizeExcludePage(int number);

  /// Info-bulle du bouton qui remet une page dans le document.
  ///
  /// In fr, this message translates to:
  /// **'Inclure la page {number}'**
  String organizeIncludePage(int number);

  /// Étiquette d'accessibilité de la poignée de glissement. Lue à voix haute, jamais affichée.
  ///
  /// In fr, this message translates to:
  /// **'Déplacer la page {number}'**
  String organizeMovePage(int number);

  /// Bouton qui ne garde qu'une plage de pages. Verbe à l'infinitif, court.
  ///
  /// In fr, this message translates to:
  /// **'Extraire'**
  String get organizeExtract;

  /// Bouton qui coupe le document en plusieurs fichiers. Verbe à l'infinitif, court.
  ///
  /// In fr, this message translates to:
  /// **'Diviser'**
  String get organizeSplit;

  /// Bouton qui mène à l'écran d'aperçu. Court.
  ///
  /// In fr, this message translates to:
  /// **'Aperçu'**
  String get organizePreview;

  /// Titre de la boîte de dialogue de choix de la plage.
  ///
  /// In fr, this message translates to:
  /// **'Extraire une plage de pages'**
  String get organizeExtractTitle;

  /// Plage retenue par le curseur double de la boîte d'extraction.
  ///
  /// In fr, this message translates to:
  /// **'Pages {start} à {end}'**
  String organizeRangeLabel(int start, int end);

  /// Titre de la boîte de dialogue de division.
  ///
  /// In fr, this message translates to:
  /// **'Diviser en plusieurs fichiers'**
  String get organizeSplitTitle;

  /// Nombre de fichiers que la division produira, sous le curseur.
  ///
  /// In fr, this message translates to:
  /// **'{count, plural, one{{count} fichier} other{{count} fichiers}}'**
  String organizeFileCount(int count);

  /// Bandeau d'erreur quand la division échoue. {detail} est un message technique non traduit.
  ///
  /// In fr, this message translates to:
  /// **'Échec de la division : {detail}'**
  String organizeSplitFailed(String detail);

  /// Message d'erreur quand l'appareil n'expose aucune caméra.
  ///
  /// In fr, this message translates to:
  /// **'Aucune caméra disponible sur cet appareil.'**
  String get scanNoCamera;

  /// Message d'erreur quand la caméra refuse de démarrer. {detail} est un message technique non traduit.
  ///
  /// In fr, this message translates to:
  /// **'Impossible d’initialiser la caméra : {detail}'**
  String scanCameraFailed(String detail);

  /// Titre de la barre du recadreur système d'Android, après la prise de vue. Court.
  ///
  /// In fr, this message translates to:
  /// **'Ajuster'**
  String get scanCropToolbar;

  /// Bandeau d'erreur quand la prise de vue échoue. {detail} est un message technique non traduit.
  ///
  /// In fr, this message translates to:
  /// **'Échec de la capture : {detail}'**
  String scanCaptureFailed(String detail);

  /// Explication affichée quand l'autorisation d'accès à la caméra n'a pas été accordée.
  ///
  /// In fr, this message translates to:
  /// **'L’accès à l’appareil photo est nécessaire pour scanner un document.'**
  String get scanPermissionBody;

  /// Bouton qui redemande l'autorisation d'accès à la caméra. Doit tenir sur une ligne.
  ///
  /// In fr, this message translates to:
  /// **'Autoriser l’appareil photo'**
  String get scanGrantPermission;

  /// Bouton qui relance une opération après un échec. Court.
  ///
  /// In fr, this message translates to:
  /// **'Réessayer'**
  String get actionRetry;

  /// Affiché dans la grille de relecture tant qu'aucune page n'a été photographiée.
  ///
  /// In fr, this message translates to:
  /// **'Aucune page pour le moment.'**
  String get scanNoPageYet;

  /// Bouton qui clôt la capture, suivi du nombre de pages prises. Le point médian est un séparateur typographique. Doit tenir sur une ligne.
  ///
  /// In fr, this message translates to:
  /// **'Terminer · {count}'**
  String scanFinishAction(int count);

  /// Titre de la barre de l'outil Signer.
  ///
  /// In fr, this message translates to:
  /// **'Signer un PDF'**
  String get signTitle;

  /// Consigne en tête de l'outil Signer. La dernière proposition est une réserve juridique — ne la retirez pas.
  ///
  /// In fr, this message translates to:
  /// **'Apposez votre signature dessinée à la main sur une page d’un PDF. C’est un simple dessin ajouté au document, pas une signature électronique certifiée.'**
  String get signIntro;

  /// Sous-titre de la rangée qui ouvre la sélection de fichiers.
  ///
  /// In fr, this message translates to:
  /// **'Sélectionnez le document à signer'**
  String get signChooseSubtitle;

  /// Consigne au-dessus de la bande de vignettes de pages.
  ///
  /// In fr, this message translates to:
  /// **'Choisissez la page à signer.'**
  String get signPickPage;

  /// Titre de l'étape où l'on trace la signature au doigt.
  ///
  /// In fr, this message translates to:
  /// **'Dessiner ma signature'**
  String get signDrawTitle;

  /// Consigne de l'étape de tracé. La réserve juridique de la fin est délibérément répétée ici.
  ///
  /// In fr, this message translates to:
  /// **'Dessinez avec le doigt comme sur papier. Ceci appose un dessin sur la page — ce n’est pas une signature électronique certifiée.'**
  String get signDrawBody;

  /// Bandeau d'erreur quand on valide une zone de tracé restée vide.
  ///
  /// In fr, this message translates to:
  /// **'Dessinez une signature avant de continuer.'**
  String get signNeedDrawing;

  /// Bouton qui vide la zone de tracé. Court.
  ///
  /// In fr, this message translates to:
  /// **'Effacer'**
  String get signClear;

  /// Bouton qui retient la signature tracée et passe au placement. Court.
  ///
  /// In fr, this message translates to:
  /// **'Valider'**
  String get signValidate;

  /// Consigne de l'étape de placement. « Terminer » doit reprendre exactement le libellé traduit de actionFinish.
  ///
  /// In fr, this message translates to:
  /// **'Faites glisser la signature à l’endroit voulu sur la page, puis appuyez sur Terminer.'**
  String get signPlaceBody;

  /// Affiché à la place de la page quand son rendu échoue.
  ///
  /// In fr, this message translates to:
  /// **'Impossible d’afficher la page.'**
  String get signPageUnavailable;

  /// Titre de la boîte de progression. Garder le caractère de suspension final.
  ///
  /// In fr, this message translates to:
  /// **'Ajout de la signature…'**
  String get signProgress;

  /// Titre de l'écran vide de l'outil Éditer.
  ///
  /// In fr, this message translates to:
  /// **'Annoter un document'**
  String get editTitle;

  /// Consigne de l'écran vide de l'outil Éditer.
  ///
  /// In fr, this message translates to:
  /// **'Ajoutez du texte ou surlignez des passages directement sur un PDF existant.'**
  String get editEmptyBody;

  /// Titre de la boîte de dialogue de saisie d'une annotation.
  ///
  /// In fr, this message translates to:
  /// **'Ajouter du texte'**
  String get editAddTextTitle;

  /// Texte d'invite du champ de saisie de l'annotation.
  ///
  /// In fr, this message translates to:
  /// **'Votre texte'**
  String get editTextHint;

  /// Intitulé du curseur de corps, dans la boîte de saisie.
  ///
  /// In fr, this message translates to:
  /// **'Taille du texte : {size}'**
  String editFontSize(int size);

  /// Bandeau d'erreur quand on termine sans avoir rien ajouté.
  ///
  /// In fr, this message translates to:
  /// **'Ajoutez au moins une annotation avant de terminer.'**
  String get editNeedAnnotation;

  /// Titre de la boîte de progression. Garder le caractère de suspension final.
  ///
  /// In fr, this message translates to:
  /// **'Application des annotations…'**
  String get editProgress;

  /// Info-bulle du bouton qui abandonne le document en cours.
  ///
  /// In fr, this message translates to:
  /// **'Choisir un autre PDF'**
  String get editChooseOther;

  /// Info-bulle du bouton qui retire la dernière annotation posée. Il s'agit de défaire, pas d'interrompre.
  ///
  /// In fr, this message translates to:
  /// **'Annuler la dernière annotation'**
  String get editUndoTooltip;

  /// Onglet du sélecteur : poser du texte. Très court, il tient dans un segment.
  ///
  /// In fr, this message translates to:
  /// **'Texte'**
  String get editModeText;

  /// Onglet du sélecteur : surligner un passage. Très court, il tient dans un segment.
  ///
  /// In fr, this message translates to:
  /// **'Surligner'**
  String get editModeHighlight;

  /// Affiché à la place de la page quand son rendu échoue.
  ///
  /// In fr, this message translates to:
  /// **'Impossible d’afficher cette page.'**
  String get editPageUnavailable;

  /// Titre de l'écran vide de l'outil OCR.
  ///
  /// In fr, this message translates to:
  /// **'Rendre le texte recherchable'**
  String get ocrEmptyTitle;

  /// Consigne de l'écran vide de l'outil OCR. La seconde phrase est importante : elle rassure sur le fait que rien n'est abîmé.
  ///
  /// In fr, this message translates to:
  /// **'Le texte d’un PDF scanné est reconnu et ajouté par-dessus l’image, de façon invisible. La page ne change pas d’apparence.'**
  String get ocrEmptyBody;

  /// Bandeau d'erreur quand le fichier n'est ni un PDF ni une image. Les noms de format ne se traduisent pas.
  ///
  /// In fr, this message translates to:
  /// **'Choisissez un PDF ou une image (JPG, PNG…).'**
  String get ocrWrongFormat;

  /// Titre de la boîte de progression pendant la reconnaissance de caractères. Garder le caractère de suspension final.
  ///
  /// In fr, this message translates to:
  /// **'Reconnaissance en cours…'**
  String get ocrProgress;

  /// Bandeau d'erreur quand la reconnaissance échoue. {detail} est un message technique non traduit.
  ///
  /// In fr, this message translates to:
  /// **'Échec de la reconnaissance : {detail}'**
  String ocrFailed(String detail);

  /// Bouton de bas d'écran qui lance l'OCR. Doit tenir sur une ligne.
  ///
  /// In fr, this message translates to:
  /// **'Lancer la reconnaissance'**
  String get ocrRunAction;

  /// Titre de la barre de l'écran de résultat. « OCR » est un sigle international, à conserver.
  ///
  /// In fr, this message translates to:
  /// **'Résultat de l’OCR'**
  String get ocrResultTitle;

  /// Résumé de l'écran de résultat : combien de pages ont été traitées et ce qu'on peut faire ensuite.
  ///
  /// In fr, this message translates to:
  /// **'{count, plural, one{{count} page analysée} other{{count} pages analysées}}. Le PDF avec texte recherchable est prêt, et vous pouvez aussi copier tout le texte reconnu.'**
  String ocrResultBody(int count);

  /// Bouton qui met tout le texte reconnu dans le presse-papiers.
  ///
  /// In fr, this message translates to:
  /// **'Copier le texte'**
  String get ocrCopyText;

  /// Bandeau confirmant la copie dans le presse-papiers.
  ///
  /// In fr, this message translates to:
  /// **'Texte copié.'**
  String get ocrTextCopied;

  /// Consigne en tête de l'outil Caviarder. La distinction avec un rectangle noir décoratif est le cœur de l'outil — ne l'allégez pas.
  ///
  /// In fr, this message translates to:
  /// **'Masquez définitivement des zones d’un PDF (noms, adresses, montants). Contrairement à un simple rectangle noir posé par-dessus, le texte masqué est réellement supprimé du fichier, pas seulement recouvert : il ne peut plus être sélectionné ni copié.'**
  String get redactIntro;

  /// Sous-titre de la rangée qui ouvre la sélection de fichiers.
  ///
  /// In fr, this message translates to:
  /// **'Sélectionnez le document à caviarder'**
  String get redactChooseSubtitle;

  /// Le prix à payer du caviardage réel. « ppp » est l'abréviation française de « points par pouce » ; l'anglais et la plupart des langues emploient « dpi ».
  ///
  /// In fr, this message translates to:
  /// **'À savoir : pour supprimer le texte caché, chaque page du document est reconvertie en image (200 ppp). Le résultat n’est donc plus un PDF dont on peut sélectionner le texte, et le fichier obtenu est généralement plus lourd que l’original.'**
  String get redactCaveat;

  /// Bandeau d'erreur quand le document choisi est vide.
  ///
  /// In fr, this message translates to:
  /// **'Ce PDF ne contient aucune page.'**
  String get redactEmptyPdf;

  /// Bandeau d'erreur quand le PDF ne peut pas être lu. {detail} est un message technique non traduit.
  ///
  /// In fr, this message translates to:
  /// **'Impossible d’ouvrir ce PDF (il est peut-être protégé par mot de passe) : {detail}'**
  String redactOpenFailed(String detail);

  /// Bandeau d'erreur quand une page ne peut pas être rendue à l'écran. {detail} est un message technique non traduit.
  ///
  /// In fr, this message translates to:
  /// **'Affichage de la page {number} impossible : {detail}'**
  String redactPageRenderFailed(int number, String detail);

  /// Info-bulle du bouton qui retire le dernier rectangle tracé. Il s'agit de défaire, pas d'interrompre.
  ///
  /// In fr, this message translates to:
  /// **'Annuler la dernière zone'**
  String get redactUndoTooltip;

  /// Consigne au-dessus de la page, dans l'éditeur.
  ///
  /// In fr, this message translates to:
  /// **'Faites glisser le doigt sur la page pour tracer une zone à masquer. Le texte couvert sera réellement supprimé du fichier, pas seulement recouvert.'**
  String get redactInstructions;

  /// Info-bulle de la flèche qui remonte d'une page.
  ///
  /// In fr, this message translates to:
  /// **'Page précédente'**
  String get redactPagePrevious;

  /// Info-bulle de la flèche qui descend d'une page.
  ///
  /// In fr, this message translates to:
  /// **'Page suivante'**
  String get redactPageNext;

  /// Position dans le document, entre les deux flèches de navigation. Forme abrégée avec une barre oblique.
  ///
  /// In fr, this message translates to:
  /// **'Page {current} / {total}'**
  String redactPager(int current, int total);

  /// Affiché au-dessus des boutons tant qu'aucun rectangle n'a été tracé.
  ///
  /// In fr, this message translates to:
  /// **'Aucune zone tracée'**
  String get redactNoZone;

  /// Nombre de rectangles tracés, au-dessus des boutons.
  ///
  /// In fr, this message translates to:
  /// **'{count, plural, one{{count} zone à masquer} other{{count} zones à masquer}}'**
  String redactZoneCount(int count);

  /// Bouton qui abandonne le document en cours pour en ouvrir un autre. Court.
  ///
  /// In fr, this message translates to:
  /// **'Autre PDF'**
  String get redactOtherPdf;

  /// Bouton qui applique le caviardage. Verbe à l'infinitif, court ; employez le terme consacré de votre langue.
  ///
  /// In fr, this message translates to:
  /// **'Caviarder'**
  String get redactAction;

  /// Titre de la boîte de progression. Garder le caractère de suspension final.
  ///
  /// In fr, this message translates to:
  /// **'Caviardage en cours…'**
  String get redactProgress;

  /// Titre de l'écran vide de l'outil Rogner.
  ///
  /// In fr, this message translates to:
  /// **'Rogner les marges'**
  String get cropEmptyTitle;

  /// Consigne de l'écran vide de l'outil Rogner.
  ///
  /// In fr, this message translates to:
  /// **'Choisissez un PDF, puis faites glisser votre doigt sur l’aperçu pour délimiter la zone à conserver.'**
  String get cropEmptyBody;

  /// Bandeau d'erreur quand la zone tracée au doigt est trop réduite pour donner une page.
  ///
  /// In fr, this message translates to:
  /// **'La zone sélectionnée est trop petite.'**
  String get cropTooSmall;

  /// Titre de la boîte de progression. Garder le caractère de suspension final.
  ///
  /// In fr, this message translates to:
  /// **'Rognage en cours…'**
  String get cropProgress;

  /// Bandeau d'erreur quand le recadrage échoue. {detail} est un message technique non traduit.
  ///
  /// In fr, this message translates to:
  /// **'Échec du rognage : {detail}'**
  String cropFailed(String detail);

  /// Intitulé au-dessus de l'aperçu sur lequel on trace la zone à garder.
  ///
  /// In fr, this message translates to:
  /// **'Zone conservée'**
  String get cropKeptArea;

  /// Dimensions de la zone tracée, en millimètres puis en proportion de la page. Le signe × est le symbole de multiplication. L'espace avant le signe % est une convention française.
  ///
  /// In fr, this message translates to:
  /// **'{width} × {height} mm ({widthPercent} % × {heightPercent} %)'**
  String cropDimensions(
    int width,
    int height,
    int widthPercent,
    int heightPercent,
  );

  /// Bouton qui remet la zone aux dimensions de la page entière.
  ///
  /// In fr, this message translates to:
  /// **'Page entière'**
  String get cropFullPage;

  /// Intitulé de l'interrupteur qui étend le recadrage au document entier.
  ///
  /// In fr, this message translates to:
  /// **'Appliquer à toutes les pages'**
  String get cropAllPages;

  /// Sous-titre de l'interrupteur quand il est activé.
  ///
  /// In fr, this message translates to:
  /// **'La même zone est découpée sur chaque page.'**
  String get cropAllPagesOn;

  /// Sous-titre de l'interrupteur quand il est désactivé.
  ///
  /// In fr, this message translates to:
  /// **'Seule la page 1 est rognée, les autres sont conservées entières.'**
  String get cropAllPagesOff;

  /// Ce que le recadrage fait au document, dit avant qu'on l'applique.
  ///
  /// In fr, this message translates to:
  /// **'Le rognage réduit la taille de la page : le contenu situé en dehors de la zone n’est plus affiché ni imprimé.'**
  String get cropCaveat;

  /// Bouton de bas d'écran qui lance le recadrage. Verbe à l'infinitif, court.
  ///
  /// In fr, this message translates to:
  /// **'Rogner'**
  String get cropAction;

  /// Titre de la barre de l'outil Comparer.
  ///
  /// In fr, this message translates to:
  /// **'Comparer deux PDF'**
  String get compareTitle;

  /// Titre de l'écran vide de l'outil Comparer.
  ///
  /// In fr, this message translates to:
  /// **'Ce qui a changé'**
  String get compareEmptyTitle;

  /// Consigne de l'écran vide de l'outil Comparer.
  ///
  /// In fr, this message translates to:
  /// **'Choisissez deux versions d’un même PDF. Les passages ajoutés et supprimés seront mis en regard, page par page.'**
  String get compareEmptyBody;

  /// Intitulé de la première case : la version de départ. La lettre A sert de repère, gardez-la.
  ///
  /// In fr, this message translates to:
  /// **'Fichier A'**
  String get compareSlotA;

  /// Intitulé de la seconde case : la version à confronter. La lettre B sert de repère, gardez-la.
  ///
  /// In fr, this message translates to:
  /// **'Fichier B'**
  String get compareSlotB;

  /// Bouton qui lance la comparaison. Verbe à l'infinitif, court.
  ///
  /// In fr, this message translates to:
  /// **'Comparer'**
  String get compareAction;

  /// Titre de la boîte de progression. Garder le caractère de suspension final.
  ///
  /// In fr, this message translates to:
  /// **'Comparaison en cours…'**
  String get compareProgress;

  /// Bandeau d'erreur quand la comparaison échoue. {detail} est un message technique non traduit.
  ///
  /// In fr, this message translates to:
  /// **'Échec de la comparaison : {detail}'**
  String compareFailed(String detail);

  /// Résumé de la comparaison : combien de pages diffèrent, sur combien au total. Accordez le verbe au nombre.
  ///
  /// In fr, this message translates to:
  /// **'{changed, plural, one{{changed} page diffère} other{{changed} pages diffèrent}} sur {total}'**
  String compareChangedPages(int changed, int total);

  /// Affiché quand les deux documents sont identiques mot pour mot.
  ///
  /// In fr, this message translates to:
  /// **'Aucune différence détectée entre les deux fichiers.'**
  String get compareNoDifference;

  /// Titre d'une carte de résultat, pour une page qui a changé.
  ///
  /// In fr, this message translates to:
  /// **'Page {number}'**
  String comparePageHeading(int number);

  /// Titre de la feuille de résultats de la division : combien de fichiers en sont sortis.
  ///
  /// In fr, this message translates to:
  /// **'{count, plural, one{{count} fichier créé} other{{count} fichiers créés}}'**
  String organizeFilesCreated(int count);

  /// Nom d'un des fichiers issus de la division, dans la liste des résultats et dans la feuille de confirmation.
  ///
  /// In fr, this message translates to:
  /// **'Partie {number}'**
  String organizePartTitle(int number);
}

class _LDelegate extends LocalizationsDelegate<L> {
  const _LDelegate();

  @override
  Future<L> load(Locale locale) {
    return SynchronousFuture<L>(lookupL(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
    'cs',
    'da',
    'de',
    'el',
    'en',
    'es',
    'fil',
    'fr',
    'hr',
    'hu',
    'id',
    'it',
    'ja',
    'nb',
    'nl',
    'pl',
    'pt',
    'ro',
    'ru',
    'sk',
    'sl',
    'sv',
    'tr',
    'uk',
    'vi',
  ].contains(locale.languageCode);

  @override
  bool shouldReload(_LDelegate old) => false;
}

L lookupL(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'cs':
      return LCs();
    case 'da':
      return LDa();
    case 'de':
      return LDe();
    case 'el':
      return LEl();
    case 'en':
      return LEn();
    case 'es':
      return LEs();
    case 'fil':
      return LFil();
    case 'fr':
      return LFr();
    case 'hr':
      return LHr();
    case 'hu':
      return LHu();
    case 'id':
      return LId();
    case 'it':
      return LIt();
    case 'ja':
      return LJa();
    case 'nb':
      return LNb();
    case 'nl':
      return LNl();
    case 'pl':
      return LPl();
    case 'pt':
      return LPt();
    case 'ro':
      return LRo();
    case 'ru':
      return LRu();
    case 'sk':
      return LSk();
    case 'sl':
      return LSl();
    case 'sv':
      return LSv();
    case 'tr':
      return LTr();
    case 'uk':
      return LUk();
    case 'vi':
      return LVi();
  }

  throw FlutterError(
    'L.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
