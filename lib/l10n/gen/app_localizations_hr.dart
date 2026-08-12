// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Croatian (`hr`).
class LHr extends L {
  LHr([String locale = 'hr']) : super(locale);

  @override
  String get appTitle => 'Trombone — PDF, skeniranje i Word';

  @override
  String get appWordmark => 'Trombone';

  @override
  String get actionSave => 'Spremi';

  @override
  String get actionShare => 'Podijeli';

  @override
  String get actionCompress => 'Smanji';

  @override
  String get actionDone => 'Gotovo';

  @override
  String get actionCancel => 'Odustani';

  @override
  String get actionChange => 'Promijeni';

  @override
  String get actionContinue => 'Nastavi';

  @override
  String get actionOpening => 'Otvara se…';

  @override
  String get actionRemoveFile => 'Ukloni ovu datoteku';

  @override
  String get progressPreparing => 'Priprema…';

  @override
  String progressPercent(int percent) {
    return '$percent %';
  }

  @override
  String get emptyReassurance =>
      'Izvoz je besplatan, bez vodenog žiga i bez ograničenja.';

  @override
  String get emptyAcceptedFormats => 'Podržani formati';

  @override
  String get exportSavedTitle => 'Spremljeno.';

  @override
  String get exportSavedBody =>
      'Pod nazivom i u mapu koje ste upravo odabrali. Bez vodenog žiga, bez ograničenja, nema se što otključavati.';

  @override
  String get exportSaveDialogTitle => 'Spremi PDF';

  @override
  String pageTileIncluded(int number) {
    return 'Stranica $number, uključena. Dodirnite da je izostavite.';
  }

  @override
  String pageTileExcluded(int number) {
    return 'Stranica $number, izostavljena. Dodirnite da je uključite.';
  }

  @override
  String pageTileRotate(int number) {
    return 'Zakreni stranicu $number';
  }

  @override
  String sectionHeaderSemantics(String title, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count alata',
      few: '$count alata',
      one: '$count alat',
    );
    return '$title, $_temp0';
  }

  @override
  String toolCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count alata',
      few: '$count alata',
      one: '$count alat',
    );
    return '$_temp0';
  }

  @override
  String get homePromise =>
      'Složite dokument i izvezite ga.\nNa kraju nema zida.';

  @override
  String get homeChipNoAccount => 'Bez računa';

  @override
  String get homeChipNoWatermark => 'Bez vodenog žiga';

  @override
  String get homeChipUnlimited => 'Neograničen izvoz';

  @override
  String get homeSearchTooltip => 'Pronađi alat';

  @override
  String get homeColophon =>
      'Pri spremanju se ništa ne otključava uz plaćanje. Izvoz je besplatan, bez vodenog žiga i bez ograničenja broja.';

  @override
  String get sectionFeatured => 'Istaknuto';

  @override
  String get sectionToPdf => 'U PDF';

  @override
  String get sectionFromPdf => 'Iz PDF-a';

  @override
  String get sectionSecurity => 'Sigurnost';

  @override
  String get sectionEdit => 'Uređivanje';

  @override
  String get toolMerge => 'Spoji';

  @override
  String get toolMergeKeywords => 'spajanje sastavi objedini pridruzi nadovezi';

  @override
  String get toolMergeSubtitle => 'PDF, Word, slike i tekst u jednom dokumentu';

  @override
  String get toolRectoVerso => 'Obostrano';

  @override
  String get toolRectoVersoKeywords =>
      'dupleks umetanje skeniranje parne neparne dvije strane';

  @override
  String get toolRectoVersoSubtitle => 'Dva skena, opet u pravom redoslijedu';

  @override
  String get toolImagesToPdf => 'Slike u PDF';

  @override
  String get toolImagesToPdfKeywords =>
      'fotografija jpg jpeg png slike album kamera';

  @override
  String get toolImagesToPdfSubtitle =>
      'Fotografije i snimke zaslona u jednom dokumentu';

  @override
  String get toolPdfToWord => 'PDF u Word';

  @override
  String get toolPdfToWordKeywords =>
      'docx uredivac teksta uredivo pretvori doc';

  @override
  String get toolPdfToWordSubtitle =>
      'Tekst i tablice, s mogućnošću uređivanja';

  @override
  String get toolOrganize => 'Posloži PDF';

  @override
  String get toolOrganizeKeywords =>
      'podijeli razdvoji izdvoji preslozi redoslijed stranice obrisi';

  @override
  String get toolOrganizeSubtitle => 'Dijeljenje, izdvajanje, slaganje';

  @override
  String get toolExcelToPdf => 'Excel u PDF';

  @override
  String get toolExcelToPdfKeywords =>
      'proracunska tablica xlsx radna knjiga list';

  @override
  String get toolPptxToPdf => 'PowerPoint u PDF';

  @override
  String get toolPptxToPdfKeywords => 'pptx slajd prezentacija slides';

  @override
  String get toolHtmlToPdf => 'Web stranica u PDF';

  @override
  String get toolHtmlToPdfKeywords => 'html web internet url poveznica clanak';

  @override
  String get toolScan => 'Skeniraj dokument';

  @override
  String get toolScanKeywords =>
      'kamera fotografija digitaliziraj skener papir';

  @override
  String get toolPdfToExcel => 'PDF u Excel';

  @override
  String get toolPdfToExcelKeywords =>
      'proracunska tablica xlsx tablica izdvoji podatke';

  @override
  String get toolPdfToPptx => 'PDF u PowerPoint';

  @override
  String get toolPdfToPptxKeywords => 'pptx slajd prezentacija slides';

  @override
  String get toolPdfToImages => 'PDF u slike';

  @override
  String get toolPdfToImagesKeywords =>
      'jpg png fotografija izvezi snimka zaslona slika';

  @override
  String get toolOcr => 'Tekst koji se može pretraživati (OCR)';

  @override
  String get toolOcrKeywords =>
      'prepoznavanje znakovi skenirano kopiraj oznaci';

  @override
  String get toolPdfA => 'Pretvori u PDF/A';

  @override
  String get toolPdfAKeywords => 'arhiviranje norma dugorocno cuvanje iso';

  @override
  String get toolProtect => 'Zaštiti PDF';

  @override
  String get toolProtectKeywords => 'lozinka lokot sifriraj zakljucaj zastita';

  @override
  String get toolUnlock => 'Otključaj PDF';

  @override
  String get toolUnlockKeywords =>
      'ukloni lozinku otvori desifriraj otkljucaj lokot';

  @override
  String get toolRepair => 'Popravi PDF';

  @override
  String get toolRepairKeywords => 'ostecen necitljiv pokvaren oporavi greska';

  @override
  String get toolRedact => 'Zacrni u PDF-u';

  @override
  String get toolRedactKeywords =>
      'sakrij zacrni anonimiziraj povjerljivo obrisi cenzura';

  @override
  String get toolEdit => 'Uredi PDF';

  @override
  String get toolEditKeywords => 'tekst promijeni ispravi biljeska pisi';

  @override
  String get toolSign => 'Potpiši';

  @override
  String get toolSignKeywords => 'potpis parafa ugovor ruka';

  @override
  String get toolWatermark => 'Vodeni žig';

  @override
  String get toolWatermarkKeywords =>
      'watermark pecat povjerljivo nacrt oznaka';

  @override
  String get toolPageNumbers => 'Brojevi stranica';

  @override
  String get toolPageNumbersKeywords =>
      'numeriranje paginacija obiljezi brojke';

  @override
  String get toolCrop => 'Obreži PDF';

  @override
  String get toolCropKeywords => 'rezanje margine obrezivanje rubovi velicina';

  @override
  String get toolCompare => 'Usporedi PDF-ove';

  @override
  String get toolCompareKeywords => 'razlika inacice diff izmjene usporedi';

  @override
  String get searchHint => 'Spoji, lozinka, vodeni žig…';

  @override
  String get searchClear => 'Očisti';

  @override
  String searchNoResultTitle(String query) {
    return 'Nema alata za „$query”.';
  }

  @override
  String get searchNoResultBody =>
      'Pokušajte s formatom koji imate pri ruci — „Word”, „Excel”, „fotografija” — ili s onim što želite učiniti: „potpisati”, „podijeliti”, „lozinka”.';

  @override
  String get actionUndo => 'Poništi';

  @override
  String get actionApply => 'Primijeni';

  @override
  String get actionChoose => 'Odaberi';

  @override
  String get actionChoosePdf => 'Odaberi PDF';

  @override
  String get actionChooseFiles => 'Odaberi datoteke';

  @override
  String get actionConvert => 'Pretvori';

  @override
  String get actionFinish => 'Završi';

  @override
  String get actionBack => 'Natrag';

  @override
  String get actionAdd => 'Dodaj';

  @override
  String get noFileChosen => 'Nije odabrana nijedna datoteka';

  @override
  String errorExportFailed(String detail) {
    return 'Izvoz nije uspio: $detail';
  }

  @override
  String errorShareFailed(String detail) {
    return 'Dijeljenje nije uspjelo: $detail';
  }

  @override
  String errorOpenFailed(String detail) {
    return 'Datoteku nije bilo moguće otvoriti: $detail';
  }

  @override
  String errorConversionFailed(String detail) {
    return 'Pretvaranje nije uspjelo: $detail';
  }

  @override
  String errorOnFile(String name, String detail) {
    return '$name: $detail';
  }

  @override
  String get errorPickPdf => 'Odaberite PDF datoteku.';

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
      other: '$count stranica',
      few: '$count stranice',
      one: '$count stranica',
    );
    return '$_temp0';
  }

  @override
  String pageCountOfTotal(int kept, int total) {
    String _temp0 = intl.Intl.pluralLogic(
      kept,
      locale: localeName,
      other: '$kept stranica',
      few: '$kept stranice',
      one: '$kept stranica',
    );
    return '$_temp0 od $total';
  }

  @override
  String pageOfTotal(int current, int total) {
    return 'Stranica $current od $total';
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
  String get formatImages => 'Slike';

  @override
  String get formatText => 'Tekst';

  @override
  String get mergeAddFile => 'Dodaj datoteku';

  @override
  String get mergeAddHint => 'PDF, Word, slike ili tekst';

  @override
  String get mergeEmptyTitle => 'Jedan jedini dokument';

  @override
  String get mergeEmptyBody =>
      'Dodajte PDF-ove, Word datoteke, slike ili tekst. Prije izvoza možete promijeniti redoslijed i izostaviti stranice.';

  @override
  String get mergeNeedOnePage =>
      'Dodajte barem jednu datoteku sa stranicom za uključivanje.';

  @override
  String get mergeProgress => 'Spajanje u tijeku…';

  @override
  String mergeFailed(String detail) {
    return 'Spajanje nije uspjelo: $detail';
  }

  @override
  String mergeRemoved(String name) {
    return '$name uklonjena.';
  }

  @override
  String mergeRemoveTooltip(String name) {
    return 'Ukloni $name';
  }

  @override
  String mergeMoveSemantics(String name) {
    return 'Premjesti $name';
  }

  @override
  String get mergeRotateAll => 'Zakreni sve stranice';

  @override
  String mergePreviewAndExport(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count stranica',
      few: '$count stranice',
      one: '$count stranica',
    );
    return 'Pretpregled i izvoz ($_temp0)';
  }

  @override
  String previewTitle(String size) {
    return 'Pretpregled · $size';
  }

  @override
  String previewZoomPage(int number) {
    return 'Stranica $number, povećaj';
  }

  @override
  String get previewPageUnreadable => 'Stranica je nečitljiva.';

  @override
  String previewExportWhat(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count stranica',
      few: '$count stranice',
      one: '$count stranica',
    );
    return 'PDF · $_temp0';
  }

  @override
  String get compressTitle => 'Smanjivanje';

  @override
  String compressBody(String size) {
    return 'Trenutna veličina: $size. Odaberite razinu — procijenjena veličina prikazuje se prije primjene.';
  }

  @override
  String get compressEstimating => 'Procjena…';

  @override
  String get compressProgress => 'Smanjivanje u tijeku…';

  @override
  String compressFailed(String detail) {
    return 'Smanjivanje nije uspjelo: $detail';
  }

  @override
  String get protectEmptyTitle => 'Zaključaj lozinkom';

  @override
  String get protectEmptyBody =>
      'PDF se više neće otvarati bez lozinke koju odaberete. Sačuvajte je: ne može se vratiti.';

  @override
  String get protectSubtitle => 'Bit će šifriran s AES 256 bita';

  @override
  String get protectPassword => 'Lozinka';

  @override
  String get protectConfirmPassword => 'Potvrdi lozinku';

  @override
  String get protectShowPasswords => 'Prikaži lozinke';

  @override
  String get protectHidePasswords => 'Sakrij lozinke';

  @override
  String get protectMismatch => 'Dvije se lozinke razlikuju.';

  @override
  String get protectWarning =>
      'Zapišite je negdje: bez nje dokument postaje zauvijek nečitljiv. Oporavak nije moguć — ni s vaše strane ni sa strane aplikacije.';

  @override
  String get protectAlreadyProtected =>
      'Ova je datoteka već zaštićena — najprije upotrijebite Otključaj PDF.';

  @override
  String get protectProgress => 'Zaštita u tijeku…';

  @override
  String protectFailed(String detail) {
    return 'Zaštita nije uspjela: $detail';
  }

  @override
  String get protectAction => 'Zaštiti';

  @override
  String get protectResultTitle => 'PDF je zaštićen';

  @override
  String get protectResultDetail =>
      'Šifriran s AES 256 bita. Za otvaranje će trebati lozinka.';

  @override
  String get protectExportWhat => 'PDF zaštićen lozinkom';

  @override
  String get unlockEmptyTitle => 'Ukloni lozinku';

  @override
  String get unlockEmptyBody =>
      'Trebate trenutnu lozinku dokumenta. Nakon uklanjanja PDF će se otvarati slobodno.';

  @override
  String get unlockAcceptsProtectedPdf => 'Zaštićeni PDF';

  @override
  String get unlockChooseProtectedPdf => 'Odaberi zaštićeni PDF';

  @override
  String get unlockCurrentPassword => 'Trenutna lozinka';

  @override
  String get unlockWrongPassword => 'Netočna lozinka.';

  @override
  String get unlockProgress => 'Otključavanje u tijeku…';

  @override
  String unlockFailed(String detail) {
    return 'Otključavanje nije uspjelo: $detail';
  }

  @override
  String get unlockAction => 'Otključaj';

  @override
  String get repairEmptyTitle => 'Popravi oštećenu datoteku';

  @override
  String get repairEmptyBody =>
      'Unutarnja struktura oštećenog PDF-a ponovno se gradi. Što se može spasiti, bit će spašeno.';

  @override
  String get repairProgress => 'Popravak u tijeku…';

  @override
  String get repairFailed =>
      'Ovu datoteku nije moguće popraviti — možda je previše oštećena.';

  @override
  String get repairAction => 'Popravi';

  @override
  String get pdfToWordEmptyTitle => 'Word koji se može uređivati';

  @override
  String get pdfToWordEmptyBody =>
      'Tekst i struktura PDF-a prenose se u .docx dokument koji ćete moći ponovno otvoriti i ispraviti.';

  @override
  String get pdfToWordAnalyzing => 'Analiza dokumenta…';

  @override
  String get pdfToWordAnalysisPending => 'Analiza na čekanju';

  @override
  String pdfToWordAnalysisFailed(String detail) {
    return 'Analiza nije uspjela: $detail';
  }

  @override
  String get pdfLocked =>
      'Ovaj je PDF zaštićen lozinkom. Najprije ga otključajte.';

  @override
  String get pdfToWordConverting => 'Pretvaranje u Word…';

  @override
  String get pdfToWordSummaryTitle => 'Pronađeni sadržaj';

  @override
  String pdfToWordParagraphCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count odlomaka',
      few: '$count odlomka',
      one: '$count odlomak',
    );
    return '$_temp0';
  }

  @override
  String pdfToWordHeadingCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count naslova',
      few: '$count naslova',
      one: '$count naslov',
    );
    return '$_temp0';
  }

  @override
  String pdfToWordTableCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count tablica',
      few: '$count tablice',
      one: '$count tablica',
    );
    return '$_temp0';
  }

  @override
  String get pdfToWordNoTables =>
      'Nije pronađena nijedna tablica: ako je vaš PDF sadrži, njezini će se retci pretvoriti u odlomke.';

  @override
  String get pdfToWordCaveat =>
      'Pretvaranje prenosi tekst, oblikovanje i tablice, ali ne i točan raspored na stranici: položaj slika i stupaca ne zadržava se, a slike ne prelaze u Word dokument.';

  @override
  String get pdfToWordScanWarning =>
      'Ovaj PDF izgleda kao sken: nije pronađen nikakav tekst. Najprije upotrijebite alat Tekst koji se može pretraživati (OCR), pa se vratite i pretvorite dobiveni PDF.';

  @override
  String get pdfToWordResultTitle => 'Word dokument je gotov';

  @override
  String pdfToWordResultDetail(String name, String size) {
    return '$name — $size';
  }

  @override
  String get pdfToWordExportWhat => 'Word dokument';

  @override
  String get pdfToWordConvertAction => 'Pretvori u Word';

  @override
  String get actionConvertAgain => 'Pretvori ponovno';

  @override
  String errorSaveFailed(String detail) {
    return 'Nije bilo moguće spremiti: $detail';
  }

  @override
  String get rectoVersoIntro =>
      'Jednostrani ulagač daje dvije datoteke: neparne stranice redom, a parne često obrnutim redoslijedom. Odaberite obje da se dokument ponovno složi.';

  @override
  String get rectoVersoOddSlot => 'Datoteka s neparnim stranicama (lice)';

  @override
  String get rectoVersoEvenSlot => 'Datoteka s parnim stranicama (naličje)';

  @override
  String get rectoVersoReversed => 'Druga je datoteka obrnutim redoslijedom';

  @override
  String get rectoVersoReversedHint =>
      'To je najčešći slučaj, pa je unaprijed označeno';

  @override
  String rectoVersoPreview(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count stranica',
      few: '$count stranice',
      one: '$count stranica',
    );
    return 'Pretpregled umetanja ($_temp0)';
  }

  @override
  String get rectoVersoProgress => 'Umetanje u tijeku…';

  @override
  String fileWithPageCount(String name, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count stranica',
      few: '$count stranice',
      one: '$count stranica',
    );
    return '$name · $_temp0';
  }

  @override
  String get actionPreviewAndExport => 'Pretpregled i izvoz';

  @override
  String errorOpenFailedShort(String detail) {
    return 'Nije bilo moguće otvoriti: $detail';
  }

  @override
  String errorGeneric(String detail) {
    return 'Nije uspjelo: $detail';
  }

  @override
  String get actionConvertToPdf => 'Pretvori u PDF';

  @override
  String get convertProgress => 'Pretvaranje u tijeku…';

  @override
  String get excelEmptyTitle => 'Radna knjiga kao PDF';

  @override
  String get excelEmptyBody =>
      'Listovi .xlsx datoteke postaju PDF stranice, spremne za slanje ili ispis.';

  @override
  String get excelChooseWorkbook => 'Odaberi radnu knjigu';

  @override
  String get excelChooseXlsx => 'Odaberi .xlsx radnu knjigu';

  @override
  String get excelLegacyFormat =>
      'Format .xls (stari binarni Excelov format) nije podržan. Spremite datoteku kao .xlsx pa pokušajte ponovno.';

  @override
  String get excelWrongFormat =>
      'Odaberite Excelovu radnu knjigu u formatu .xlsx.';

  @override
  String excelUnreadable(String detail) {
    return 'Radna knjiga je nečitljiva: $detail';
  }

  @override
  String excelSheetsAndRows(int sheets, int rows) {
    String _temp0 = intl.Intl.pluralLogic(
      sheets,
      locale: localeName,
      other: '$sheets listova',
      few: '$sheets lista',
      one: '$sheets list',
    );
    String _temp1 = intl.Intl.pluralLogic(
      rows,
      locale: localeName,
      other: '$rows redaka',
      few: '$rows retka',
      one: '$rows redak',
    );
    return '$_temp0 · ukupno $_temp1';
  }

  @override
  String get excelSheetsDetected => 'Pronađeni listovi';

  @override
  String get excelEmptySheet => 'Prazan list';

  @override
  String excelSheetDimensions(int rows, int columns) {
    String _temp0 = intl.Intl.pluralLogic(
      rows,
      locale: localeName,
      other: '$rows redaka',
      few: '$rows retka',
      one: '$rows redak',
    );
    String _temp1 = intl.Intl.pluralLogic(
      columns,
      locale: localeName,
      other: '$columns stupaca',
      few: '$columns stupca',
      one: '$columns stupac',
    );
    return '$_temp0 × $_temp1';
  }

  @override
  String get excelRepeatHeader => 'Ponovi redak zaglavlja na svakoj stranici';

  @override
  String get excelRepeatHeaderHint =>
      'Prvi redak lista ponovno se iscrtava na vrhu svake stranice tablice.';

  @override
  String get excelCaveat =>
      'Što pretvaranje prenosi: tekst ćelija onako kako je spremljen u datoteci (uključujući posljednji izračunati rezultat formula), prvi redak podebljano i mrežu.\n\nŠto ne prenosi: boje, pisma, formate brojeva, spojene ćelije, slike, grafikone i same formule. Stupci se sužavaju da stanu u širinu stranice; na vrlo širokim listovima tekst preuskih ćelija skraćuje se znakom „…”.';

  @override
  String get pptxEmptyTitle => 'Prezentacija kao PDF';

  @override
  String get pptxEmptyBody =>
      'Jedna vodoravna stranica 16:9 po slajdu, s naslovom i natuknicama. Tekst se prenosi; izvorne slike, oblici i pozadine ne.\n\nPodržani format: .pptx. Stariju .ppt datoteku treba prvo spremiti kao .pptx iz PowerPointa.';

  @override
  String get pptxChoosePresentation => 'Odaberi prezentaciju';

  @override
  String get pptxTextOnlyTitle => 'Pretvara se samo tekst';

  @override
  String get pptxTextOnlyBody =>
      'Tekst svakog slajda se prenosi. Izvorne slike, oblici, pozadine, boje i rasporedi ne zadržavaju se: dobiveni PDF jednostavan je i čitljiv raspored, a ne vjerna kopija vaše prezentacije.';

  @override
  String pptxSlideCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count slajdova',
      few: '$count slajda',
      one: '$count slajd',
    );
    return '$_temp0';
  }

  @override
  String get pptxSlidesDetected => 'Pronađeni slajdovi';

  @override
  String pptxMoreSlides(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count slajdova',
      few: '$count slajda',
      one: '$count slajd',
    );
    return 'i još $_temp0…';
  }

  @override
  String get pptxUntitledSlide => 'Bez naslova';

  @override
  String get pptxEmptySlide => 'Bez teksta (samo slika ili oblik)';

  @override
  String pptxTextLineCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count redaka teksta',
      few: '$count retka teksta',
      one: '$count redak teksta',
    );
    return '$_temp0';
  }

  @override
  String pptxReadFailed(String detail) {
    return 'Nije bilo moguće pročitati: $detail';
  }

  @override
  String get compressLevelLight => 'Blago';

  @override
  String get compressLevelMedium => 'Srednje';

  @override
  String get compressLevelStrong => 'Jako';

  @override
  String get pptxQualityStandard => 'Standardna (150 dpi)';

  @override
  String get pptxQualityHigh => 'Visoka (220 dpi)';

  @override
  String get pdfToExcelEmptyTitle => 'Vrati tablice';

  @override
  String get pdfToExcelEmptyBody =>
      'Tablice iz PDF-a izdvajaju se u Excelovu radnu knjigu. Oblikovanje se ne zadržava, vrijednosti se zadržavaju.';

  @override
  String pdfToExcelPagesAnalyzed(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'analizirano $count stranica',
      few: 'analizirane $count stranice',
      one: 'analizirana $count stranica',
    );
    return '$_temp0';
  }

  @override
  String pdfToExcelAnalysisFailed(String detail) {
    return 'Analiza nije moguća. PDF je možda zaštićen lozinkom ili oštećen. ($detail)';
  }

  @override
  String get pdfToExcelNothingToExport =>
      'Nema što izvesti: nije pronađena nijedna tablica.';

  @override
  String get pdfToExcelBuilding => 'Izrada radne knjige…';

  @override
  String get pdfToExcelIncludeParagraphs =>
      'Uključi i tekst izvan tablica (jedan redak po odlomku)';

  @override
  String get pdfToExcelIncludeParagraphsHint =>
      'Korisno za polustrukturirani dokument: tekst dolazi u stupac A, nakon tablica te stranice.';

  @override
  String get pdfToExcelCaveatTitle => 'Što pretvaranje ne zadržava';

  @override
  String get pdfToExcelCaveat =>
      'Prepoznavanje se oslanja na položaj teksta na stranici: tablice bez pravilnog obruba, spojene ćelije i vrlo nepravilni stupci mogu se loše podijeliti. Skenirani PDF (slika) ne sadrži tekst koji se može izdvojiti i neće dati ništa. Boje, formule i slike nikada se ne prenose: samo tekstualne vrijednosti.';

  @override
  String pdfToExcelTablesFound(int tables, int pages) {
    String _temp0 = intl.Intl.pluralLogic(
      tables,
      locale: localeName,
      other: 'pronađeno $tables tablica',
      few: 'pronađene $tables tablice',
      one: 'pronađena $tables tablica',
    );
    String _temp1 = intl.Intl.pluralLogic(
      pages,
      locale: localeName,
      other: '$pages stranica',
      few: '$pages stranice',
      one: '$pages stranici',
    );
    return '$_temp0 na $_temp1';
  }

  @override
  String pdfToExcelPagesConcerned(String pages) {
    return 'Obuhvaćene stranice: $pages';
  }

  @override
  String pdfToExcelParagraphsOutside(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count odlomaka izvan tablica',
      few: '$count odlomka izvan tablica',
      one: '$count odlomak izvan tablica',
    );
    return '$_temp0';
  }

  @override
  String get pdfToExcelScannedWarning =>
      'Iz ovog PDF-a nije bilo moguće izdvojiti tekst: gotovo sigurno je riječ o skeniranom dokumentu (slikama stranica). Proračunska tablica iz njega ne može ništa izvući; najprije upotrijebite alat za prepoznavanje teksta (OCR).';

  @override
  String get pdfToExcelNoTableWarning =>
      'U ovom dokumentu nije prepoznata nijedna struktura tablice. Tekst postoji, ali nije složen u pravilne stupce. Umjesto nečitljive radne knjige, uključite gore „Uključi i tekst izvan tablica” ili upotrijebite „PDF u Word”, koji bolje čuva odlomke.';

  @override
  String get pdfToExcelResultTitle => 'Radna knjiga je gotova';

  @override
  String get pdfToExcelExportWhat => 'Excelova radna knjiga';

  @override
  String get pdfToExcelConvertAction => 'Pretvori u Excel';

  @override
  String resultNameAndSize(String name, String size) {
    return '$name — $size';
  }

  @override
  String get pdfToPptxEmptyTitle => 'Jedan slajd po stranici';

  @override
  String get pdfToPptxEmptyBody =>
      'PDF postaje potpuno jednaka PowerPoint prezentacija. Svaka stranica dolazi kao slika: raspored je vjeran, ali se tekst u PowerPointu neće moći uređivati.';

  @override
  String pdfToPptxOpenFailed(String detail) {
    return 'Ovaj PDF nije bilo moguće otvoriti: $detail';
  }

  @override
  String get pdfToPptxConverting => 'Pretvaranje u PowerPoint…';

  @override
  String pdfToPptxPagesToSlides(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count stranica',
      few: '$count stranice',
      one: '$count stranica',
    );
    String _temp1 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count slajdova',
      few: '$count slajda',
      one: '$count slajd',
    );
    return '$_temp0 > $_temp1';
  }

  @override
  String get pdfToPptxEmptyDocument => 'Prazan dokument';

  @override
  String get qualityLabel => 'Kvaliteta';

  @override
  String get pdfToPptxQualityHint =>
      'Viša razlučivost daje oštrije slajdove, ali osjetno težu datoteku.';

  @override
  String pdfToPptxHeavyWarning(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count stranica',
      few: '$count stranice',
      one: '$count stranice',
    );
    return 'Pozor: u visokoj kvaliteti prezentacija od $_temp0 može težiti desetke MB i sporo se otvarati. Ako niste sigurni, odaberite Standardnu.';
  }

  @override
  String get goodToKnow => 'Dobro je znati';

  @override
  String get pdfToPptxCaveat =>
      'Svaki je slajd slika stranice: raspored je jednak PDF-u, ali se tekst u PowerPointu neće moći uređivati.\nZa tekst koji se može uređivati radije upotrijebite „PDF u Word”.\nPrezentacija ima samo jednu veličinu slajda: preuzima se s prve stranice, a stranice druge veličine centriraju se unutar nje.';

  @override
  String get pdfToPptxResultTitle => 'Prezentacija je gotova';

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
      other: '$count slajdova',
      few: '$count slajda',
      one: '$count slajd',
    );
    return '$name — $_temp0 · $size · $quality';
  }

  @override
  String get notSavedYet =>
      'Datoteka još nije na vašem uređaju: spremite je ili je podijelite.';

  @override
  String get pdfToPptxChangeQuality => 'Promijeni kvalitetu';

  @override
  String get pdfToPptxConvertAction => 'Pretvori u PowerPoint';

  @override
  String pdfToPptxExportWhat(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count slajdova',
      few: '$count slajda',
      one: '$count slajd',
    );
    return 'PowerPoint prezentacija · $_temp0';
  }

  @override
  String get formatLabel => 'Format';

  @override
  String get actionExport => 'Izvezi';

  @override
  String get imageQualityWeb => 'Web (72 dpi)';

  @override
  String get imageQualityStandard => 'Standardna (150 dpi)';

  @override
  String get imageQualityHigh => 'Visoka kvaliteta (300 dpi)';

  @override
  String get pdfToImagesEmptyTitle => 'Jedna slika po stranici';

  @override
  String get pdfToImagesEmptyBody =>
      'Odaberite PDF: svaka će stranica izaći kao slika, u razlučivosti koju zatim postavite.';

  @override
  String pdfToImagesNotAPdf(String name) {
    return '$name: odaberite PDF datoteku.';
  }

  @override
  String errorLoadFailed(String detail) {
    return 'Učitavanje nije uspjelo: $detail';
  }

  @override
  String get pdfToImagesProgress => 'Izvoz u tijeku…';

  @override
  String pdfToImagesExportWhat(int count, String format) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count $format slika',
      few: '$count $format slike',
      one: '$count $format slika',
    );
    return '$_temp0';
  }

  @override
  String get pdfaEmptyTitle => 'Arhiviraj nadugo';

  @override
  String get pdfaEmptyBody =>
      'PDF/A je format arhiviranja koji traže mnoge ustanove. Dokument se pretvara bez gubitka izgleda.';

  @override
  String get pdfaConformanceLevel => 'Razina usklađenosti';

  @override
  String get pdfaA1bDetail =>
      'Najstroža i najšire prihvaćena razina. Odaberite je ako niste sigurni.';

  @override
  String get pdfaA2bDetail =>
      'Temelji se na PDF-u 1.7: učinkovitije sažimanje, nešto lakše datoteke.';

  @override
  String get pdfaA3bDetail =>
      'Kao A-2b, ali dopušta privitke (često se traži za elektroničko izdavanje računa).';

  @override
  String pdfaConvertingTo(String level) {
    return 'Pretvaranje u $level…';
  }

  @override
  String get pdfaCaveatTitle => 'Što pretvaranje mijenja';

  @override
  String pdfaCaveat(int dpi) {
    return 'Svaka se stranica iznova iscrtava kao slika pri $dpi dpi: tekst postaje slika, a raspored se fiksira. Upravo to čini datoteku doista usklađenom bez ovisnosti o pismima izvornog dokumenta, ali zauzvrat se tekst više ne može označiti ni pretraživati, poveznice i obrasci nestaju, a datoteka postaje teža.';
  }

  @override
  String pdfaOpenFailed(String detail) {
    return 'Ovaj PDF nije bilo moguće otvoriti: $detail';
  }

  @override
  String get imagesToPdfEmptyTitle => 'Slike u jednom PDF-u';

  @override
  String get imagesToPdfEmptyBody =>
      'JPG, PNG, WebP, HEIC — dodajte svoje slike i složit će se redoslijedom koji odaberete.';

  @override
  String get imagesToPdfChoose => 'Odaberi slike';

  @override
  String get imagesToPdfAdd => 'Dodaj slike';

  @override
  String imagesToPdfRejected(String names) {
    return 'Preskočeno (nije slika): $names';
  }

  @override
  String get imagesToPdfBuilding => 'Izrada PDF-a…';

  @override
  String imagesToPdfBuildFailed(String detail) {
    return 'Izrada nije uspjela: $detail';
  }

  @override
  String imagesToPdfCreateAction(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count slika',
      few: '$count slike',
      one: '$count slika',
    );
    return 'Izradi PDF ($_temp0)';
  }

  @override
  String get actionRotate => 'Zakreni';

  @override
  String get actionRemove => 'Ukloni';

  @override
  String get htmlTitle => 'HTML / web stranica u PDF';

  @override
  String get htmlIntro =>
      'Pretvorite web stranicu ili HTML kod u PDF formata A4. Prikaz obavlja preglednik ugrađen u Android, pa je raspored onakav kakav bi bio pri ispisu iz Chromea.';

  @override
  String get htmlModeUrl => 'Web adresa';

  @override
  String get htmlModeCode => 'HTML kod';

  @override
  String get htmlUrlLabel => 'Adresa stranice';

  @override
  String get htmlUrlHint => 'https://primjer.hr/clanak';

  @override
  String get htmlCodeLabel => 'HTML kod';

  @override
  String get htmlCodeHint => '<h1>Naslov</h1>\n<p>Tekst…</p>';

  @override
  String get htmlUrlBadScheme =>
      'Adresa mora počinjati s http:// ili https://.';

  @override
  String get htmlUrlIncomplete => 'Unesite potpunu web adresu.';

  @override
  String get htmlCodeEmpty => 'Zalijepite HTML kod za pretvaranje.';

  @override
  String get htmlLoadingUrl => 'Učitavanje stranice i pretvaranje…';

  @override
  String get htmlConverting => 'Pretvaranje HTML-a…';

  @override
  String get htmlNetworkNotice =>
      'Potrebna je internetska veza: ovo je jedini alat u aplikaciji koji mora preuzeti stranicu. Stranice koje traže prijavu, traku s kolačićima ili mnogo JavaScripta mogu ispasti nepotpune.';

  @override
  String get htmlOfflineNotice =>
      'HTML i CSS napisani izravno u stranici prikazuju se bez veze. Nasuprot tome, slike, stilski predlošci ili pisma koja se dohvaćaju s vanjske web adrese traže internetsku vezu.';

  @override
  String get watermarkEmptyTitle => 'Stavi vodeni žig';

  @override
  String get watermarkEmptyBody =>
      'Tekst po vašem izboru ponavlja se u pozadini svih stranica — da dokument označite kao povjerljiv ili kao nacrt.';

  @override
  String get watermarkEmptyNote =>
      'Izvoz je besplatan i bez ograničenja broja.';

  @override
  String get watermarkTextLabel => 'Tekst vodenog žiga';

  @override
  String get watermarkDefaultText => 'POVJERLJIVO';

  @override
  String get watermarkNeedText => 'Unesite tekst vodenog žiga.';

  @override
  String watermarkOpacity(int percent) {
    return 'Neprozirnost: $percent %';
  }

  @override
  String watermarkRotation(int degrees) {
    return 'Kut zakretanja: $degrees°';
  }

  @override
  String watermarkFontSize(int points) {
    return 'Veličina teksta: $points pt';
  }

  @override
  String get watermarkColor => 'Boja';

  @override
  String get colorGrey => 'Siva';

  @override
  String get colorRed => 'Crvena';

  @override
  String get colorBlue => 'Plava';

  @override
  String get colorBlack => 'Crna';

  @override
  String get watermarkProgress => 'Postavljanje vodenog žiga…';

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
  String get pageNumbersEmptyTitle => 'Numeriraj stranice';

  @override
  String get pageNumbersEmptyBody =>
      'Odaberite PDF, pa položaj i oblik brojeva koji će se dodati na svaku stranicu.';

  @override
  String get positionLabel => 'Položaj';

  @override
  String get positionBottomCenter => 'Dolje sredina';

  @override
  String get positionBottomRight => 'Dolje desno';

  @override
  String get positionTopCenter => 'Gore sredina';

  @override
  String get positionTopRight => 'Gore desno';

  @override
  String get pageNumbersFormatPlain => 'N';

  @override
  String get pageNumbersFormatOfTotal => 'N / ukupno';

  @override
  String get pageNumbersStart => 'Početni broj';

  @override
  String get pageNumbersProgress => 'Numeriranje u tijeku…';

  @override
  String get organizeEmptyTitle => 'Uzmi PDF ponovno u ruke';

  @override
  String get organizeEmptyBody =>
      'Otvorite dokument da ga podijelite, izdvojite stranice ili im promijenite redoslijed.';

  @override
  String get organizeOpenFile => 'Otvori datoteku';

  @override
  String get organizeNothingToExport => 'Nema stranice za izvoz.';

  @override
  String organizePagesKept(int kept, int total) {
    String _temp0 = intl.Intl.pluralLogic(
      kept,
      locale: localeName,
      other: 'zadržano $kept stranica',
      few: 'zadržane $kept stranice',
      one: 'zadržana $kept stranica',
    );
    return '$_temp0 od $total';
  }

  @override
  String get organizePageExcluded => 'Izostavljena';

  @override
  String organizePageMoved(int from) {
    return 'Premještena s položaja $from';
  }

  @override
  String organizePageTitle(int number) {
    return 'Stranica $number';
  }

  @override
  String organizeExcludePage(int number) {
    return 'Izostavi stranicu $number';
  }

  @override
  String organizeIncludePage(int number) {
    return 'Uključi stranicu $number';
  }

  @override
  String organizeMovePage(int number) {
    return 'Premjesti stranicu $number';
  }

  @override
  String get organizeExtract => 'Izdvoji';

  @override
  String get organizeSplit => 'Podijeli';

  @override
  String get organizePreview => 'Pretpregled';

  @override
  String get organizeExtractTitle => 'Izdvoji raspon stranica';

  @override
  String organizeRangeLabel(int start, int end) {
    return 'Stranice $start do $end';
  }

  @override
  String get organizeSplitTitle => 'Podijeli u više datoteka';

  @override
  String organizeFileCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count datoteka',
      few: '$count datoteke',
      one: '$count datoteka',
    );
    return '$_temp0';
  }

  @override
  String organizeSplitFailed(String detail) {
    return 'Dijeljenje nije uspjelo: $detail';
  }

  @override
  String get scanNoCamera => 'Na ovom uređaju nema dostupne kamere.';

  @override
  String scanCameraFailed(String detail) {
    return 'Kameru nije bilo moguće pokrenuti: $detail';
  }

  @override
  String get scanCropToolbar => 'Prilagodi';

  @override
  String scanCaptureFailed(String detail) {
    return 'Snimanje nije uspjelo: $detail';
  }

  @override
  String get scanPermissionBody =>
      'Za skeniranje dokumenta potreban je pristup kameri.';

  @override
  String get scanGrantPermission => 'Dopusti kameru';

  @override
  String get actionRetry => 'Pokušaj ponovno';

  @override
  String get scanNoPageYet => 'Zasad nema nijedne stranice.';

  @override
  String scanFinishAction(int count) {
    return 'Završi · $count';
  }

  @override
  String get signTitle => 'Potpiši PDF';

  @override
  String get signIntro =>
      'Stavite svoj rukom nacrtan potpis na stranicu PDF-a. To je samo crtež dodan dokumentu, a ne ovjeren elektronički potpis.';

  @override
  String get signChooseSubtitle => 'Odaberite dokument za potpisivanje';

  @override
  String get signPickPage => 'Odaberite stranicu za potpisivanje.';

  @override
  String get signDrawTitle => 'Nacrtaj moj potpis';

  @override
  String get signDrawBody =>
      'Crtajte prstom kao po papiru. Time se na stranicu stavlja crtež — to nije ovjeren elektronički potpis.';

  @override
  String get signNeedDrawing => 'Nacrtajte potpis prije nego što nastavite.';

  @override
  String get signClear => 'Očisti';

  @override
  String get signValidate => 'Potvrdi';

  @override
  String get signPlaceBody =>
      'Povucite potpis na željeno mjesto na stranici, pa dodirnite Završi.';

  @override
  String get signPageUnavailable => 'Stranicu nije bilo moguće prikazati.';

  @override
  String get signProgress => 'Dodavanje potpisa…';

  @override
  String get editTitle => 'Zabilježi na dokumentu';

  @override
  String get editEmptyBody =>
      'Dodajte tekst ili istaknite dijelove izravno na postojećem PDF-u.';

  @override
  String get editAddTextTitle => 'Dodaj tekst';

  @override
  String get editTextHint => 'Vaš tekst';

  @override
  String editFontSize(int size) {
    return 'Veličina teksta: $size';
  }

  @override
  String get editNeedAnnotation =>
      'Dodajte barem jednu bilješku prije nego što završite.';

  @override
  String get editProgress => 'Primjena bilježaka…';

  @override
  String get editChooseOther => 'Odaberi drugi PDF';

  @override
  String get editUndoTooltip => 'Poništi posljednju bilješku';

  @override
  String get editModeText => 'Tekst';

  @override
  String get editModeHighlight => 'Istakni';

  @override
  String get editPageUnavailable => 'Ovu stranicu nije bilo moguće prikazati.';

  @override
  String get ocrEmptyTitle => 'Učini tekst pretraživim';

  @override
  String get ocrEmptyBody =>
      'Tekst skeniranog PDF-a prepoznaje se i nevidljivo dodaje preko slike. Izgled stranice se ne mijenja.';

  @override
  String get ocrWrongFormat => 'Odaberite PDF ili sliku (JPG, PNG…).';

  @override
  String get ocrProgress => 'Prepoznavanje u tijeku…';

  @override
  String ocrFailed(String detail) {
    return 'Prepoznavanje nije uspjelo: $detail';
  }

  @override
  String get ocrRunAction => 'Pokreni prepoznavanje';

  @override
  String get ocrResultTitle => 'Rezultat OCR-a';

  @override
  String ocrResultBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'analizirano $count stranica',
      few: 'analizirane $count stranice',
      one: 'analizirana $count stranica',
    );
    return '$_temp0. Pretraživi PDF je gotov, a možete kopirati i sav prepoznati tekst.';
  }

  @override
  String get ocrCopyText => 'Kopiraj tekst';

  @override
  String get ocrTextCopied => 'Tekst je kopiran.';

  @override
  String get redactIntro =>
      'Trajno sakrijte dijelove PDF-a (imena, adrese, iznose). Za razliku od običnog crnog pravokutnika stavljenog preko, skriveni se tekst doista uklanja iz datoteke, a ne samo prekriva: više se ne može označiti ni kopirati.';

  @override
  String get redactChooseSubtitle => 'Odaberite dokument za zacrnjivanje';

  @override
  String get redactCaveat =>
      'Dobro je znati: da bi se skriveni tekst uklonio, svaka se stranica dokumenta ponovno pretvara u sliku (200 dpi). Rezultat stoga više nije PDF u kojem se može označiti tekst, a dobivena je datoteka obično teža od izvorne.';

  @override
  String get redactEmptyPdf => 'Ovaj PDF ne sadrži nijednu stranicu.';

  @override
  String redactOpenFailed(String detail) {
    return 'Ovaj PDF nije bilo moguće otvoriti (možda je zaštićen lozinkom): $detail';
  }

  @override
  String redactPageRenderFailed(int number, String detail) {
    return 'Stranicu $number nije bilo moguće prikazati: $detail';
  }

  @override
  String get redactUndoTooltip => 'Poništi posljednje područje';

  @override
  String get redactInstructions =>
      'Povucite prstom po stranici da ocrtate područje za skrivanje. Prekriveni će se tekst doista ukloniti iz datoteke, a ne samo prekriti.';

  @override
  String get redactPagePrevious => 'Prethodna stranica';

  @override
  String get redactPageNext => 'Sljedeća stranica';

  @override
  String redactPager(int current, int total) {
    return 'Stranica $current / $total';
  }

  @override
  String get redactNoZone => 'Nije ocrtano nijedno područje';

  @override
  String redactZoneCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count područja za skrivanje',
      few: '$count područja za skrivanje',
      one: '$count područje za skrivanje',
    );
    return '$_temp0';
  }

  @override
  String get redactOtherPdf => 'Drugi PDF';

  @override
  String get redactAction => 'Zacrni';

  @override
  String get redactProgress => 'Zacrnjivanje u tijeku…';

  @override
  String get cropEmptyTitle => 'Obreži margine';

  @override
  String get cropEmptyBody =>
      'Odaberite PDF, pa povucite prstom po pretpregledu da odredite područje koje se zadržava.';

  @override
  String get cropTooSmall => 'Odabrano je područje premalo.';

  @override
  String get cropProgress => 'Obrezivanje u tijeku…';

  @override
  String cropFailed(String detail) {
    return 'Obrezivanje nije uspjelo: $detail';
  }

  @override
  String get cropKeptArea => 'Zadržano područje';

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
  String get cropFullPage => 'Cijela stranica';

  @override
  String get cropAllPages => 'Primijeni na sve stranice';

  @override
  String get cropAllPagesOn => 'Na svakoj se stranici izrezuje isto područje.';

  @override
  String get cropAllPagesOff =>
      'Obrezuje se samo stranica 1, ostale ostaju cijele.';

  @override
  String get cropCaveat =>
      'Obrezivanje smanjuje stranicu: sadržaj izvan područja više se ne prikazuje niti ispisuje.';

  @override
  String get cropAction => 'Obreži';

  @override
  String get compareTitle => 'Usporedi dva PDF-a';

  @override
  String get compareEmptyTitle => 'Što se promijenilo';

  @override
  String get compareEmptyBody =>
      'Odaberite dvije inačice istog PDF-a. Dodani i uklonjeni dijelovi bit će postavljeni jedan uz drugi, stranicu po stranicu.';

  @override
  String get compareSlotA => 'Datoteka A';

  @override
  String get compareSlotB => 'Datoteka B';

  @override
  String get compareAction => 'Usporedi';

  @override
  String get compareProgress => 'Usporedba u tijeku…';

  @override
  String compareFailed(String detail) {
    return 'Usporedba nije uspjela: $detail';
  }

  @override
  String compareChangedPages(int changed, int total) {
    String _temp0 = intl.Intl.pluralLogic(
      changed,
      locale: localeName,
      other: '$changed stranica se razlikuje',
      few: '$changed stranice se razlikuju',
      one: '$changed stranica se razlikuje',
    );
    return '$_temp0 od $total';
  }

  @override
  String get compareNoDifference =>
      'Između dviju datoteka nije pronađena nijedna razlika.';

  @override
  String comparePageHeading(int number) {
    return 'Stranica $number';
  }

  @override
  String organizeFilesCreated(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'izrađeno $count datoteka',
      few: 'izrađene $count datoteke',
      one: 'izrađena $count datoteka',
    );
    return '$_temp0';
  }

  @override
  String organizePartTitle(int number) {
    return 'Dio $number';
  }
}
