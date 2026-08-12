// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hungarian (`hu`).
class LHu extends L {
  LHu([String locale = 'hu']) : super(locale);

  @override
  String get appTitle => 'Trombone — PDF, szkennelés és Word';

  @override
  String get appWordmark => 'Trombone';

  @override
  String get actionSave => 'Mentés';

  @override
  String get actionShare => 'Megosztás';

  @override
  String get actionCompress => 'Tömörítés';

  @override
  String get actionDone => 'Kész';

  @override
  String get actionCancel => 'Mégse';

  @override
  String get actionChange => 'Csere';

  @override
  String get actionContinue => 'Tovább';

  @override
  String get actionOpening => 'Megnyitás…';

  @override
  String get actionRemoveFile => 'Fájl eltávolítása';

  @override
  String get progressPreparing => 'Előkészítés…';

  @override
  String progressPercent(int percent) {
    return '$percent%';
  }

  @override
  String get emptyReassurance =>
      'Az exportálás ingyenes, vízjel és korlát nélkül.';

  @override
  String get emptyAcceptedFormats => 'Elfogadott formátumok';

  @override
  String get exportSavedTitle => 'Elmentve.';

  @override
  String get exportSavedBody =>
      'Azon a néven és abba a mappába, amit az imént választott. Vízjel nélkül, korlát nélkül, nincs mit feloldani.';

  @override
  String get exportSaveDialogTitle => 'PDF mentése';

  @override
  String pageTileIncluded(int number) {
    return '$number. oldal, benne van. Koppintson a kihagyásához.';
  }

  @override
  String pageTileExcluded(int number) {
    return '$number. oldal, kihagyva. Koppintson a hozzávételéhez.';
  }

  @override
  String pageTileRotate(int number) {
    return '$number. oldal forgatása';
  }

  @override
  String sectionHeaderSemantics(String title, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count eszköz',
      one: '$count eszköz',
    );
    return '$title, $_temp0';
  }

  @override
  String toolCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count eszköz',
      one: '$count eszköz',
    );
    return '$_temp0';
  }

  @override
  String get homePromise =>
      'Állítsa össze a dokumentumot, és exportálja.\nA végén nincs fal.';

  @override
  String get homeChipNoAccount => 'Fiók nélkül';

  @override
  String get homeChipNoWatermark => 'Vízjel nélkül';

  @override
  String get homeChipUnlimited => 'Korlátlan exportálás';

  @override
  String get homeSearchTooltip => 'Eszköz keresése';

  @override
  String get homeColophon =>
      'Mentéskor semmi nem oldódik fel fizetés ellenében. Az exportálás ingyenes, vízjel nélküli, és a darabszám sincs korlátozva.';

  @override
  String get sectionFeatured => 'Kiemelt';

  @override
  String get sectionToPdf => 'PDF-be';

  @override
  String get sectionFromPdf => 'PDF-ből';

  @override
  String get sectionSecurity => 'Biztonság';

  @override
  String get sectionEdit => 'Szerkesztés';

  @override
  String get toolMerge => 'Egyesítés';

  @override
  String get toolMergeKeywords =>
      'osszefuzes egyesites osszevonas hozzafuzes egybe';

  @override
  String get toolMergeSubtitle =>
      'PDF, Word, képek és szöveg egyetlen dokumentumban';

  @override
  String get toolRectoVerso => 'Kétoldalas';

  @override
  String get toolRectoVersoKeywords =>
      'duplex osszefesules szkennelés paros paratlan ket oldal';

  @override
  String get toolRectoVersoSubtitle => 'Két beolvasás, újra jó sorrendben';

  @override
  String get toolImagesToPdf => 'Képekből PDF';

  @override
  String get toolImagesToPdfKeywords =>
      'fotó jpg jpeg png kepek album kamera kep';

  @override
  String get toolImagesToPdfSubtitle =>
      'Fényképek és képernyőképek egy dokumentumban';

  @override
  String get toolPdfToWord => 'PDF-ből Word';

  @override
  String get toolPdfToWordKeywords =>
      'docx szovegszerkeszto szerkesztheto atalakitas doc';

  @override
  String get toolPdfToWordSubtitle => 'Szöveg és táblázatok, szerkeszthetően';

  @override
  String get toolOrganize => 'PDF rendezése';

  @override
  String get toolOrganizeKeywords =>
      'szetvagas szetvalasztas kiemeles atrendezes sorrend oldalak torles';

  @override
  String get toolOrganizeSubtitle => 'Szétvágás, kiemelés, átrendezés';

  @override
  String get toolExcelToPdf => 'Excelből PDF';

  @override
  String get toolExcelToPdfKeywords =>
      'tablazat xlsx munkafuzet munkalap szamolas';

  @override
  String get toolPptxToPdf => 'PowerPointból PDF';

  @override
  String get toolPptxToPdfKeywords => 'pptx dia bemutato slides';

  @override
  String get toolHtmlToPdf => 'Weboldalból PDF';

  @override
  String get toolHtmlToPdfKeywords =>
      'html webhely internet url hivatkozas cikk';

  @override
  String get toolScan => 'Dokumentum beolvasása';

  @override
  String get toolScanKeywords => 'kamera fotó digitalizalas szkenner papir';

  @override
  String get toolPdfToExcel => 'PDF-ből Excel';

  @override
  String get toolPdfToExcelKeywords => 'tablazat xlsx kiemeles adatok';

  @override
  String get toolPdfToPptx => 'PDF-ből PowerPoint';

  @override
  String get toolPdfToPptxKeywords => 'pptx dia bemutato slides';

  @override
  String get toolPdfToImages => 'PDF-ből képek';

  @override
  String get toolPdfToImagesKeywords =>
      'jpg png fotó exportalas kepernyokep kep';

  @override
  String get toolOcr => 'Kereshető szöveg (OCR)';

  @override
  String get toolOcrKeywords =>
      'felismeres karakterek beolvasott masolas kijeloles';

  @override
  String get toolPdfA => 'Átalakítás PDF/A-ba';

  @override
  String get toolPdfAKeywords => 'archivalas szabvany hosszu tavu megorzes iso';

  @override
  String get toolProtect => 'PDF védelme';

  @override
  String get toolProtectKeywords => 'jelszo lakat titkositas zarolas vedelem';

  @override
  String get toolUnlock => 'PDF feloldása';

  @override
  String get toolUnlockKeywords =>
      'jelszo eltavolitasa megnyitas visszafejtes lakat';

  @override
  String get toolRepair => 'PDF javítása';

  @override
  String get toolRepairKeywords =>
      'serult olvashatatlan hibas helyreallitas hiba';

  @override
  String get toolRedact => 'PDF kitakarása';

  @override
  String get toolRedactKeywords =>
      'elrejtes kifekitese anonimizalas bizalmas torles cenzura';

  @override
  String get toolEdit => 'PDF szerkesztése';

  @override
  String get toolEditKeywords => 'szoveg modositas javitas jegyzet iras';

  @override
  String get toolSign => 'Aláírás';

  @override
  String get toolSignKeywords => 'alairas kezjegy szerzodes kez';

  @override
  String get toolWatermark => 'Vízjel';

  @override
  String get toolWatermarkKeywords =>
      'watermark belyegzo bizalmas piszkozat jelzes';

  @override
  String get toolPageNumbers => 'Oldalszámok';

  @override
  String get toolPageNumbersKeywords =>
      'oldalszamozas szamozas oldalszam szamjegyek';

  @override
  String get toolCrop => 'PDF levágása';

  @override
  String get toolCropKeywords => 'vagas margok korbevagas szelek meret';

  @override
  String get toolCompare => 'PDF-ek összehasonlítása';

  @override
  String get toolCompareKeywords =>
      'kulonbseg valtozatok diff modositasok osszehasonlitas';

  @override
  String get searchHint => 'Egyesítés, jelszó, vízjel…';

  @override
  String get searchClear => 'Törlés';

  @override
  String searchNoResultTitle(String query) {
    return 'Nincs eszköz erre: „$query”.';
  }

  @override
  String get searchNoResultBody =>
      'Próbálja a kéznél lévő formátummal — „Word”, „Excel”, „fotó” —, vagy azzal, amit tenni szeretne vele: „aláírás”, „szétvágás”, „jelszó”.';

  @override
  String get actionUndo => 'Visszavonás';

  @override
  String get actionApply => 'Alkalmaz';

  @override
  String get actionChoose => 'Kiválasztás';

  @override
  String get actionChoosePdf => 'PDF kiválasztása';

  @override
  String get actionChooseFiles => 'Fájlok kiválasztása';

  @override
  String get actionConvert => 'Átalakítás';

  @override
  String get actionFinish => 'Befejezés';

  @override
  String get actionBack => 'Vissza';

  @override
  String get actionAdd => 'Hozzáadás';

  @override
  String get noFileChosen => 'Nincs kiválasztott fájl';

  @override
  String errorExportFailed(String detail) {
    return 'Az exportálás nem sikerült: $detail';
  }

  @override
  String errorShareFailed(String detail) {
    return 'A megosztás nem sikerült: $detail';
  }

  @override
  String errorOpenFailed(String detail) {
    return 'A fájlt nem sikerült megnyitni: $detail';
  }

  @override
  String errorConversionFailed(String detail) {
    return 'Az átalakítás nem sikerült: $detail';
  }

  @override
  String errorOnFile(String name, String detail) {
    return '$name: $detail';
  }

  @override
  String get errorPickPdf => 'Válasszon egy PDF-fájlt.';

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
      other: '$count oldal',
      one: '$count oldal',
    );
    return '$_temp0';
  }

  @override
  String pageCountOfTotal(int kept, int total) {
    String _temp0 = intl.Intl.pluralLogic(
      kept,
      locale: localeName,
      other: '$kept oldal',
      one: '$kept oldal',
    );
    return '$total oldalból $_temp0';
  }

  @override
  String pageOfTotal(int current, int total) {
    return '$total oldalból a(z) $current.';
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
  String get formatImages => 'Képek';

  @override
  String get formatText => 'Szöveg';

  @override
  String get mergeAddFile => 'Fájl hozzáadása';

  @override
  String get mergeAddHint => 'PDF, Word, képek vagy szöveg';

  @override
  String get mergeEmptyTitle => 'Egyetlen dokumentum';

  @override
  String get mergeEmptyBody =>
      'Adjon hozzá PDF-eket, Word-fájlokat, képeket vagy szöveget. Exportálás előtt átrendezheti őket, és oldalakat is kihagyhat.';

  @override
  String get mergeNeedOnePage =>
      'Adjon hozzá legalább egy fájlt, amelyben van beveendő oldal.';

  @override
  String get mergeProgress => 'Egyesítés folyamatban…';

  @override
  String mergeFailed(String detail) {
    return 'Az egyesítés nem sikerült: $detail';
  }

  @override
  String mergeRemoved(String name) {
    return '$name eltávolítva.';
  }

  @override
  String mergeRemoveTooltip(String name) {
    return '$name eltávolítása';
  }

  @override
  String mergeMoveSemantics(String name) {
    return '$name áthelyezése';
  }

  @override
  String get mergeRotateAll => 'Minden oldal forgatása';

  @override
  String mergePreviewAndExport(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count oldal',
      one: '$count oldal',
    );
    return 'Előnézet és exportálás ($_temp0)';
  }

  @override
  String previewTitle(String size) {
    return 'Előnézet · $size';
  }

  @override
  String previewZoomPage(int number) {
    return '$number. oldal nagyítása';
  }

  @override
  String get previewPageUnreadable => 'Az oldal olvashatatlan.';

  @override
  String previewExportWhat(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count oldal',
      one: '$count oldal',
    );
    return 'PDF · $_temp0';
  }

  @override
  String get compressTitle => 'Tömörítés';

  @override
  String compressBody(String size) {
    return 'Jelenlegi méret: $size. Válasszon szintet — a becsült méret az alkalmazás előtt megjelenik.';
  }

  @override
  String get compressEstimating => 'Becslés…';

  @override
  String get compressProgress => 'Tömörítés folyamatban…';

  @override
  String compressFailed(String detail) {
    return 'A tömörítés nem sikerült: $detail';
  }

  @override
  String get protectEmptyTitle => 'Jelszó beállítása';

  @override
  String get protectEmptyBody =>
      'A PDF a választott jelszó nélkül többé nem nyílik meg. Őrizze meg: nem állítható vissza.';

  @override
  String get protectSubtitle => 'AES 256 bites titkosítást kap';

  @override
  String get protectPassword => 'Jelszó';

  @override
  String get protectConfirmPassword => 'Jelszó megerősítése';

  @override
  String get protectShowPasswords => 'Jelszavak megjelenítése';

  @override
  String get protectHidePasswords => 'Jelszavak elrejtése';

  @override
  String get protectMismatch => 'A két jelszó eltér.';

  @override
  String get protectWarning =>
      'Jegyezze fel valahová: nélküle a dokumentum végleg olvashatatlanná válik. Sem Ön, sem az alkalmazás nem tudja visszaállítani.';

  @override
  String get protectAlreadyProtected =>
      'Ez a fájl már védett — használja előbb a PDF feloldása eszközt.';

  @override
  String get protectProgress => 'Védelem folyamatban…';

  @override
  String protectFailed(String detail) {
    return 'A védelem nem sikerült: $detail';
  }

  @override
  String get protectAction => 'Védelem';

  @override
  String get protectResultTitle => 'A PDF védett';

  @override
  String get protectResultDetail =>
      'AES 256 bites titkosítással. A megnyitáshoz jelszó kell majd.';

  @override
  String get protectExportWhat => 'Jelszóval védett PDF';

  @override
  String get unlockEmptyTitle => 'Jelszó eltávolítása';

  @override
  String get unlockEmptyBody =>
      'Szüksége lesz a dokumentum jelenlegi jelszavára. Eltávolítás után a PDF szabadon megnyílik.';

  @override
  String get unlockAcceptsProtectedPdf => 'Védett PDF';

  @override
  String get unlockChooseProtectedPdf => 'Védett PDF kiválasztása';

  @override
  String get unlockCurrentPassword => 'Jelenlegi jelszó';

  @override
  String get unlockWrongPassword => 'Hibás jelszó.';

  @override
  String get unlockProgress => 'Feloldás folyamatban…';

  @override
  String unlockFailed(String detail) {
    return 'A feloldás nem sikerült: $detail';
  }

  @override
  String get unlockAction => 'Feloldás';

  @override
  String get repairEmptyTitle => 'Sérült fájl javítása';

  @override
  String get repairEmptyBody =>
      'A sérült PDF belső szerkezetét újraépítjük. Ami menthető, azt megmentjük.';

  @override
  String get repairProgress => 'Javítás folyamatban…';

  @override
  String get repairFailed =>
      'Ez a fájl nem javítható — talán túlságosan sérült.';

  @override
  String get repairAction => 'Javítás';

  @override
  String get pdfToWordEmptyTitle => 'Szerkeszthető Word';

  @override
  String get pdfToWordEmptyBody =>
      'A PDF szövege és szerkezete átkerül egy .docx dokumentumba, amelyet újra megnyithat és javíthat.';

  @override
  String get pdfToWordAnalyzing => 'A dokumentum elemzése…';

  @override
  String get pdfToWordAnalysisPending => 'Elemzés folyamatban';

  @override
  String pdfToWordAnalysisFailed(String detail) {
    return 'Az elemzés nem sikerült: $detail';
  }

  @override
  String get pdfLocked => 'Ez a PDF jelszóval védett. Oldja fel előbb.';

  @override
  String get pdfToWordConverting => 'Átalakítás Wordbe…';

  @override
  String get pdfToWordSummaryTitle => 'Talált tartalom';

  @override
  String pdfToWordParagraphCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count bekezdés',
      one: '$count bekezdés',
    );
    return '$_temp0';
  }

  @override
  String pdfToWordHeadingCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count címsor',
      one: '$count címsor',
    );
    return '$_temp0';
  }

  @override
  String pdfToWordTableCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count táblázat',
      one: '$count táblázat',
    );
    return '$_temp0';
  }

  @override
  String get pdfToWordNoTables =>
      'Nem találtunk táblázatot: ha a PDF-ben mégis van, annak sorai bekezdésekké alakulnak.';

  @override
  String get pdfToWordCaveat =>
      'Az átalakítás a szöveget, a formázást és a táblázatokat viszi át, a pontos elrendezést nem: a képek és hasábok helye nem marad meg, a képek pedig nem kerülnek át a Word-dokumentumba.';

  @override
  String get pdfToWordScanWarning =>
      'Ez a PDF beolvasásnak tűnik: nem találtunk benne szöveget. Használja előbb a Kereshető szöveg (OCR) eszközt, majd térjen vissza, és alakítsa át a kapott PDF-et.';

  @override
  String get pdfToWordResultTitle => 'A Word-dokumentum kész';

  @override
  String pdfToWordResultDetail(String name, String size) {
    return '$name — $size';
  }

  @override
  String get pdfToWordExportWhat => 'Word-dokumentum';

  @override
  String get pdfToWordConvertAction => 'Átalakítás Wordbe';

  @override
  String get actionConvertAgain => 'Átalakítás újra';

  @override
  String errorSaveFailed(String detail) {
    return 'A mentés nem sikerült: $detail';
  }

  @override
  String get rectoVersoIntro =>
      'Az egyoldalas lapadagoló két fájlt ad: a páratlan oldalakat sorban, a párosakat gyakran fordítva. Válassza ki mindkettőt, hogy a dokumentum újra összeálljon.';

  @override
  String get rectoVersoOddSlot => 'A páratlan oldalak fájlja (előlap)';

  @override
  String get rectoVersoEvenSlot => 'A páros oldalak fájlja (hátlap)';

  @override
  String get rectoVersoReversed => 'A második fájl fordított sorrendű';

  @override
  String get rectoVersoReversedHint =>
      'Ez a leggyakoribb eset, ezért van alapból bejelölve';

  @override
  String rectoVersoPreview(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count oldal',
      one: '$count oldal',
    );
    return 'Az összefésülés előnézete ($_temp0)';
  }

  @override
  String get rectoVersoProgress => 'Összefésülés folyamatban…';

  @override
  String fileWithPageCount(String name, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count oldal',
      one: '$count oldal',
    );
    return '$name · $_temp0';
  }

  @override
  String get actionPreviewAndExport => 'Előnézet és exportálás';

  @override
  String errorOpenFailedShort(String detail) {
    return 'Nem sikerült megnyitni: $detail';
  }

  @override
  String errorGeneric(String detail) {
    return 'Nem sikerült: $detail';
  }

  @override
  String get actionConvertToPdf => 'Átalakítás PDF-be';

  @override
  String get convertProgress => 'Átalakítás folyamatban…';

  @override
  String get excelEmptyTitle => 'Munkafüzet PDF-ként';

  @override
  String get excelEmptyBody =>
      'Egy .xlsx fájl munkalapjaiból PDF-oldalak lesznek, küldésre vagy nyomtatásra készen.';

  @override
  String get excelChooseWorkbook => 'Munkafüzet kiválasztása';

  @override
  String get excelChooseXlsx => '.xlsx munkafüzet kiválasztása';

  @override
  String get excelLegacyFormat =>
      'Az .xls formátum (az Excel régi bináris formátuma) nem támogatott. Mentse a fájlt .xlsx néven, és próbálja újra.';

  @override
  String get excelWrongFormat =>
      'Válasszon .xlsx formátumú Excel-munkafüzetet.';

  @override
  String excelUnreadable(String detail) {
    return 'A munkafüzet olvashatatlan: $detail';
  }

  @override
  String excelSheetsAndRows(int sheets, int rows) {
    String _temp0 = intl.Intl.pluralLogic(
      sheets,
      locale: localeName,
      other: '$sheets munkalap',
      one: '$sheets munkalap',
    );
    String _temp1 = intl.Intl.pluralLogic(
      rows,
      locale: localeName,
      other: '$rows sor',
      one: '$rows sor',
    );
    return '$_temp0 · összesen $_temp1';
  }

  @override
  String get excelSheetsDetected => 'Talált munkalapok';

  @override
  String get excelEmptySheet => 'Üres munkalap';

  @override
  String excelSheetDimensions(int rows, int columns) {
    String _temp0 = intl.Intl.pluralLogic(
      rows,
      locale: localeName,
      other: '$rows sor',
      one: '$rows sor',
    );
    String _temp1 = intl.Intl.pluralLogic(
      columns,
      locale: localeName,
      other: '$columns oszlop',
      one: '$columns oszlop',
    );
    return '$_temp0 × $_temp1';
  }

  @override
  String get excelRepeatHeader => 'Fejlécsor ismétlése minden oldalon';

  @override
  String get excelRepeatHeaderHint =>
      'A munkalap első sora a táblázat minden oldalának tetején újra kirajzolódik.';

  @override
  String get excelCaveat =>
      'Amit az átalakítás átvisz: a cellák szövegét úgy, ahogy a fájlban szerepel (a képletek utolsó kiszámított eredményével együtt), az első sort félkövéren, és egy rácsot.\n\nAmit nem: színek, betűtípusok, számformátumok, egyesített cellák, képek, diagramok és maguk a képletek. Az oszlopok szűkülnek, hogy elférjenek az oldal szélességében; nagyon széles munkalapokon a túl keskeny cellák szövege „…” jellel csonkolódik.';

  @override
  String get pptxEmptyTitle => 'Bemutató PDF-ként';

  @override
  String get pptxEmptyBody =>
      'Diánként egy fekvő, 16:9 arányú oldal, a címmel és a felsorolásokkal. A szöveg átkerül; az eredeti képek, alakzatok és hátterek nem.\n\nElfogadott formátum: .pptx. A régebbi .ppt fájlt előbb .pptx néven kell menteni a PowerPointból.';

  @override
  String get pptxChoosePresentation => 'Bemutató kiválasztása';

  @override
  String get pptxTextOnlyTitle => 'Csak a szöveg alakul át';

  @override
  String get pptxTextOnlyBody =>
      'Minden dia szövege átkerül. Az eredeti képek, alakzatok, hátterek, színek és elrendezések nem maradnak meg: a kapott PDF egyszerű, jól olvasható elrendezés, nem a bemutató hű másolata.';

  @override
  String pptxSlideCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count dia',
      one: '$count dia',
    );
    return '$_temp0';
  }

  @override
  String get pptxSlidesDetected => 'Talált diák';

  @override
  String pptxMoreSlides(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count dia',
      one: '$count dia',
    );
    return 'és további $_temp0…';
  }

  @override
  String get pptxUntitledSlide => 'Cím nélkül';

  @override
  String get pptxEmptySlide => 'Nincs szöveg (csak kép vagy alakzat)';

  @override
  String pptxTextLineCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count sor szöveg',
      one: '$count sor szöveg',
    );
    return '$_temp0';
  }

  @override
  String pptxReadFailed(String detail) {
    return 'Nem sikerült beolvasni: $detail';
  }

  @override
  String get compressLevelLight => 'Enyhe';

  @override
  String get compressLevelMedium => 'Közepes';

  @override
  String get compressLevelStrong => 'Erős';

  @override
  String get pptxQualityStandard => 'Normál (150 dpi)';

  @override
  String get pptxQualityHigh => 'Magas (220 dpi)';

  @override
  String get pdfToExcelEmptyTitle => 'A táblázatok visszaszerzése';

  @override
  String get pdfToExcelEmptyBody =>
      'A PDF táblázatai Excel-munkafüzetbe kerülnek. A formázás nem marad meg, az értékek igen.';

  @override
  String pdfToExcelPagesAnalyzed(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count oldal elemezve',
      one: '$count oldal elemezve',
    );
    return '$_temp0';
  }

  @override
  String pdfToExcelAnalysisFailed(String detail) {
    return 'Az elemzés nem lehetséges. A PDF talán jelszóval védett vagy sérült. ($detail)';
  }

  @override
  String get pdfToExcelNothingToExport =>
      'Nincs mit exportálni: nem találtunk táblázatot.';

  @override
  String get pdfToExcelBuilding => 'A munkafüzet készítése…';

  @override
  String get pdfToExcelIncludeParagraphs =>
      'A táblázatokon kívüli szöveg is kerüljön bele (bekezdésenként egy sor)';

  @override
  String get pdfToExcelIncludeParagraphsHint =>
      'Félig strukturált dokumentumnál hasznos: a szöveg az A oszlopba kerül, az oldal táblázatai után.';

  @override
  String get pdfToExcelCaveatTitle => 'Amit az átalakítás nem őriz meg';

  @override
  String get pdfToExcelCaveat =>
      'A felismerés a szöveg oldalon elfoglalt helyére támaszkodik: a szabályos szegély nélküli táblázatok, az egyesített cellák és a nagyon szabálytalan oszlopok rosszul tagolódhatnak. A beolvasott PDF (kép) nem tartalmaz kinyerhető szöveget, így semmit nem ad. A színek, képletek és képek soha nem kerülnek át: csak a szöveges értékek.';

  @override
  String pdfToExcelTablesFound(int tables, int pages) {
    String _temp0 = intl.Intl.pluralLogic(
      pages,
      locale: localeName,
      other: '$pages oldalon',
      one: '$pages oldalon',
    );
    String _temp1 = intl.Intl.pluralLogic(
      tables,
      locale: localeName,
      other: '$tables táblázat',
      one: '$tables táblázat',
    );
    return '$_temp0 $_temp1 található';
  }

  @override
  String pdfToExcelPagesConcerned(String pages) {
    return 'Érintett oldalak: $pages';
  }

  @override
  String pdfToExcelParagraphsOutside(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count bekezdés a táblázatokon kívül',
      one: '$count bekezdés a táblázatokon kívül',
    );
    return '$_temp0';
  }

  @override
  String get pdfToExcelScannedWarning =>
      'Ebből a PDF-ből nem sikerült szöveget kinyerni: szinte biztosan beolvasott dokumentum (oldalak képei). Egy táblázatkezelő nem tud vele mit kezdeni; használja előbb a szövegfelismerő (OCR) eszközt.';

  @override
  String get pdfToExcelNoTableWarning =>
      'Ebben a dokumentumban nem ismertünk fel táblázatszerkezetet. A szöveg megvan, de nem szabályos oszlopokba rendeződik. Olvashatatlan munkafüzet helyett kapcsolja be fent „A táblázatokon kívüli szöveg is kerüljön bele” lehetőséget, vagy használja a „PDF-ből Word” eszközt, amely jobban megőrzi a bekezdéseket.';

  @override
  String get pdfToExcelResultTitle => 'A munkafüzet kész';

  @override
  String get pdfToExcelExportWhat => 'Excel-munkafüzet';

  @override
  String get pdfToExcelConvertAction => 'Átalakítás Excelbe';

  @override
  String resultNameAndSize(String name, String size) {
    return '$name — $size';
  }

  @override
  String get pdfToPptxEmptyTitle => 'Oldalanként egy dia';

  @override
  String get pdfToPptxEmptyBody =>
      'A PDF-ből teljesen ugyanolyan PowerPoint-bemutató lesz. Minden oldal képként kerül be: az elrendezés hű marad, de a szöveg a PowerPointban nem lesz szerkeszthető.';

  @override
  String pdfToPptxOpenFailed(String detail) {
    return 'Ezt a PDF-et nem sikerült megnyitni: $detail';
  }

  @override
  String get pdfToPptxConverting => 'Átalakítás PowerPointba…';

  @override
  String pdfToPptxPagesToSlides(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count oldal',
      one: '$count oldal',
    );
    String _temp1 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count dia',
      one: '$count dia',
    );
    return '$_temp0 > $_temp1';
  }

  @override
  String get pdfToPptxEmptyDocument => 'Üres dokumentum';

  @override
  String get qualityLabel => 'Minőség';

  @override
  String get pdfToPptxQualityHint =>
      'A nagyobb felbontás élesebb diákat ad, de jóval nehezebb fájlt.';

  @override
  String pdfToPptxHeavyWarning(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count oldalas',
      one: '$count oldalas',
    );
    return 'Figyelem: magas minőségben egy $_temp0 bemutató több tíz MB is lehet, és lassan nyílik meg. Kétség esetén válassza a Normál beállítást.';
  }

  @override
  String get goodToKnow => 'Jó tudni';

  @override
  String get pdfToPptxCaveat =>
      'Minden dia az oldal képe: az elrendezés megegyezik a PDF-ével, de a szöveg a PowerPointban nem szerkeszthető.\nSzerkeszthető szöveghez inkább a „PDF-ből Word” eszközt használja.\nEgy bemutatónak csak egyféle diamérete van: az első oldalról származik, az eltérő méretű oldalak pedig középre kerülnek benne.';

  @override
  String get pdfToPptxResultTitle => 'A bemutató kész';

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
      other: '$count dia',
      one: '$count dia',
    );
    return '$name — $_temp0 · $size · $quality';
  }

  @override
  String get notSavedYet =>
      'A fájl még nincs a készülékén: mentse el vagy ossza meg.';

  @override
  String get pdfToPptxChangeQuality => 'Minőség módosítása';

  @override
  String get pdfToPptxConvertAction => 'Átalakítás PowerPointba';

  @override
  String pdfToPptxExportWhat(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count dia',
      one: '$count dia',
    );
    return 'PowerPoint-bemutató · $_temp0';
  }

  @override
  String get formatLabel => 'Formátum';

  @override
  String get actionExport => 'Exportálás';

  @override
  String get imageQualityWeb => 'Web (72 dpi)';

  @override
  String get imageQualityStandard => 'Normál (150 dpi)';

  @override
  String get imageQualityHigh => 'Magas minőség (300 dpi)';

  @override
  String get pdfToImagesEmptyTitle => 'Oldalanként egy kép';

  @override
  String get pdfToImagesEmptyBody =>
      'Válasszon PDF-et: minden oldal képként jön ki belőle, azon a felbontáson, amit utána beállít.';

  @override
  String pdfToImagesNotAPdf(String name) {
    return '$name: válasszon PDF-fájlt.';
  }

  @override
  String errorLoadFailed(String detail) {
    return 'A betöltés nem sikerült: $detail';
  }

  @override
  String get pdfToImagesProgress => 'Exportálás folyamatban…';

  @override
  String pdfToImagesExportWhat(int count, String format) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count $format kép',
      one: '$count $format kép',
    );
    return '$_temp0';
  }

  @override
  String get pdfaEmptyTitle => 'Hosszú távú megőrzés';

  @override
  String get pdfaEmptyBody =>
      'A PDF/A az a megőrzési formátum, amelyet sok hivatal megkövetel. A dokumentum úgy alakul át, hogy a megjelenése nem változik.';

  @override
  String get pdfaConformanceLevel => 'Megfelelőségi szint';

  @override
  String get pdfaA1bDetail =>
      'A legszigorúbb és legszélesebb körben elfogadott szint. Kétség esetén ezt válassza.';

  @override
  String get pdfaA2bDetail =>
      'A PDF 1.7-re épül: hatékonyabb tömörítés, valamivel kisebb fájlok.';

  @override
  String get pdfaA3bDetail =>
      'Mint az A-2b, de megengedi a mellékleteket (elektronikus számlázásnál gyakran elvárás).';

  @override
  String pdfaConvertingTo(String level) {
    return 'Átalakítás erre: $level…';
  }

  @override
  String get pdfaCaveatTitle => 'Amit az átalakítás megváltoztat';

  @override
  String pdfaCaveat(int dpi) {
    return 'Minden oldal képként rajzolódik újra $dpi dpi felbontásban: a szövegből kép lesz, az elrendezés rögzül. Éppen ez teszi a fájlt valóban szabványossá anélkül, hogy az eredeti dokumentum betűtípusaitól függne, cserébe viszont a szöveg többé nem jelölhető ki és nem kereshető, a hivatkozások és űrlapok eltűnnek, a fájl pedig nehezebb lesz.';
  }

  @override
  String pdfaOpenFailed(String detail) {
    return 'Ezt a PDF-et nem sikerült megnyitni: $detail';
  }

  @override
  String get imagesToPdfEmptyTitle => 'Képek egyetlen PDF-ben';

  @override
  String get imagesToPdfEmptyBody =>
      'JPG, PNG, WebP, HEIC — adja hozzá a képeit, és a választott sorrendben állnak össze.';

  @override
  String get imagesToPdfChoose => 'Képek kiválasztása';

  @override
  String get imagesToPdfAdd => 'Képek hozzáadása';

  @override
  String imagesToPdfRejected(String names) {
    return 'Kihagyva (nem kép): $names';
  }

  @override
  String get imagesToPdfBuilding => 'A PDF készítése…';

  @override
  String imagesToPdfBuildFailed(String detail) {
    return 'A készítés nem sikerült: $detail';
  }

  @override
  String imagesToPdfCreateAction(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count kép',
      one: '$count kép',
    );
    return 'PDF létrehozása ($_temp0)';
  }

  @override
  String get actionRotate => 'Forgatás';

  @override
  String get actionRemove => 'Eltávolítás';

  @override
  String get htmlTitle => 'HTML / weboldalból PDF';

  @override
  String get htmlIntro =>
      'Alakítson egy weboldalt vagy HTML-kódot A4-es PDF-fé. A megjelenítést az Androidba épített böngésző végzi, így az elrendezés olyan, mint a Chrome-ból való nyomtatásnál.';

  @override
  String get htmlModeUrl => 'Webcím';

  @override
  String get htmlModeCode => 'HTML-kód';

  @override
  String get htmlUrlLabel => 'Az oldal címe';

  @override
  String get htmlUrlHint => 'https://pelda.hu/cikk';

  @override
  String get htmlCodeLabel => 'HTML-kód';

  @override
  String get htmlCodeHint => '<h1>Cím</h1>\n<p>Szöveg…</p>';

  @override
  String get htmlUrlBadScheme =>
      'A címnek http:// vagy https:// előtaggal kell kezdődnie.';

  @override
  String get htmlUrlIncomplete => 'Adjon meg teljes webcímet.';

  @override
  String get htmlCodeEmpty => 'Illessze be az átalakítandó HTML-kódot.';

  @override
  String get htmlLoadingUrl => 'Az oldal betöltése és átalakítása…';

  @override
  String get htmlConverting => 'A HTML átalakítása…';

  @override
  String get htmlNetworkNotice =>
      'Internetkapcsolat szükséges: ez az alkalmazás egyetlen eszköze, amelynek le kell töltenie az oldalt. A bejelentkezést, sütisávot vagy sok JavaScriptet igénylő oldalak hiányosan jöhetnek ki.';

  @override
  String get htmlOfflineNotice =>
      'A közvetlenül az oldalba írt HTML és CSS kapcsolat nélkül is megjelenik. A külső webcímről betöltött képekhez, stíluslapokhoz vagy betűtípusokhoz viszont internetkapcsolat kell.';

  @override
  String get watermarkEmptyTitle => 'Vízjel elhelyezése';

  @override
  String get watermarkEmptyBody =>
      'Az Ön által választott szöveg minden oldal hátterében ismétlődik — hogy a dokumentumot bizalmasnak vagy piszkozatnak jelölje.';

  @override
  String get watermarkEmptyNote =>
      'Az exportálás ingyenes, és a darabszám sincs korlátozva.';

  @override
  String get watermarkTextLabel => 'A vízjel szövege';

  @override
  String get watermarkDefaultText => 'BIZALMAS';

  @override
  String get watermarkNeedText => 'Adja meg a vízjel szövegét.';

  @override
  String watermarkOpacity(int percent) {
    return 'Átlátszatlanság: $percent%';
  }

  @override
  String watermarkRotation(int degrees) {
    return 'Elforgatás szöge: $degrees°';
  }

  @override
  String watermarkFontSize(int points) {
    return 'Szövegméret: $points pt';
  }

  @override
  String get watermarkColor => 'Szín';

  @override
  String get colorGrey => 'Szürke';

  @override
  String get colorRed => 'Piros';

  @override
  String get colorBlue => 'Kék';

  @override
  String get colorBlack => 'Fekete';

  @override
  String get watermarkProgress => 'A vízjel elhelyezése…';

  @override
  String percentValue(int percent) {
    return '$percent%';
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
  String get pageNumbersEmptyTitle => 'Oldalak számozása';

  @override
  String get pageNumbersEmptyBody =>
      'Válasszon PDF-et, majd a minden oldalra kerülő számok helyét és alakját.';

  @override
  String get positionLabel => 'Elhelyezés';

  @override
  String get positionBottomCenter => 'Lent középen';

  @override
  String get positionBottomRight => 'Lent jobbra';

  @override
  String get positionTopCenter => 'Fent középen';

  @override
  String get positionTopRight => 'Fent jobbra';

  @override
  String get pageNumbersFormatPlain => 'N';

  @override
  String get pageNumbersFormatOfTotal => 'N / összes';

  @override
  String get pageNumbersStart => 'Kezdő szám';

  @override
  String get pageNumbersProgress => 'Számozás folyamatban…';

  @override
  String get organizeEmptyTitle => 'PDF újrarendezése';

  @override
  String get organizeEmptyBody =>
      'Nyisson meg egy dokumentumot, hogy szétvágja, oldalakat emeljen ki belőle, vagy megváltoztassa a sorrendjüket.';

  @override
  String get organizeOpenFile => 'Fájl megnyitása';

  @override
  String get organizeNothingToExport => 'Nincs exportálandó oldal.';

  @override
  String organizePagesKept(int kept, int total) {
    String _temp0 = intl.Intl.pluralLogic(
      kept,
      locale: localeName,
      other: '$kept oldal megtartva',
      one: '$kept oldal megtartva',
    );
    return '$total oldalból $_temp0';
  }

  @override
  String get organizePageExcluded => 'Kihagyva';

  @override
  String organizePageMoved(int from) {
    return 'Áthelyezve a(z) $from. helyről';
  }

  @override
  String organizePageTitle(int number) {
    return '$number. oldal';
  }

  @override
  String organizeExcludePage(int number) {
    return 'A(z) $number. oldal kihagyása';
  }

  @override
  String organizeIncludePage(int number) {
    return 'A(z) $number. oldal hozzávétele';
  }

  @override
  String organizeMovePage(int number) {
    return 'A(z) $number. oldal áthelyezése';
  }

  @override
  String get organizeExtract => 'Kiemelés';

  @override
  String get organizeSplit => 'Szétvágás';

  @override
  String get organizePreview => 'Előnézet';

  @override
  String get organizeExtractTitle => 'Oldaltartomány kiemelése';

  @override
  String organizeRangeLabel(int start, int end) {
    return '$start–$end. oldal';
  }

  @override
  String get organizeSplitTitle => 'Szétvágás több fájlra';

  @override
  String organizeFileCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fájl',
      one: '$count fájl',
    );
    return '$_temp0';
  }

  @override
  String organizeSplitFailed(String detail) {
    return 'A szétvágás nem sikerült: $detail';
  }

  @override
  String get scanNoCamera => 'Ezen a készüléken nincs elérhető kamera.';

  @override
  String scanCameraFailed(String detail) {
    return 'A kamerát nem sikerült elindítani: $detail';
  }

  @override
  String get scanCropToolbar => 'Igazítás';

  @override
  String scanCaptureFailed(String detail) {
    return 'A felvétel nem sikerült: $detail';
  }

  @override
  String get scanPermissionBody =>
      'Dokumentum beolvasásához hozzáférés kell a kamerához.';

  @override
  String get scanGrantPermission => 'Kamera engedélyezése';

  @override
  String get actionRetry => 'Újra';

  @override
  String get scanNoPageYet => 'Még nincs egyetlen oldal sem.';

  @override
  String scanFinishAction(int count) {
    return 'Befejezés · $count';
  }

  @override
  String get signTitle => 'PDF aláírása';

  @override
  String get signIntro =>
      'Helyezze kézzel rajzolt aláírását a PDF egyik oldalára. Ez csupán a dokumentumhoz hozzáadott rajz, nem hitelesített elektronikus aláírás.';

  @override
  String get signChooseSubtitle => 'Válassza ki az aláírandó dokumentumot';

  @override
  String get signPickPage => 'Válassza ki az aláírandó oldalt.';

  @override
  String get signDrawTitle => 'Aláírásom megrajzolása';

  @override
  String get signDrawBody =>
      'Rajzoljon az ujjával, mintha papíron tenné. Ez rajzot helyez az oldalra — nem hitelesített elektronikus aláírás.';

  @override
  String get signNeedDrawing => 'Rajzoljon aláírást, mielőtt továbblép.';

  @override
  String get signClear => 'Törlés';

  @override
  String get signValidate => 'Megerősítés';

  @override
  String get signPlaceBody =>
      'Húzza az aláírást az oldal kívánt helyére, majd koppintson a Befejezés gombra.';

  @override
  String get signPageUnavailable => 'Az oldalt nem sikerült megjeleníteni.';

  @override
  String get signProgress => 'Az aláírás hozzáadása…';

  @override
  String get editTitle => 'Jegyzetelés a dokumentumban';

  @override
  String get editEmptyBody =>
      'Adjon hozzá szöveget, vagy emeljen ki részeket közvetlenül egy meglévő PDF-en.';

  @override
  String get editAddTextTitle => 'Szöveg hozzáadása';

  @override
  String get editTextHint => 'Az Ön szövege';

  @override
  String editFontSize(int size) {
    return 'Szövegméret: $size';
  }

  @override
  String get editNeedAnnotation =>
      'Befejezés előtt adjon hozzá legalább egy jegyzetet.';

  @override
  String get editProgress => 'A jegyzetek alkalmazása…';

  @override
  String get editChooseOther => 'Másik PDF kiválasztása';

  @override
  String get editUndoTooltip => 'Az utolsó jegyzet visszavonása';

  @override
  String get editModeText => 'Szöveg';

  @override
  String get editModeHighlight => 'Kiemelés';

  @override
  String get editPageUnavailable => 'Ezt az oldalt nem sikerült megjeleníteni.';

  @override
  String get ocrEmptyTitle => 'A szöveg kereshetővé tétele';

  @override
  String get ocrEmptyBody =>
      'A beolvasott PDF szövegét felismerjük, és láthatatlanul a kép fölé helyezzük. Az oldal megjelenése nem változik.';

  @override
  String get ocrWrongFormat => 'Válasszon PDF-et vagy képet (JPG, PNG…).';

  @override
  String get ocrProgress => 'Felismerés folyamatban…';

  @override
  String ocrFailed(String detail) {
    return 'A felismerés nem sikerült: $detail';
  }

  @override
  String get ocrRunAction => 'Felismerés indítása';

  @override
  String get ocrResultTitle => 'Az OCR eredménye';

  @override
  String ocrResultBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count oldal elemezve',
      one: '$count oldal elemezve',
    );
    return '$_temp0. A kereshető PDF elkészült, és a felismert szöveg egészét is átmásolhatja.';
  }

  @override
  String get ocrCopyText => 'Szöveg másolása';

  @override
  String get ocrTextCopied => 'A szöveg átmásolva.';

  @override
  String get redactIntro =>
      'Rejtsen el véglegesen részeket a PDF-ből (nevek, címek, összegek). A fölé húzott egyszerű fekete téglalappal ellentétben az elrejtett szöveg valóban törlődik a fájlból, nem csak eltakaródik: többé nem jelölhető ki és nem másolható.';

  @override
  String get redactChooseSubtitle => 'Válassza ki a kitakarandó dokumentumot';

  @override
  String get redactCaveat =>
      'Jó tudni: az elrejtett szöveg törléséhez a dokumentum minden oldala újra képpé alakul (200 dpi). Az eredmény ezért már nem olyan PDF, amelyben ki lehet jelölni a szöveget, és a kapott fájl általában nehezebb az eredetinél.';

  @override
  String get redactEmptyPdf => 'Ez a PDF egyetlen oldalt sem tartalmaz.';

  @override
  String redactOpenFailed(String detail) {
    return 'Ezt a PDF-et nem sikerült megnyitni (lehet, hogy jelszóval védett): $detail';
  }

  @override
  String redactPageRenderFailed(int number, String detail) {
    return 'A(z) $number. oldalt nem sikerült megjeleníteni: $detail';
  }

  @override
  String get redactUndoTooltip => 'Az utolsó terület visszavonása';

  @override
  String get redactInstructions =>
      'Húzza az ujját az oldalon, hogy kijelölje az elrejtendő területet. A letakart szöveg valóban törlődik a fájlból, nem csak eltakaródik.';

  @override
  String get redactPagePrevious => 'Előző oldal';

  @override
  String get redactPageNext => 'Következő oldal';

  @override
  String redactPager(int current, int total) {
    return '$current / $total. oldal';
  }

  @override
  String get redactNoZone => 'Nincs kijelölt terület';

  @override
  String redactZoneCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count elrejtendő terület',
      one: '$count elrejtendő terület',
    );
    return '$_temp0';
  }

  @override
  String get redactOtherPdf => 'Másik PDF';

  @override
  String get redactAction => 'Kitakarás';

  @override
  String get redactProgress => 'Kitakarás folyamatban…';

  @override
  String get cropEmptyTitle => 'A margók levágása';

  @override
  String get cropEmptyBody =>
      'Válasszon PDF-et, majd húzza az ujját az előnézeten, hogy kijelölje a megtartandó területet.';

  @override
  String get cropTooSmall => 'A kijelölt terület túl kicsi.';

  @override
  String get cropProgress => 'Levágás folyamatban…';

  @override
  String cropFailed(String detail) {
    return 'A levágás nem sikerült: $detail';
  }

  @override
  String get cropKeptArea => 'Megtartott terület';

  @override
  String cropDimensions(
    int width,
    int height,
    int widthPercent,
    int heightPercent,
  ) {
    return '$width × $height mm ($widthPercent% × $heightPercent%)';
  }

  @override
  String get cropFullPage => 'Teljes oldal';

  @override
  String get cropAllPages => 'Alkalmazás minden oldalra';

  @override
  String get cropAllPagesOn => 'Minden oldalból ugyanaz a terület kerül ki.';

  @override
  String get cropAllPagesOff =>
      'Csak az 1. oldal lesz levágva, a többi egészben marad.';

  @override
  String get cropCaveat =>
      'A levágás kisebbé teszi az oldalt: a területen kívüli tartalom többé nem jelenik meg és nem nyomtatódik ki.';

  @override
  String get cropAction => 'Levágás';

  @override
  String get compareTitle => 'Két PDF összehasonlítása';

  @override
  String get compareEmptyTitle => 'Ami megváltozott';

  @override
  String get compareEmptyBody =>
      'Válassza ki ugyanannak a PDF-nek két változatát. A hozzáadott és törölt részek oldalról oldalra egymás mellé kerülnek.';

  @override
  String get compareSlotA => 'A fájl';

  @override
  String get compareSlotB => 'B fájl';

  @override
  String get compareAction => 'Összehasonlítás';

  @override
  String get compareProgress => 'Összehasonlítás folyamatban…';

  @override
  String compareFailed(String detail) {
    return 'Az összehasonlítás nem sikerült: $detail';
  }

  @override
  String compareChangedPages(int changed, int total) {
    String _temp0 = intl.Intl.pluralLogic(
      changed,
      locale: localeName,
      other: '$changed oldal tér el',
      one: '$changed oldal tér el',
    );
    return '$total oldalból $_temp0';
  }

  @override
  String get compareNoDifference => 'A két fájl között nem találtunk eltérést.';

  @override
  String comparePageHeading(int number) {
    return '$number. oldal';
  }

  @override
  String organizeFilesCreated(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fájl létrehozva',
      one: '$count fájl létrehozva',
    );
    return '$_temp0';
  }

  @override
  String organizePartTitle(int number) {
    return '$number. rész';
  }
}
