// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Swedish (`sv`).
class LSv extends L {
  LSv([String locale = 'sv']) : super(locale);

  @override
  String get appTitle => 'Trombone — PDF, skanning och Word';

  @override
  String get appWordmark => 'Trombone';

  @override
  String get actionSave => 'Spara';

  @override
  String get actionShare => 'Dela';

  @override
  String get actionCompress => 'Komprimera';

  @override
  String get actionDone => 'Klar';

  @override
  String get actionCancel => 'Avbryt';

  @override
  String get actionChange => 'Ändra';

  @override
  String get actionContinue => 'Fortsätt';

  @override
  String get actionOpening => 'Öppnar…';

  @override
  String get actionRemoveFile => 'Ta bort den här filen';

  @override
  String get progressPreparing => 'Förbereder…';

  @override
  String progressPercent(int percent) {
    return '$percent %';
  }

  @override
  String get emptyReassurance =>
      'Gratis export, ingen vattenstämpel, ingen gräns.';

  @override
  String get emptyAcceptedFormats => 'Format som godtas';

  @override
  String get exportSavedTitle => 'Den är sparad.';

  @override
  String get exportSavedBody =>
      'Med det namn och i den mapp du just valde. Ingen vattenstämpel, ingen gräns, inget att låsa upp.';

  @override
  String get exportSaveDialogTitle => 'Spara PDF';

  @override
  String pageTileIncluded(int number) {
    return 'Sida $number, medtagen. Tryck för att utesluta den.';
  }

  @override
  String pageTileExcluded(int number) {
    return 'Sida $number, utesluten. Tryck för att ta med den.';
  }

  @override
  String pageTileRotate(int number) {
    return 'Rotera sida $number';
  }

  @override
  String sectionHeaderSemantics(String title, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count verktyg',
      one: '$count verktyg',
    );
    return '$title, $_temp0';
  }

  @override
  String toolCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count verktyg',
      one: '$count verktyg',
    );
    return '$_temp0';
  }

  @override
  String get homePromise =>
      'Gör ditt dokument och exportera det.\nIngen mur på slutet.';

  @override
  String get homeChipNoAccount => 'Inget konto';

  @override
  String get homeChipNoWatermark => 'Ingen vattenstämpel';

  @override
  String get homeChipUnlimited => 'Obegränsad export';

  @override
  String get homeSearchTooltip => 'Sök efter ett verktyg';

  @override
  String get homeColophon =>
      'Ingenting låses upp mot betalning när du ska spara. Export är gratis, utan vattenstämpel och utan tak för hur många.';

  @override
  String get sectionFeatured => 'Utvalt';

  @override
  String get sectionToPdf => 'Till PDF';

  @override
  String get sectionFromPdf => 'Från PDF';

  @override
  String get sectionSecurity => 'Säkerhet';

  @override
  String get sectionEdit => 'Redigering';

  @override
  String get toolMerge => 'Slå ihop';

  @override
  String get toolMergeKeywords =>
      'kombinera foga samman sammanfoga lägg ihop bifoga';

  @override
  String get toolMergeSubtitle =>
      'PDF, Word, bilder och text i ett enda dokument';

  @override
  String get toolRectoVerso => 'Dubbelsidigt';

  @override
  String get toolRectoVersoKeywords =>
      'duplex varva skanning udda jämna båda sidor';

  @override
  String get toolRectoVersoSubtitle => 'Två skanningar, tillbaka i ordning';

  @override
  String get toolImagesToPdf => 'Bilder till PDF';

  @override
  String get toolImagesToPdfKeywords => 'foto jpg jpeg png bilder album kamera';

  @override
  String get toolImagesToPdfSubtitle =>
      'Foton och skärmbilder i ett enda dokument';

  @override
  String get toolPdfToWord => 'PDF till Word';

  @override
  String get toolPdfToWordKeywords =>
      'docx ordbehandling redigerbar konvertera doc';

  @override
  String get toolPdfToWordSubtitle => 'Text och tabeller, redigerbara';

  @override
  String get toolOrganize => 'Organisera en PDF';

  @override
  String get toolOrganizeKeywords =>
      'dela upp separera extrahera ordna om ordning sidor radera';

  @override
  String get toolOrganizeSubtitle => 'Dela upp, extrahera, ordna om';

  @override
  String get toolExcelToPdf => 'Excel till PDF';

  @override
  String get toolExcelToPdfKeywords => 'kalkylark xlsx arbetsbok blad flik';

  @override
  String get toolPptxToPdf => 'PowerPoint till PDF';

  @override
  String get toolPptxToPdfKeywords => 'pptx bild presentation bildspel slides';

  @override
  String get toolHtmlToPdf => 'Webbsida till PDF';

  @override
  String get toolHtmlToPdfKeywords =>
      'html webbplats internet url länk artikel spara sida';

  @override
  String get toolScan => 'Skanna ett dokument';

  @override
  String get toolScanKeywords => 'kamera foto digitalisera skanning papper';

  @override
  String get toolPdfToExcel => 'PDF till Excel';

  @override
  String get toolPdfToExcelKeywords => 'kalkylark xlsx tabell extrahera data';

  @override
  String get toolPdfToPptx => 'PDF till PowerPoint';

  @override
  String get toolPdfToPptxKeywords => 'pptx bild presentation bildspel slides';

  @override
  String get toolPdfToImages => 'PDF till bilder';

  @override
  String get toolPdfToImagesKeywords => 'jpg png foto export skärmbild';

  @override
  String get toolOcr => 'Sökbar text (OCR)';

  @override
  String get toolOcrKeywords =>
      'igenkänning tecken skannad kopiera markera sökbar';

  @override
  String get toolPdfA => 'Konvertera till PDF/A';

  @override
  String get toolPdfAKeywords =>
      'arkiv standard långtidsbevarande bevarande iso';

  @override
  String get toolProtect => 'Skydda PDF';

  @override
  String get toolProtectKeywords => 'lösenord lås kryptera säker hänglås';

  @override
  String get toolUnlock => 'Lås upp PDF';

  @override
  String get toolUnlockKeywords =>
      'ta bort lösenord öppna dekryptera häv hänglås';

  @override
  String get toolRepair => 'Reparera PDF';

  @override
  String get toolRepairKeywords => 'skadad oläslig trasig återställ fel';

  @override
  String get toolRedact => 'Maskera en PDF';

  @override
  String get toolRedactKeywords =>
      'dölj svärta anonymisera konfidentiellt radera censurera';

  @override
  String get toolEdit => 'Redigera PDF';

  @override
  String get toolEditKeywords => 'text ändra rätta kommentera skriv lägg till';

  @override
  String get toolSign => 'Signera';

  @override
  String get toolSignKeywords =>
      'signatur underskrift initialer kontrakt handskriven';

  @override
  String get toolWatermark => 'Vattenstämpel';

  @override
  String get toolWatermarkKeywords =>
      'vattenstämpel stämpel konfidentiellt utkast märke';

  @override
  String get toolPageNumbers => 'Sidnummer';

  @override
  String get toolPageNumbersKeywords =>
      'paginering numrering nummer sidnumrering';

  @override
  String get toolCrop => 'Beskär en PDF';

  @override
  String get toolCropKeywords =>
      'trimma marginaler beskär kanter storlek klipp';

  @override
  String get toolCompare => 'Jämför PDF-filer';

  @override
  String get toolCompareKeywords => 'skillnad versioner diff ändringar jämför';

  @override
  String get searchHint => 'Slå ihop, lösenord, vattenstämpel…';

  @override
  String get searchClear => 'Rensa';

  @override
  String searchNoResultTitle(String query) {
    return 'Inget verktyg för ”$query”.';
  }

  @override
  String get searchNoResultBody =>
      'Prova det format du har till hands — ”Word”, ”Excel”, ”foto” — eller det du vill göra med det: ”signera”, ”dela upp”, ”lösenord”.';

  @override
  String get actionUndo => 'Ångra';

  @override
  String get actionApply => 'Använd';

  @override
  String get actionChoose => 'Välj';

  @override
  String get actionChoosePdf => 'Välj en PDF';

  @override
  String get actionChooseFiles => 'Välj filer';

  @override
  String get actionConvert => 'Konvertera';

  @override
  String get actionFinish => 'Slutför';

  @override
  String get actionBack => 'Tillbaka';

  @override
  String get actionAdd => 'Lägg till';

  @override
  String get noFileChosen => 'Ingen fil vald';

  @override
  String errorExportFailed(String detail) {
    return 'Exporten misslyckades: $detail';
  }

  @override
  String errorShareFailed(String detail) {
    return 'Delningen misslyckades: $detail';
  }

  @override
  String errorOpenFailed(String detail) {
    return 'Filen kunde inte öppnas: $detail';
  }

  @override
  String errorConversionFailed(String detail) {
    return 'Konverteringen misslyckades: $detail';
  }

  @override
  String errorOnFile(String name, String detail) {
    return '$name: $detail';
  }

  @override
  String get errorPickPdf => 'Välj en PDF-fil.';

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
      other: '$count sidor',
      one: '$count sida',
    );
    return '$_temp0';
  }

  @override
  String pageCountOfTotal(int kept, int total) {
    String _temp0 = intl.Intl.pluralLogic(
      kept,
      locale: localeName,
      other: '$kept sidor',
      one: '$kept sida',
    );
    return '$_temp0 av $total';
  }

  @override
  String pageOfTotal(int current, int total) {
    return 'Sida $current av $total';
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
  String get formatImages => 'Bilder';

  @override
  String get formatText => 'Text';

  @override
  String get mergeAddFile => 'Lägg till en fil';

  @override
  String get mergeAddHint => 'PDF, Word, bilder eller text';

  @override
  String get mergeEmptyTitle => 'Ett enda dokument';

  @override
  String get mergeEmptyBody =>
      'Lägg till PDF-filer, Word-filer, bilder eller text. Du kan ändra ordningen och utesluta sidor innan du exporterar.';

  @override
  String get mergeNeedOnePage =>
      'Lägg till minst en fil med en sida som kan tas med.';

  @override
  String get mergeProgress => 'Slår ihop…';

  @override
  String mergeFailed(String detail) {
    return 'Sammanslagningen misslyckades: $detail';
  }

  @override
  String mergeRemoved(String name) {
    return '$name har tagits bort.';
  }

  @override
  String mergeRemoveTooltip(String name) {
    return 'Ta bort $name';
  }

  @override
  String mergeMoveSemantics(String name) {
    return 'Flytta $name';
  }

  @override
  String get mergeRotateAll => 'Rotera alla sidor';

  @override
  String mergePreviewAndExport(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count sidor',
      one: '$count sida',
    );
    return 'Förhandsgranska och exportera ($_temp0)';
  }

  @override
  String previewTitle(String size) {
    return 'Förhandsgranskning · $size';
  }

  @override
  String previewZoomPage(int number) {
    return 'Sida $number, förstora';
  }

  @override
  String get previewPageUnreadable => 'Sidan går inte att läsa.';

  @override
  String previewExportWhat(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count sidor',
      one: '$count sida',
    );
    return 'PDF · $_temp0';
  }

  @override
  String get compressTitle => 'Komprimering';

  @override
  String compressBody(String size) {
    return 'Nuvarande storlek: $size. Välj en nivå — den uppskattade storleken visas innan du använder den.';
  }

  @override
  String get compressEstimating => 'Uppskattar…';

  @override
  String get compressProgress => 'Komprimerar…';

  @override
  String compressFailed(String detail) {
    return 'Komprimeringen misslyckades: $detail';
  }

  @override
  String get protectEmptyTitle => 'Lägg den bakom ett lösenord';

  @override
  String get protectEmptyBody =>
      'PDF-filen går inte längre att öppna utan det lösenord du väljer. Spara det: det går inte att återskapa.';

  @override
  String get protectSubtitle => 'Krypteras med AES 256-bitars';

  @override
  String get protectPassword => 'Lösenord';

  @override
  String get protectConfirmPassword => 'Bekräfta lösenordet';

  @override
  String get protectShowPasswords => 'Visa lösenorden';

  @override
  String get protectHidePasswords => 'Dölj lösenorden';

  @override
  String get protectMismatch => 'De två lösenorden är olika.';

  @override
  String get protectWarning =>
      'Skriv ner det någonstans: utan det blir dokumentet permanent oläsligt. Ingen återställning är möjlig, varken av dig eller av appen.';

  @override
  String get protectAlreadyProtected =>
      'Den här filen är redan skyddad — använd Lås upp PDF först.';

  @override
  String get protectProgress => 'Skyddar…';

  @override
  String protectFailed(String detail) {
    return 'Skyddet misslyckades: $detail';
  }

  @override
  String get protectAction => 'Skydda';

  @override
  String get protectResultTitle => 'PDF skyddad';

  @override
  String get protectResultDetail =>
      'Krypterad med AES 256-bitars. Lösenordet behövs för att öppna den.';

  @override
  String get protectExportWhat => 'Lösenordsskyddad PDF';

  @override
  String get unlockEmptyTitle => 'Ta bort lösenordet';

  @override
  String get unlockEmptyBody =>
      'Du behöver dokumentets nuvarande lösenord. När det är borttaget går PDF-filen att öppna fritt.';

  @override
  String get unlockAcceptsProtectedPdf => 'Skyddad PDF';

  @override
  String get unlockChooseProtectedPdf => 'Välj en skyddad PDF';

  @override
  String get unlockCurrentPassword => 'Nuvarande lösenord';

  @override
  String get unlockWrongPassword => 'Fel lösenord.';

  @override
  String get unlockProgress => 'Låser upp…';

  @override
  String unlockFailed(String detail) {
    return 'Upplåsningen misslyckades: $detail';
  }

  @override
  String get unlockAction => 'Lås upp';

  @override
  String get repairEmptyTitle => 'Reparera en skadad fil';

  @override
  String get repairEmptyBody =>
      'Den interna strukturen i en skadad PDF byggs upp på nytt. Allt som går att rädda blir räddat.';

  @override
  String get repairProgress => 'Reparerar…';

  @override
  String get repairFailed =>
      'Den här filen går inte att reparera — den kan vara för svårt skadad.';

  @override
  String get repairAction => 'Reparera';

  @override
  String get pdfToWordEmptyTitle => 'En redigerbar Word-fil';

  @override
  String get pdfToWordEmptyBody =>
      'Texten och strukturen i PDF-filen förs över till ett .docx-dokument som du kan öppna igen och rätta i.';

  @override
  String get pdfToWordAnalyzing => 'Analyserar dokumentet…';

  @override
  String get pdfToWordAnalysisPending => 'Analys väntar';

  @override
  String pdfToWordAnalysisFailed(String detail) {
    return 'Analysen misslyckades: $detail';
  }

  @override
  String get pdfLocked =>
      'Den här PDF-filen är lösenordsskyddad. Lås upp den först.';

  @override
  String get pdfToWordConverting => 'Konverterar till Word…';

  @override
  String get pdfToWordSummaryTitle => 'Innehåll som hittades';

  @override
  String pdfToWordParagraphCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count stycken',
      one: '$count stycke',
    );
    return '$_temp0';
  }

  @override
  String pdfToWordHeadingCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count rubriker',
      one: '$count rubrik',
    );
    return '$_temp0';
  }

  @override
  String pdfToWordTableCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count tabeller',
      one: '$count tabell',
    );
    return '$_temp0';
  }

  @override
  String get pdfToWordNoTables =>
      'Ingen tabell hittades: om din PDF innehåller några konverteras deras rader till stycken.';

  @override
  String get pdfToWordCaveat =>
      'Konverteringen återger texten, formateringen och tabellerna, men inte den exakta layouten: bildernas och spalternas placering bevaras inte, och bilder följer inte med till Word-dokumentet.';

  @override
  String get pdfToWordScanWarning =>
      'Den här PDF-filen ser ut som en skanning: ingen text hittades. Använd verktyget Sökbar text (OCR) först, kom sedan tillbaka och konvertera den PDF du får ut.';

  @override
  String get pdfToWordResultTitle => 'Word-dokumentet är klart';

  @override
  String pdfToWordResultDetail(String name, String size) {
    return '$name — $size';
  }

  @override
  String get pdfToWordExportWhat => 'Word-dokument';

  @override
  String get pdfToWordConvertAction => 'Konvertera till Word';

  @override
  String get actionConvertAgain => 'Konvertera igen';

  @override
  String errorSaveFailed(String detail) {
    return 'Kunde inte spara: $detail';
  }

  @override
  String get rectoVersoIntro =>
      'En enkelsidig arkmatare ger dig två filer: de udda sidorna i ordning, de jämna sidorna ofta i omvänd ordning. Välj båda för att sätta ihop dem igen.';

  @override
  String get rectoVersoOddSlot => 'Fil med de udda sidorna (framsidor)';

  @override
  String get rectoVersoEvenSlot => 'Fil med de jämna sidorna (baksidor)';

  @override
  String get rectoVersoReversed => 'Den andra filen är i omvänd ordning';

  @override
  String get rectoVersoReversedHint =>
      'Det är det vanliga fallet, ikryssat som standard';

  @override
  String rectoVersoPreview(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count sidor',
      one: '$count sida',
    );
    return 'Förhandsgranskning av varvningen ($_temp0)';
  }

  @override
  String get rectoVersoProgress => 'Varvar sidorna…';

  @override
  String fileWithPageCount(String name, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count sidor',
      one: '$count sida',
    );
    return '$name · $_temp0';
  }

  @override
  String get actionPreviewAndExport => 'Förhandsgranska och exportera';

  @override
  String errorOpenFailedShort(String detail) {
    return 'Kunde inte öppna: $detail';
  }

  @override
  String errorGeneric(String detail) {
    return 'Misslyckades: $detail';
  }

  @override
  String get actionConvertToPdf => 'Konvertera till PDF';

  @override
  String get convertProgress => 'Konverterar…';

  @override
  String get excelEmptyTitle => 'En arbetsbok som PDF';

  @override
  String get excelEmptyBody =>
      'Bladen i en .xlsx-fil blir PDF-sidor, klara att skicka eller skriva ut.';

  @override
  String get excelChooseWorkbook => 'Välj en arbetsbok';

  @override
  String get excelChooseXlsx => 'Välj en .xlsx-arbetsbok';

  @override
  String get excelLegacyFormat =>
      'Formatet .xls (Excels gamla binära format) stöds inte. Spara filen som .xlsx och försök igen.';

  @override
  String get excelWrongFormat => 'Välj en .xlsx-arbetsbok från Excel.';

  @override
  String excelUnreadable(String detail) {
    return 'Arbetsboken går inte att läsa: $detail';
  }

  @override
  String excelSheetsAndRows(int sheets, int rows) {
    String _temp0 = intl.Intl.pluralLogic(
      sheets,
      locale: localeName,
      other: '$sheets blad',
      one: '$sheets blad',
    );
    String _temp1 = intl.Intl.pluralLogic(
      rows,
      locale: localeName,
      other: '$rows rader totalt',
      one: '$rows rad totalt',
    );
    return '$_temp0 · $_temp1';
  }

  @override
  String get excelSheetsDetected => 'Blad som hittades';

  @override
  String get excelEmptySheet => 'Tomt blad';

  @override
  String excelSheetDimensions(int rows, int columns) {
    String _temp0 = intl.Intl.pluralLogic(
      rows,
      locale: localeName,
      other: '$rows rader',
      one: '$rows rad',
    );
    String _temp1 = intl.Intl.pluralLogic(
      columns,
      locale: localeName,
      other: '$columns kolumner',
      one: '$columns kolumn',
    );
    return '$_temp0 × $_temp1';
  }

  @override
  String get excelRepeatHeader => 'Upprepa rubrikraden på varje sida';

  @override
  String get excelRepeatHeaderHint =>
      'Bladets första rad ritas om högst upp på varje sida av tabellen.';

  @override
  String get excelCaveat =>
      'Vad konverteringen tar med: celltexten som den är sparad i filen (inklusive formlernas senast beräknade resultat), första raden i fetstil och ett rutnät.\n\nVad den inte tar med: färger, teckensnitt, talformat, sammanfogade celler, bilder, diagram och formlerna själva. Kolumnerna krymps för att rymmas i sidbredden; i mycket breda blad kortas text i alltför smala celler av med ”…”.';

  @override
  String get pptxEmptyTitle => 'En presentation som PDF';

  @override
  String get pptxEmptyBody =>
      'En liggande sida i 16:9 per bild, med rubriken och punkterna. Texten följer med; originalets bilder, former och bakgrunder gör det inte.\n\nFormat som godtas: .pptx. En äldre .ppt-fil måste först sparas om som .pptx från PowerPoint.';

  @override
  String get pptxChoosePresentation => 'Välj en presentation';

  @override
  String get pptxTextOnlyTitle => 'Endast textkonvertering';

  @override
  String get pptxTextOnlyBody =>
      'Texten på varje bild följer med. Originalets bilder, former, bakgrunder, färger och layouter bevaras inte: den färdiga PDF-filen är en enkel, läsbar layout, inte en trogen kopia av din presentation.';

  @override
  String pptxSlideCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count bilder',
      one: '$count bild',
    );
    return '$_temp0';
  }

  @override
  String get pptxSlidesDetected => 'Bilder som hittades';

  @override
  String pptxMoreSlides(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count bilder till',
      one: '$count bild till',
    );
    return 'och $_temp0…';
  }

  @override
  String get pptxUntitledSlide => 'Utan rubrik';

  @override
  String get pptxEmptySlide => 'Ingen text (endast bild eller form)';

  @override
  String pptxTextLineCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count textrader',
      one: '$count textrad',
    );
    return '$_temp0';
  }

  @override
  String pptxReadFailed(String detail) {
    return 'Kunde inte läsas: $detail';
  }

  @override
  String get compressLevelLight => 'Lätt';

  @override
  String get compressLevelMedium => 'Medel';

  @override
  String get compressLevelStrong => 'Kraftig';

  @override
  String get pptxQualityStandard => 'Standard (150 dpi)';

  @override
  String get pptxQualityHigh => 'Hög (220 dpi)';

  @override
  String get pdfToExcelEmptyTitle => 'Få tillbaka tabellerna';

  @override
  String get pdfToExcelEmptyBody =>
      'Tabeller i en PDF plockas ut till en Excel-arbetsbok. Formateringen bevaras inte; värdena gör det.';

  @override
  String pdfToExcelPagesAnalyzed(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count sidor analyserade',
      one: '$count sida analyserad',
    );
    return '$_temp0';
  }

  @override
  String pdfToExcelAnalysisFailed(String detail) {
    return 'Analysen misslyckades. PDF-filen kan vara lösenordsskyddad eller skadad. ($detail)';
  }

  @override
  String get pdfToExcelNothingToExport =>
      'Inget att exportera: ingen tabell hittades.';

  @override
  String get pdfToExcelBuilding => 'Bygger arbetsboken…';

  @override
  String get pdfToExcelIncludeParagraphs =>
      'Ta även med text utanför tabeller (en rad per stycke)';

  @override
  String get pdfToExcelIncludeParagraphsHint =>
      'Användbart för ett halvstrukturerat dokument: texten hamnar i kolumn A, efter sidans tabeller.';

  @override
  String get pdfToExcelCaveatTitle => 'Vad konverteringen inte bevarar';

  @override
  String get pdfToExcelCaveat =>
      'Igenkänningen bygger på var texten sitter på sidan: tabeller utan regelbundna linjer, sammanfogade celler och mycket oregelbundna kolumner kan delas fel. En skannad PDF (en bild) innehåller ingen text som går att plocka ut och ger ingenting. Färger, formler och bilder följer aldrig med: bara textvärdena.';

  @override
  String pdfToExcelTablesFound(int tables, int pages) {
    String _temp0 = intl.Intl.pluralLogic(
      tables,
      locale: localeName,
      other: '$tables tabeller hittade',
      one: '$tables tabell hittad',
    );
    String _temp1 = intl.Intl.pluralLogic(
      pages,
      locale: localeName,
      other: '$pages sidor',
      one: '$pages sida',
    );
    return '$_temp0 fördelat på $_temp1';
  }

  @override
  String pdfToExcelPagesConcerned(String pages) {
    return 'Berörda sidor: $pages';
  }

  @override
  String pdfToExcelParagraphsOutside(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count stycken utanför tabeller',
      one: '$count stycke utanför tabeller',
    );
    return '$_temp0';
  }

  @override
  String get pdfToExcelScannedWarning =>
      'Ingen text kunde plockas ut ur den här PDF-filen: den är nästan säkert ett skannat dokument (bilder av sidor). Ett kalkylark kan inte göra något av det; använd verktyget för textigenkänning (OCR) först.';

  @override
  String get pdfToExcelNoTableWarning =>
      'Ingen tabellstruktur kändes igen i det här dokumentet. Texten finns där, men den är inte satt i regelbundna kolumner. Slå hellre på ”Ta även med text utanför tabeller” ovan än att skapa en oläslig arbetsbok, eller använd ”PDF till Word”, som bevarar styckena bättre.';

  @override
  String get pdfToExcelResultTitle => 'Arbetsboken är klar';

  @override
  String get pdfToExcelExportWhat => 'Excel-arbetsbok';

  @override
  String get pdfToExcelConvertAction => 'Konvertera till Excel';

  @override
  String resultNameAndSize(String name, String size) {
    return '$name — $size';
  }

  @override
  String get pdfToPptxEmptyTitle => 'En bild per sida';

  @override
  String get pdfToPptxEmptyBody =>
      'PDF-filen blir en PowerPoint-presentation, likadan. Varje sida kommer in som en bild: layouten är trogen, men texten går inte att redigera i PowerPoint.';

  @override
  String pdfToPptxOpenFailed(String detail) {
    return 'Den här PDF-filen kunde inte öppnas: $detail';
  }

  @override
  String get pdfToPptxConverting => 'Konverterar till PowerPoint…';

  @override
  String pdfToPptxPagesToSlides(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count sidor',
      one: '$count sida',
    );
    String _temp1 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count bilder',
      one: '$count bild',
    );
    return '$_temp0 > $_temp1';
  }

  @override
  String get pdfToPptxEmptyDocument => 'Tomt dokument';

  @override
  String get qualityLabel => 'Kvalitet';

  @override
  String get pdfToPptxQualityHint =>
      'En högre upplösning ger skarpare bilder men en märkbart tyngre fil.';

  @override
  String pdfToPptxHeavyWarning(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count sidor',
      one: '$count sida',
    );
    return 'Se upp: vid hög kvalitet kan en presentation på $_temp0 väga flera tiotals MB och vara långsam att öppna. Välj Standard om du tvekar.';
  }

  @override
  String get goodToKnow => 'Bra att veta';

  @override
  String get pdfToPptxCaveat =>
      'Varje bild är en bild av sidan: layouten är identisk med PDF-filens, men texten går inte att redigera i PowerPoint.\nAnvänd ”PDF till Word” i stället om du vill ha tillbaka redigerbar text.\nEn presentation har bara en bildstorlek: den tas från första sidan, och sidor med en annan storlek centreras inuti den.';

  @override
  String get pdfToPptxResultTitle => 'Presentationen är klar';

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
      other: '$count bilder',
      one: '$count bild',
    );
    return '$name — $_temp0 · $size · $quality';
  }

  @override
  String get notSavedYet =>
      'Filen finns inte på din enhet ännu: spara den eller dela den.';

  @override
  String get pdfToPptxChangeQuality => 'Ändra kvaliteten';

  @override
  String get pdfToPptxConvertAction => 'Konvertera till PowerPoint';

  @override
  String pdfToPptxExportWhat(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count bilder',
      one: '$count bild',
    );
    return 'PowerPoint-presentation · $_temp0';
  }

  @override
  String get formatLabel => 'Format';

  @override
  String get actionExport => 'Exportera';

  @override
  String get imageQualityWeb => 'Webb (72 dpi)';

  @override
  String get imageQualityStandard => 'Standard (150 dpi)';

  @override
  String get imageQualityHigh => 'Hög kvalitet (300 dpi)';

  @override
  String get pdfToImagesEmptyTitle => 'En bild per sida';

  @override
  String get pdfToImagesEmptyBody =>
      'Välj en PDF: varje sida kommer ut som en bild, i den upplösning du anger härnäst.';

  @override
  String pdfToImagesNotAPdf(String name) {
    return '$name: välj en PDF-fil.';
  }

  @override
  String errorLoadFailed(String detail) {
    return 'Inläsningen misslyckades: $detail';
  }

  @override
  String get pdfToImagesProgress => 'Exporterar…';

  @override
  String pdfToImagesExportWhat(int count, String format) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count $format-bilder',
      one: '$count $format-bild',
    );
    return '$_temp0';
  }

  @override
  String get pdfaEmptyTitle => 'Arkivera för lång sikt';

  @override
  String get pdfaEmptyBody =>
      'PDF/A är det arkivformat som många myndigheter kräver. Dokumentet konverteras utan att förlora sitt utseende.';

  @override
  String get pdfaConformanceLevel => 'Konformitetsnivå';

  @override
  String get pdfaA1bDetail =>
      'Den strängaste och mest allmänt accepterade nivån. Välj den här om du tvekar.';

  @override
  String get pdfaA2bDetail =>
      'Bygger på PDF 1.7: effektivare komprimering, något lättare filer.';

  @override
  String get pdfaA3bDetail =>
      'Som A-2b, men tillåter bilagor (krävs ofta för elektronisk fakturering).';

  @override
  String pdfaConvertingTo(String level) {
    return 'Konverterar till $level…';
  }

  @override
  String get pdfaCaveatTitle => 'Vad konverteringen ändrar';

  @override
  String pdfaCaveat(int dpi) {
    return 'Varje sida ritas om som en bild i $dpi dpi: texten blir en bild och layouten fryses. Det är det som gör filen verkligt konform utan att bero på originaldokumentets teckensnitt, men i utbyte går texten inte längre att markera eller söka i, länkar och formulär försvinner, och filen blir tyngre.';
  }

  @override
  String pdfaOpenFailed(String detail) {
    return 'Den här PDF-filen kunde inte öppnas: $detail';
  }

  @override
  String get imagesToPdfEmptyTitle => 'Bilder i en enda PDF';

  @override
  String get imagesToPdfEmptyBody =>
      'JPG, PNG, WebP, HEIC — lägg till dina bilder så sätts de ihop i den ordning du väljer.';

  @override
  String get imagesToPdfChoose => 'Välj bilder';

  @override
  String get imagesToPdfAdd => 'Lägg till bilder';

  @override
  String imagesToPdfRejected(String names) {
    return 'Överhoppade (inte en bild): $names';
  }

  @override
  String get imagesToPdfBuilding => 'Bygger PDF-filen…';

  @override
  String imagesToPdfBuildFailed(String detail) {
    return 'Kunde inte bygga den: $detail';
  }

  @override
  String imagesToPdfCreateAction(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count bilder',
      one: '$count bild',
    );
    return 'Skapa PDF-filen ($_temp0)';
  }

  @override
  String get actionRotate => 'Rotera';

  @override
  String get actionRemove => 'Ta bort';

  @override
  String get htmlTitle => 'HTML / webbsida till PDF';

  @override
  String get htmlIntro =>
      'Gör om en webbsida eller HTML-kod till en PDF i A4. Renderingen sköts av webbläsaren som är inbyggd i Android, så layouten är den du skulle få om du skrev ut från Chrome.';

  @override
  String get htmlModeUrl => 'Webbadress';

  @override
  String get htmlModeCode => 'HTML-kod';

  @override
  String get htmlUrlLabel => 'Sidans adress';

  @override
  String get htmlUrlHint => 'https://example.com/artikel';

  @override
  String get htmlCodeLabel => 'HTML-kod';

  @override
  String get htmlCodeHint => '<h1>Rubrik</h1>\n<p>Text…</p>';

  @override
  String get htmlUrlBadScheme =>
      'Adressen måste börja med http:// eller https://.';

  @override
  String get htmlUrlIncomplete => 'Ange en fullständig webbadress.';

  @override
  String get htmlCodeEmpty => 'Klistra in HTML-kod att konvertera.';

  @override
  String get htmlLoadingUrl => 'Läser in sidan och konverterar…';

  @override
  String get htmlConverting => 'Konverterar HTML-koden…';

  @override
  String get htmlNetworkNotice =>
      'En internetanslutning krävs: det här är det enda verktyget i appen som måste hämta sidan. Sidor som kräver inloggning på ett konto, en cookiebanner eller mycket JavaScript kan komma ut ofullständiga.';

  @override
  String get htmlOfflineNotice =>
      'HTML och CSS som skrivits direkt i sidan renderas offline. Bilder, formatmallar eller teckensnitt som hämtas från en extern webbadress kräver däremot en internetanslutning.';

  @override
  String get watermarkEmptyTitle => 'Lägg på en vattenstämpel';

  @override
  String get watermarkEmptyBody =>
      'En text du väljer själv upprepas i bakgrunden på varje sida — för att märka ett dokument som konfidentiellt eller som utkast.';

  @override
  String get watermarkEmptyNote => 'Gratis export, inget tak för hur många.';

  @override
  String get watermarkTextLabel => 'Vattenstämpelns text';

  @override
  String get watermarkDefaultText => 'KONFIDENTIELLT';

  @override
  String get watermarkNeedText => 'Ange en text för vattenstämpeln.';

  @override
  String watermarkOpacity(int percent) {
    return 'Ogenomskinlighet: $percent %';
  }

  @override
  String watermarkRotation(int degrees) {
    return 'Rotationsvinkel: $degrees°';
  }

  @override
  String watermarkFontSize(int points) {
    return 'Textstorlek: $points pt';
  }

  @override
  String get watermarkColor => 'Färg';

  @override
  String get colorGrey => 'Grå';

  @override
  String get colorRed => 'Röd';

  @override
  String get colorBlue => 'Blå';

  @override
  String get colorBlack => 'Svart';

  @override
  String get watermarkProgress => 'Lägger på vattenstämpeln…';

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
  String get pageNumbersEmptyTitle => 'Numrera sidorna';

  @override
  String get pageNumbersEmptyBody =>
      'Välj en PDF och sedan placeringen och formatet på de nummer som läggs till på varje sida.';

  @override
  String get positionLabel => 'Placering';

  @override
  String get positionBottomCenter => 'Nedtill i mitten';

  @override
  String get positionBottomRight => 'Nedtill till höger';

  @override
  String get positionTopCenter => 'Upptill i mitten';

  @override
  String get positionTopRight => 'Upptill till höger';

  @override
  String get pageNumbersFormatPlain => 'N';

  @override
  String get pageNumbersFormatOfTotal => 'N / totalt';

  @override
  String get pageNumbersStart => 'Startnummer';

  @override
  String get pageNumbersProgress => 'Numrerar…';

  @override
  String get organizeEmptyTitle => 'Ta tag i en PDF igen';

  @override
  String get organizeEmptyBody =>
      'Öppna ett dokument för att dela upp det, plocka ut sidor ur det eller ändra deras ordning.';

  @override
  String get organizeOpenFile => 'Öppna en fil';

  @override
  String get organizeNothingToExport => 'Ingen sida att exportera.';

  @override
  String organizePagesKept(int kept, int total) {
    String _temp0 = intl.Intl.pluralLogic(
      kept,
      locale: localeName,
      other: '$kept sidor behållna',
      one: '$kept sida behållen',
    );
    return '$_temp0 av $total';
  }

  @override
  String get organizePageExcluded => 'Utesluten';

  @override
  String organizePageMoved(int from) {
    return 'Flyttad från plats $from';
  }

  @override
  String organizePageTitle(int number) {
    return 'Sida $number';
  }

  @override
  String organizeExcludePage(int number) {
    return 'Uteslut sida $number';
  }

  @override
  String organizeIncludePage(int number) {
    return 'Ta med sida $number';
  }

  @override
  String organizeMovePage(int number) {
    return 'Flytta sida $number';
  }

  @override
  String get organizeExtract => 'Extrahera';

  @override
  String get organizeSplit => 'Dela upp';

  @override
  String get organizePreview => 'Förhandsgranska';

  @override
  String get organizeExtractTitle => 'Extrahera ett sidintervall';

  @override
  String organizeRangeLabel(int start, int end) {
    return 'Sida $start till $end';
  }

  @override
  String get organizeSplitTitle => 'Dela upp i flera filer';

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
    return 'Uppdelningen misslyckades: $detail';
  }

  @override
  String get scanNoCamera => 'Det finns ingen kamera på den här enheten.';

  @override
  String scanCameraFailed(String detail) {
    return 'Kameran kunde inte startas: $detail';
  }

  @override
  String get scanCropToolbar => 'Justera';

  @override
  String scanCaptureFailed(String detail) {
    return 'Tagningen misslyckades: $detail';
  }

  @override
  String get scanPermissionBody =>
      'Åtkomst till kameran krävs för att skanna ett dokument.';

  @override
  String get scanGrantPermission => 'Tillåt åtkomst till kameran';

  @override
  String get actionRetry => 'Försök igen';

  @override
  String get scanNoPageYet => 'Ingen sida ännu.';

  @override
  String scanFinishAction(int count) {
    return 'Slutför · $count';
  }

  @override
  String get signTitle => 'Signera en PDF';

  @override
  String get signIntro =>
      'Sätt din handritade signatur på en sida i en PDF. Det är bara en teckning som läggs till i dokumentet, inte en certifierad elektronisk signatur.';

  @override
  String get signChooseSubtitle => 'Välj dokumentet som ska signeras';

  @override
  String get signPickPage => 'Välj sidan som ska signeras.';

  @override
  String get signDrawTitle => 'Rita min signatur';

  @override
  String get signDrawBody =>
      'Rita med fingret som du skulle göra på papper. Det sätter en teckning på sidan — det är inte en certifierad elektronisk signatur.';

  @override
  String get signNeedDrawing => 'Rita en signatur innan du fortsätter.';

  @override
  String get signClear => 'Rensa';

  @override
  String get signValidate => 'Bekräfta';

  @override
  String get signPlaceBody =>
      'Dra signaturen dit du vill ha den på sidan och tryck sedan på Slutför.';

  @override
  String get signPageUnavailable => 'Sidan kunde inte visas.';

  @override
  String get signProgress => 'Lägger till signaturen…';

  @override
  String get editTitle => 'Kommentera ett dokument';

  @override
  String get editEmptyBody =>
      'Lägg till text eller markera avsnitt direkt i en befintlig PDF.';

  @override
  String get editAddTextTitle => 'Lägg till text';

  @override
  String get editTextHint => 'Din text';

  @override
  String editFontSize(int size) {
    return 'Textstorlek: $size';
  }

  @override
  String get editNeedAnnotation =>
      'Lägg till minst en kommentar innan du slutför.';

  @override
  String get editProgress => 'Tillämpar kommentarerna…';

  @override
  String get editChooseOther => 'Välj en annan PDF';

  @override
  String get editUndoTooltip => 'Ångra den senaste kommentaren';

  @override
  String get editModeText => 'Text';

  @override
  String get editModeHighlight => 'Överstrykning';

  @override
  String get editPageUnavailable => 'Den här sidan kunde inte visas.';

  @override
  String get ocrEmptyTitle => 'Gör texten sökbar';

  @override
  String get ocrEmptyBody =>
      'Texten i en skannad PDF känns igen och läggs osynligt ovanpå bilden. Sidan ser likadan ut.';

  @override
  String get ocrWrongFormat => 'Välj en PDF eller en bild (JPG, PNG…).';

  @override
  String get ocrProgress => 'Känner igen…';

  @override
  String ocrFailed(String detail) {
    return 'Igenkänningen misslyckades: $detail';
  }

  @override
  String get ocrRunAction => 'Starta igenkänningen';

  @override
  String get ocrResultTitle => 'OCR-resultat';

  @override
  String ocrResultBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count sidor analyserade',
      one: '$count sida analyserad',
    );
    return '$_temp0. Den sökbara PDF-filen är klar, och du kan också kopiera all text som känts igen.';
  }

  @override
  String get ocrCopyText => 'Kopiera texten';

  @override
  String get ocrTextCopied => 'Texten har kopierats.';

  @override
  String get redactIntro =>
      'Dölj områden i en PDF permanent (namn, adresser, belopp). Till skillnad från en vanlig svart rektangel som läggs ovanpå tas den dolda texten verkligen bort ur filen, inte bara täcks över: den går inte längre att markera eller kopiera.';

  @override
  String get redactChooseSubtitle => 'Välj dokumentet som ska maskeras';

  @override
  String get redactCaveat =>
      'Bra att veta: för att ta bort den dolda texten görs varje sida i dokumentet om till en bild igen (200 dpi). Resultatet är därför inte längre en PDF vars text går att markera, och den färdiga filen är oftast tyngre än originalet.';

  @override
  String get redactEmptyPdf => 'Den här PDF-filen innehåller ingen sida.';

  @override
  String redactOpenFailed(String detail) {
    return 'Den här PDF-filen kunde inte öppnas (den kan vara lösenordsskyddad): $detail';
  }

  @override
  String redactPageRenderFailed(int number, String detail) {
    return 'Sida $number kunde inte visas: $detail';
  }

  @override
  String get redactUndoTooltip => 'Ångra det senaste området';

  @override
  String get redactInstructions =>
      'Dra fingret över sidan för att rita ett område som ska döljas. Texten som täcks tas verkligen bort ur filen, inte bara täcks över.';

  @override
  String get redactPagePrevious => 'Föregående sida';

  @override
  String get redactPageNext => 'Nästa sida';

  @override
  String redactPager(int current, int total) {
    return 'Sida $current / $total';
  }

  @override
  String get redactNoZone => 'Inget område ritat';

  @override
  String redactZoneCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count områden att dölja',
      one: '$count område att dölja',
    );
    return '$_temp0';
  }

  @override
  String get redactOtherPdf => 'En annan PDF';

  @override
  String get redactAction => 'Maskera';

  @override
  String get redactProgress => 'Maskerar…';

  @override
  String get cropEmptyTitle => 'Skär bort marginalerna';

  @override
  String get cropEmptyBody =>
      'Välj en PDF och dra sedan fingret över förhandsgranskningen för att märka ut området som ska behållas.';

  @override
  String get cropTooSmall => 'Det valda området är för litet.';

  @override
  String get cropProgress => 'Beskär…';

  @override
  String cropFailed(String detail) {
    return 'Beskärningen misslyckades: $detail';
  }

  @override
  String get cropKeptArea => 'Behållet område';

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
  String get cropFullPage => 'Hela sidan';

  @override
  String get cropAllPages => 'Tillämpa på alla sidor';

  @override
  String get cropAllPagesOn => 'Samma område skärs ut på varje sida.';

  @override
  String get cropAllPagesOff => 'Bara sida 1 beskärs; de övriga behålls hela.';

  @override
  String get cropCaveat =>
      'Beskärningen minskar sidans storlek: innehåll utanför området visas och skrivs inte längre ut.';

  @override
  String get cropAction => 'Beskär';

  @override
  String get compareTitle => 'Jämför två PDF-filer';

  @override
  String get compareEmptyTitle => 'Vad som har ändrats';

  @override
  String get compareEmptyBody =>
      'Välj två versioner av samma PDF. Tillagda och borttagna avsnitt ställs sida vid sida, sida för sida.';

  @override
  String get compareSlotA => 'Fil A';

  @override
  String get compareSlotB => 'Fil B';

  @override
  String get compareAction => 'Jämför';

  @override
  String get compareProgress => 'Jämför…';

  @override
  String compareFailed(String detail) {
    return 'Jämförelsen misslyckades: $detail';
  }

  @override
  String compareChangedPages(int changed, int total) {
    String _temp0 = intl.Intl.pluralLogic(
      changed,
      locale: localeName,
      other: '$changed sidor skiljer sig',
      one: '$changed sida skiljer sig',
    );
    return '$_temp0 av $total';
  }

  @override
  String get compareNoDifference =>
      'Ingen skillnad hittades mellan de två filerna.';

  @override
  String comparePageHeading(int number) {
    return 'Sida $number';
  }

  @override
  String organizeFilesCreated(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count filer skapade',
      one: '$count fil skapad',
    );
    return '$_temp0';
  }

  @override
  String organizePartTitle(int number) {
    return 'Del $number';
  }
}
