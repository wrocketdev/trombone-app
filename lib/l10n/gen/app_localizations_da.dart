// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Danish (`da`).
class LDa extends L {
  LDa([String locale = 'da']) : super(locale);

  @override
  String get appTitle => 'Trombone — PDF, scan og Word';

  @override
  String get appWordmark => 'Trombone';

  @override
  String get actionSave => 'Gem';

  @override
  String get actionShare => 'Del';

  @override
  String get actionCompress => 'Komprimér';

  @override
  String get actionDone => 'Færdig';

  @override
  String get actionCancel => 'Annullér';

  @override
  String get actionChange => 'Skift';

  @override
  String get actionContinue => 'Fortsæt';

  @override
  String get actionOpening => 'Åbner…';

  @override
  String get actionRemoveFile => 'Fjern denne fil';

  @override
  String get progressPreparing => 'Forbereder…';

  @override
  String progressPercent(int percent) {
    return '$percent %';
  }

  @override
  String get emptyReassurance =>
      'Gratis eksport, intet vandmærke, ingen grænse.';

  @override
  String get emptyAcceptedFormats => 'Accepterede formater';

  @override
  String get exportSavedTitle => 'Den er gemt.';

  @override
  String get exportSavedBody =>
      'Under det navn og i den mappe, du lige har valgt. Intet vandmærke, ingen grænse, intet at låse op.';

  @override
  String get exportSaveDialogTitle => 'Gem PDF';

  @override
  String pageTileIncluded(int number) {
    return 'Side $number, medtaget. Tryk for at udelade den.';
  }

  @override
  String pageTileExcluded(int number) {
    return 'Side $number, udeladt. Tryk for at medtage den.';
  }

  @override
  String pageTileRotate(int number) {
    return 'Rotér side $number';
  }

  @override
  String sectionHeaderSemantics(String title, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count værktøjer',
      one: '$count værktøj',
    );
    return '$title, $_temp0';
  }

  @override
  String toolCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count værktøjer',
      one: '$count værktøj',
    );
    return '$_temp0';
  }

  @override
  String get homePromise =>
      'Lav dit dokument, og eksportér det.\nIngen betalingsmur til sidst.';

  @override
  String get homeChipNoAccount => 'Ingen konto';

  @override
  String get homeChipNoWatermark => 'Intet vandmærke';

  @override
  String get homeChipUnlimited => 'Ubegrænset eksport';

  @override
  String get homeSearchTooltip => 'Søg efter et værktøj';

  @override
  String get homeColophon =>
      'Ved lagring låses intet op mod betaling. Eksport er gratis, uden vandmærke og uden begrænsninger.';

  @override
  String get sectionFeatured => 'Fremhævet';

  @override
  String get sectionToPdf => 'Til PDF';

  @override
  String get sectionFromPdf => 'Fra PDF';

  @override
  String get sectionSecurity => 'Sikkerhed';

  @override
  String get sectionEdit => 'Redigering';

  @override
  String get toolMerge => 'Flet sammen';

  @override
  String get toolMergeKeywords =>
      'kombiner saml forene sammensæt tilføj vedhæft';

  @override
  String get toolMergeSubtitle => 'PDF, Word, billeder og tekst i ét dokument';

  @override
  String get toolRectoVerso => 'Dobbeltsidet';

  @override
  String get toolRectoVersoKeywords =>
      'duplex indflet scan ulige lige begge sider';

  @override
  String get toolRectoVersoSubtitle => 'To scanninger, tilbage i rækkefølge';

  @override
  String get toolImagesToPdf => 'Billeder til PDF';

  @override
  String get toolImagesToPdfKeywords =>
      'foto jpg jpeg png billeder album kamera';

  @override
  String get toolImagesToPdfSubtitle => 'Fotos og skærmbilleder i ét dokument';

  @override
  String get toolPdfToWord => 'PDF til Word';

  @override
  String get toolPdfToWordKeywords =>
      'docx tekstbehandling redigerbar konverter doc';

  @override
  String get toolPdfToWordSubtitle => 'Tekst og tabeller, redigerbare';

  @override
  String get toolOrganize => 'Organisér en PDF';

  @override
  String get toolOrganizeKeywords =>
      'opdel adskil udtræk omarrangér rækkefølge sider slet';

  @override
  String get toolOrganizeSubtitle => 'Opdel, udtræk, omarrangér';

  @override
  String get toolExcelToPdf => 'Excel til PDF';

  @override
  String get toolExcelToPdfKeywords =>
      'regneark xlsx projektmappe ark faneblad';

  @override
  String get toolPptxToPdf => 'PowerPoint til PDF';

  @override
  String get toolPptxToPdfKeywords => 'pptx dias præsentation slides';

  @override
  String get toolHtmlToPdf => 'Webside til PDF';

  @override
  String get toolHtmlToPdfKeywords =>
      'html hjemmeside internet url link artikel gem side';

  @override
  String get toolScan => 'Scan et dokument';

  @override
  String get toolScanKeywords => 'kamera foto digitalisér scanning papir';

  @override
  String get toolPdfToExcel => 'PDF til Excel';

  @override
  String get toolPdfToExcelKeywords => 'regneark xlsx tabel udtræk data';

  @override
  String get toolPdfToPptx => 'PDF til PowerPoint';

  @override
  String get toolPdfToPptxKeywords => 'pptx dias præsentation slides';

  @override
  String get toolPdfToImages => 'PDF til billeder';

  @override
  String get toolPdfToImagesKeywords => 'jpg png foto eksport skærmbillede';

  @override
  String get toolOcr => 'Søgbar tekst (OCR)';

  @override
  String get toolOcrKeywords => 'genkendelse tegn scannet kopiér markér søgbar';

  @override
  String get toolPdfA => 'Konvertér til PDF/A';

  @override
  String get toolPdfAKeywords =>
      'arkiv standard langtidsopbevaring bevaring iso';

  @override
  String get toolProtect => 'Beskyt PDF';

  @override
  String get toolProtectKeywords => 'adgangskode lås kryptér sikker hængelås';

  @override
  String get toolUnlock => 'Lås PDF op';

  @override
  String get toolUnlockKeywords =>
      'fjern adgangskode åbn dekryptér ophæv hængelås';

  @override
  String get toolRepair => 'Reparér PDF';

  @override
  String get toolRepairKeywords => 'beskadiget ulæselig ødelagt gendan fejl';

  @override
  String get toolRedact => 'Anonymisér en PDF';

  @override
  String get toolRedactKeywords =>
      'skjul sværtet fortroligt slet censurér tildæk';

  @override
  String get toolEdit => 'Redigér PDF';

  @override
  String get toolEditKeywords => 'tekst ændr rettelse annotér skriv tilføj';

  @override
  String get toolSign => 'Underskriv';

  @override
  String get toolSignKeywords =>
      'underskrift signatur initialer kontrakt håndskrevet';

  @override
  String get toolWatermark => 'Vandmærke';

  @override
  String get toolWatermarkKeywords =>
      'vandmærke stempel fortroligt kladde mærke';

  @override
  String get toolPageNumbers => 'Sidetal';

  @override
  String get toolPageNumbersKeywords =>
      'paginering nummerering numre sidenumre';

  @override
  String get toolCrop => 'Beskær en PDF';

  @override
  String get toolCropKeywords => 'trim margener beskær kanter størrelse klip';

  @override
  String get toolCompare => 'Sammenlign PDF-filer';

  @override
  String get toolCompareKeywords =>
      'forskel versioner diff ændringer sammenlign';

  @override
  String get searchHint => 'Flet, adgangskode, vandmærke…';

  @override
  String get searchClear => 'Ryd';

  @override
  String searchNoResultTitle(String query) {
    return 'Intet værktøj til “$query”.';
  }

  @override
  String get searchNoResultBody =>
      'Prøv det format, du har ved hånden — “Word”, “Excel”, “foto” — eller det, du vil gøre med det: “underskriv”, “opdel”, “adgangskode”.';

  @override
  String get actionUndo => 'Fortryd';

  @override
  String get actionApply => 'Anvend';

  @override
  String get actionChoose => 'Vælg';

  @override
  String get actionChoosePdf => 'Vælg en PDF';

  @override
  String get actionChooseFiles => 'Vælg filer';

  @override
  String get actionConvert => 'Konvertér';

  @override
  String get actionFinish => 'Afslut';

  @override
  String get actionBack => 'Tilbage';

  @override
  String get actionAdd => 'Tilføj';

  @override
  String get noFileChosen => 'Ingen fil valgt';

  @override
  String errorExportFailed(String detail) {
    return 'Eksporten mislykkedes: $detail';
  }

  @override
  String errorShareFailed(String detail) {
    return 'Delingen mislykkedes: $detail';
  }

  @override
  String errorOpenFailed(String detail) {
    return 'Filen kunne ikke åbnes: $detail';
  }

  @override
  String errorConversionFailed(String detail) {
    return 'Konverteringen mislykkedes: $detail';
  }

  @override
  String errorOnFile(String name, String detail) {
    return '$name: $detail';
  }

  @override
  String get errorPickPdf => 'Vælg venligst en PDF-fil.';

  @override
  String sizeBytes(String value) {
    return '$value B';
  }

  @override
  String sizeKb(String value) {
    return '$value kB';
  }

  @override
  String sizeMb(String value) {
    return '$value MB';
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
      other: '$count sider',
      one: '$count side',
    );
    return '$_temp0';
  }

  @override
  String pageCountOfTotal(int kept, int total) {
    String _temp0 = intl.Intl.pluralLogic(
      kept,
      locale: localeName,
      other: '$kept sider',
      one: '$kept side',
    );
    return '$_temp0 af $total';
  }

  @override
  String pageOfTotal(int current, int total) {
    return 'Side $current af $total';
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
  String get formatImages => 'Billeder';

  @override
  String get formatText => 'Tekst';

  @override
  String get mergeAddFile => 'Tilføj en fil';

  @override
  String get mergeAddHint => 'PDF, Word, billeder eller tekst';

  @override
  String get mergeEmptyTitle => 'Ét enkelt dokument';

  @override
  String get mergeEmptyBody =>
      'Tilføj PDF-filer, Word-filer, billeder eller tekst. Du kan ændre rækkefølgen og udelade sider, inden du eksporterer.';

  @override
  String get mergeNeedOnePage =>
      'Tilføj mindst én fil med en side, der kan medtages.';

  @override
  String get mergeProgress => 'Fletter…';

  @override
  String mergeFailed(String detail) {
    return 'Fletningen mislykkedes: $detail';
  }

  @override
  String mergeRemoved(String name) {
    return '$name er fjernet.';
  }

  @override
  String mergeRemoveTooltip(String name) {
    return 'Fjern $name';
  }

  @override
  String mergeMoveSemantics(String name) {
    return 'Flyt $name';
  }

  @override
  String get mergeRotateAll => 'Rotér alle sider';

  @override
  String mergePreviewAndExport(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count sider',
      one: '$count side',
    );
    return 'Forhåndsvis og eksportér ($_temp0)';
  }

  @override
  String previewTitle(String size) {
    return 'Forhåndsvisning · $size';
  }

  @override
  String previewZoomPage(int number) {
    return 'Side $number, forstør';
  }

  @override
  String get previewPageUnreadable => 'Siden kan ikke læses.';

  @override
  String previewExportWhat(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count sider',
      one: '$count side',
    );
    return 'PDF · $_temp0';
  }

  @override
  String get compressTitle => 'Komprimering';

  @override
  String compressBody(String size) {
    return 'Nuværende størrelse: $size. Vælg et niveau — den anslåede størrelse vises, inden du anvender den.';
  }

  @override
  String get compressEstimating => 'Anslår…';

  @override
  String get compressProgress => 'Komprimerer…';

  @override
  String compressFailed(String detail) {
    return 'Komprimeringen mislykkedes: $detail';
  }

  @override
  String get protectEmptyTitle => 'Læg den bag en adgangskode';

  @override
  String get protectEmptyBody =>
      'PDF-filen kan ikke længere åbnes uden den adgangskode, du vælger. Gem den godt: den kan ikke gendannes.';

  @override
  String get protectSubtitle => 'Krypteres med AES 256-bit';

  @override
  String get protectPassword => 'Adgangskode';

  @override
  String get protectConfirmPassword => 'Bekræft adgangskoden';

  @override
  String get protectShowPasswords => 'Vis adgangskoderne';

  @override
  String get protectHidePasswords => 'Skjul adgangskoderne';

  @override
  String get protectMismatch => 'De to adgangskoder er ikke ens.';

  @override
  String get protectWarning =>
      'Skriv den ned et sted: uden den bliver dokumentet permanent ulæseligt. Ingen gendannelse er mulig, hverken af dig eller af appen.';

  @override
  String get protectAlreadyProtected =>
      'Denne fil er allerede beskyttet — brug Lås PDF op først.';

  @override
  String get protectProgress => 'Beskytter…';

  @override
  String protectFailed(String detail) {
    return 'Beskyttelsen mislykkedes: $detail';
  }

  @override
  String get protectAction => 'Beskyt';

  @override
  String get protectResultTitle => 'PDF beskyttet';

  @override
  String get protectResultDetail =>
      'Krypteret med AES 256-bit. Adgangskoden skal bruges for at åbne den.';

  @override
  String get protectExportWhat => 'Adgangskodebeskyttet PDF';

  @override
  String get unlockEmptyTitle => 'Fjern adgangskoden';

  @override
  String get unlockEmptyBody =>
      'Du skal bruge dokumentets nuværende adgangskode. Når den er fjernet, kan PDF-filen åbnes frit.';

  @override
  String get unlockAcceptsProtectedPdf => 'Beskyttet PDF';

  @override
  String get unlockChooseProtectedPdf => 'Vælg en beskyttet PDF';

  @override
  String get unlockCurrentPassword => 'Nuværende adgangskode';

  @override
  String get unlockWrongPassword => 'Forkert adgangskode.';

  @override
  String get unlockProgress => 'Låser op…';

  @override
  String unlockFailed(String detail) {
    return 'Oplåsningen mislykkedes: $detail';
  }

  @override
  String get unlockAction => 'Lås op';

  @override
  String get repairEmptyTitle => 'Reparér en beskadiget fil';

  @override
  String get repairEmptyBody =>
      'Den interne struktur i en beskadiget PDF bygges op igen. Alt, hvad der kan reddes, bliver reddet.';

  @override
  String get repairProgress => 'Reparerer…';

  @override
  String get repairFailed =>
      'Denne fil kan ikke repareres — den er måske for hårdt beskadiget.';

  @override
  String get repairAction => 'Reparér';

  @override
  String get pdfToWordEmptyTitle => 'En redigerbar Word-fil';

  @override
  String get pdfToWordEmptyBody =>
      'Tekst og struktur fra PDF-filen overføres til et .docx-dokument, som du kan åbne igen og rette i.';

  @override
  String get pdfToWordAnalyzing => 'Analyserer dokumentet…';

  @override
  String get pdfToWordAnalysisPending => 'Analyse afventer';

  @override
  String pdfToWordAnalysisFailed(String detail) {
    return 'Analysen mislykkedes: $detail';
  }

  @override
  String get pdfLocked =>
      'Denne PDF er beskyttet med en adgangskode. Lås den op først.';

  @override
  String get pdfToWordConverting => 'Konverterer til Word…';

  @override
  String get pdfToWordSummaryTitle => 'Fundet indhold';

  @override
  String pdfToWordParagraphCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count afsnit',
      one: '$count afsnit',
    );
    return '$_temp0';
  }

  @override
  String pdfToWordHeadingCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count overskrifter',
      one: '$count overskrift',
    );
    return '$_temp0';
  }

  @override
  String pdfToWordTableCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count tabeller',
      one: '$count tabel',
    );
    return '$_temp0';
  }

  @override
  String get pdfToWordNoTables =>
      'Ingen tabel fundet: hvis din PDF indeholder nogen, bliver deres rækker konverteret til afsnit.';

  @override
  String get pdfToWordCaveat =>
      'Konverteringen gengiver teksten, formateringen og tabellerne, men ikke det nøjagtige layout: placeringen af billeder og spalter bevares ikke, og billeder overføres ikke til Word-dokumentet.';

  @override
  String get pdfToWordScanWarning =>
      'Denne PDF ligner en scanning: der blev ikke fundet nogen tekst. Brug først værktøjet Søgbar tekst (OCR), og kom så tilbage og konvertér den PDF, du får ud af det.';

  @override
  String get pdfToWordResultTitle => 'Word-dokument klar';

  @override
  String pdfToWordResultDetail(String name, String size) {
    return '$name — $size';
  }

  @override
  String get pdfToWordExportWhat => 'Word-dokument';

  @override
  String get pdfToWordConvertAction => 'Konvertér til Word';

  @override
  String get actionConvertAgain => 'Konvertér igen';

  @override
  String errorSaveFailed(String detail) {
    return 'Kunne ikke gemme: $detail';
  }

  @override
  String get rectoVersoIntro =>
      'En enkeltsidet arkføder giver dig to filer: de ulige sider i rækkefølge, de lige sider ofte i omvendt rækkefølge. Vælg begge for at sætte dem sammen igen.';

  @override
  String get rectoVersoOddSlot => 'Fil med de ulige sider (forsider)';

  @override
  String get rectoVersoEvenSlot => 'Fil med de lige sider (bagsider)';

  @override
  String get rectoVersoReversed => 'Den anden fil er i omvendt rækkefølge';

  @override
  String get rectoVersoReversedHint =>
      'Det er det normale tilfælde, markeret som standard';

  @override
  String rectoVersoPreview(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count sider',
      one: '$count side',
    );
    return 'Forhåndsvisning af indfletningen ($_temp0)';
  }

  @override
  String get rectoVersoProgress => 'Fletter siderne ind…';

  @override
  String fileWithPageCount(String name, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count sider',
      one: '$count side',
    );
    return '$name · $_temp0';
  }

  @override
  String get actionPreviewAndExport => 'Forhåndsvis og eksportér';

  @override
  String errorOpenFailedShort(String detail) {
    return 'Kunne ikke åbne: $detail';
  }

  @override
  String errorGeneric(String detail) {
    return 'Mislykkedes: $detail';
  }

  @override
  String get actionConvertToPdf => 'Konvertér til PDF';

  @override
  String get convertProgress => 'Konverterer…';

  @override
  String get excelEmptyTitle => 'En projektmappe som PDF';

  @override
  String get excelEmptyBody =>
      'Arkene i en .xlsx-fil bliver til PDF-sider, klar til at sende eller printe.';

  @override
  String get excelChooseWorkbook => 'Vælg en projektmappe';

  @override
  String get excelChooseXlsx => 'Vælg en .xlsx-projektmappe';

  @override
  String get excelLegacyFormat =>
      'Formatet .xls (Excels gamle binære format) understøttes ikke. Gem filen som .xlsx, og prøv igen.';

  @override
  String get excelWrongFormat =>
      'Vælg venligst en .xlsx-projektmappe fra Excel.';

  @override
  String excelUnreadable(String detail) {
    return 'Projektmappen kan ikke læses: $detail';
  }

  @override
  String excelSheetsAndRows(int sheets, int rows) {
    String _temp0 = intl.Intl.pluralLogic(
      sheets,
      locale: localeName,
      other: '$sheets ark',
      one: '$sheets ark',
    );
    String _temp1 = intl.Intl.pluralLogic(
      rows,
      locale: localeName,
      other: '$rows rækker i alt',
      one: '$rows række i alt',
    );
    return '$_temp0 · $_temp1';
  }

  @override
  String get excelSheetsDetected => 'Fundne ark';

  @override
  String get excelEmptySheet => 'Tomt ark';

  @override
  String excelSheetDimensions(int rows, int columns) {
    String _temp0 = intl.Intl.pluralLogic(
      rows,
      locale: localeName,
      other: '$rows rækker',
      one: '$rows række',
    );
    String _temp1 = intl.Intl.pluralLogic(
      columns,
      locale: localeName,
      other: '$columns kolonner',
      one: '$columns kolonne',
    );
    return '$_temp0 × $_temp1';
  }

  @override
  String get excelRepeatHeader => 'Gentag overskriftsrækken på hver side';

  @override
  String get excelRepeatHeaderHint =>
      'Arkets første række tegnes igen øverst på hver side af tabellen.';

  @override
  String get excelCaveat =>
      'Hvad konverteringen tager med: celleteksten, som den er gemt i filen (herunder formlernes sidst beregnede resultat), den første række i fed og et gitter.\n\nHvad den ikke tager med: farver, skrifttyper, talformater, flettede celler, billeder, diagrammer og selve formlerne. Kolonnerne skrumpes, så de passer til sidebredden; i meget brede ark bliver tekst i for smalle celler afkortet med “…”.';

  @override
  String get pptxEmptyTitle => 'En præsentation som PDF';

  @override
  String get pptxEmptyBody =>
      'Én liggende side i 16:9 pr. dias, med titlen og punkterne. Teksten kommer med; de oprindelige billeder, former og baggrunde gør ikke.\n\nAccepteret format: .pptx. En ældre .ppt-fil skal først gemmes igen som .pptx fra PowerPoint.';

  @override
  String get pptxChoosePresentation => 'Vælg en præsentation';

  @override
  String get pptxTextOnlyTitle => 'Kun konvertering af teksten';

  @override
  String get pptxTextOnlyBody =>
      'Teksten fra hvert dias kommer med. De oprindelige billeder, former, baggrunde, farver og layouts bevares ikke: den færdige PDF er et enkelt, læsbart layout, ikke en tro kopi af din præsentation.';

  @override
  String pptxSlideCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count dias',
      one: '$count dias',
    );
    return '$_temp0';
  }

  @override
  String get pptxSlidesDetected => 'Fundne dias';

  @override
  String pptxMoreSlides(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count dias mere',
      one: '$count dias mere',
    );
    return 'og $_temp0…';
  }

  @override
  String get pptxUntitledSlide => 'Uden titel';

  @override
  String get pptxEmptySlide => 'Ingen tekst (kun billede eller form)';

  @override
  String pptxTextLineCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count tekstlinjer',
      one: '$count tekstlinje',
    );
    return '$_temp0';
  }

  @override
  String pptxReadFailed(String detail) {
    return 'Kunne ikke læses: $detail';
  }

  @override
  String get compressLevelLight => 'Let';

  @override
  String get compressLevelMedium => 'Middel';

  @override
  String get compressLevelStrong => 'Kraftig';

  @override
  String get pptxQualityStandard => 'Standard (150 dpi)';

  @override
  String get pptxQualityHigh => 'Høj (220 dpi)';

  @override
  String get pdfToExcelEmptyTitle => 'Få tabellerne tilbage';

  @override
  String get pdfToExcelEmptyBody =>
      'Tabeller i en PDF trækkes ud i en Excel-projektmappe. Formateringen bevares ikke; det gør værdierne.';

  @override
  String pdfToExcelPagesAnalyzed(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count sider analyseret',
      one: '$count side analyseret',
    );
    return '$_temp0';
  }

  @override
  String pdfToExcelAnalysisFailed(String detail) {
    return 'Analysen mislykkedes. PDF-filen er måske beskyttet med en adgangskode eller beskadiget. ($detail)';
  }

  @override
  String get pdfToExcelNothingToExport =>
      'Intet at eksportere: ingen tabel fundet.';

  @override
  String get pdfToExcelBuilding => 'Bygger projektmappen…';

  @override
  String get pdfToExcelIncludeParagraphs =>
      'Medtag også tekst uden for tabeller (én række pr. afsnit)';

  @override
  String get pdfToExcelIncludeParagraphsHint =>
      'Nyttigt til et halvstruktureret dokument: teksten havner i kolonne A, efter sidens tabeller.';

  @override
  String get pdfToExcelCaveatTitle => 'Hvad konverteringen ikke bevarer';

  @override
  String get pdfToExcelCaveat =>
      'Genkendelsen bygger på, hvor teksten sidder på siden: tabeller uden regelmæssige streger, flettede celler og meget uregelmæssige kolonner kan blive delt forkert. En scannet PDF (et billede) indeholder ingen tekst, der kan trækkes ud, og giver intet. Farver, formler og billeder kommer aldrig med: kun tekstværdierne.';

  @override
  String pdfToExcelTablesFound(int tables, int pages) {
    String _temp0 = intl.Intl.pluralLogic(
      tables,
      locale: localeName,
      other: '$tables tabeller fundet',
      one: '$tables tabel fundet',
    );
    String _temp1 = intl.Intl.pluralLogic(
      pages,
      locale: localeName,
      other: '$pages sider',
      one: '$pages side',
    );
    return '$_temp0 fordelt på $_temp1';
  }

  @override
  String pdfToExcelPagesConcerned(String pages) {
    return 'Berørte sider: $pages';
  }

  @override
  String pdfToExcelParagraphsOutside(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count afsnit uden for tabeller',
      one: '$count afsnit uden for tabeller',
    );
    return '$_temp0';
  }

  @override
  String get pdfToExcelScannedWarning =>
      'Der kunne ikke trækkes tekst ud af denne PDF: den er næsten med sikkerhed et scannet dokument (billeder af sider). Et regneark kan ikke stille noget op med det; brug først værktøjet til tekstgenkendelse (OCR).';

  @override
  String get pdfToExcelNoTableWarning =>
      'Der blev ikke genkendt nogen tabelstruktur i dette dokument. Teksten er der, men den er ikke sat op i regelmæssige kolonner. Slå hellere “Medtag også tekst uden for tabeller” til ovenfor end at lave en ulæselig projektmappe, eller brug “PDF til Word”, som bevarer afsnittene bedre.';

  @override
  String get pdfToExcelResultTitle => 'Projektmappe klar';

  @override
  String get pdfToExcelExportWhat => 'Excel-projektmappe';

  @override
  String get pdfToExcelConvertAction => 'Konvertér til Excel';

  @override
  String resultNameAndSize(String name, String size) {
    return '$name — $size';
  }

  @override
  String get pdfToPptxEmptyTitle => 'Ét dias pr. side';

  @override
  String get pdfToPptxEmptyBody =>
      'PDF-filen bliver til en PowerPoint-præsentation, magen til. Hver side kommer ind som et billede: layoutet er tro mod originalen, men teksten kan ikke redigeres i PowerPoint.';

  @override
  String pdfToPptxOpenFailed(String detail) {
    return 'Denne PDF kunne ikke åbnes: $detail';
  }

  @override
  String get pdfToPptxConverting => 'Konverterer til PowerPoint…';

  @override
  String pdfToPptxPagesToSlides(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count sider',
      one: '$count side',
    );
    String _temp1 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count dias',
      one: '$count dias',
    );
    return '$_temp0 > $_temp1';
  }

  @override
  String get pdfToPptxEmptyDocument => 'Tomt dokument';

  @override
  String get qualityLabel => 'Kvalitet';

  @override
  String get pdfToPptxQualityHint =>
      'En højere opløsning giver skarpere dias, men en mærkbart tungere fil.';

  @override
  String pdfToPptxHeavyWarning(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count sider',
      one: '$count side',
    );
    return 'Pas på: ved høj kvalitet kan en præsentation på $_temp0 fylde adskillige titusinder af MB og være langsom at åbne. Vælg Standard, hvis du er i tvivl.';
  }

  @override
  String get goodToKnow => 'Godt at vide';

  @override
  String get pdfToPptxCaveat =>
      'Hvert dias er et billede af siden: layoutet er magen til PDF-filens, men teksten kan ikke redigeres i PowerPoint.\nBrug “PDF til Word” i stedet, hvis du vil have redigerbar tekst tilbage.\nEn præsentation har kun én diasstørrelse: den tages fra den første side, og sider med en anden størrelse centreres inden i den.';

  @override
  String get pdfToPptxResultTitle => 'Præsentation klar';

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
      other: '$count dias',
      one: '$count dias',
    );
    return '$name — $_temp0 · $size · $quality';
  }

  @override
  String get notSavedYet =>
      'Filen er endnu ikke på din enhed: gem den eller del den.';

  @override
  String get pdfToPptxChangeQuality => 'Skift kvaliteten';

  @override
  String get pdfToPptxConvertAction => 'Konvertér til PowerPoint';

  @override
  String pdfToPptxExportWhat(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count dias',
      one: '$count dias',
    );
    return 'PowerPoint-præsentation · $_temp0';
  }

  @override
  String get formatLabel => 'Format';

  @override
  String get actionExport => 'Eksportér';

  @override
  String get imageQualityWeb => 'Web (72 dpi)';

  @override
  String get imageQualityStandard => 'Standard (150 dpi)';

  @override
  String get imageQualityHigh => 'Høj kvalitet (300 dpi)';

  @override
  String get pdfToImagesEmptyTitle => 'Ét billede pr. side';

  @override
  String get pdfToImagesEmptyBody =>
      'Vælg en PDF: hver side kommer ud som et billede, i den opløsning du vælger bagefter.';

  @override
  String pdfToImagesNotAPdf(String name) {
    return '$name: vælg venligst en PDF-fil.';
  }

  @override
  String errorLoadFailed(String detail) {
    return 'Indlæsningen mislykkedes: $detail';
  }

  @override
  String get pdfToImagesProgress => 'Eksporterer…';

  @override
  String pdfToImagesExportWhat(int count, String format) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count $format-billeder',
      one: '$count $format-billede',
    );
    return '$_temp0';
  }

  @override
  String get pdfaEmptyTitle => 'Arkivér for den lange bane';

  @override
  String get pdfaEmptyBody =>
      'PDF/A er det arkivformat, mange offentlige myndigheder kræver. Dokumentet konverteres uden at miste sit udseende.';

  @override
  String get pdfaConformanceLevel => 'Overensstemmelsesniveau';

  @override
  String get pdfaA1bDetail =>
      'Det strengeste og mest universelt accepterede niveau. Vælg dette, hvis du er i tvivl.';

  @override
  String get pdfaA2bDetail =>
      'Bygger på PDF 1.7: mere effektiv komprimering, lidt lettere filer.';

  @override
  String get pdfaA3bDetail =>
      'Som A-2b, men tillader vedhæftede filer (ofte krævet ved elektronisk fakturering).';

  @override
  String pdfaConvertingTo(String level) {
    return 'Konverterer til $level…';
  }

  @override
  String get pdfaCaveatTitle => 'Hvad konverteringen ændrer';

  @override
  String pdfaCaveat(int dpi) {
    return 'Hver side tegnes om som et billede ved $dpi dpi: teksten bliver til et billede, og layoutet fryses fast. Det er det, der gør filen reelt overensstemmende uden at afhænge af det oprindelige dokuments skrifttyper, men til gengæld kan teksten ikke længere markeres eller søges i, links og formularer forsvinder, og filen bliver tungere.';
  }

  @override
  String pdfaOpenFailed(String detail) {
    return 'Denne PDF kunne ikke åbnes: $detail';
  }

  @override
  String get imagesToPdfEmptyTitle => 'Billeder i én PDF';

  @override
  String get imagesToPdfEmptyBody =>
      'JPG, PNG, WebP, HEIC — tilføj dine billeder, så bliver de samlet i den rækkefølge, du vælger.';

  @override
  String get imagesToPdfChoose => 'Vælg billeder';

  @override
  String get imagesToPdfAdd => 'Tilføj billeder';

  @override
  String imagesToPdfRejected(String names) {
    return 'Sprunget over (ikke et billede): $names';
  }

  @override
  String get imagesToPdfBuilding => 'Bygger PDF-filen…';

  @override
  String imagesToPdfBuildFailed(String detail) {
    return 'Kunne ikke bygge den: $detail';
  }

  @override
  String imagesToPdfCreateAction(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count billeder',
      one: '$count billede',
    );
    return 'Opret PDF-filen ($_temp0)';
  }

  @override
  String get actionRotate => 'Rotér';

  @override
  String get actionRemove => 'Fjern';

  @override
  String get htmlTitle => 'HTML / webside til PDF';

  @override
  String get htmlIntro =>
      'Lav en webside eller HTML-kode om til en PDF i A4. Gengivelsen klares af den browser, der er indbygget i Android, så layoutet er det, du ville få ved at printe fra Chrome.';

  @override
  String get htmlModeUrl => 'Webadresse';

  @override
  String get htmlModeCode => 'HTML-kode';

  @override
  String get htmlUrlLabel => 'Sidens adresse';

  @override
  String get htmlUrlHint => 'https://example.com/artikel';

  @override
  String get htmlCodeLabel => 'HTML-kode';

  @override
  String get htmlCodeHint => '<h1>Overskrift</h1>\n<p>Tekst…</p>';

  @override
  String get htmlUrlBadScheme =>
      'Adressen skal begynde med http:// eller https://.';

  @override
  String get htmlUrlIncomplete => 'Indtast en fuldstændig webadresse.';

  @override
  String get htmlCodeEmpty => 'Indsæt noget HTML-kode, der skal konverteres.';

  @override
  String get htmlLoadingUrl => 'Indlæser siden og konverterer…';

  @override
  String get htmlConverting => 'Konverterer HTML-koden…';

  @override
  String get htmlNetworkNotice =>
      'Der kræves en internetforbindelse: det er det eneste værktøj i appen, der er nødt til at hente siden. Sider, der kræver login på en konto, et cookiebanner eller meget JavaScript, kan komme ufuldstændigt ud.';

  @override
  String get htmlOfflineNotice =>
      'HTML og CSS skrevet direkte i siden gengives offline. Billeder, typografiark eller skrifttyper, der hentes fra en ekstern webadresse, kræver derimod en internetforbindelse.';

  @override
  String get watermarkEmptyTitle => 'Læg et vandmærke på';

  @override
  String get watermarkEmptyBody =>
      'En tekst, du selv vælger, gentages i baggrunden på hver side — til at mærke et dokument som fortroligt eller som kladde.';

  @override
  String get watermarkEmptyNote => 'Gratis eksport uden begrænsninger.';

  @override
  String get watermarkTextLabel => 'Vandmærkets tekst';

  @override
  String get watermarkDefaultText => 'FORTROLIGT';

  @override
  String get watermarkNeedText => 'Indtast en tekst til vandmærket.';

  @override
  String watermarkOpacity(int percent) {
    return 'Uigennemsigtighed: $percent %';
  }

  @override
  String watermarkRotation(int degrees) {
    return 'Rotationsvinkel: $degrees°';
  }

  @override
  String watermarkFontSize(int points) {
    return 'Tekststørrelse: $points pt';
  }

  @override
  String get watermarkColor => 'Farve';

  @override
  String get colorGrey => 'Grå';

  @override
  String get colorRed => 'Rød';

  @override
  String get colorBlue => 'Blå';

  @override
  String get colorBlack => 'Sort';

  @override
  String get watermarkProgress => 'Lægger vandmærket på…';

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
  String get pageNumbersEmptyTitle => 'Sæt tal på siderne';

  @override
  String get pageNumbersEmptyBody =>
      'Vælg en PDF, og derefter placeringen og formatet på de tal, der bliver føjet til hver side.';

  @override
  String get positionLabel => 'Placering';

  @override
  String get positionBottomCenter => 'Nederst i midten';

  @override
  String get positionBottomRight => 'Nederst til højre';

  @override
  String get positionTopCenter => 'Øverst i midten';

  @override
  String get positionTopRight => 'Øverst til højre';

  @override
  String get pageNumbersFormatPlain => 'N';

  @override
  String get pageNumbersFormatOfTotal => 'N / i alt';

  @override
  String get pageNumbersStart => 'Starttal';

  @override
  String get pageNumbersProgress => 'Nummererer…';

  @override
  String get organizeEmptyTitle => 'Tag fat i en PDF igen';

  @override
  String get organizeEmptyBody =>
      'Åbn et dokument for at dele det op, trække sider ud af det eller ændre deres rækkefølge.';

  @override
  String get organizeOpenFile => 'Åbn en fil';

  @override
  String get organizeNothingToExport => 'Ingen side at eksportere.';

  @override
  String organizePagesKept(int kept, int total) {
    String _temp0 = intl.Intl.pluralLogic(
      kept,
      locale: localeName,
      other: '$kept sider beholdt',
      one: '$kept side beholdt',
    );
    return '$_temp0 af $total';
  }

  @override
  String get organizePageExcluded => 'Udeladt';

  @override
  String organizePageMoved(int from) {
    return 'Flyttet fra plads $from';
  }

  @override
  String organizePageTitle(int number) {
    return 'Side $number';
  }

  @override
  String organizeExcludePage(int number) {
    return 'Udelad side $number';
  }

  @override
  String organizeIncludePage(int number) {
    return 'Medtag side $number';
  }

  @override
  String organizeMovePage(int number) {
    return 'Flyt side $number';
  }

  @override
  String get organizeExtract => 'Udtræk';

  @override
  String get organizeSplit => 'Opdel';

  @override
  String get organizePreview => 'Forhåndsvis';

  @override
  String get organizeExtractTitle => 'Udtræk et sideinterval';

  @override
  String organizeRangeLabel(int start, int end) {
    return 'Side $start til $end';
  }

  @override
  String get organizeSplitTitle => 'Del op i flere filer';

  @override
  String organizeFileCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count filer',
      one: '$count fil',
    );
    return '$_temp0';
  }

  @override
  String organizeSplitFailed(String detail) {
    return 'Opdelingen mislykkedes: $detail';
  }

  @override
  String get scanNoCamera => 'Der er intet kamera på denne enhed.';

  @override
  String scanCameraFailed(String detail) {
    return 'Kameraet kunne ikke startes: $detail';
  }

  @override
  String get scanCropToolbar => 'Justér';

  @override
  String scanCaptureFailed(String detail) {
    return 'Optagelsen mislykkedes: $detail';
  }

  @override
  String get scanPermissionBody =>
      'Der kræves adgang til kameraet for at scanne et dokument.';

  @override
  String get scanGrantPermission => 'Giv adgang til kameraet';

  @override
  String get actionRetry => 'Prøv igen';

  @override
  String get scanNoPageYet => 'Ingen side endnu.';

  @override
  String scanFinishAction(int count) {
    return 'Afslut · $count';
  }

  @override
  String get signTitle => 'Underskriv en PDF';

  @override
  String get signIntro =>
      'Sæt din håndtegnede underskrift på en side i en PDF. Det er blot en tegning, der føjes til dokumentet, ikke en certificeret elektronisk signatur.';

  @override
  String get signChooseSubtitle => 'Vælg det dokument, der skal underskrives';

  @override
  String get signPickPage => 'Vælg den side, der skal underskrives.';

  @override
  String get signDrawTitle => 'Tegn min underskrift';

  @override
  String get signDrawBody =>
      'Tegn med fingeren, som du ville gøre på papir. Det sætter en tegning på siden — det er ikke en certificeret elektronisk signatur.';

  @override
  String get signNeedDrawing => 'Tegn en underskrift, før du fortsætter.';

  @override
  String get signClear => 'Ryd';

  @override
  String get signValidate => 'Bekræft';

  @override
  String get signPlaceBody =>
      'Træk underskriften hen, hvor du vil have den på siden, og tryk så på Afslut.';

  @override
  String get signPageUnavailable => 'Siden kunne ikke vises.';

  @override
  String get signProgress => 'Tilføjer underskriften…';

  @override
  String get editTitle => 'Kommentér et dokument';

  @override
  String get editEmptyBody =>
      'Tilføj tekst eller fremhæv passager direkte i en eksisterende PDF.';

  @override
  String get editAddTextTitle => 'Tilføj tekst';

  @override
  String get editTextHint => 'Din tekst';

  @override
  String editFontSize(int size) {
    return 'Tekststørrelse: $size';
  }

  @override
  String get editNeedAnnotation =>
      'Tilføj mindst én kommentar, før du afslutter.';

  @override
  String get editProgress => 'Anvender kommentarerne…';

  @override
  String get editChooseOther => 'Vælg en anden PDF';

  @override
  String get editUndoTooltip => 'Fortryd den sidste kommentar';

  @override
  String get editModeText => 'Tekst';

  @override
  String get editModeHighlight => 'Fremhævning';

  @override
  String get editPageUnavailable => 'Denne side kunne ikke vises.';

  @override
  String get ocrEmptyTitle => 'Gør teksten søgbar';

  @override
  String get ocrEmptyBody =>
      'Teksten i en scannet PDF genkendes og lægges usynligt oven på billedet. Siden ser ud, som den plejer.';

  @override
  String get ocrWrongFormat => 'Vælg en PDF eller et billede (JPG, PNG…).';

  @override
  String get ocrProgress => 'Genkender…';

  @override
  String ocrFailed(String detail) {
    return 'Genkendelsen mislykkedes: $detail';
  }

  @override
  String get ocrRunAction => 'Start genkendelsen';

  @override
  String get ocrResultTitle => 'OCR-resultat';

  @override
  String ocrResultBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count sider analyseret',
      one: '$count side analyseret',
    );
    return '$_temp0. Den søgbare PDF er klar, og du kan også kopiere hele den genkendte tekst.';
  }

  @override
  String get ocrCopyText => 'Kopiér teksten';

  @override
  String get ocrTextCopied => 'Teksten er kopieret.';

  @override
  String get redactIntro =>
      'Skjul områder i en PDF permanent (navne, adresser, beløb). I modsætning til et almindeligt sort rektangel lagt ovenpå bliver den skjulte tekst reelt fjernet fra filen, ikke bare dækket: den kan ikke længere markeres eller kopieres.';

  @override
  String get redactChooseSubtitle => 'Vælg det dokument, der skal anonymiseres';

  @override
  String get redactCaveat =>
      'Godt at vide: for at fjerne den skjulte tekst laves hver side i dokumentet om til et billede igen (200 dpi). Resultatet er derfor ikke længere en PDF, hvis tekst kan markeres, og den færdige fil fylder som regel mere end den oprindelige.';

  @override
  String get redactEmptyPdf => 'Denne PDF indeholder ingen side.';

  @override
  String redactOpenFailed(String detail) {
    return 'Denne PDF kunne ikke åbnes (den er måske beskyttet med en adgangskode): $detail';
  }

  @override
  String redactPageRenderFailed(int number, String detail) {
    return 'Side $number kunne ikke vises: $detail';
  }

  @override
  String get redactUndoTooltip => 'Fortryd det sidste område';

  @override
  String get redactInstructions =>
      'Træk fingeren hen over siden for at tegne et område, der skal skjules. Den tekst, der bliver dækket, fjernes reelt fra filen, ikke bare dækket.';

  @override
  String get redactPagePrevious => 'Forrige side';

  @override
  String get redactPageNext => 'Næste side';

  @override
  String redactPager(int current, int total) {
    return 'Side $current / $total';
  }

  @override
  String get redactNoZone => 'Intet område tegnet';

  @override
  String redactZoneCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count områder at skjule',
      one: '$count område at skjule',
    );
    return '$_temp0';
  }

  @override
  String get redactOtherPdf => 'En anden PDF';

  @override
  String get redactAction => 'Anonymisér';

  @override
  String get redactProgress => 'Anonymiserer…';

  @override
  String get cropEmptyTitle => 'Skær margenerne væk';

  @override
  String get cropEmptyBody =>
      'Vælg en PDF, og træk så fingeren hen over forhåndsvisningen for at markere det område, der skal beholdes.';

  @override
  String get cropTooSmall => 'Det valgte område er for lille.';

  @override
  String get cropProgress => 'Beskærer…';

  @override
  String cropFailed(String detail) {
    return 'Beskæringen mislykkedes: $detail';
  }

  @override
  String get cropKeptArea => 'Beholdt område';

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
  String get cropFullPage => 'Hele siden';

  @override
  String get cropAllPages => 'Anvend på alle sider';

  @override
  String get cropAllPagesOn => 'Det samme område skæres ud på hver side.';

  @override
  String get cropAllPagesOff => 'Kun side 1 beskæres; de øvrige beholdes hele.';

  @override
  String get cropCaveat =>
      'Beskæringen gør siden mindre: indhold uden for området vises og printes ikke længere.';

  @override
  String get cropAction => 'Beskær';

  @override
  String get compareTitle => 'Sammenlign to PDF-filer';

  @override
  String get compareEmptyTitle => 'Hvad der er ændret';

  @override
  String get compareEmptyBody =>
      'Vælg to versioner af den samme PDF. Tilføjede og fjernede passager stilles side om side, side for side.';

  @override
  String get compareSlotA => 'Fil A';

  @override
  String get compareSlotB => 'Fil B';

  @override
  String get compareAction => 'Sammenlign';

  @override
  String get compareProgress => 'Sammenligner…';

  @override
  String compareFailed(String detail) {
    return 'Sammenligningen mislykkedes: $detail';
  }

  @override
  String compareChangedPages(int changed, int total) {
    String _temp0 = intl.Intl.pluralLogic(
      changed,
      locale: localeName,
      other: '$changed sider er forskellige',
      one: '$changed side er forskellig',
    );
    return '$_temp0 ud af $total';
  }

  @override
  String get compareNoDifference => 'Ingen forskel fundet mellem de to filer.';

  @override
  String comparePageHeading(int number) {
    return 'Side $number';
  }

  @override
  String organizeFilesCreated(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count filer oprettet',
      one: '$count fil oprettet',
    );
    return '$_temp0';
  }

  @override
  String organizePartTitle(int number) {
    return 'Del $number';
  }
}
