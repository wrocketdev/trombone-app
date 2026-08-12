// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class LFr extends L {
  LFr([String locale = 'fr']) : super(locale);

  @override
  String get appTitle => 'Trombone — PDF, Scan & Word';

  @override
  String get appWordmark => 'Trombone';

  @override
  String get actionSave => 'Enregistrer';

  @override
  String get actionShare => 'Partager';

  @override
  String get actionCompress => 'Compresser';

  @override
  String get actionDone => 'Terminé';

  @override
  String get actionCancel => 'Annuler';

  @override
  String get actionChange => 'Changer';

  @override
  String get actionContinue => 'Continuer';

  @override
  String get actionOpening => 'Ouverture…';

  @override
  String get actionRemoveFile => 'Retirer ce fichier';

  @override
  String get progressPreparing => 'Préparation…';

  @override
  String progressPercent(int percent) {
    return '$percent %';
  }

  @override
  String get emptyReassurance => 'Export gratuit, sans filigrane ni limite.';

  @override
  String get emptyAcceptedFormats => 'Formats acceptés';

  @override
  String get exportSavedTitle => 'C’est enregistré.';

  @override
  String get exportSavedBody =>
      'Sous le nom et dans le dossier que vous venez de choisir. Sans filigrane, sans limite, rien à débloquer.';

  @override
  String get exportSaveDialogTitle => 'Enregistrer le PDF';

  @override
  String pageTileIncluded(int number) {
    return 'Page $number, incluse. Toucher pour l’écarter.';
  }

  @override
  String pageTileExcluded(int number) {
    return 'Page $number, écartée. Toucher pour l’inclure.';
  }

  @override
  String pageTileRotate(int number) {
    return 'Pivoter la page $number';
  }

  @override
  String sectionHeaderSemantics(String title, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count outils',
      one: '$count outil',
    );
    return '$title, $_temp0';
  }

  @override
  String toolCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count outils',
      one: '$count outil',
    );
    return '$_temp0';
  }

  @override
  String get homePromise =>
      'Faites votre document, exportez-le.\nAucun mur à la fin.';

  @override
  String get homeChipNoAccount => 'Sans compte';

  @override
  String get homeChipNoWatermark => 'Sans filigrane';

  @override
  String get homeChipUnlimited => 'Export illimité';

  @override
  String get homeSearchTooltip => 'Rechercher un outil';

  @override
  String get homeColophon =>
      'Rien ne se débloque contre paiement au moment d’enregistrer. L’export est gratuit, sans filigrane et sans limite de nombre.';

  @override
  String get sectionFeatured => 'À la une';

  @override
  String get sectionToPdf => 'Vers le PDF';

  @override
  String get sectionFromPdf => 'Depuis le PDF';

  @override
  String get sectionSecurity => 'Sécurité';

  @override
  String get sectionEdit => 'Éditer';

  @override
  String get toolMerge => 'Fusionner';

  @override
  String get toolMergeKeywords =>
      'assembler combiner joindre regrouper reunir concatener';

  @override
  String get toolMergeSubtitle =>
      'PDF, Word, images et texte en un seul document';

  @override
  String get toolRectoVerso => 'Recto-verso';

  @override
  String get toolRectoVersoKeywords =>
      'double face intercaler scan pair impair';

  @override
  String get toolRectoVersoSubtitle => 'Deux scans, remis dans l’ordre';

  @override
  String get toolImagesToPdf => 'Images vers PDF';

  @override
  String get toolImagesToPdfKeywords =>
      'photo jpg jpeg png photos album appareil';

  @override
  String get toolImagesToPdfSubtitle => 'Photos et captures en un document';

  @override
  String get toolPdfToWord => 'PDF vers Word';

  @override
  String get toolPdfToWordKeywords =>
      'docx traitement de texte editable convertir';

  @override
  String get toolPdfToWordSubtitle => 'Texte et tableaux, modifiables';

  @override
  String get toolOrganize => 'Organiser un PDF';

  @override
  String get toolOrganizeKeywords =>
      'diviser separer extraire reordonner ordre pages supprimer';

  @override
  String get toolOrganizeSubtitle => 'Diviser, extraire, réordonner';

  @override
  String get toolExcelToPdf => 'Excel vers PDF';

  @override
  String get toolExcelToPdfKeywords => 'tableur xlsx classeur feuille calcul';

  @override
  String get toolPptxToPdf => 'PowerPoint vers PDF';

  @override
  String get toolPptxToPdfKeywords => 'pptx diapositive presentation slides';

  @override
  String get toolHtmlToPdf => 'Page web vers PDF';

  @override
  String get toolHtmlToPdfKeywords => 'html site internet url lien article';

  @override
  String get toolScan => 'Scanner un document';

  @override
  String get toolScanKeywords => 'camera photo numeriser scan appareil papier';

  @override
  String get toolPdfToExcel => 'PDF vers Excel';

  @override
  String get toolPdfToExcelKeywords => 'tableur xlsx tableau extraire donnees';

  @override
  String get toolPdfToPptx => 'PDF vers PowerPoint';

  @override
  String get toolPdfToPptxKeywords => 'pptx diapositive presentation slides';

  @override
  String get toolPdfToImages => 'PDF vers Images';

  @override
  String get toolPdfToImagesKeywords => 'jpg png photo exporter capture';

  @override
  String get toolOcr => 'Texte cherchable (OCR)';

  @override
  String get toolOcrKeywords =>
      'reconnaissance caracteres scanne copier selectionner';

  @override
  String get toolPdfA => 'Convertir en PDF/A';

  @override
  String get toolPdfAKeywords => 'archivage norme long terme conservation';

  @override
  String get toolProtect => 'Protéger PDF';

  @override
  String get toolProtectKeywords =>
      'mot de passe cadenas chiffrer verrouiller securiser';

  @override
  String get toolUnlock => 'Déverrouiller PDF';

  @override
  String get toolUnlockKeywords =>
      'retirer mot de passe ouvrir dechiffrer debloquer cadenas';

  @override
  String get toolRepair => 'Réparer PDF';

  @override
  String get toolRepairKeywords =>
      'corrompu illisible endommage recuperer erreur';

  @override
  String get toolRedact => 'Caviarder un PDF';

  @override
  String get toolRedactKeywords =>
      'masquer noircir anonymiser confidentiel effacer';

  @override
  String get toolEdit => 'Éditer PDF';

  @override
  String get toolEditKeywords => 'texte modifier corriger annoter ecrire';

  @override
  String get toolSign => 'Signer';

  @override
  String get toolSignKeywords => 'signature paraphe contrat main';

  @override
  String get toolWatermark => 'Filigrane';

  @override
  String get toolWatermarkKeywords =>
      'watermark tampon confidentiel brouillon marque';

  @override
  String get toolPageNumbers => 'Numéros de page';

  @override
  String get toolPageNumbersKeywords => 'pagination folio numeroter chiffres';

  @override
  String get toolCrop => 'Rogner un PDF';

  @override
  String get toolCropKeywords => 'couper marges recadrer bords taille';

  @override
  String get toolCompare => 'Comparer PDF';

  @override
  String get toolCompareKeywords => 'difference versions diff changements';

  @override
  String get searchHint => 'Fusionner, mot de passe, filigrane…';

  @override
  String get searchClear => 'Effacer';

  @override
  String searchNoResultTitle(String query) {
    return 'Aucun outil pour « $query ».';
  }

  @override
  String get searchNoResultBody =>
      'Essayez le format que vous avez sous la main — « Word », « Excel », « photo » — ou ce que vous voulez en faire : « signer », « diviser », « mot de passe ».';

  @override
  String get actionUndo => 'Annuler';

  @override
  String get actionApply => 'Appliquer';

  @override
  String get actionChoose => 'Choisir';

  @override
  String get actionChoosePdf => 'Choisir un PDF';

  @override
  String get actionChooseFiles => 'Choisir des fichiers';

  @override
  String get actionConvert => 'Convertir';

  @override
  String get actionFinish => 'Terminer';

  @override
  String get actionBack => 'Retour';

  @override
  String get actionAdd => 'Ajouter';

  @override
  String get noFileChosen => 'Aucun fichier choisi';

  @override
  String errorExportFailed(String detail) {
    return 'Échec de l’export : $detail';
  }

  @override
  String errorShareFailed(String detail) {
    return 'Échec du partage : $detail';
  }

  @override
  String errorOpenFailed(String detail) {
    return 'Impossible d’ouvrir le fichier : $detail';
  }

  @override
  String errorConversionFailed(String detail) {
    return 'Échec de la conversion : $detail';
  }

  @override
  String errorOnFile(String name, String detail) {
    return '$name : $detail';
  }

  @override
  String get errorPickPdf => 'Veuillez choisir un fichier PDF.';

  @override
  String sizeBytes(String value) {
    return '$value o';
  }

  @override
  String sizeKb(String value) {
    return '$value Ko';
  }

  @override
  String sizeMb(String value) {
    return '$value Mo';
  }

  @override
  String sizeApprox(String size) {
    return '~ $size';
  }

  @override
  String pageCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count pages',
      one: '$count page',
    );
    return '$_temp0';
  }

  @override
  String pageCountOfTotal(int kept, int total) {
    String _temp0 = intl.Intl.pluralLogic(
      kept,
      locale: localeName,
      other: '$kept pages',
      one: '$kept page',
    );
    return '$_temp0 sur $total';
  }

  @override
  String pageOfTotal(int current, int total) {
    return 'Page $current sur $total';
  }

  @override
  String get formatPdf => 'PDF';

  @override
  String get formatWord => 'Word';

  @override
  String get formatExcel => 'Excel';

  @override
  String get formatPowerPoint => 'PowerPoint';

  @override
  String get formatImages => 'Images';

  @override
  String get formatText => 'Texte';

  @override
  String get mergeAddFile => 'Ajouter un fichier';

  @override
  String get mergeAddHint => 'PDF, Word, images ou texte';

  @override
  String get mergeEmptyTitle => 'Un seul document';

  @override
  String get mergeEmptyBody =>
      'Ajoutez des PDF, des fichiers Word, des images ou du texte. Vous pourrez les réordonner et écarter des pages avant l’export.';

  @override
  String get mergeNeedOnePage =>
      'Ajoutez au moins un fichier avec une page à inclure.';

  @override
  String get mergeProgress => 'Fusion en cours…';

  @override
  String mergeFailed(String detail) {
    return 'Échec de la fusion : $detail';
  }

  @override
  String mergeRemoved(String name) {
    return '$name retiré.';
  }

  @override
  String mergeRemoveTooltip(String name) {
    return 'Retirer $name';
  }

  @override
  String mergeMoveSemantics(String name) {
    return 'Déplacer $name';
  }

  @override
  String get mergeRotateAll => 'Pivoter toutes les pages';

  @override
  String mergePreviewAndExport(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count pages',
      one: '$count page',
    );
    return 'Aperçu et export ($_temp0)';
  }

  @override
  String previewTitle(String size) {
    return 'Aperçu · $size';
  }

  @override
  String previewZoomPage(int number) {
    return 'Page $number, agrandir';
  }

  @override
  String get previewPageUnreadable => 'Page illisible.';

  @override
  String previewExportWhat(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count pages',
      one: '$count page',
    );
    return 'PDF · $_temp0';
  }

  @override
  String get compressTitle => 'Compression';

  @override
  String compressBody(String size) {
    return 'Taille actuelle : $size. Choisissez un niveau — la taille estimée s’affiche avant d’appliquer.';
  }

  @override
  String get compressEstimating => 'Estimation…';

  @override
  String get compressProgress => 'Compression en cours…';

  @override
  String compressFailed(String detail) {
    return 'Échec de la compression : $detail';
  }

  @override
  String get protectEmptyTitle => 'Mettre sous mot de passe';

  @override
  String get protectEmptyBody =>
      'Le PDF ne s’ouvrira plus sans le mot de passe que vous choisissez. Gardez-le : il ne peut pas être récupéré.';

  @override
  String get protectSubtitle => 'Sera chiffré en AES 256 bits';

  @override
  String get protectPassword => 'Mot de passe';

  @override
  String get protectConfirmPassword => 'Confirmer le mot de passe';

  @override
  String get protectShowPasswords => 'Afficher les mots de passe';

  @override
  String get protectHidePasswords => 'Masquer les mots de passe';

  @override
  String get protectMismatch => 'Les deux mots de passe diffèrent.';

  @override
  String get protectWarning =>
      'Notez-le quelque part : sans lui, le document devient définitivement illisible. Aucune récupération n’est possible, ni par vous ni par l’application.';

  @override
  String get protectAlreadyProtected =>
      'Ce fichier est déjà protégé — utilisez d’abord Déverrouiller PDF.';

  @override
  String get protectProgress => 'Protection en cours…';

  @override
  String protectFailed(String detail) {
    return 'Échec de la protection : $detail';
  }

  @override
  String get protectAction => 'Protéger';

  @override
  String get protectResultTitle => 'PDF protégé';

  @override
  String get protectResultDetail =>
      'Chiffré en AES 256 bits. Il faudra le mot de passe pour l’ouvrir.';

  @override
  String get protectExportWhat => 'PDF protégé par mot de passe';

  @override
  String get unlockEmptyTitle => 'Retirer le mot de passe';

  @override
  String get unlockEmptyBody =>
      'Il vous faut le mot de passe actuel du document. Une fois retiré, le PDF s’ouvrira librement.';

  @override
  String get unlockAcceptsProtectedPdf => 'PDF protégé';

  @override
  String get unlockChooseProtectedPdf => 'Choisir un PDF protégé';

  @override
  String get unlockCurrentPassword => 'Mot de passe actuel';

  @override
  String get unlockWrongPassword => 'Mot de passe incorrect.';

  @override
  String get unlockProgress => 'Déverrouillage en cours…';

  @override
  String unlockFailed(String detail) {
    return 'Échec du déverrouillage : $detail';
  }

  @override
  String get unlockAction => 'Déverrouiller';

  @override
  String get repairEmptyTitle => 'Réparer un fichier abîmé';

  @override
  String get repairEmptyBody =>
      'La structure interne d’un PDF endommagé est reconstruite. Ce qui est récupérable le sera.';

  @override
  String get repairProgress => 'Réparation en cours…';

  @override
  String get repairFailed =>
      'Impossible de réparer ce fichier — il est peut-être trop endommagé.';

  @override
  String get repairAction => 'Réparer';

  @override
  String get pdfToWordEmptyTitle => 'Un Word modifiable';

  @override
  String get pdfToWordEmptyBody =>
      'Le texte et la structure du PDF sont transposés dans un document .docx que vous pourrez rouvrir et corriger.';

  @override
  String get pdfToWordAnalyzing => 'Analyse du document…';

  @override
  String get pdfToWordAnalysisPending => 'Analyse en attente';

  @override
  String pdfToWordAnalysisFailed(String detail) {
    return 'Analyse impossible : $detail';
  }

  @override
  String get pdfLocked =>
      'Ce PDF est protégé par un mot de passe. Déverrouillez-le d’abord.';

  @override
  String get pdfToWordConverting => 'Conversion en Word…';

  @override
  String get pdfToWordSummaryTitle => 'Contenu détecté';

  @override
  String pdfToWordParagraphCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count paragraphes',
      one: '$count paragraphe',
    );
    return '$_temp0';
  }

  @override
  String pdfToWordHeadingCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count titres',
      one: '$count titre',
    );
    return '$_temp0';
  }

  @override
  String pdfToWordTableCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count tableaux',
      one: '$count tableau',
    );
    return '$_temp0';
  }

  @override
  String get pdfToWordNoTables =>
      'Aucun tableau détecté : si votre PDF en contient, ses lignes seront converties en paragraphes.';

  @override
  String get pdfToWordCaveat =>
      'La conversion reproduit le texte, la mise en forme et les tableaux, mais pas la mise en page exacte : la position des images et des colonnes n’est pas conservée, et les images ne sont pas reprises dans le document Word.';

  @override
  String get pdfToWordScanWarning =>
      'Ce PDF semble être un scan : aucun texte n’a été trouvé. Utilisez d’abord l’outil Texte cherchable (OCR), puis revenez convertir le PDF obtenu.';

  @override
  String get pdfToWordResultTitle => 'Document Word prêt';

  @override
  String pdfToWordResultDetail(String name, String size) {
    return '$name — $size';
  }

  @override
  String get pdfToWordExportWhat => 'Document Word';

  @override
  String get pdfToWordConvertAction => 'Convertir en Word';

  @override
  String get actionConvertAgain => 'Convertir à nouveau';

  @override
  String errorSaveFailed(String detail) {
    return 'Enregistrement impossible : $detail';
  }

  @override
  String get rectoVersoIntro =>
      'Un chargeur simple face donne deux fichiers : les pages impaires dans l’ordre, les pages paires souvent dans l’ordre inverse. Choisissez les deux pour les recomposer.';

  @override
  String get rectoVersoOddSlot => 'Fichier des pages impaires (recto)';

  @override
  String get rectoVersoEvenSlot => 'Fichier des pages paires (verso)';

  @override
  String get rectoVersoReversed => 'Le second fichier est en ordre inverse';

  @override
  String get rectoVersoReversedHint =>
      'C’est le cas le plus courant, coché par défaut';

  @override
  String rectoVersoPreview(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count pages',
      one: '$count page',
    );
    return 'Aperçu de l’entrelacement ($_temp0)';
  }

  @override
  String get rectoVersoProgress => 'Entrelacement en cours…';

  @override
  String fileWithPageCount(String name, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count pages',
      one: '$count page',
    );
    return '$name · $_temp0';
  }

  @override
  String get actionPreviewAndExport => 'Aperçu et export';

  @override
  String errorOpenFailedShort(String detail) {
    return 'Impossible d’ouvrir : $detail';
  }

  @override
  String errorGeneric(String detail) {
    return 'Échec : $detail';
  }

  @override
  String get actionConvertToPdf => 'Convertir en PDF';

  @override
  String get convertProgress => 'Conversion en cours…';

  @override
  String get excelEmptyTitle => 'Un classeur en PDF';

  @override
  String get excelEmptyBody =>
      'Les feuilles d’un fichier .xlsx deviennent des pages PDF, prêtes à envoyer ou à imprimer.';

  @override
  String get excelChooseWorkbook => 'Choisir un classeur';

  @override
  String get excelChooseXlsx => 'Choisir un classeur .xlsx';

  @override
  String get excelLegacyFormat =>
      'Le format .xls (ancien format binaire Excel) n’est pas pris en charge. Enregistrez le fichier en .xlsx puis réessayez.';

  @override
  String get excelWrongFormat => 'Veuillez choisir un classeur Excel .xlsx.';

  @override
  String excelUnreadable(String detail) {
    return 'Classeur illisible : $detail';
  }

  @override
  String excelSheetsAndRows(int sheets, int rows) {
    String _temp0 = intl.Intl.pluralLogic(
      sheets,
      locale: localeName,
      other: '$sheets feuilles',
      one: '$sheets feuille',
    );
    String _temp1 = intl.Intl.pluralLogic(
      rows,
      locale: localeName,
      other: '$rows lignes au total',
      one: '$rows ligne au total',
    );
    return '$_temp0 · $_temp1';
  }

  @override
  String get excelSheetsDetected => 'Feuilles détectées';

  @override
  String get excelEmptySheet => 'Feuille vide';

  @override
  String excelSheetDimensions(int rows, int columns) {
    String _temp0 = intl.Intl.pluralLogic(
      rows,
      locale: localeName,
      other: '$rows lignes',
      one: '$rows ligne',
    );
    String _temp1 = intl.Intl.pluralLogic(
      columns,
      locale: localeName,
      other: '$columns colonnes',
      one: '$columns colonne',
    );
    return '$_temp0 × $_temp1';
  }

  @override
  String get excelRepeatHeader => 'Répéter la ligne d’en-tête sur chaque page';

  @override
  String get excelRepeatHeaderHint =>
      'La première ligne de la feuille est redessinée en haut de chaque page du tableau.';

  @override
  String get excelCaveat =>
      'Ce que la conversion reprend : le texte des cellules tel qu’il est enregistré dans le fichier (y compris le dernier résultat calculé des formules), la première ligne en gras et un quadrillage.\n\nCe qui n’est pas repris : couleurs, polices, formats de nombres, cellules fusionnées, images, graphiques et formules elles-mêmes. Les colonnes sont réduites pour tenir dans la largeur de la page ; sur les feuilles très larges, le texte des cellules trop étroites est tronqué par « … ».';

  @override
  String get pptxEmptyTitle => 'Une présentation en PDF';

  @override
  String get pptxEmptyBody =>
      'Une page paysage 16:9 par diapositive, reprenant le titre et les puces. Le texte est repris ; les images, formes et arrière-plans d’origine ne le sont pas.\n\nFormat accepté : .pptx. Un ancien fichier .ppt doit d’abord être réenregistré en .pptx depuis PowerPoint.';

  @override
  String get pptxChoosePresentation => 'Choisir une présentation';

  @override
  String get pptxTextOnlyTitle => 'Conversion du texte uniquement';

  @override
  String get pptxTextOnlyBody =>
      'Le texte de chaque diapositive est repris. Les images, formes, arrière-plans, couleurs et mises en page d’origine ne sont pas conservés : le PDF obtenu est une mise en page simple et lisible, pas une copie fidèle de votre présentation.';

  @override
  String pptxSlideCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count diapositives',
      one: '$count diapositive',
    );
    return '$_temp0';
  }

  @override
  String get pptxSlidesDetected => 'Diapositives détectées';

  @override
  String pptxMoreSlides(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count autres diapositives',
      one: '$count autre diapositive',
    );
    return 'et $_temp0…';
  }

  @override
  String get pptxUntitledSlide => 'Sans titre';

  @override
  String get pptxEmptySlide => 'Aucun texte (image ou forme uniquement)';

  @override
  String pptxTextLineCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count lignes de texte',
      one: '$count ligne de texte',
    );
    return '$_temp0';
  }

  @override
  String pptxReadFailed(String detail) {
    return 'Lecture impossible : $detail';
  }

  @override
  String get compressLevelLight => 'Légère';

  @override
  String get compressLevelMedium => 'Moyenne';

  @override
  String get compressLevelStrong => 'Forte';

  @override
  String get pptxQualityStandard => 'Standard (150 dpi)';

  @override
  String get pptxQualityHigh => 'Haute (220 dpi)';

  @override
  String get pdfToExcelEmptyTitle => 'Récupérer les tableaux';

  @override
  String get pdfToExcelEmptyBody =>
      'Les tableaux d’un PDF sont extraits vers un classeur Excel. La mise en forme n’est pas conservée, les valeurs le sont.';

  @override
  String pdfToExcelPagesAnalyzed(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count pages analysées',
      one: '$count page analysée',
    );
    return '$_temp0';
  }

  @override
  String pdfToExcelAnalysisFailed(String detail) {
    return 'Analyse impossible. Le PDF est peut-être protégé par un mot de passe ou endommagé. ($detail)';
  }

  @override
  String get pdfToExcelNothingToExport =>
      'Rien à exporter : aucun tableau détecté.';

  @override
  String get pdfToExcelBuilding => 'Création du classeur…';

  @override
  String get pdfToExcelIncludeParagraphs =>
      'Inclure aussi le texte hors tableaux (une ligne par paragraphe)';

  @override
  String get pdfToExcelIncludeParagraphsHint =>
      'Utile pour un document semi-structuré : le texte est placé dans la colonne A, après les tableaux de la page.';

  @override
  String get pdfToExcelCaveatTitle => 'Ce que la conversion ne conserve pas';

  @override
  String get pdfToExcelCaveat =>
      'La détection repose sur la position du texte dans la page : les tableaux sans bordure régulière, les cellules fusionnées et les colonnes très irrégulières peuvent être mal découpés. Un PDF scanné (image) ne contient aucun texte extractible et ne donnera rien. Les couleurs, formules et images ne sont jamais reprises : seules les valeurs texte le sont.';

  @override
  String pdfToExcelTablesFound(int tables, int pages) {
    String _temp0 = intl.Intl.pluralLogic(
      tables,
      locale: localeName,
      other: '$tables tableaux détectés',
      one: '$tables tableau détecté',
    );
    String _temp1 = intl.Intl.pluralLogic(
      pages,
      locale: localeName,
      other: '$pages pages',
      one: '$pages page',
    );
    return '$_temp0 sur $_temp1';
  }

  @override
  String pdfToExcelPagesConcerned(String pages) {
    return 'Pages concernées : $pages';
  }

  @override
  String pdfToExcelParagraphsOutside(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count paragraphes hors tableaux',
      one: '$count paragraphe hors tableaux',
    );
    return '$_temp0';
  }

  @override
  String get pdfToExcelScannedWarning =>
      'Aucun texte n’a pu être extrait de ce PDF : il s’agit très probablement d’un document scanné (des images de pages). Un tableur ne peut rien en tirer ; utilisez d’abord l’outil de reconnaissance de texte (OCR).';

  @override
  String get pdfToExcelNoTableWarning =>
      'Aucune structure de tableau n’a été reconnue dans ce document. Le texte est bien là, mais il n’est pas disposé en colonnes régulières. Plutôt que de produire un classeur illisible, activez « Inclure aussi le texte hors tableaux » ci-dessus, ou utilisez « PDF vers Word » qui conserve mieux les paragraphes.';

  @override
  String get pdfToExcelResultTitle => 'Classeur prêt';

  @override
  String get pdfToExcelExportWhat => 'Classeur Excel';

  @override
  String get pdfToExcelConvertAction => 'Convertir en Excel';

  @override
  String resultNameAndSize(String name, String size) {
    return '$name — $size';
  }

  @override
  String get pdfToPptxEmptyTitle => 'Une diapositive par page';

  @override
  String get pdfToPptxEmptyBody =>
      'Le PDF devient une présentation PowerPoint à l’identique. Chaque page arrive sous forme d’image : la mise en page est fidèle, mais le texte ne sera pas modifiable dans PowerPoint.';

  @override
  String pdfToPptxOpenFailed(String detail) {
    return 'Impossible d’ouvrir ce PDF : $detail';
  }

  @override
  String get pdfToPptxConverting => 'Conversion en PowerPoint…';

  @override
  String pdfToPptxPagesToSlides(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count pages',
      one: '$count page',
    );
    String _temp1 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count diapositives',
      one: '$count diapositive',
    );
    return '$_temp0 > $_temp1';
  }

  @override
  String get pdfToPptxEmptyDocument => 'Document vide';

  @override
  String get qualityLabel => 'Qualité';

  @override
  String get pdfToPptxQualityHint =>
      'Une résolution plus élevée donne des diapositives plus nettes mais un fichier nettement plus lourd.';

  @override
  String pdfToPptxHeavyWarning(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count pages',
      one: '$count page',
    );
    return 'Attention : en haute qualité, une présentation de $_temp0 peut peser plusieurs dizaines de Mo et être longue à ouvrir. Choisissez Standard en cas de doute.';
  }

  @override
  String get goodToKnow => 'À savoir';

  @override
  String get pdfToPptxCaveat =>
      'Chaque diapositive est une image de la page : la mise en page est identique au PDF, mais le texte ne sera pas modifiable dans PowerPoint.\nPour récupérer du texte modifiable, utilisez plutôt « PDF vers Word ».\nUne présentation n’a qu’un seul format de diapositive : il est repris de la première page, et les pages de format différent sont centrées à l’intérieur.';

  @override
  String get pdfToPptxResultTitle => 'Présentation prête';

  @override
  String pdfToPptxResultDetail(
    String name,
    int count,
    String size,
    String quality,
  ) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count diapositives',
      one: '$count diapositive',
    );
    return '$name — $_temp0 · $size · $quality';
  }

  @override
  String get notSavedYet =>
      'Le fichier n’est pas encore sur votre appareil : enregistrez-le ou partagez-le.';

  @override
  String get pdfToPptxChangeQuality => 'Changer la qualité';

  @override
  String get pdfToPptxConvertAction => 'Convertir en PowerPoint';

  @override
  String pdfToPptxExportWhat(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count diapositives',
      one: '$count diapositive',
    );
    return 'Présentation PowerPoint · $_temp0';
  }

  @override
  String get formatLabel => 'Format';

  @override
  String get actionExport => 'Exporter';

  @override
  String get imageQualityWeb => 'Web (72 dpi)';

  @override
  String get imageQualityStandard => 'Standard (150 dpi)';

  @override
  String get imageQualityHigh => 'Haute qualité (300 dpi)';

  @override
  String get pdfToImagesEmptyTitle => 'Une image par page';

  @override
  String get pdfToImagesEmptyBody =>
      'Choisissez un PDF : chaque page en sortira sous forme d’image, à la définition que vous réglez ensuite.';

  @override
  String pdfToImagesNotAPdf(String name) {
    return '$name : veuillez choisir un fichier PDF.';
  }

  @override
  String errorLoadFailed(String detail) {
    return 'Échec du chargement : $detail';
  }

  @override
  String get pdfToImagesProgress => 'Export en cours…';

  @override
  String pdfToImagesExportWhat(int count, String format) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count images',
      one: '$count image',
    );
    return '$_temp0 $format';
  }

  @override
  String get pdfaEmptyTitle => 'Archiver pour longtemps';

  @override
  String get pdfaEmptyBody =>
      'Le PDF/A est le format d’archivage exigé par de nombreuses administrations. Le document est converti sans perdre son apparence.';

  @override
  String get pdfaConformanceLevel => 'Niveau de conformité';

  @override
  String get pdfaA1bDetail =>
      'Le niveau le plus strict et le plus universellement accepté. À choisir en cas de doute.';

  @override
  String get pdfaA2bDetail =>
      'Basé sur PDF 1.7 : compression plus efficace, fichiers un peu plus légers.';

  @override
  String get pdfaA3bDetail =>
      'Comme le A-2b, mais autorise les pièces jointes (souvent demandé pour la facturation électronique).';

  @override
  String pdfaConvertingTo(String level) {
    return 'Conversion en $level…';
  }

  @override
  String get pdfaCaveatTitle => 'Ce que la conversion change';

  @override
  String pdfaCaveat(int dpi) {
    return 'Chaque page est redessinée en image à $dpi dpi : le texte devient une image, la mise en page est figée. C’est ce qui rend le fichier réellement conforme sans dépendre des polices du document d’origine, mais en contrepartie le texte n’est plus sélectionnable ni recherchable, les liens et les formulaires disparaissent, et le fichier devient plus lourd.';
  }

  @override
  String pdfaOpenFailed(String detail) {
    return 'Impossible d’ouvrir ce PDF : $detail';
  }

  @override
  String get imagesToPdfEmptyTitle => 'Des images, un PDF';

  @override
  String get imagesToPdfEmptyBody =>
      'JPG, PNG, WebP, HEIC — ajoutez vos images et elles seront assemblées dans l’ordre que vous choisissez.';

  @override
  String get imagesToPdfChoose => 'Choisir des images';

  @override
  String get imagesToPdfAdd => 'Ajouter des images';

  @override
  String imagesToPdfRejected(String names) {
    return 'Ignoré (pas une image) : $names';
  }

  @override
  String get imagesToPdfBuilding => 'Création du PDF…';

  @override
  String imagesToPdfBuildFailed(String detail) {
    return 'Échec de la création : $detail';
  }

  @override
  String imagesToPdfCreateAction(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count images',
      one: '$count image',
    );
    return 'Créer le PDF ($_temp0)';
  }

  @override
  String get actionRotate => 'Pivoter';

  @override
  String get actionRemove => 'Retirer';

  @override
  String get htmlTitle => 'HTML / page web en PDF';

  @override
  String get htmlIntro =>
      'Transformez une page web ou du code HTML en PDF A4. Le rendu est réalisé par le navigateur intégré à Android, la mise en page est donc celle d’une impression depuis Chrome.';

  @override
  String get htmlModeUrl => 'Adresse web';

  @override
  String get htmlModeCode => 'Code HTML';

  @override
  String get htmlUrlLabel => 'Adresse de la page';

  @override
  String get htmlUrlHint => 'https://exemple.fr/article';

  @override
  String get htmlCodeLabel => 'Code HTML';

  @override
  String get htmlCodeHint => '<h1>Titre</h1>\n<p>Texte…</p>';

  @override
  String get htmlUrlBadScheme =>
      'L’adresse doit commencer par http:// ou https://.';

  @override
  String get htmlUrlIncomplete => 'Entrez une adresse web complète.';

  @override
  String get htmlCodeEmpty => 'Collez du code HTML à convertir.';

  @override
  String get htmlLoadingUrl => 'Chargement de la page et conversion…';

  @override
  String get htmlConverting => 'Conversion du HTML en cours…';

  @override
  String get htmlNetworkNotice =>
      'Une connexion internet est nécessaire : c’est le seul outil de l’application qui doit télécharger la page. Les pages qui exigent une connexion à un compte, un bandeau de cookies ou beaucoup de JavaScript peuvent sortir incomplètes.';

  @override
  String get htmlOfflineNotice =>
      'Le HTML et le CSS écrits directement dans la page sont rendus hors ligne. En revanche, les images, feuilles de style ou polices appelées par une adresse web externe nécessitent une connexion internet.';

  @override
  String get watermarkEmptyTitle => 'Apposer un filigrane';

  @override
  String get watermarkEmptyBody =>
      'Un texte de votre choix est répété en fond sur toutes les pages — pour marquer un document comme confidentiel ou brouillon.';

  @override
  String get watermarkEmptyNote => 'Export gratuit et sans limite de nombre.';

  @override
  String get watermarkTextLabel => 'Texte du filigrane';

  @override
  String get watermarkDefaultText => 'CONFIDENTIEL';

  @override
  String get watermarkNeedText => 'Entrez un texte pour le filigrane.';

  @override
  String watermarkOpacity(int percent) {
    return 'Opacité : $percent %';
  }

  @override
  String watermarkRotation(int degrees) {
    return 'Angle de rotation : $degrees°';
  }

  @override
  String watermarkFontSize(int points) {
    return 'Taille du texte : $points pt';
  }

  @override
  String get watermarkColor => 'Couleur';

  @override
  String get colorGrey => 'Gris';

  @override
  String get colorRed => 'Rouge';

  @override
  String get colorBlue => 'Bleu';

  @override
  String get colorBlack => 'Noir';

  @override
  String get watermarkProgress => 'Application du filigrane en cours…';

  @override
  String percentValue(int percent) {
    return '$percent %';
  }

  @override
  String degreesValue(int degrees) {
    return '$degrees°';
  }

  @override
  String pointsValue(int points) {
    return '$points pt';
  }

  @override
  String get pageNumbersEmptyTitle => 'Numéroter les pages';

  @override
  String get pageNumbersEmptyBody =>
      'Choisissez un PDF, puis la position et le format des numéros qui seront ajoutés sur chaque page.';

  @override
  String get positionLabel => 'Position';

  @override
  String get positionBottomCenter => 'Bas centre';

  @override
  String get positionBottomRight => 'Bas droite';

  @override
  String get positionTopCenter => 'Haut centre';

  @override
  String get positionTopRight => 'Haut droite';

  @override
  String get pageNumbersFormatPlain => 'N';

  @override
  String get pageNumbersFormatOfTotal => 'N / total';

  @override
  String get pageNumbersStart => 'Numéro de départ';

  @override
  String get pageNumbersProgress => 'Numérotation en cours…';

  @override
  String get organizeEmptyTitle => 'Reprendre un PDF en main';

  @override
  String get organizeEmptyBody =>
      'Ouvrez un document pour le diviser, en extraire des pages ou en changer l’ordre.';

  @override
  String get organizeOpenFile => 'Ouvrir un fichier';

  @override
  String get organizeNothingToExport => 'Aucune page à exporter.';

  @override
  String organizePagesKept(int kept, int total) {
    String _temp0 = intl.Intl.pluralLogic(
      kept,
      locale: localeName,
      other: '$kept pages retenues',
      one: '$kept page retenue',
    );
    return '$_temp0 sur $total';
  }

  @override
  String get organizePageExcluded => 'Écartée';

  @override
  String organizePageMoved(int from) {
    return 'Déplacée depuis la position $from';
  }

  @override
  String organizePageTitle(int number) {
    return 'Page $number';
  }

  @override
  String organizeExcludePage(int number) {
    return 'Écarter la page $number';
  }

  @override
  String organizeIncludePage(int number) {
    return 'Inclure la page $number';
  }

  @override
  String organizeMovePage(int number) {
    return 'Déplacer la page $number';
  }

  @override
  String get organizeExtract => 'Extraire';

  @override
  String get organizeSplit => 'Diviser';

  @override
  String get organizePreview => 'Aperçu';

  @override
  String get organizeExtractTitle => 'Extraire une plage de pages';

  @override
  String organizeRangeLabel(int start, int end) {
    return 'Pages $start à $end';
  }

  @override
  String get organizeSplitTitle => 'Diviser en plusieurs fichiers';

  @override
  String organizeFileCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fichiers',
      one: '$count fichier',
    );
    return '$_temp0';
  }

  @override
  String organizeSplitFailed(String detail) {
    return 'Échec de la division : $detail';
  }

  @override
  String get scanNoCamera => 'Aucune caméra disponible sur cet appareil.';

  @override
  String scanCameraFailed(String detail) {
    return 'Impossible d’initialiser la caméra : $detail';
  }

  @override
  String get scanCropToolbar => 'Ajuster';

  @override
  String scanCaptureFailed(String detail) {
    return 'Échec de la capture : $detail';
  }

  @override
  String get scanPermissionBody =>
      'L’accès à l’appareil photo est nécessaire pour scanner un document.';

  @override
  String get scanGrantPermission => 'Autoriser l’appareil photo';

  @override
  String get actionRetry => 'Réessayer';

  @override
  String get scanNoPageYet => 'Aucune page pour le moment.';

  @override
  String scanFinishAction(int count) {
    return 'Terminer · $count';
  }

  @override
  String get signTitle => 'Signer un PDF';

  @override
  String get signIntro =>
      'Apposez votre signature dessinée à la main sur une page d’un PDF. C’est un simple dessin ajouté au document, pas une signature électronique certifiée.';

  @override
  String get signChooseSubtitle => 'Sélectionnez le document à signer';

  @override
  String get signPickPage => 'Choisissez la page à signer.';

  @override
  String get signDrawTitle => 'Dessiner ma signature';

  @override
  String get signDrawBody =>
      'Dessinez avec le doigt comme sur papier. Ceci appose un dessin sur la page — ce n’est pas une signature électronique certifiée.';

  @override
  String get signNeedDrawing => 'Dessinez une signature avant de continuer.';

  @override
  String get signClear => 'Effacer';

  @override
  String get signValidate => 'Valider';

  @override
  String get signPlaceBody =>
      'Faites glisser la signature à l’endroit voulu sur la page, puis appuyez sur Terminer.';

  @override
  String get signPageUnavailable => 'Impossible d’afficher la page.';

  @override
  String get signProgress => 'Ajout de la signature…';

  @override
  String get editTitle => 'Annoter un document';

  @override
  String get editEmptyBody =>
      'Ajoutez du texte ou surlignez des passages directement sur un PDF existant.';

  @override
  String get editAddTextTitle => 'Ajouter du texte';

  @override
  String get editTextHint => 'Votre texte';

  @override
  String editFontSize(int size) {
    return 'Taille du texte : $size';
  }

  @override
  String get editNeedAnnotation =>
      'Ajoutez au moins une annotation avant de terminer.';

  @override
  String get editProgress => 'Application des annotations…';

  @override
  String get editChooseOther => 'Choisir un autre PDF';

  @override
  String get editUndoTooltip => 'Annuler la dernière annotation';

  @override
  String get editModeText => 'Texte';

  @override
  String get editModeHighlight => 'Surligner';

  @override
  String get editPageUnavailable => 'Impossible d’afficher cette page.';

  @override
  String get ocrEmptyTitle => 'Rendre le texte cherchable';

  @override
  String get ocrEmptyBody =>
      'Le texte d’un PDF scanné est reconnu et ajouté par-dessus l’image, de façon invisible. La page ne change pas d’apparence.';

  @override
  String get ocrWrongFormat => 'Choisissez un PDF ou une image (JPG, PNG…).';

  @override
  String get ocrProgress => 'Reconnaissance en cours…';

  @override
  String ocrFailed(String detail) {
    return 'Échec de la reconnaissance : $detail';
  }

  @override
  String get ocrRunAction => 'Lancer la reconnaissance';

  @override
  String get ocrResultTitle => 'Résultat de l’OCR';

  @override
  String ocrResultBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count pages analysées',
      one: '$count page analysée',
    );
    return '$_temp0. Le PDF cherchable est prêt, et vous pouvez aussi copier tout le texte reconnu.';
  }

  @override
  String get ocrCopyText => 'Copier le texte';

  @override
  String get ocrTextCopied => 'Texte copié.';

  @override
  String get redactIntro =>
      'Masquez définitivement des zones d’un PDF (noms, adresses, montants). Contrairement à un simple rectangle noir posé par-dessus, le texte masqué est réellement supprimé du fichier, pas seulement recouvert : il ne peut plus être sélectionné ni copié.';

  @override
  String get redactChooseSubtitle => 'Sélectionnez le document à caviarder';

  @override
  String get redactCaveat =>
      'À savoir : pour supprimer le texte caché, chaque page du document est reconvertie en image (200 ppp). Le résultat n’est donc plus un PDF dont on peut sélectionner le texte, et le fichier obtenu est généralement plus lourd que l’original.';

  @override
  String get redactEmptyPdf => 'Ce PDF ne contient aucune page.';

  @override
  String redactOpenFailed(String detail) {
    return 'Impossible d’ouvrir ce PDF (il est peut-être protégé par mot de passe) : $detail';
  }

  @override
  String redactPageRenderFailed(int number, String detail) {
    return 'Affichage de la page $number impossible : $detail';
  }

  @override
  String get redactUndoTooltip => 'Annuler la dernière zone';

  @override
  String get redactInstructions =>
      'Faites glisser le doigt sur la page pour tracer une zone à masquer. Le texte couvert sera réellement supprimé du fichier, pas seulement recouvert.';

  @override
  String get redactPagePrevious => 'Page précédente';

  @override
  String get redactPageNext => 'Page suivante';

  @override
  String redactPager(int current, int total) {
    return 'Page $current / $total';
  }

  @override
  String get redactNoZone => 'Aucune zone tracée';

  @override
  String redactZoneCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count zones à masquer',
      one: '$count zone à masquer',
    );
    return '$_temp0';
  }

  @override
  String get redactOtherPdf => 'Autre PDF';

  @override
  String get redactAction => 'Caviarder';

  @override
  String get redactProgress => 'Caviardage en cours…';

  @override
  String get cropEmptyTitle => 'Rogner les marges';

  @override
  String get cropEmptyBody =>
      'Choisissez un PDF, puis faites glisser votre doigt sur l’aperçu pour délimiter la zone à conserver.';

  @override
  String get cropTooSmall => 'La zone sélectionnée est trop petite.';

  @override
  String get cropProgress => 'Rognage en cours…';

  @override
  String cropFailed(String detail) {
    return 'Échec du rognage : $detail';
  }

  @override
  String get cropKeptArea => 'Zone conservée';

  @override
  String cropDimensions(
    int width,
    int height,
    int widthPercent,
    int heightPercent,
  ) {
    return '$width × $height mm ($widthPercent % × $heightPercent %)';
  }

  @override
  String get cropFullPage => 'Page entière';

  @override
  String get cropAllPages => 'Appliquer à toutes les pages';

  @override
  String get cropAllPagesOn => 'La même zone est découpée sur chaque page.';

  @override
  String get cropAllPagesOff =>
      'Seule la page 1 est rognée, les autres sont conservées entières.';

  @override
  String get cropCaveat =>
      'Le rognage réduit la taille de la page : le contenu situé en dehors de la zone n’est plus affiché ni imprimé.';

  @override
  String get cropAction => 'Rogner';

  @override
  String get compareTitle => 'Comparer deux PDF';

  @override
  String get compareEmptyTitle => 'Ce qui a changé';

  @override
  String get compareEmptyBody =>
      'Choisissez deux versions d’un même PDF. Les passages ajoutés et supprimés seront mis en regard, page par page.';

  @override
  String get compareSlotA => 'Fichier A';

  @override
  String get compareSlotB => 'Fichier B';

  @override
  String get compareAction => 'Comparer';

  @override
  String get compareProgress => 'Comparaison en cours…';

  @override
  String compareFailed(String detail) {
    return 'Échec de la comparaison : $detail';
  }

  @override
  String compareChangedPages(int changed, int total) {
    String _temp0 = intl.Intl.pluralLogic(
      changed,
      locale: localeName,
      other: '$changed pages diffèrent',
      one: '$changed page diffère',
    );
    return '$_temp0 sur $total';
  }

  @override
  String get compareNoDifference =>
      'Aucune différence détectée entre les deux fichiers.';

  @override
  String comparePageHeading(int number) {
    return 'Page $number';
  }

  @override
  String organizeFilesCreated(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fichiers créés',
      one: '$count fichier créé',
    );
    return '$_temp0';
  }

  @override
  String organizePartTitle(int number) {
    return 'Partie $number';
  }
}
