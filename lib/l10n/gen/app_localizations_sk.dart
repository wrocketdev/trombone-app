// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Slovak (`sk`).
class LSk extends L {
  LSk([String locale = 'sk']) : super(locale);

  @override
  String get appTitle => 'Trombone — PDF, skenovanie a Word';

  @override
  String get appWordmark => 'Trombone';

  @override
  String get actionSave => 'Uložiť';

  @override
  String get actionShare => 'Zdieľať';

  @override
  String get actionCompress => 'Zmenšiť';

  @override
  String get actionDone => 'Hotovo';

  @override
  String get actionCancel => 'Zrušiť';

  @override
  String get actionChange => 'Zmeniť';

  @override
  String get actionContinue => 'Pokračovať';

  @override
  String get actionOpening => 'Otvára sa…';

  @override
  String get actionRemoveFile => 'Odobrať tento súbor';

  @override
  String get progressPreparing => 'Pripravuje sa…';

  @override
  String progressPercent(int percent) {
    return '$percent %';
  }

  @override
  String get emptyReassurance =>
      'Export zadarmo, bez vodoznaku a bez obmedzení.';

  @override
  String get emptyAcceptedFormats => 'Podporované formáty';

  @override
  String get exportSavedTitle => 'Uložené.';

  @override
  String get exportSavedBody =>
      'Pod názvom a do priečinka, ktoré ste práve zvolili. Bez vodoznaku, bez obmedzení, niet čo odomykať.';

  @override
  String get exportSaveDialogTitle => 'Uložiť PDF';

  @override
  String pageTileIncluded(int number) {
    return 'Strana $number, zahrnutá. Ťuknutím ju vyradíte.';
  }

  @override
  String pageTileExcluded(int number) {
    return 'Strana $number, vyradená. Ťuknutím ju zahrniete.';
  }

  @override
  String pageTileRotate(int number) {
    return 'Otočiť stranu $number';
  }

  @override
  String sectionHeaderSemantics(String title, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count nástrojov',
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
      other: '$count nástrojov',
      few: '$count nástroje',
      one: '$count nástroj',
    );
    return '$_temp0';
  }

  @override
  String get homePromise =>
      'Vytvorte dokument a exportujte ho.\nŽiadne skryté poplatky na konci.';

  @override
  String get homeChipNoAccount => 'Bez účtu';

  @override
  String get homeChipNoWatermark => 'Bez vodoznaku';

  @override
  String get homeChipUnlimited => 'Export bez obmedzení';

  @override
  String get homeSearchTooltip => 'Nájsť nástroj';

  @override
  String get homeColophon =>
      'Pri ukladaní sa nič neodomyká za peniaze. Export je zadarmo, bez vodoznaku a bez obmedzenia počtu.';

  @override
  String get sectionFeatured => 'Odporúčané';

  @override
  String get sectionToPdf => 'Do PDF';

  @override
  String get sectionFromPdf => 'Z PDF';

  @override
  String get sectionSecurity => 'Zabezpečenie';

  @override
  String get sectionEdit => 'Úpravy';

  @override
  String get toolMerge => 'Zlúčiť';

  @override
  String get toolMergeKeywords => 'spojit zlucit dat dokopy pripojit zlucenie';

  @override
  String get toolMergeSubtitle =>
      'PDF, Word, obrázky a text v jednom dokumente';

  @override
  String get toolRectoVerso => 'Obojstranne';

  @override
  String get toolRectoVersoKeywords =>
      'duplex prekladat sken neparne parne dve strany';

  @override
  String get toolRectoVersoSubtitle => 'Dva skeny, zase v správnom poradí';

  @override
  String get toolImagesToPdf => 'Obrázky do PDF';

  @override
  String get toolImagesToPdfKeywords =>
      'foto jpg jpeg png fotky album fotoaparat obrazok';

  @override
  String get toolImagesToPdfSubtitle =>
      'Fotky a snímky obrazovky v jednom dokumente';

  @override
  String get toolPdfToWord => 'PDF do Wordu';

  @override
  String get toolPdfToWordKeywords =>
      'docx textovy editor upravitelny previest doc';

  @override
  String get toolPdfToWordSubtitle => 'Text aj tabuľky, upraviteľné';

  @override
  String get toolOrganize => 'Usporiadať PDF';

  @override
  String get toolOrganizeKeywords =>
      'rozdelit oddelit vybrat preusporiadat poradie strany zmazat';

  @override
  String get toolOrganizeSubtitle => 'Rozdeliť, vybrať, usporiadať';

  @override
  String get toolExcelToPdf => 'Excel do PDF';

  @override
  String get toolExcelToPdfKeywords => 'tabulka xlsx zosit harok vypocty';

  @override
  String get toolPptxToPdf => 'PowerPoint do PDF';

  @override
  String get toolPptxToPdfKeywords => 'pptx snimka prezentacia slides';

  @override
  String get toolHtmlToPdf => 'Webová stránka do PDF';

  @override
  String get toolHtmlToPdfKeywords => 'html web internet url odkaz clanok';

  @override
  String get toolScan => 'Naskenovať dokument';

  @override
  String get toolScanKeywords => 'fotoaparat foto digitalizovat skener papier';

  @override
  String get toolPdfToExcel => 'PDF do Excelu';

  @override
  String get toolPdfToExcelKeywords => 'tabulka xlsx vybrat udaje';

  @override
  String get toolPdfToPptx => 'PDF do PowerPointu';

  @override
  String get toolPdfToPptxKeywords => 'pptx snimka prezentacia slides';

  @override
  String get toolPdfToImages => 'PDF do obrázkov';

  @override
  String get toolPdfToImagesKeywords =>
      'jpg png foto exportovat snimka obrazok';

  @override
  String get toolOcr => 'Vyhľadateľný text (OCR)';

  @override
  String get toolOcrKeywords =>
      'rozpoznavanie znaky naskenovane kopirovat oznacit';

  @override
  String get toolPdfA => 'Previesť na PDF/A';

  @override
  String get toolPdfAKeywords => 'archivacia norma dlhodobe uchovanie iso';

  @override
  String get toolProtect => 'Zabezpečiť PDF';

  @override
  String get toolProtectKeywords => 'heslo zamok sifrovat uzamknut zabezpecit';

  @override
  String get toolUnlock => 'Odomknúť PDF';

  @override
  String get toolUnlockKeywords =>
      'odobrat heslo otvorit desifrovat odomknut zamok';

  @override
  String get toolRepair => 'Opraviť PDF';

  @override
  String get toolRepairKeywords =>
      'poskodeny necitatelny rozbity obnovit chyba';

  @override
  String get toolRedact => 'Začierniť v PDF';

  @override
  String get toolRedactKeywords =>
      'skryt zacernit anonymizovat doverne zmazat cenzura';

  @override
  String get toolEdit => 'Upraviť PDF';

  @override
  String get toolEditKeywords => 'text zmenit opravit poznamka pisat';

  @override
  String get toolSign => 'Podpísať';

  @override
  String get toolSignKeywords => 'podpis parafa zmluva ruka';

  @override
  String get toolWatermark => 'Vodoznak';

  @override
  String get toolWatermarkKeywords =>
      'watermark peciatka doverne koncept znacka';

  @override
  String get toolPageNumbers => 'Čísla strán';

  @override
  String get toolPageNumbersKeywords =>
      'strankovanie cislovanie ocislovat cislice';

  @override
  String get toolCrop => 'Orezať PDF';

  @override
  String get toolCropKeywords => 'orezat okraje kadrovat hrany velkost';

  @override
  String get toolCompare => 'Porovnať PDF';

  @override
  String get toolCompareKeywords => 'rozdiel verzie diff zmeny porovnat';

  @override
  String get searchHint => 'Zlúčiť, heslo, vodoznak…';

  @override
  String get searchClear => 'Vymazať';

  @override
  String searchNoResultTitle(String query) {
    return 'Pre „$query“ nie je žiadny nástroj.';
  }

  @override
  String get searchNoResultBody =>
      'Skúste formát, ktorý máte poruke — „Word“, „Excel“, „foto“ — alebo to, čo s ním chcete urobiť: „podpísať“, „rozdeliť“, „heslo“.';

  @override
  String get actionUndo => 'Späť';

  @override
  String get actionApply => 'Použiť';

  @override
  String get actionChoose => 'Vybrať';

  @override
  String get actionChoosePdf => 'Vybrať PDF';

  @override
  String get actionChooseFiles => 'Vybrať súbory';

  @override
  String get actionConvert => 'Previesť';

  @override
  String get actionFinish => 'Dokončiť';

  @override
  String get actionBack => 'Späť';

  @override
  String get actionAdd => 'Pridať';

  @override
  String get noFileChosen => 'Nie je vybraný žiadny súbor';

  @override
  String errorExportFailed(String detail) {
    return 'Export sa nepodaril: $detail';
  }

  @override
  String errorShareFailed(String detail) {
    return 'Zdieľanie sa nepodarilo: $detail';
  }

  @override
  String errorOpenFailed(String detail) {
    return 'Súbor sa nepodarilo otvoriť: $detail';
  }

  @override
  String errorConversionFailed(String detail) {
    return 'Prevod sa nepodaril: $detail';
  }

  @override
  String errorOnFile(String name, String detail) {
    return '$name: $detail';
  }

  @override
  String get errorPickPdf => 'Vyberte súbor PDF.';

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
      other: '$count strán',
      few: '$count strany',
      one: '$count strana',
    );
    return '$_temp0';
  }

  @override
  String pageCountOfTotal(int kept, int total) {
    String _temp0 = intl.Intl.pluralLogic(
      kept,
      locale: localeName,
      other: '$kept strán',
      few: '$kept strany',
      one: '$kept strana',
    );
    return '$_temp0 z $total';
  }

  @override
  String pageOfTotal(int current, int total) {
    return 'Strana $current z $total';
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
  String get mergeAddFile => 'Pridať súbor';

  @override
  String get mergeAddHint => 'PDF, Word, obrázky alebo text';

  @override
  String get mergeEmptyTitle => 'Jediný dokument';

  @override
  String get mergeEmptyBody =>
      'Pridajte PDF, súbory Wordu, obrázky alebo text. Pred exportom ich môžete usporiadať a vyradiť strany.';

  @override
  String get mergeNeedOnePage =>
      'Pridajte aspoň jeden súbor so stranou na zahrnutie.';

  @override
  String get mergeProgress => 'Zlučuje sa…';

  @override
  String mergeFailed(String detail) {
    return 'Zlúčenie sa nepodarilo: $detail';
  }

  @override
  String mergeRemoved(String name) {
    return '$name odobratý.';
  }

  @override
  String mergeRemoveTooltip(String name) {
    return 'Odobrať $name';
  }

  @override
  String mergeMoveSemantics(String name) {
    return 'Presunúť $name';
  }

  @override
  String get mergeRotateAll => 'Otočiť všetky strany';

  @override
  String mergePreviewAndExport(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count strán',
      few: '$count strany',
      one: '$count strana',
    );
    return 'Náhľad a export ($_temp0)';
  }

  @override
  String previewTitle(String size) {
    return 'Náhľad · $size';
  }

  @override
  String previewZoomPage(int number) {
    return 'Strana $number, zväčšiť';
  }

  @override
  String get previewPageUnreadable => 'Strana je nečitateľná.';

  @override
  String previewExportWhat(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count strán',
      few: '$count strany',
      one: '$count strana',
    );
    return 'PDF · $_temp0';
  }

  @override
  String get compressTitle => 'Zmenšenie';

  @override
  String compressBody(String size) {
    return 'Súčasná veľkosť: $size. Vyberte úroveň — odhadovaná veľkosť sa ukáže pred použitím.';
  }

  @override
  String get compressEstimating => 'Odhaduje sa…';

  @override
  String get compressProgress => 'Zmenšuje sa…';

  @override
  String compressFailed(String detail) {
    return 'Zmenšenie sa nepodarilo: $detail';
  }

  @override
  String get protectEmptyTitle => 'Zamknúť heslom';

  @override
  String get protectEmptyBody =>
      'PDF sa už neotvorí bez hesla, ktoré zvolíte. Uschovajte si ho: obnoviť sa nedá.';

  @override
  String get protectSubtitle => 'Bude zašifrované pomocou AES 256 bitov';

  @override
  String get protectPassword => 'Heslo';

  @override
  String get protectConfirmPassword => 'Potvrdiť heslo';

  @override
  String get protectShowPasswords => 'Zobraziť heslá';

  @override
  String get protectHidePasswords => 'Skryť heslá';

  @override
  String get protectMismatch => 'Heslá sa líšia.';

  @override
  String get protectWarning =>
      'Poznačte si ho: bez neho sa dokument stane natrvalo nečitateľným. Obnovenie nie je možné ani z vašej strany, ani zo strany aplikácie.';

  @override
  String get protectAlreadyProtected =>
      'Tento súbor je už zabezpečený — použite najprv Odomknúť PDF.';

  @override
  String get protectProgress => 'Zabezpečuje sa…';

  @override
  String protectFailed(String detail) {
    return 'Zabezpečenie sa nepodarilo: $detail';
  }

  @override
  String get protectAction => 'Zabezpečiť';

  @override
  String get protectResultTitle => 'PDF zabezpečené';

  @override
  String get protectResultDetail =>
      'Zašifrované pomocou AES 256 bitov. Na otvorenie bude potrebné heslo.';

  @override
  String get protectExportWhat => 'PDF chránené heslom';

  @override
  String get unlockEmptyTitle => 'Odobrať heslo';

  @override
  String get unlockEmptyBody =>
      'Potrebujete súčasné heslo dokumentu. Po jeho odobratí sa PDF bude otvárať voľne.';

  @override
  String get unlockAcceptsProtectedPdf => 'Zabezpečené PDF';

  @override
  String get unlockChooseProtectedPdf => 'Vybrať zabezpečené PDF';

  @override
  String get unlockCurrentPassword => 'Súčasné heslo';

  @override
  String get unlockWrongPassword => 'Nesprávne heslo.';

  @override
  String get unlockProgress => 'Odomyká sa…';

  @override
  String unlockFailed(String detail) {
    return 'Odomknutie sa nepodarilo: $detail';
  }

  @override
  String get unlockAction => 'Odomknúť';

  @override
  String get repairEmptyTitle => 'Opraviť poškodený súbor';

  @override
  String get repairEmptyBody =>
      'Vnútorná štruktúra poškodeného PDF sa poskladá nanovo. Čo sa zachrániť dá, zachránené bude.';

  @override
  String get repairProgress => 'Opravuje sa…';

  @override
  String get repairFailed =>
      'Tento súbor sa nedá opraviť — je zrejme príliš poškodený.';

  @override
  String get repairAction => 'Opraviť';

  @override
  String get pdfToWordEmptyTitle => 'Upraviteľný Word';

  @override
  String get pdfToWordEmptyBody =>
      'Text a štruktúra PDF sa prenesú do dokumentu .docx, ktorý môžete znova otvoriť a opraviť.';

  @override
  String get pdfToWordAnalyzing => 'Rozbor dokumentu…';

  @override
  String get pdfToWordAnalysisPending => 'Rozbor čaká';

  @override
  String pdfToWordAnalysisFailed(String detail) {
    return 'Rozbor sa nepodaril: $detail';
  }

  @override
  String get pdfLocked => 'Toto PDF je chránené heslom. Najprv ho odomknite.';

  @override
  String get pdfToWordConverting => 'Prevádza sa do Wordu…';

  @override
  String get pdfToWordSummaryTitle => 'Nájdený obsah';

  @override
  String pdfToWordParagraphCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count odsekov',
      few: '$count odseky',
      one: '$count odsek',
    );
    return '$_temp0';
  }

  @override
  String pdfToWordHeadingCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count nadpisov',
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
      other: '$count tabuliek',
      few: '$count tabuľky',
      one: '$count tabuľka',
    );
    return '$_temp0';
  }

  @override
  String get pdfToWordNoTables =>
      'Nenašla sa žiadna tabuľka: ak vaše PDF nejakú obsahuje, jej riadky sa prevedú na odseky.';

  @override
  String get pdfToWordCaveat =>
      'Prevod prenáša text, formátovanie aj tabuľky, ale nie presné rozloženie: umiestnenie obrázkov a stĺpcov sa nezachováva a obrázky sa do dokumentu Wordu neprenášajú.';

  @override
  String get pdfToWordScanWarning =>
      'Toto PDF vyzerá ako sken: nenašiel sa žiadny text. Použite najprv nástroj Vyhľadateľný text (OCR) a potom sa vráťte a preveďte získané PDF.';

  @override
  String get pdfToWordResultTitle => 'Dokument Wordu je hotový';

  @override
  String pdfToWordResultDetail(String name, String size) {
    return '$name — $size';
  }

  @override
  String get pdfToWordExportWhat => 'Dokument Wordu';

  @override
  String get pdfToWordConvertAction => 'Previesť do Wordu';

  @override
  String get actionConvertAgain => 'Previesť znova';

  @override
  String errorSaveFailed(String detail) {
    return 'Nepodarilo sa uložiť: $detail';
  }

  @override
  String get rectoVersoIntro =>
      'Jednostranný podávač vytvorí dva súbory: nepárne strany po poriadku, párne často naopak. Vyberte oba, aby sa dokument poskladal späť.';

  @override
  String get rectoVersoOddSlot => 'Súbor s nepárnymi stranami (líce)';

  @override
  String get rectoVersoEvenSlot => 'Súbor s párnymi stranami (rub)';

  @override
  String get rectoVersoReversed => 'Druhý súbor je v obrátenom poradí';

  @override
  String get rectoVersoReversedHint =>
      'To je najbežnejší prípad, preto je zaškrtnuté vopred';

  @override
  String rectoVersoPreview(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count strán',
      few: '$count strany',
      one: '$count strana',
    );
    return 'Náhľad prekladania ($_temp0)';
  }

  @override
  String get rectoVersoProgress => 'Prekladá sa…';

  @override
  String fileWithPageCount(String name, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count strán',
      few: '$count strany',
      one: '$count strana',
    );
    return '$name · $_temp0';
  }

  @override
  String get actionPreviewAndExport => 'Náhľad a export';

  @override
  String errorOpenFailedShort(String detail) {
    return 'Nepodarilo sa otvoriť: $detail';
  }

  @override
  String errorGeneric(String detail) {
    return 'Nepodarilo sa: $detail';
  }

  @override
  String get actionConvertToPdf => 'Previesť do PDF';

  @override
  String get convertProgress => 'Prevádza sa…';

  @override
  String get excelEmptyTitle => 'Zošit ako PDF';

  @override
  String get excelEmptyBody =>
      'Hárky súboru .xlsx sa stanú stranami PDF, pripravenými na odoslanie alebo tlač.';

  @override
  String get excelChooseWorkbook => 'Vybrať zošit';

  @override
  String get excelChooseXlsx => 'Vybrať zošit .xlsx';

  @override
  String get excelLegacyFormat =>
      'Formát .xls (starý binárny formát Excelu) nie je podporovaný. Uložte súbor ako .xlsx a skúste to znova.';

  @override
  String get excelWrongFormat => 'Vyberte zošit Excelu vo formáte .xlsx.';

  @override
  String excelUnreadable(String detail) {
    return 'Zošit je nečitateľný: $detail';
  }

  @override
  String excelSheetsAndRows(int sheets, int rows) {
    String _temp0 = intl.Intl.pluralLogic(
      sheets,
      locale: localeName,
      other: '$sheets hárkov',
      few: '$sheets hárky',
      one: '$sheets hárok',
    );
    String _temp1 = intl.Intl.pluralLogic(
      rows,
      locale: localeName,
      other: 'spolu $rows riadkov',
      few: 'spolu $rows riadky',
      one: 'spolu $rows riadok',
    );
    return '$_temp0 · $_temp1';
  }

  @override
  String get excelSheetsDetected => 'Nájdené hárky';

  @override
  String get excelEmptySheet => 'Prázdny hárok';

  @override
  String excelSheetDimensions(int rows, int columns) {
    String _temp0 = intl.Intl.pluralLogic(
      rows,
      locale: localeName,
      other: '$rows riadkov',
      few: '$rows riadky',
      one: '$rows riadok',
    );
    String _temp1 = intl.Intl.pluralLogic(
      columns,
      locale: localeName,
      other: '$columns stĺpcov',
      few: '$columns stĺpce',
      one: '$columns stĺpec',
    );
    return '$_temp0 × $_temp1';
  }

  @override
  String get excelRepeatHeader => 'Opakovať riadok hlavičky na každej strane';

  @override
  String get excelRepeatHeaderHint =>
      'Prvý riadok hárka sa znova vykreslí hore na každej strane tabuľky.';

  @override
  String get excelCaveat =>
      'Čo prevod prenáša: text buniek tak, ako je uložený v súbore (vrátane posledného vypočítaného výsledku vzorcov), prvý riadok tučne a mriežku.\n\nČo neprenáša: farby, písma, formáty čísel, zlúčené bunky, obrázky, grafy a samotné vzorce. Stĺpce sa zúžia, aby sa zmestili do šírky strany; pri veľmi širokých hárkoch sa text príliš úzkych buniek skráti znakom „…“.';

  @override
  String get pptxEmptyTitle => 'Prezentácia ako PDF';

  @override
  String get pptxEmptyBody =>
      'Jedna strana na šírku v pomere 16:9 na snímku, s nadpisom a odrážkami. Text sa prenáša; pôvodné obrázky, tvary a pozadia nie.\n\nPodporovaný formát: .pptx. Starší súbor .ppt treba najprv uložiť v PowerPointe ako .pptx.';

  @override
  String get pptxChoosePresentation => 'Vybrať prezentáciu';

  @override
  String get pptxTextOnlyTitle => 'Prevádza sa len text';

  @override
  String get pptxTextOnlyBody =>
      'Text každej snímky sa prenáša. Pôvodné obrázky, tvary, pozadia, farby a rozloženia sa nezachovávajú: získané PDF je jednoduché a čitateľné rozloženie, nie verná kópia vašej prezentácie.';

  @override
  String pptxSlideCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count snímok',
      few: '$count snímky',
      one: '$count snímka',
    );
    return '$_temp0';
  }

  @override
  String get pptxSlidesDetected => 'Nájdené snímky';

  @override
  String pptxMoreSlides(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ďalších snímok',
      few: '$count ďalšie snímky',
      one: '$count ďalšia snímka',
    );
    return 'a $_temp0…';
  }

  @override
  String get pptxUntitledSlide => 'Bez názvu';

  @override
  String get pptxEmptySlide => 'Bez textu (len obrázok alebo tvar)';

  @override
  String pptxTextLineCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count riadkov textu',
      few: '$count riadky textu',
      one: '$count riadok textu',
    );
    return '$_temp0';
  }

  @override
  String pptxReadFailed(String detail) {
    return 'Nepodarilo sa prečítať: $detail';
  }

  @override
  String get compressLevelLight => 'Mierne';

  @override
  String get compressLevelMedium => 'Stredné';

  @override
  String get compressLevelStrong => 'Silné';

  @override
  String get pptxQualityStandard => 'Štandardná (150 dpi)';

  @override
  String get pptxQualityHigh => 'Vysoká (220 dpi)';

  @override
  String get pdfToExcelEmptyTitle => 'Získať tabuľky späť';

  @override
  String get pdfToExcelEmptyBody =>
      'Tabuľky z PDF sa vyberú do zošita Excelu. Formátovanie sa nezachová, hodnoty áno.';

  @override
  String pdfToExcelPagesAnalyzed(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'preskúmaných $count strán',
      few: 'preskúmané $count strany',
      one: 'preskúmaná $count strana',
    );
    return '$_temp0';
  }

  @override
  String pdfToExcelAnalysisFailed(String detail) {
    return 'Rozbor nie je možný. PDF je možno chránené heslom alebo poškodené. ($detail)';
  }

  @override
  String get pdfToExcelNothingToExport =>
      'Nie je čo exportovať: nenašla sa žiadna tabuľka.';

  @override
  String get pdfToExcelBuilding => 'Vytvára sa zošit…';

  @override
  String get pdfToExcelIncludeParagraphs =>
      'Zahrnúť aj text mimo tabuliek (jeden riadok na odsek)';

  @override
  String get pdfToExcelIncludeParagraphsHint =>
      'Užitočné pri pološtruktúrovanom dokumente: text sa dostane do stĺpca A, za tabuľky danej strany.';

  @override
  String get pdfToExcelCaveatTitle => 'Čo prevod nezachováva';

  @override
  String get pdfToExcelCaveat =>
      'Rozpoznávanie sa opiera o umiestnenie textu na strane: tabuľky bez pravidelného orámovania, zlúčené bunky a veľmi nepravidelné stĺpce sa môžu rozdeliť zle. Naskenované PDF (obrázok) neobsahuje žiadny získateľný text a nedá nič. Farby, vzorce a obrázky sa neprenášajú nikdy: iba textové hodnoty.';

  @override
  String pdfToExcelTablesFound(int tables, int pages) {
    String _temp0 = intl.Intl.pluralLogic(
      tables,
      locale: localeName,
      other: 'nájdených $tables tabuliek',
      few: 'nájdené $tables tabuľky',
      one: 'nájdená $tables tabuľka',
    );
    String _temp1 = intl.Intl.pluralLogic(
      pages,
      locale: localeName,
      other: '$pages stranách',
      few: '$pages stranách',
      one: '$pages strane',
    );
    return '$_temp0 na $_temp1';
  }

  @override
  String pdfToExcelPagesConcerned(String pages) {
    return 'Dotknuté strany: $pages';
  }

  @override
  String pdfToExcelParagraphsOutside(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count odsekov mimo tabuliek',
      few: '$count odseky mimo tabuliek',
      one: '$count odsek mimo tabuliek',
    );
    return '$_temp0';
  }

  @override
  String get pdfToExcelScannedWarning =>
      'Z tohto PDF sa nepodarilo získať žiadny text: takmer isto ide o naskenovaný dokument (obrázky strán). Tabuľkový editor z neho nič nezíska; použite najprv nástroj na rozpoznávanie textu (OCR).';

  @override
  String get pdfToExcelNoTableWarning =>
      'V tomto dokumente sa nerozpoznala žiadna štruktúra tabuľky. Text tam je, ale nie je usporiadaný do pravidelných stĺpcov. Namiesto nečitateľného zošita radšej zapnite vyššie „Zahrnúť aj text mimo tabuliek“, alebo použite „PDF do Wordu“, ktoré odseky zachováva lepšie.';

  @override
  String get pdfToExcelResultTitle => 'Zošit je hotový';

  @override
  String get pdfToExcelExportWhat => 'Zošit Excelu';

  @override
  String get pdfToExcelConvertAction => 'Previesť do Excelu';

  @override
  String resultNameAndSize(String name, String size) {
    return '$name — $size';
  }

  @override
  String get pdfToPptxEmptyTitle => 'Jedna snímka na stranu';

  @override
  String get pdfToPptxEmptyBody =>
      'PDF sa zmení na úplne rovnakú prezentáciu PowerPointu. Každá strana príde ako obrázok: rozloženie je verné, ale text sa v PowerPointe nebude dať upravovať.';

  @override
  String pdfToPptxOpenFailed(String detail) {
    return 'Toto PDF sa nepodarilo otvoriť: $detail';
  }

  @override
  String get pdfToPptxConverting => 'Prevádza sa do PowerPointu…';

  @override
  String pdfToPptxPagesToSlides(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count strán',
      few: '$count strany',
      one: '$count strana',
    );
    String _temp1 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count snímok',
      few: '$count snímky',
      one: '$count snímka',
    );
    return '$_temp0 > $_temp1';
  }

  @override
  String get pdfToPptxEmptyDocument => 'Prázdny dokument';

  @override
  String get qualityLabel => 'Kvalita';

  @override
  String get pdfToPptxQualityHint =>
      'Vyššie rozlíšenie dá ostrejšie snímky, ale výrazne ťažší súbor.';

  @override
  String pdfToPptxHeavyWarning(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count stranami',
      few: '$count stranami',
      one: '$count stranou',
    );
    return 'Pozor: vo vysokej kvalite môže prezentácia s $_temp0 vážiť niekoľko desiatok MB a otvárať sa dlho. Pri pochybnostiach zvoľte Štandardnú.';
  }

  @override
  String get goodToKnow => 'Dobré vedieť';

  @override
  String get pdfToPptxCaveat =>
      'Každá snímka je obrázok strany: rozloženie zodpovedá PDF, ale text sa v PowerPointe nebude dať upravovať.\nNa upraviteľný text radšej použite „PDF do Wordu“.\nPrezentácia má len jednu veľkosť snímky: preberá sa z prvej strany a strany inej veľkosti sa do nej vycentrujú.';

  @override
  String get pdfToPptxResultTitle => 'Prezentácia je hotová';

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
      other: '$count snímok',
      few: '$count snímky',
      one: '$count snímka',
    );
    return '$name — $_temp0 · $size · $quality';
  }

  @override
  String get notSavedYet =>
      'Súbor zatiaľ nie je vo vašom zariadení: uložte ho alebo zdieľajte.';

  @override
  String get pdfToPptxChangeQuality => 'Zmeniť kvalitu';

  @override
  String get pdfToPptxConvertAction => 'Previesť do PowerPointu';

  @override
  String pdfToPptxExportWhat(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count snímok',
      few: '$count snímky',
      one: '$count snímka',
    );
    return 'Prezentácia PowerPointu · $_temp0';
  }

  @override
  String get formatLabel => 'Formát';

  @override
  String get actionExport => 'Exportovať';

  @override
  String get imageQualityWeb => 'Web (72 dpi)';

  @override
  String get imageQualityStandard => 'Štandardná (150 dpi)';

  @override
  String get imageQualityHigh => 'Vysoká kvalita (300 dpi)';

  @override
  String get pdfToImagesEmptyTitle => 'Jeden obrázok na stranu';

  @override
  String get pdfToImagesEmptyBody =>
      'Vyberte PDF: každá strana z neho vyjde ako obrázok, v rozlíšení, ktoré nastavíte potom.';

  @override
  String pdfToImagesNotAPdf(String name) {
    return '$name: vyberte súbor PDF.';
  }

  @override
  String errorLoadFailed(String detail) {
    return 'Načítanie sa nepodarilo: $detail';
  }

  @override
  String get pdfToImagesProgress => 'Exportuje sa…';

  @override
  String pdfToImagesExportWhat(int count, String format) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count obrázkov $format',
      few: '$count obrázky $format',
      one: '$count obrázok $format',
    );
    return '$_temp0';
  }

  @override
  String get pdfaEmptyTitle => 'Archivovať nadlho';

  @override
  String get pdfaEmptyBody =>
      'PDF/A je archivačný formát, ktorý vyžaduje množstvo úradov. Dokument sa prevedie bez toho, aby stratil svoj vzhľad.';

  @override
  String get pdfaConformanceLevel => 'Úroveň zhody';

  @override
  String get pdfaA1bDetail =>
      'Najprísnejšia a najširšie prijímaná úroveň. Pri pochybnostiach zvoľte túto.';

  @override
  String get pdfaA2bDetail =>
      'Založené na PDF 1.7: účinnejšia kompresia, o čosi ľahšie súbory.';

  @override
  String get pdfaA3bDetail =>
      'Ako A-2b, ale povoľuje prílohy (často vyžadované pri elektronickej fakturácii).';

  @override
  String pdfaConvertingTo(String level) {
    return 'Prevádza sa na $level…';
  }

  @override
  String get pdfaCaveatTitle => 'Čo prevod mení';

  @override
  String pdfaCaveat(int dpi) {
    return 'Každá strana sa znova vykreslí ako obrázok v rozlíšení $dpi dpi: text sa stane obrázkom a rozloženie sa ustáli. Práve to robí súbor skutočne vyhovujúcim bez závislosti na písmach pôvodného dokumentu, ale výmenou sa text už nedá označiť ani vyhľadať, odkazy a formuláre zmiznú a súbor oťažie.';
  }

  @override
  String pdfaOpenFailed(String detail) {
    return 'Toto PDF sa nepodarilo otvoriť: $detail';
  }

  @override
  String get imagesToPdfEmptyTitle => 'Obrázky v jednom PDF';

  @override
  String get imagesToPdfEmptyBody =>
      'JPG, PNG, WebP, HEIC — pridajte svoje obrázky a poskladajú sa v poradí, ktoré zvolíte.';

  @override
  String get imagesToPdfChoose => 'Vybrať obrázky';

  @override
  String get imagesToPdfAdd => 'Pridať obrázky';

  @override
  String imagesToPdfRejected(String names) {
    return 'Preskočené (nie je obrázok): $names';
  }

  @override
  String get imagesToPdfBuilding => 'Vytvára sa PDF…';

  @override
  String imagesToPdfBuildFailed(String detail) {
    return 'Vytvorenie sa nepodarilo: $detail';
  }

  @override
  String imagesToPdfCreateAction(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count obrázkov',
      few: '$count obrázky',
      one: '$count obrázok',
    );
    return 'Vytvoriť PDF ($_temp0)';
  }

  @override
  String get actionRotate => 'Otočiť';

  @override
  String get actionRemove => 'Odobrať';

  @override
  String get htmlTitle => 'HTML / webová stránka do PDF';

  @override
  String get htmlIntro =>
      'Premeňte webovú stránku alebo kód HTML na PDF vo formáte A4. Vykresľovanie zabezpečí prehliadač zabudovaný v Androide, takže rozloženie zodpovedá tlači z Chromu.';

  @override
  String get htmlModeUrl => 'Webová adresa';

  @override
  String get htmlModeCode => 'Kód HTML';

  @override
  String get htmlUrlLabel => 'Adresa stránky';

  @override
  String get htmlUrlHint => 'https://priklad.sk/clanok';

  @override
  String get htmlCodeLabel => 'Kód HTML';

  @override
  String get htmlCodeHint => '<h1>Nadpis</h1>\n<p>Text…</p>';

  @override
  String get htmlUrlBadScheme => 'Adresa musí začínať http:// alebo https://.';

  @override
  String get htmlUrlIncomplete => 'Zadajte úplnú webovú adresu.';

  @override
  String get htmlCodeEmpty => 'Vložte kód HTML na prevedenie.';

  @override
  String get htmlLoadingUrl => 'Načítava sa stránka a prevádza…';

  @override
  String get htmlConverting => 'Prevádza sa HTML…';

  @override
  String get htmlNetworkNotice =>
      'Je potrebné pripojenie na internet: je to jediný nástroj aplikácie, ktorý musí stránku stiahnuť. Stránky vyžadujúce prihlásenie, lištu so súhlasom s cookies alebo veľa JavaScriptu môžu vyjsť neúplné.';

  @override
  String get htmlOfflineNotice =>
      'HTML a CSS zapísané priamo v stránke sa vykreslia bez pripojenia. Naopak obrázky, štýly či písma načítavané z vonkajšej webovej adresy pripojenie na internet vyžadujú.';

  @override
  String get watermarkEmptyTitle => 'Vložiť vodoznak';

  @override
  String get watermarkEmptyBody =>
      'Text podľa vášho výberu sa opakuje na pozadí všetkých strán — aby ste dokument označili ako dôverný alebo ako koncept.';

  @override
  String get watermarkEmptyNote => 'Export zadarmo a bez obmedzenia počtu.';

  @override
  String get watermarkTextLabel => 'Text vodoznaku';

  @override
  String get watermarkDefaultText => 'DÔVERNÉ';

  @override
  String get watermarkNeedText => 'Zadajte text vodoznaku.';

  @override
  String watermarkOpacity(int percent) {
    return 'Krytie: $percent %';
  }

  @override
  String watermarkRotation(int degrees) {
    return 'Uhol otočenia: $degrees°';
  }

  @override
  String watermarkFontSize(int points) {
    return 'Veľkosť textu: $points pt';
  }

  @override
  String get watermarkColor => 'Farba';

  @override
  String get colorGrey => 'Sivá';

  @override
  String get colorRed => 'Červená';

  @override
  String get colorBlue => 'Modrá';

  @override
  String get colorBlack => 'Čierna';

  @override
  String get watermarkProgress => 'Vkladá sa vodoznak…';

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
  String get pageNumbersEmptyTitle => 'Očíslovať strany';

  @override
  String get pageNumbersEmptyBody =>
      'Vyberte PDF a potom umiestnenie a podobu čísel, ktoré pribudnú na každú stranu.';

  @override
  String get positionLabel => 'Umiestnenie';

  @override
  String get positionBottomCenter => 'Dole v strede';

  @override
  String get positionBottomRight => 'Dole vpravo';

  @override
  String get positionTopCenter => 'Hore v strede';

  @override
  String get positionTopRight => 'Hore vpravo';

  @override
  String get pageNumbersFormatPlain => 'N';

  @override
  String get pageNumbersFormatOfTotal => 'N / spolu';

  @override
  String get pageNumbersStart => 'Počiatočné číslo';

  @override
  String get pageNumbersProgress => 'Čísluje sa…';

  @override
  String get organizeEmptyTitle => 'Vziať PDF znova do ruky';

  @override
  String get organizeEmptyBody =>
      'Otvorte dokument, aby ste ho rozdelili, vybrali z neho strany alebo zmenili ich poradie.';

  @override
  String get organizeOpenFile => 'Otvoriť súbor';

  @override
  String get organizeNothingToExport => 'Nie je čo exportovať.';

  @override
  String organizePagesKept(int kept, int total) {
    String _temp0 = intl.Intl.pluralLogic(
      kept,
      locale: localeName,
      other: 'zachovaných $kept strán',
      few: 'zachované $kept strany',
      one: 'zachovaná $kept strana',
    );
    return '$_temp0 z $total';
  }

  @override
  String get organizePageExcluded => 'Vyradená';

  @override
  String organizePageMoved(int from) {
    return 'Presunutá z pozície $from';
  }

  @override
  String organizePageTitle(int number) {
    return 'Strana $number';
  }

  @override
  String organizeExcludePage(int number) {
    return 'Vyradiť stranu $number';
  }

  @override
  String organizeIncludePage(int number) {
    return 'Zahrnúť stranu $number';
  }

  @override
  String organizeMovePage(int number) {
    return 'Presunúť stranu $number';
  }

  @override
  String get organizeExtract => 'Vybrať';

  @override
  String get organizeSplit => 'Rozdeliť';

  @override
  String get organizePreview => 'Náhľad';

  @override
  String get organizeExtractTitle => 'Vybrať rozsah strán';

  @override
  String organizeRangeLabel(int start, int end) {
    return 'Strany $start až $end';
  }

  @override
  String get organizeSplitTitle => 'Rozdeliť na niekoľko súborov';

  @override
  String organizeFileCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count súborov',
      few: '$count súbory',
      one: '$count súbor',
    );
    return '$_temp0';
  }

  @override
  String organizeSplitFailed(String detail) {
    return 'Rozdelenie sa nepodarilo: $detail';
  }

  @override
  String get scanNoCamera =>
      'V tomto zariadení nie je dostupný žiadny fotoaparát.';

  @override
  String scanCameraFailed(String detail) {
    return 'Fotoaparát sa nepodarilo spustiť: $detail';
  }

  @override
  String get scanCropToolbar => 'Upraviť';

  @override
  String scanCaptureFailed(String detail) {
    return 'Zhotovenie snímky sa nepodarilo: $detail';
  }

  @override
  String get scanPermissionBody =>
      'Na naskenovanie dokumentu je potrebný prístup k fotoaparátu.';

  @override
  String get scanGrantPermission => 'Povoliť fotoaparát';

  @override
  String get actionRetry => 'Skúsiť znova';

  @override
  String get scanNoPageYet => 'Zatiaľ žiadna strana.';

  @override
  String scanFinishAction(int count) {
    return 'Dokončiť · $count';
  }

  @override
  String get signTitle => 'Podpísať PDF';

  @override
  String get signIntro =>
      'Vložte na stranu PDF svoj rukou nakreslený podpis. Je to jednoducho kresba pridaná k dokumentu, nie overený elektronický podpis.';

  @override
  String get signChooseSubtitle => 'Vyberte dokument na podpis';

  @override
  String get signPickPage => 'Vyberte stranu na podpis.';

  @override
  String get signDrawTitle => 'Nakresliť môj podpis';

  @override
  String get signDrawBody =>
      'Kreslite prstom ako na papier. Tým sa na stranu vloží kresba — nejde o overený elektronický podpis.';

  @override
  String get signNeedDrawing =>
      'Skôr než budete pokračovať, nakreslite podpis.';

  @override
  String get signClear => 'Zmazať';

  @override
  String get signValidate => 'Potvrdiť';

  @override
  String get signPlaceBody =>
      'Potiahnite podpis na požadované miesto na strane a potom ťuknite na Dokončiť.';

  @override
  String get signPageUnavailable => 'Stranu sa nepodarilo zobraziť.';

  @override
  String get signProgress => 'Pridáva sa podpis…';

  @override
  String get editTitle => 'Opoznámkovať dokument';

  @override
  String get editEmptyBody =>
      'Pridávajte text alebo zvýrazňujte pasáže priamo v hotovom PDF.';

  @override
  String get editAddTextTitle => 'Pridať text';

  @override
  String get editTextHint => 'Váš text';

  @override
  String editFontSize(int size) {
    return 'Veľkosť textu: $size';
  }

  @override
  String get editNeedAnnotation =>
      'Skôr než skončíte, pridajte aspoň jednu poznámku.';

  @override
  String get editProgress => 'Používajú sa poznámky…';

  @override
  String get editChooseOther => 'Vybrať iné PDF';

  @override
  String get editUndoTooltip => 'Vrátiť poslednú poznámku';

  @override
  String get editModeText => 'Text';

  @override
  String get editModeHighlight => 'Zvýrazniť';

  @override
  String get editPageUnavailable => 'Túto stranu sa nepodarilo zobraziť.';

  @override
  String get ocrEmptyTitle => 'Sprístupniť text vyhľadávaniu';

  @override
  String get ocrEmptyBody =>
      'Text naskenovaného PDF sa rozpozná a neviditeľne sa vloží cez obrázok. Vzhľad strany sa nemení.';

  @override
  String get ocrWrongFormat => 'Vyberte PDF alebo obrázok (JPG, PNG…).';

  @override
  String get ocrProgress => 'Rozpoznáva sa…';

  @override
  String ocrFailed(String detail) {
    return 'Rozpoznávanie sa nepodarilo: $detail';
  }

  @override
  String get ocrRunAction => 'Spustiť rozpoznávanie';

  @override
  String get ocrResultTitle => 'Výsledok OCR';

  @override
  String ocrResultBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Preskúmaných $count strán',
      few: 'Preskúmané $count strany',
      one: 'Preskúmaná $count strana',
    );
    return '$_temp0. Vyhľadateľné PDF je hotové a celý rozpoznaný text môžete aj skopírovať.';
  }

  @override
  String get ocrCopyText => 'Skopírovať text';

  @override
  String get ocrTextCopied => 'Text skopírovaný.';

  @override
  String get redactIntro =>
      'Natrvalo skryte časti PDF (mená, adresy, sumy). Na rozdiel od obyčajného čierneho obdĺžnika položeného navrch sa skrytý text zo súboru naozaj odstráni, nielen zakryje: už sa nedá označiť ani skopírovať.';

  @override
  String get redactChooseSubtitle => 'Vyberte dokument na začiernenie';

  @override
  String get redactCaveat =>
      'Dobré vedieť: aby sa skrytý text odstránil, prevedie sa každá strana dokumentu späť na obrázok (200 dpi). Výsledok preto už nie je PDF, v ktorom sa dá označiť text, a získaný súbor býva ťažší než pôvodný.';

  @override
  String get redactEmptyPdf => 'Toto PDF neobsahuje žiadnu stranu.';

  @override
  String redactOpenFailed(String detail) {
    return 'Toto PDF sa nepodarilo otvoriť (možno je chránené heslom): $detail';
  }

  @override
  String redactPageRenderFailed(int number, String detail) {
    return 'Stranu $number sa nepodarilo zobraziť: $detail';
  }

  @override
  String get redactUndoTooltip => 'Vrátiť poslednú oblasť';

  @override
  String get redactInstructions =>
      'Ťahajte prstom po strane a vyznačte oblasť na skrytie. Zakrytý text sa zo súboru naozaj odstráni, nielen zakryje.';

  @override
  String get redactPagePrevious => 'Predchádzajúca strana';

  @override
  String get redactPageNext => 'Ďalšia strana';

  @override
  String redactPager(int current, int total) {
    return 'Strana $current / $total';
  }

  @override
  String get redactNoZone => 'Nie je vyznačená žiadna oblasť';

  @override
  String redactZoneCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count oblastí na skrytie',
      few: '$count oblasti na skrytie',
      one: '$count oblasť na skrytie',
    );
    return '$_temp0';
  }

  @override
  String get redactOtherPdf => 'Iné PDF';

  @override
  String get redactAction => 'Začierniť';

  @override
  String get redactProgress => 'Čierni sa…';

  @override
  String get cropEmptyTitle => 'Orezať okraje';

  @override
  String get cropEmptyBody =>
      'Vyberte PDF a potom ťahajte prstom po náhľade, aby ste vymedzili oblasť, ktorá sa má zachovať.';

  @override
  String get cropTooSmall => 'Vybraná oblasť je príliš malá.';

  @override
  String get cropProgress => 'Orezáva sa…';

  @override
  String cropFailed(String detail) {
    return 'Orezanie sa nepodarilo: $detail';
  }

  @override
  String get cropKeptArea => 'Zachovaná oblasť';

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
  String get cropFullPage => 'Celá strana';

  @override
  String get cropAllPages => 'Použiť na všetky strany';

  @override
  String get cropAllPagesOn => 'Na každej strane sa vyreže rovnaká oblasť.';

  @override
  String get cropAllPagesOff => 'Oreže sa len strana 1, ostatné zostanú celé.';

  @override
  String get cropCaveat =>
      'Orezanie zmenší stranu: obsah mimo oblasti sa už nezobrazuje ani netlačí.';

  @override
  String get cropAction => 'Orezať';

  @override
  String get compareTitle => 'Porovnať dve PDF';

  @override
  String get compareEmptyTitle => 'Čo sa zmenilo';

  @override
  String get compareEmptyBody =>
      'Vyberte dve verzie toho istého PDF. Pridané a odobrané pasáže sa postavia vedľa seba, stranu po strane.';

  @override
  String get compareSlotA => 'Súbor A';

  @override
  String get compareSlotB => 'Súbor B';

  @override
  String get compareAction => 'Porovnať';

  @override
  String get compareProgress => 'Porovnáva sa…';

  @override
  String compareFailed(String detail) {
    return 'Porovnanie sa nepodarilo: $detail';
  }

  @override
  String compareChangedPages(int changed, int total) {
    String _temp0 = intl.Intl.pluralLogic(
      changed,
      locale: localeName,
      other: '$changed strán sa líši',
      few: '$changed strany sa líšia',
      one: '$changed strana sa líši',
    );
    return '$_temp0 z $total';
  }

  @override
  String get compareNoDifference =>
      'Medzi oboma súbormi sa nezistil žiadny rozdiel.';

  @override
  String comparePageHeading(int number) {
    return 'Strana $number';
  }

  @override
  String organizeFilesCreated(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Vytvorených $count súborov',
      few: 'Vytvorené $count súbory',
      one: 'Vytvorený $count súbor',
    );
    return '$_temp0';
  }

  @override
  String organizePartTitle(int number) {
    return 'Časť $number';
  }
}
