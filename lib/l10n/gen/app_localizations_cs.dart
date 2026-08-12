// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Czech (`cs`).
class LCs extends L {
  LCs([String locale = 'cs']) : super(locale);

  @override
  String get appTitle => 'Trombone — PDF, skenování a Word';

  @override
  String get appWordmark => 'Trombone';

  @override
  String get actionSave => 'Uložit';

  @override
  String get actionShare => 'Sdílet';

  @override
  String get actionCompress => 'Zmenšit';

  @override
  String get actionDone => 'Hotovo';

  @override
  String get actionCancel => 'Zrušit';

  @override
  String get actionChange => 'Změnit';

  @override
  String get actionContinue => 'Pokračovat';

  @override
  String get actionOpening => 'Otevírá se…';

  @override
  String get actionRemoveFile => 'Odebrat tento soubor';

  @override
  String get progressPreparing => 'Připravuje se…';

  @override
  String progressPercent(int percent) {
    return '$percent %';
  }

  @override
  String get emptyReassurance => 'Export zdarma, bez vodoznaku a bez omezení.';

  @override
  String get emptyAcceptedFormats => 'Podporované formáty';

  @override
  String get exportSavedTitle => 'Uloženo.';

  @override
  String get exportSavedBody =>
      'Pod názvem a do složky, které jste právě zvolili. Bez vodoznaku, bez omezení, není co odemykat.';

  @override
  String get exportSaveDialogTitle => 'Uložit PDF';

  @override
  String pageTileIncluded(int number) {
    return 'Stránka $number, zahrnuta. Klepnutím ji vyřadíte.';
  }

  @override
  String pageTileExcluded(int number) {
    return 'Stránka $number, vyřazena. Klepnutím ji zahrnete.';
  }

  @override
  String pageTileRotate(int number) {
    return 'Otočit stránku $number';
  }

  @override
  String sectionHeaderSemantics(String title, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count nástrojů',
      many: '$count nástroje',
      few: '$count nástroje',
      one: '$count nástroj',
    );
    return '$title, $_temp0';
  }

  @override
  String toolCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count nástrojů',
      many: '$count nástroje',
      few: '$count nástroje',
      one: '$count nástroj',
    );
    return '$_temp0';
  }

  @override
  String get homePromise =>
      'Vytvořte dokument a exportujte ho.\nŽádná zeď na konci.';

  @override
  String get homeChipNoAccount => 'Bez účtu';

  @override
  String get homeChipNoWatermark => 'Bez vodoznaku';

  @override
  String get homeChipUnlimited => 'Export bez omezení';

  @override
  String get homeSearchTooltip => 'Najít nástroj';

  @override
  String get homeColophon =>
      'Při ukládání se nic neodemyká za peníze. Export je zdarma, bez vodoznaku a bez omezení počtu.';

  @override
  String get sectionFeatured => 'Doporučené';

  @override
  String get sectionToPdf => 'Do PDF';

  @override
  String get sectionFromPdf => 'Z PDF';

  @override
  String get sectionSecurity => 'Zabezpečení';

  @override
  String get sectionEdit => 'Úpravy';

  @override
  String get toolMerge => 'Sloučit';

  @override
  String get toolMergeKeywords =>
      'spojit slucit dat dohromady pripojit spojeni';

  @override
  String get toolMergeSubtitle =>
      'PDF, Word, obrázky a text v jednom dokumentu';

  @override
  String get toolRectoVerso => 'Oboustranně';

  @override
  String get toolRectoVersoKeywords =>
      'duplex prokladat sken liche sude dve strany';

  @override
  String get toolRectoVersoSubtitle => 'Dva skeny, zase ve správném pořadí';

  @override
  String get toolImagesToPdf => 'Obrázky do PDF';

  @override
  String get toolImagesToPdfKeywords =>
      'foto jpg jpeg png fotky album fotoaparat obrazek';

  @override
  String get toolImagesToPdfSubtitle =>
      'Fotky a snímky obrazovky v jednom dokumentu';

  @override
  String get toolPdfToWord => 'PDF do Wordu';

  @override
  String get toolPdfToWordKeywords =>
      'docx textovy editor upravitelny prevest doc';

  @override
  String get toolPdfToWordSubtitle => 'Text i tabulky, upravitelné';

  @override
  String get toolOrganize => 'Uspořádat PDF';

  @override
  String get toolOrganizeKeywords =>
      'rozdelit oddelit vyjmout preusporadat poradi stranky smazat';

  @override
  String get toolOrganizeSubtitle => 'Rozdělit, vyjmout, přeuspořádat';

  @override
  String get toolExcelToPdf => 'Excel do PDF';

  @override
  String get toolExcelToPdfKeywords => 'tabulka xlsx sesit list vypocty';

  @override
  String get toolPptxToPdf => 'PowerPoint do PDF';

  @override
  String get toolPptxToPdfKeywords => 'pptx snimek prezentace slides';

  @override
  String get toolHtmlToPdf => 'Webová stránka do PDF';

  @override
  String get toolHtmlToPdfKeywords => 'html web internet url odkaz clanek';

  @override
  String get toolScan => 'Naskenovat dokument';

  @override
  String get toolScanKeywords => 'fotoaparat foto digitalizovat skener papir';

  @override
  String get toolPdfToExcel => 'PDF do Excelu';

  @override
  String get toolPdfToExcelKeywords => 'tabulka xlsx vyjmout data';

  @override
  String get toolPdfToPptx => 'PDF do PowerPointu';

  @override
  String get toolPdfToPptxKeywords => 'pptx snimek prezentace slides';

  @override
  String get toolPdfToImages => 'PDF do obrázků';

  @override
  String get toolPdfToImagesKeywords =>
      'jpg png foto exportovat snimek obrazek';

  @override
  String get toolOcr => 'Vyhledatelný text (OCR)';

  @override
  String get toolOcrKeywords =>
      'rozpoznavani znaky naskenovane kopirovat oznacit';

  @override
  String get toolPdfA => 'Převést na PDF/A';

  @override
  String get toolPdfAKeywords => 'archivace norma dlouhodobe uchovani iso';

  @override
  String get toolProtect => 'Zabezpečit PDF';

  @override
  String get toolProtectKeywords => 'heslo zamek sifrovat uzamknout zabezpecit';

  @override
  String get toolUnlock => 'Odemknout PDF';

  @override
  String get toolUnlockKeywords =>
      'odebrat heslo otevrit desifrovat odemknout zamek';

  @override
  String get toolRepair => 'Opravit PDF';

  @override
  String get toolRepairKeywords => 'poskozeny necitelny rozbity obnovit chyba';

  @override
  String get toolRedact => 'Začernit v PDF';

  @override
  String get toolRedactKeywords =>
      'skryt zacernit anonymizovat duverne smazat cenzura';

  @override
  String get toolEdit => 'Upravit PDF';

  @override
  String get toolEditKeywords => 'text zmenit opravit poznamka psat';

  @override
  String get toolSign => 'Podepsat';

  @override
  String get toolSignKeywords => 'podpis parafa smlouva ruka';

  @override
  String get toolWatermark => 'Vodoznak';

  @override
  String get toolWatermarkKeywords =>
      'watermark razitko duverne koncept znacka';

  @override
  String get toolPageNumbers => 'Čísla stránek';

  @override
  String get toolPageNumbersKeywords =>
      'strankovani cislovani ocislovat cislice';

  @override
  String get toolCrop => 'Oříznout PDF';

  @override
  String get toolCropKeywords => 'oriznout okraje kadrovat hrany velikost';

  @override
  String get toolCompare => 'Porovnat PDF';

  @override
  String get toolCompareKeywords => 'rozdil verze diff zmeny porovnat';

  @override
  String get searchHint => 'Sloučit, heslo, vodoznak…';

  @override
  String get searchClear => 'Vymazat';

  @override
  String searchNoResultTitle(String query) {
    return 'Pro „$query“ není žádný nástroj.';
  }

  @override
  String get searchNoResultBody =>
      'Zkuste formát, který máte po ruce — „Word“, „Excel“, „foto“ — nebo to, co s ním chcete udělat: „podepsat“, „rozdělit“, „heslo“.';

  @override
  String get actionUndo => 'Zpět';

  @override
  String get actionApply => 'Použít';

  @override
  String get actionChoose => 'Vybrat';

  @override
  String get actionChoosePdf => 'Vybrat PDF';

  @override
  String get actionChooseFiles => 'Vybrat soubory';

  @override
  String get actionConvert => 'Převést';

  @override
  String get actionFinish => 'Dokončit';

  @override
  String get actionBack => 'Zpět';

  @override
  String get actionAdd => 'Přidat';

  @override
  String get noFileChosen => 'Není vybrán žádný soubor';

  @override
  String errorExportFailed(String detail) {
    return 'Export se nezdařil: $detail';
  }

  @override
  String errorShareFailed(String detail) {
    return 'Sdílení se nezdařilo: $detail';
  }

  @override
  String errorOpenFailed(String detail) {
    return 'Soubor se nepodařilo otevřít: $detail';
  }

  @override
  String errorConversionFailed(String detail) {
    return 'Převod se nezdařil: $detail';
  }

  @override
  String errorOnFile(String name, String detail) {
    return '$name: $detail';
  }

  @override
  String get errorPickPdf => 'Vyberte soubor PDF.';

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
      other: '$count stránek',
      many: '$count stránky',
      few: '$count stránky',
      one: '$count stránka',
    );
    return '$_temp0';
  }

  @override
  String pageCountOfTotal(int kept, int total) {
    String _temp0 = intl.Intl.pluralLogic(
      kept,
      locale: localeName,
      other: '$kept stránek',
      many: '$kept stránky',
      few: '$kept stránky',
      one: '$kept stránka',
    );
    return '$_temp0 z $total';
  }

  @override
  String pageOfTotal(int current, int total) {
    return 'Stránka $current z $total';
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
  String get formatImages => 'Obrázky';

  @override
  String get formatText => 'Text';

  @override
  String get mergeAddFile => 'Přidat soubor';

  @override
  String get mergeAddHint => 'PDF, Word, obrázky nebo text';

  @override
  String get mergeEmptyTitle => 'Jediný dokument';

  @override
  String get mergeEmptyBody =>
      'Přidejte PDF, soubory Wordu, obrázky nebo text. Před exportem je můžete přeuspořádat a vyřadit stránky.';

  @override
  String get mergeNeedOnePage =>
      'Přidejte alespoň jeden soubor se stránkou k zahrnutí.';

  @override
  String get mergeProgress => 'Slučuje se…';

  @override
  String mergeFailed(String detail) {
    return 'Sloučení se nezdařilo: $detail';
  }

  @override
  String mergeRemoved(String name) {
    return '$name odebrán.';
  }

  @override
  String mergeRemoveTooltip(String name) {
    return 'Odebrat $name';
  }

  @override
  String mergeMoveSemantics(String name) {
    return 'Přesunout $name';
  }

  @override
  String get mergeRotateAll => 'Otočit všechny stránky';

  @override
  String mergePreviewAndExport(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count stránek',
      many: '$count stránky',
      few: '$count stránky',
      one: '$count stránka',
    );
    return 'Náhled a export ($_temp0)';
  }

  @override
  String previewTitle(String size) {
    return 'Náhled · $size';
  }

  @override
  String previewZoomPage(int number) {
    return 'Stránka $number, zvětšit';
  }

  @override
  String get previewPageUnreadable => 'Stránka je nečitelná.';

  @override
  String previewExportWhat(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count stránek',
      many: '$count stránky',
      few: '$count stránky',
      one: '$count stránka',
    );
    return 'PDF · $_temp0';
  }

  @override
  String get compressTitle => 'Zmenšení';

  @override
  String compressBody(String size) {
    return 'Současná velikost: $size. Vyberte úroveň — odhadovaná velikost se ukáže před použitím.';
  }

  @override
  String get compressEstimating => 'Odhaduje se…';

  @override
  String get compressProgress => 'Zmenšuje se…';

  @override
  String compressFailed(String detail) {
    return 'Zmenšení se nezdařilo: $detail';
  }

  @override
  String get protectEmptyTitle => 'Zamknout heslem';

  @override
  String get protectEmptyBody =>
      'PDF se už neotevře bez hesla, které zvolíte. Uschovejte si ho: obnovit ho nelze.';

  @override
  String get protectSubtitle => 'Bude zašifrováno pomocí AES 256 bitů';

  @override
  String get protectPassword => 'Heslo';

  @override
  String get protectConfirmPassword => 'Potvrdit heslo';

  @override
  String get protectShowPasswords => 'Zobrazit hesla';

  @override
  String get protectHidePasswords => 'Skrýt hesla';

  @override
  String get protectMismatch => 'Hesla se liší.';

  @override
  String get protectWarning =>
      'Poznamenejte si ho: bez něj se dokument stane natrvalo nečitelným. Obnovení není možné ani z vaší strany, ani ze strany aplikace.';

  @override
  String get protectAlreadyProtected =>
      'Tento soubor už je zabezpečený — použijte nejdřív Odemknout PDF.';

  @override
  String get protectProgress => 'Zabezpečuje se…';

  @override
  String protectFailed(String detail) {
    return 'Zabezpečení se nezdařilo: $detail';
  }

  @override
  String get protectAction => 'Zabezpečit';

  @override
  String get protectResultTitle => 'PDF zabezpečeno';

  @override
  String get protectResultDetail =>
      'Zašifrováno pomocí AES 256 bitů. K otevření bude potřeba heslo.';

  @override
  String get protectExportWhat => 'PDF chráněné heslem';

  @override
  String get unlockEmptyTitle => 'Odebrat heslo';

  @override
  String get unlockEmptyBody =>
      'Potřebujete současné heslo dokumentu. Po jeho odebrání se PDF bude otevírat volně.';

  @override
  String get unlockAcceptsProtectedPdf => 'Zabezpečené PDF';

  @override
  String get unlockChooseProtectedPdf => 'Vybrat zabezpečené PDF';

  @override
  String get unlockCurrentPassword => 'Současné heslo';

  @override
  String get unlockWrongPassword => 'Nesprávné heslo.';

  @override
  String get unlockProgress => 'Odemyká se…';

  @override
  String unlockFailed(String detail) {
    return 'Odemknutí se nezdařilo: $detail';
  }

  @override
  String get unlockAction => 'Odemknout';

  @override
  String get repairEmptyTitle => 'Opravit poškozený soubor';

  @override
  String get repairEmptyBody =>
      'Vnitřní struktura poškozeného PDF se sestaví znovu. Co se zachránit dá, zachráněno bude.';

  @override
  String get repairProgress => 'Opravuje se…';

  @override
  String get repairFailed =>
      'Tento soubor nelze opravit — je nejspíš příliš poškozený.';

  @override
  String get repairAction => 'Opravit';

  @override
  String get pdfToWordEmptyTitle => 'Upravitelný Word';

  @override
  String get pdfToWordEmptyBody =>
      'Text a struktura PDF se přenesou do dokumentu .docx, který můžete znovu otevřít a opravit.';

  @override
  String get pdfToWordAnalyzing => 'Rozbor dokumentu…';

  @override
  String get pdfToWordAnalysisPending => 'Rozbor čeká';

  @override
  String pdfToWordAnalysisFailed(String detail) {
    return 'Rozbor se nezdařil: $detail';
  }

  @override
  String get pdfLocked => 'Toto PDF je chráněné heslem. Nejdřív ho odemkněte.';

  @override
  String get pdfToWordConverting => 'Převádí se do Wordu…';

  @override
  String get pdfToWordSummaryTitle => 'Nalezený obsah';

  @override
  String pdfToWordParagraphCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count odstavců',
      many: '$count odstavce',
      few: '$count odstavce',
      one: '$count odstavec',
    );
    return '$_temp0';
  }

  @override
  String pdfToWordHeadingCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count nadpisů',
      many: '$count nadpisu',
      few: '$count nadpisy',
      one: '$count nadpis',
    );
    return '$_temp0';
  }

  @override
  String pdfToWordTableCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count tabulek',
      many: '$count tabulky',
      few: '$count tabulky',
      one: '$count tabulka',
    );
    return '$_temp0';
  }

  @override
  String get pdfToWordNoTables =>
      'Nenalezena žádná tabulka: pokud vaše PDF nějakou obsahuje, její řádky se převedou na odstavce.';

  @override
  String get pdfToWordCaveat =>
      'Převod přenáší text, formátování i tabulky, ale ne přesné rozvržení: umístění obrázků a sloupců se nezachovává a obrázky se do dokumentu Wordu nepřenášejí.';

  @override
  String get pdfToWordScanWarning =>
      'Toto PDF vypadá jako sken: nebyl nalezen žádný text. Použijte nejdřív nástroj Vyhledatelný text (OCR) a pak se vraťte a převeďte získané PDF.';

  @override
  String get pdfToWordResultTitle => 'Dokument Wordu je hotov';

  @override
  String pdfToWordResultDetail(String name, String size) {
    return '$name — $size';
  }

  @override
  String get pdfToWordExportWhat => 'Dokument Wordu';

  @override
  String get pdfToWordConvertAction => 'Převést do Wordu';

  @override
  String get actionConvertAgain => 'Převést znovu';

  @override
  String errorSaveFailed(String detail) {
    return 'Nepodařilo se uložit: $detail';
  }

  @override
  String get rectoVersoIntro =>
      'Jednostranný podavač vytvoří dva soubory: liché stránky po pořádku, sudé často obráceně. Vyberte oba, aby se dokument složil zpět.';

  @override
  String get rectoVersoOddSlot => 'Soubor s lichými stránkami (líc)';

  @override
  String get rectoVersoEvenSlot => 'Soubor se sudými stránkami (rub)';

  @override
  String get rectoVersoReversed => 'Druhý soubor je v obráceném pořadí';

  @override
  String get rectoVersoReversedHint =>
      'To je nejběžnější případ, proto je zaškrtnuto předem';

  @override
  String rectoVersoPreview(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count stránek',
      many: '$count stránky',
      few: '$count stránky',
      one: '$count stránka',
    );
    return 'Náhled prokládání ($_temp0)';
  }

  @override
  String get rectoVersoProgress => 'Prokládá se…';

  @override
  String fileWithPageCount(String name, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count stránek',
      many: '$count stránky',
      few: '$count stránky',
      one: '$count stránka',
    );
    return '$name · $_temp0';
  }

  @override
  String get actionPreviewAndExport => 'Náhled a export';

  @override
  String errorOpenFailedShort(String detail) {
    return 'Nepodařilo se otevřít: $detail';
  }

  @override
  String errorGeneric(String detail) {
    return 'Nezdařilo se: $detail';
  }

  @override
  String get actionConvertToPdf => 'Převést do PDF';

  @override
  String get convertProgress => 'Převádí se…';

  @override
  String get excelEmptyTitle => 'Sešit jako PDF';

  @override
  String get excelEmptyBody =>
      'Listy souboru .xlsx se stanou stránkami PDF, připravenými k odeslání nebo tisku.';

  @override
  String get excelChooseWorkbook => 'Vybrat sešit';

  @override
  String get excelChooseXlsx => 'Vybrat sešit .xlsx';

  @override
  String get excelLegacyFormat =>
      'Formát .xls (starý binární formát Excelu) není podporován. Uložte soubor jako .xlsx a zkuste to znovu.';

  @override
  String get excelWrongFormat => 'Vyberte sešit Excelu ve formátu .xlsx.';

  @override
  String excelUnreadable(String detail) {
    return 'Sešit je nečitelný: $detail';
  }

  @override
  String excelSheetsAndRows(int sheets, int rows) {
    String _temp0 = intl.Intl.pluralLogic(
      sheets,
      locale: localeName,
      other: '$sheets listů',
      many: '$sheets listu',
      few: '$sheets listy',
      one: '$sheets list',
    );
    String _temp1 = intl.Intl.pluralLogic(
      rows,
      locale: localeName,
      other: 'celkem $rows řádků',
      many: 'celkem $rows řádku',
      few: 'celkem $rows řádky',
      one: 'celkem $rows řádek',
    );
    return '$_temp0 · $_temp1';
  }

  @override
  String get excelSheetsDetected => 'Nalezené listy';

  @override
  String get excelEmptySheet => 'Prázdný list';

  @override
  String excelSheetDimensions(int rows, int columns) {
    String _temp0 = intl.Intl.pluralLogic(
      rows,
      locale: localeName,
      other: '$rows řádků',
      many: '$rows řádku',
      few: '$rows řádky',
      one: '$rows řádek',
    );
    String _temp1 = intl.Intl.pluralLogic(
      columns,
      locale: localeName,
      other: '$columns sloupců',
      many: '$columns sloupce',
      few: '$columns sloupce',
      one: '$columns sloupec',
    );
    return '$_temp0 × $_temp1';
  }

  @override
  String get excelRepeatHeader => 'Opakovat řádek záhlaví na každé stránce';

  @override
  String get excelRepeatHeaderHint =>
      'První řádek listu se znovu vykreslí nahoře na každé stránce tabulky.';

  @override
  String get excelCaveat =>
      'Co převod přenáší: text buněk tak, jak je uložen v souboru (včetně posledního vypočteného výsledku vzorců), první řádek tučně a mřížku.\n\nCo nepřenáší: barvy, písma, formáty čísel, sloučené buňky, obrázky, grafy a samotné vzorce. Sloupce se zúží, aby se vešly do šířky stránky; u velmi širokých listů se text příliš úzkých buněk zkrátí znakem „…“.';

  @override
  String get pptxEmptyTitle => 'Prezentace jako PDF';

  @override
  String get pptxEmptyBody =>
      'Jedna stránka na šířku v poměru 16:9 na snímek, s nadpisem a odrážkami. Text se přenáší; původní obrázky, tvary a pozadí nikoli.\n\nPodporovaný formát: .pptx. Starší soubor .ppt je nutné nejdřív uložit v PowerPointu jako .pptx.';

  @override
  String get pptxChoosePresentation => 'Vybrat prezentaci';

  @override
  String get pptxTextOnlyTitle => 'Převádí se jen text';

  @override
  String get pptxTextOnlyBody =>
      'Text každého snímku se přenáší. Původní obrázky, tvary, pozadí, barvy a rozvržení se nezachovávají: získané PDF je prosté a čitelné rozvržení, nikoli věrná kopie vaší prezentace.';

  @override
  String pptxSlideCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count snímků',
      many: '$count snímku',
      few: '$count snímky',
      one: '$count snímek',
    );
    return '$_temp0';
  }

  @override
  String get pptxSlidesDetected => 'Nalezené snímky';

  @override
  String pptxMoreSlides(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count dalších snímků',
      many: '$count dalšího snímku',
      few: '$count další snímky',
      one: '$count další snímek',
    );
    return 'a $_temp0…';
  }

  @override
  String get pptxUntitledSlide => 'Bez názvu';

  @override
  String get pptxEmptySlide => 'Bez textu (jen obrázek nebo tvar)';

  @override
  String pptxTextLineCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count řádků textu',
      many: '$count řádku textu',
      few: '$count řádky textu',
      one: '$count řádek textu',
    );
    return '$_temp0';
  }

  @override
  String pptxReadFailed(String detail) {
    return 'Nepodařilo se přečíst: $detail';
  }

  @override
  String get compressLevelLight => 'Mírné';

  @override
  String get compressLevelMedium => 'Střední';

  @override
  String get compressLevelStrong => 'Silné';

  @override
  String get pptxQualityStandard => 'Standardní (150 dpi)';

  @override
  String get pptxQualityHigh => 'Vysoká (220 dpi)';

  @override
  String get pdfToExcelEmptyTitle => 'Získat tabulky zpět';

  @override
  String get pdfToExcelEmptyBody =>
      'Tabulky z PDF se vyjmou do sešitu Excelu. Formátování se nezachová, hodnoty ano.';

  @override
  String pdfToExcelPagesAnalyzed(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'prozkoumáno $count stránek',
      many: 'prozkoumáno $count stránky',
      few: 'prozkoumány $count stránky',
      one: 'prozkoumána $count stránka',
    );
    return '$_temp0';
  }

  @override
  String pdfToExcelAnalysisFailed(String detail) {
    return 'Rozbor není možný. PDF je možná chráněné heslem nebo poškozené. ($detail)';
  }

  @override
  String get pdfToExcelNothingToExport =>
      'Není co exportovat: nenalezena žádná tabulka.';

  @override
  String get pdfToExcelBuilding => 'Vytváří se sešit…';

  @override
  String get pdfToExcelIncludeParagraphs =>
      'Zahrnout i text mimo tabulky (jeden řádek na odstavec)';

  @override
  String get pdfToExcelIncludeParagraphsHint =>
      'Užitečné u polostrukturovaného dokumentu: text se dostane do sloupce A, za tabulky dané stránky.';

  @override
  String get pdfToExcelCaveatTitle => 'Co převod nezachovává';

  @override
  String get pdfToExcelCaveat =>
      'Rozpoznávání se opírá o umístění textu na stránce: tabulky bez pravidelného orámování, sloučené buňky a velmi nepravidelné sloupce se mohou rozdělit špatně. Naskenované PDF (obrázek) neobsahuje žádný vytěžitelný text a nedá nic. Barvy, vzorce a obrázky se nepřenášejí nikdy: pouze textové hodnoty.';

  @override
  String pdfToExcelTablesFound(int tables, int pages) {
    String _temp0 = intl.Intl.pluralLogic(
      tables,
      locale: localeName,
      other: 'nalezeno $tables tabulek',
      many: 'nalezeno $tables tabulky',
      few: 'nalezeny $tables tabulky',
      one: 'nalezena $tables tabulka',
    );
    String _temp1 = intl.Intl.pluralLogic(
      pages,
      locale: localeName,
      other: '$pages stránkách',
      many: '$pages stránky',
      few: '$pages stránkách',
      one: '$pages stránce',
    );
    return '$_temp0 na $_temp1';
  }

  @override
  String pdfToExcelPagesConcerned(String pages) {
    return 'Dotčené stránky: $pages';
  }

  @override
  String pdfToExcelParagraphsOutside(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count odstavců mimo tabulky',
      many: '$count odstavce mimo tabulky',
      few: '$count odstavce mimo tabulky',
      one: '$count odstavec mimo tabulky',
    );
    return '$_temp0';
  }

  @override
  String get pdfToExcelScannedWarning =>
      'Z tohoto PDF se nepodařilo vytěžit žádný text: téměř jistě jde o naskenovaný dokument (obrázky stránek). Tabulkový editor z něj nic nezíská; použijte nejdřív nástroj pro rozpoznávání textu (OCR).';

  @override
  String get pdfToExcelNoTableWarning =>
      'V tomto dokumentu nebyla rozpoznána žádná struktura tabulky. Text tam je, ale není uspořádaný do pravidelných sloupců. Místo nečitelného sešitu raději zapněte výše „Zahrnout i text mimo tabulky“, nebo použijte „PDF do Wordu“, které odstavce zachovává lépe.';

  @override
  String get pdfToExcelResultTitle => 'Sešit je hotov';

  @override
  String get pdfToExcelExportWhat => 'Sešit Excelu';

  @override
  String get pdfToExcelConvertAction => 'Převést do Excelu';

  @override
  String resultNameAndSize(String name, String size) {
    return '$name — $size';
  }

  @override
  String get pdfToPptxEmptyTitle => 'Jeden snímek na stránku';

  @override
  String get pdfToPptxEmptyBody =>
      'PDF se změní ve zcela shodnou prezentaci PowerPointu. Každá stránka přijde jako obrázek: rozvržení je věrné, ale text nepůjde v PowerPointu upravovat.';

  @override
  String pdfToPptxOpenFailed(String detail) {
    return 'Toto PDF se nepodařilo otevřít: $detail';
  }

  @override
  String get pdfToPptxConverting => 'Převádí se do PowerPointu…';

  @override
  String pdfToPptxPagesToSlides(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count stránek',
      many: '$count stránky',
      few: '$count stránky',
      one: '$count stránka',
    );
    String _temp1 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count snímků',
      many: '$count snímku',
      few: '$count snímky',
      one: '$count snímek',
    );
    return '$_temp0 > $_temp1';
  }

  @override
  String get pdfToPptxEmptyDocument => 'Prázdný dokument';

  @override
  String get qualityLabel => 'Kvalita';

  @override
  String get pdfToPptxQualityHint =>
      'Vyšší rozlišení dá ostřejší snímky, ale výrazně těžší soubor.';

  @override
  String pdfToPptxHeavyWarning(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count stránkách',
      many: '$count stránky',
      few: '$count stránkách',
      one: '$count stránce',
    );
    return 'Pozor: ve vysoké kvalitě může prezentace o $_temp0 vážit několik desítek MB a otevírat se dlouho. Při pochybnostech zvolte Standardní.';
  }

  @override
  String get goodToKnow => 'Dobré vědět';

  @override
  String get pdfToPptxCaveat =>
      'Každý snímek je obrázek stránky: rozvržení odpovídá PDF, ale text nepůjde v PowerPointu upravovat.\nPro upravitelný text raději použijte „PDF do Wordu“.\nPrezentace má jen jednu velikost snímku: přebírá se z první stránky a stránky jiné velikosti se do ní vystředí.';

  @override
  String get pdfToPptxResultTitle => 'Prezentace je hotova';

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
      other: '$count snímků',
      many: '$count snímku',
      few: '$count snímky',
      one: '$count snímek',
    );
    return '$name — $_temp0 · $size · $quality';
  }

  @override
  String get notSavedYet =>
      'Soubor zatím není ve vašem zařízení: uložte ho nebo sdílejte.';

  @override
  String get pdfToPptxChangeQuality => 'Změnit kvalitu';

  @override
  String get pdfToPptxConvertAction => 'Převést do PowerPointu';

  @override
  String pdfToPptxExportWhat(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count snímků',
      many: '$count snímku',
      few: '$count snímky',
      one: '$count snímek',
    );
    return 'Prezentace PowerPointu · $_temp0';
  }

  @override
  String get formatLabel => 'Formát';

  @override
  String get actionExport => 'Exportovat';

  @override
  String get imageQualityWeb => 'Web (72 dpi)';

  @override
  String get imageQualityStandard => 'Standardní (150 dpi)';

  @override
  String get imageQualityHigh => 'Vysoká kvalita (300 dpi)';

  @override
  String get pdfToImagesEmptyTitle => 'Jeden obrázek na stránku';

  @override
  String get pdfToImagesEmptyBody =>
      'Vyberte PDF: každá stránka z něj vyjde jako obrázek, v rozlišení, které nastavíte potom.';

  @override
  String pdfToImagesNotAPdf(String name) {
    return '$name: vyberte soubor PDF.';
  }

  @override
  String errorLoadFailed(String detail) {
    return 'Načtení se nezdařilo: $detail';
  }

  @override
  String get pdfToImagesProgress => 'Exportuje se…';

  @override
  String pdfToImagesExportWhat(int count, String format) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count obrázků $format',
      many: '$count obrázku $format',
      few: '$count obrázky $format',
      one: '$count obrázek $format',
    );
    return '$_temp0';
  }

  @override
  String get pdfaEmptyTitle => 'Archivovat nadlouho';

  @override
  String get pdfaEmptyBody =>
      'PDF/A je archivační formát, který vyžaduje řada úřadů. Dokument se převede, aniž ztratí svůj vzhled.';

  @override
  String get pdfaConformanceLevel => 'Úroveň shody';

  @override
  String get pdfaA1bDetail =>
      'Nejpřísnější a nejšíře přijímaná úroveň. Při pochybnostech zvolte tuto.';

  @override
  String get pdfaA2bDetail =>
      'Založeno na PDF 1.7: účinnější komprese, o něco lehčí soubory.';

  @override
  String get pdfaA3bDetail =>
      'Jako A-2b, ale povoluje přílohy (často vyžadováno u elektronické fakturace).';

  @override
  String pdfaConvertingTo(String level) {
    return 'Převádí se na $level…';
  }

  @override
  String get pdfaCaveatTitle => 'Co převod mění';

  @override
  String pdfaCaveat(int dpi) {
    return 'Každá stránka se znovu vykreslí jako obrázek v rozlišení $dpi dpi: text se stane obrázkem a rozvržení se ustálí. Právě to činí soubor skutečně vyhovujícím bez závislosti na písmech původního dokumentu, ale výměnou už text nelze označit ani vyhledat, odkazy a formuláře zmizí a soubor ztěžkne.';
  }

  @override
  String pdfaOpenFailed(String detail) {
    return 'Toto PDF se nepodařilo otevřít: $detail';
  }

  @override
  String get imagesToPdfEmptyTitle => 'Obrázky v jednom PDF';

  @override
  String get imagesToPdfEmptyBody =>
      'JPG, PNG, WebP, HEIC — přidejte své obrázky a složí se v pořadí, které zvolíte.';

  @override
  String get imagesToPdfChoose => 'Vybrat obrázky';

  @override
  String get imagesToPdfAdd => 'Přidat obrázky';

  @override
  String imagesToPdfRejected(String names) {
    return 'Přeskočeno (není obrázek): $names';
  }

  @override
  String get imagesToPdfBuilding => 'Vytváří se PDF…';

  @override
  String imagesToPdfBuildFailed(String detail) {
    return 'Vytvoření se nezdařilo: $detail';
  }

  @override
  String imagesToPdfCreateAction(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count obrázků',
      many: '$count obrázku',
      few: '$count obrázky',
      one: '$count obrázek',
    );
    return 'Vytvořit PDF ($_temp0)';
  }

  @override
  String get actionRotate => 'Otočit';

  @override
  String get actionRemove => 'Odebrat';

  @override
  String get htmlTitle => 'HTML / webová stránka do PDF';

  @override
  String get htmlIntro =>
      'Proměňte webovou stránku nebo kód HTML v PDF formátu A4. Vykreslování obstará prohlížeč vestavěný v Androidu, takže rozvržení odpovídá tisku z Chromu.';

  @override
  String get htmlModeUrl => 'Webová adresa';

  @override
  String get htmlModeCode => 'Kód HTML';

  @override
  String get htmlUrlLabel => 'Adresa stránky';

  @override
  String get htmlUrlHint => 'https://priklad.cz/clanek';

  @override
  String get htmlCodeLabel => 'Kód HTML';

  @override
  String get htmlCodeHint => '<h1>Nadpis</h1>\n<p>Text…</p>';

  @override
  String get htmlUrlBadScheme => 'Adresa musí začínat http:// nebo https://.';

  @override
  String get htmlUrlIncomplete => 'Zadejte úplnou webovou adresu.';

  @override
  String get htmlCodeEmpty => 'Vložte kód HTML k převedení.';

  @override
  String get htmlLoadingUrl => 'Načítá se stránka a převádí…';

  @override
  String get htmlConverting => 'Převádí se HTML…';

  @override
  String get htmlNetworkNotice =>
      'Je potřeba připojení k internetu: je to jediný nástroj aplikace, který musí stránku stáhnout. Stránky vyžadující přihlášení, lištu se souhlasem s cookies nebo hodně JavaScriptu mohou vyjít neúplné.';

  @override
  String get htmlOfflineNotice =>
      'HTML a CSS zapsané přímo ve stránce se vykreslí bez připojení. Naopak obrázky, styly či písma načítané z vnější webové adresy připojení k internetu vyžadují.';

  @override
  String get watermarkEmptyTitle => 'Vložit vodoznak';

  @override
  String get watermarkEmptyBody =>
      'Text podle vaší volby se opakuje na pozadí všech stránek — abyste dokument označili jako důvěrný nebo jako koncept.';

  @override
  String get watermarkEmptyNote => 'Export zdarma a bez omezení počtu.';

  @override
  String get watermarkTextLabel => 'Text vodoznaku';

  @override
  String get watermarkDefaultText => 'DŮVĚRNÉ';

  @override
  String get watermarkNeedText => 'Zadejte text vodoznaku.';

  @override
  String watermarkOpacity(int percent) {
    return 'Krytí: $percent %';
  }

  @override
  String watermarkRotation(int degrees) {
    return 'Úhel otočení: $degrees°';
  }

  @override
  String watermarkFontSize(int points) {
    return 'Velikost textu: $points pt';
  }

  @override
  String get watermarkColor => 'Barva';

  @override
  String get colorGrey => 'Šedá';

  @override
  String get colorRed => 'Červená';

  @override
  String get colorBlue => 'Modrá';

  @override
  String get colorBlack => 'Černá';

  @override
  String get watermarkProgress => 'Vkládá se vodoznak…';

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
  String get pageNumbersEmptyTitle => 'Očíslovat stránky';

  @override
  String get pageNumbersEmptyBody =>
      'Vyberte PDF a pak umístění a podobu čísel, která přibudou na každou stránku.';

  @override
  String get positionLabel => 'Umístění';

  @override
  String get positionBottomCenter => 'Dole uprostřed';

  @override
  String get positionBottomRight => 'Dole vpravo';

  @override
  String get positionTopCenter => 'Nahoře uprostřed';

  @override
  String get positionTopRight => 'Nahoře vpravo';

  @override
  String get pageNumbersFormatPlain => 'N';

  @override
  String get pageNumbersFormatOfTotal => 'N / celkem';

  @override
  String get pageNumbersStart => 'Počáteční číslo';

  @override
  String get pageNumbersProgress => 'Čísluje se…';

  @override
  String get organizeEmptyTitle => 'Vzít PDF znovu do ruky';

  @override
  String get organizeEmptyBody =>
      'Otevřete dokument, abyste ho rozdělili, vyjmuli z něj stránky nebo změnili jejich pořadí.';

  @override
  String get organizeOpenFile => 'Otevřít soubor';

  @override
  String get organizeNothingToExport => 'Není co exportovat.';

  @override
  String organizePagesKept(int kept, int total) {
    String _temp0 = intl.Intl.pluralLogic(
      kept,
      locale: localeName,
      other: 'zachováno $kept stránek',
      many: 'zachováno $kept stránky',
      few: 'zachovány $kept stránky',
      one: 'zachována $kept stránka',
    );
    return '$_temp0 z $total';
  }

  @override
  String get organizePageExcluded => 'Vyřazena';

  @override
  String organizePageMoved(int from) {
    return 'Přesunuta z pozice $from';
  }

  @override
  String organizePageTitle(int number) {
    return 'Stránka $number';
  }

  @override
  String organizeExcludePage(int number) {
    return 'Vyřadit stránku $number';
  }

  @override
  String organizeIncludePage(int number) {
    return 'Zahrnout stránku $number';
  }

  @override
  String organizeMovePage(int number) {
    return 'Přesunout stránku $number';
  }

  @override
  String get organizeExtract => 'Vyjmout';

  @override
  String get organizeSplit => 'Rozdělit';

  @override
  String get organizePreview => 'Náhled';

  @override
  String get organizeExtractTitle => 'Vyjmout rozsah stránek';

  @override
  String organizeRangeLabel(int start, int end) {
    return 'Stránky $start až $end';
  }

  @override
  String get organizeSplitTitle => 'Rozdělit na několik souborů';

  @override
  String organizeFileCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count souborů',
      many: '$count souboru',
      few: '$count soubory',
      one: '$count soubor',
    );
    return '$_temp0';
  }

  @override
  String organizeSplitFailed(String detail) {
    return 'Rozdělení se nezdařilo: $detail';
  }

  @override
  String get scanNoCamera => 'V tomto zařízení není dostupný žádný fotoaparát.';

  @override
  String scanCameraFailed(String detail) {
    return 'Fotoaparát se nepodařilo spustit: $detail';
  }

  @override
  String get scanCropToolbar => 'Upravit';

  @override
  String scanCaptureFailed(String detail) {
    return 'Pořízení snímku se nezdařilo: $detail';
  }

  @override
  String get scanPermissionBody =>
      'K naskenování dokumentu je potřeba přístup k fotoaparátu.';

  @override
  String get scanGrantPermission => 'Povolit fotoaparát';

  @override
  String get actionRetry => 'Zkusit znovu';

  @override
  String get scanNoPageYet => 'Zatím žádná stránka.';

  @override
  String scanFinishAction(int count) {
    return 'Dokončit · $count';
  }

  @override
  String get signTitle => 'Podepsat PDF';

  @override
  String get signIntro =>
      'Vložte na stránku PDF svůj rukou nakreslený podpis. Je to prostě kresba přidaná k dokumentu, nikoli ověřený elektronický podpis.';

  @override
  String get signChooseSubtitle => 'Vyberte dokument k podpisu';

  @override
  String get signPickPage => 'Vyberte stránku k podpisu.';

  @override
  String get signDrawTitle => 'Nakreslit můj podpis';

  @override
  String get signDrawBody =>
      'Kreslete prstem jako na papír. Tím se na stránku vloží kresba — nejde o ověřený elektronický podpis.';

  @override
  String get signNeedDrawing => 'Než budete pokračovat, nakreslete podpis.';

  @override
  String get signClear => 'Smazat';

  @override
  String get signValidate => 'Potvrdit';

  @override
  String get signPlaceBody =>
      'Přetáhněte podpis na požadované místo na stránce a pak klepněte na Dokončit.';

  @override
  String get signPageUnavailable => 'Stránku se nepodařilo zobrazit.';

  @override
  String get signProgress => 'Přidává se podpis…';

  @override
  String get editTitle => 'Opoznámkovat dokument';

  @override
  String get editEmptyBody =>
      'Přidávejte text nebo zvýrazňujte pasáže přímo v hotovém PDF.';

  @override
  String get editAddTextTitle => 'Přidat text';

  @override
  String get editTextHint => 'Váš text';

  @override
  String editFontSize(int size) {
    return 'Velikost textu: $size';
  }

  @override
  String get editNeedAnnotation =>
      'Než skončíte, přidejte alespoň jednu poznámku.';

  @override
  String get editProgress => 'Používají se poznámky…';

  @override
  String get editChooseOther => 'Vybrat jiné PDF';

  @override
  String get editUndoTooltip => 'Vrátit poslední poznámku';

  @override
  String get editModeText => 'Text';

  @override
  String get editModeHighlight => 'Zvýraznit';

  @override
  String get editPageUnavailable => 'Tuto stránku se nepodařilo zobrazit.';

  @override
  String get ocrEmptyTitle => 'Zpřístupnit text vyhledávání';

  @override
  String get ocrEmptyBody =>
      'Text naskenovaného PDF se rozpozná a neviditelně se vloží přes obrázek. Vzhled stránky se nemění.';

  @override
  String get ocrWrongFormat => 'Vyberte PDF nebo obrázek (JPG, PNG…).';

  @override
  String get ocrProgress => 'Rozpoznává se…';

  @override
  String ocrFailed(String detail) {
    return 'Rozpoznávání se nezdařilo: $detail';
  }

  @override
  String get ocrRunAction => 'Spustit rozpoznávání';

  @override
  String get ocrResultTitle => 'Výsledek OCR';

  @override
  String ocrResultBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Prozkoumáno $count stránek',
      many: 'Prozkoumáno $count stránky',
      few: 'Prozkoumány $count stránky',
      one: 'Prozkoumána $count stránka',
    );
    return '$_temp0. Vyhledatelné PDF je hotové a celý rozpoznaný text můžete také zkopírovat.';
  }

  @override
  String get ocrCopyText => 'Zkopírovat text';

  @override
  String get ocrTextCopied => 'Text zkopírován.';

  @override
  String get redactIntro =>
      'Natrvalo skryjte části PDF (jména, adresy, částky). Na rozdíl od prostého černého obdélníku položeného navrch se skrytý text ze souboru skutečně odstraní, nejen zakryje: už ho nelze označit ani zkopírovat.';

  @override
  String get redactChooseSubtitle => 'Vyberte dokument k začernění';

  @override
  String get redactCaveat =>
      'Dobré vědět: aby se skrytý text odstranil, převede se každá stránka dokumentu zpět na obrázek (200 dpi). Výsledek proto už není PDF, v němž lze označit text, a získaný soubor bývá těžší než původní.';

  @override
  String get redactEmptyPdf => 'Toto PDF neobsahuje žádnou stránku.';

  @override
  String redactOpenFailed(String detail) {
    return 'Toto PDF se nepodařilo otevřít (možná je chráněné heslem): $detail';
  }

  @override
  String redactPageRenderFailed(int number, String detail) {
    return 'Stránku $number se nepodařilo zobrazit: $detail';
  }

  @override
  String get redactUndoTooltip => 'Vrátit poslední oblast';

  @override
  String get redactInstructions =>
      'Táhněte prstem po stránce a vyznačte oblast ke skrytí. Zakrytý text se ze souboru skutečně odstraní, nejen zakryje.';

  @override
  String get redactPagePrevious => 'Předchozí stránka';

  @override
  String get redactPageNext => 'Další stránka';

  @override
  String redactPager(int current, int total) {
    return 'Stránka $current / $total';
  }

  @override
  String get redactNoZone => 'Není vyznačena žádná oblast';

  @override
  String redactZoneCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count oblastí ke skrytí',
      many: '$count oblasti ke skrytí',
      few: '$count oblasti ke skrytí',
      one: '$count oblast ke skrytí',
    );
    return '$_temp0';
  }

  @override
  String get redactOtherPdf => 'Jiné PDF';

  @override
  String get redactAction => 'Začernit';

  @override
  String get redactProgress => 'Černí se…';

  @override
  String get cropEmptyTitle => 'Oříznout okraje';

  @override
  String get cropEmptyBody =>
      'Vyberte PDF a pak táhněte prstem po náhledu, abyste vymezili oblast, která se má zachovat.';

  @override
  String get cropTooSmall => 'Vybraná oblast je příliš malá.';

  @override
  String get cropProgress => 'Ořezává se…';

  @override
  String cropFailed(String detail) {
    return 'Oříznutí se nezdařilo: $detail';
  }

  @override
  String get cropKeptArea => 'Zachovaná oblast';

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
  String get cropFullPage => 'Celá stránka';

  @override
  String get cropAllPages => 'Použít na všechny stránky';

  @override
  String get cropAllPagesOn => 'Na každé stránce se vyřízne stejná oblast.';

  @override
  String get cropAllPagesOff =>
      'Ořízne se jen stránka 1, ostatní zůstanou celé.';

  @override
  String get cropCaveat =>
      'Oříznutí zmenší stránku: obsah mimo oblast se už nezobrazuje ani netiskne.';

  @override
  String get cropAction => 'Oříznout';

  @override
  String get compareTitle => 'Porovnat dvě PDF';

  @override
  String get compareEmptyTitle => 'Co se změnilo';

  @override
  String get compareEmptyBody =>
      'Vyberte dvě verze téhož PDF. Přidané a odebrané pasáže se postaví vedle sebe, stránku po stránce.';

  @override
  String get compareSlotA => 'Soubor A';

  @override
  String get compareSlotB => 'Soubor B';

  @override
  String get compareAction => 'Porovnat';

  @override
  String get compareProgress => 'Porovnává se…';

  @override
  String compareFailed(String detail) {
    return 'Porovnání se nezdařilo: $detail';
  }

  @override
  String compareChangedPages(int changed, int total) {
    String _temp0 = intl.Intl.pluralLogic(
      changed,
      locale: localeName,
      other: '$changed stránek se liší',
      many: '$changed stránky se liší',
      few: '$changed stránky se liší',
      one: '$changed stránka se liší',
    );
    return '$_temp0 z $total';
  }

  @override
  String get compareNoDifference =>
      'Mezi oběma soubory nebyl zjištěn žádný rozdíl.';

  @override
  String comparePageHeading(int number) {
    return 'Stránka $number';
  }

  @override
  String organizeFilesCreated(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Vytvořeno $count souborů',
      many: 'Vytvořeno $count souboru',
      few: 'Vytvořeny $count soubory',
      one: 'Vytvořen $count soubor',
    );
    return '$_temp0';
  }

  @override
  String organizePartTitle(int number) {
    return 'Část $number';
  }
}
