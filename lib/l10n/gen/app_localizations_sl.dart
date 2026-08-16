// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Slovenian (`sl`).
class LSl extends L {
  LSl([String locale = 'sl']) : super(locale);

  @override
  String get appTitle => 'Trombone — PDF, skeniranje in Word';

  @override
  String get appWordmark => 'Trombone';

  @override
  String get actionSave => 'Shrani';

  @override
  String get actionShare => 'Deli';

  @override
  String get actionCompress => 'Pomanjšaj';

  @override
  String get actionDone => 'Končano';

  @override
  String get actionCancel => 'Prekliči';

  @override
  String get actionChange => 'Zamenjaj';

  @override
  String get actionContinue => 'Naprej';

  @override
  String get actionOpening => 'Odpiranje…';

  @override
  String get actionRemoveFile => 'Odstrani to datoteko';

  @override
  String get progressPreparing => 'Pripravljanje…';

  @override
  String progressPercent(int percent) {
    return '$percent %';
  }

  @override
  String get emptyReassurance =>
      'Izvoz je brezplačen, brez vodnega žiga in brez omejitev.';

  @override
  String get emptyAcceptedFormats => 'Podprte oblike';

  @override
  String get exportSavedTitle => 'Shranjeno.';

  @override
  String get exportSavedBody =>
      'Pod imenom in v mapo, ki ste ju pravkar izbrali. Brez vodnega žiga, brez omejitev, ničesar ni treba odklepati.';

  @override
  String get exportSaveDialogTitle => 'Shrani PDF';

  @override
  String pageTileIncluded(int number) {
    return 'Stran $number, vključena. Dotaknite se, da jo izpustite.';
  }

  @override
  String pageTileExcluded(int number) {
    return 'Stran $number, izpuščena. Dotaknite se, da jo vključite.';
  }

  @override
  String pageTileRotate(int number) {
    return 'Zavrti stran $number';
  }

  @override
  String sectionHeaderSemantics(String title, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count orodij',
      few: '$count orodja',
      two: '$count orodji',
      one: '$count orodje',
    );
    return '$title, $_temp0';
  }

  @override
  String toolCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count orodij',
      few: '$count orodja',
      two: '$count orodji',
      one: '$count orodje',
    );
    return '$_temp0';
  }

  @override
  String get homePromise =>
      'Sestavite dokument in ga izvozite.\nBrez plačljivih ovir na koncu.';

  @override
  String get homeChipNoAccount => 'Brez računa';

  @override
  String get homeChipNoWatermark => 'Brez vodnega žiga';

  @override
  String get homeChipUnlimited => 'Neomejen izvoz';

  @override
  String get homeSearchTooltip => 'Poišči orodje';

  @override
  String get homeColophon =>
      'Pri shranjevanju se nič ne odklepa s plačilom. Izvoz je brezplačen, brez vodnega žiga in brez omejitev.';

  @override
  String get sectionFeatured => 'Izpostavljeno';

  @override
  String get sectionToPdf => 'V PDF';

  @override
  String get sectionFromPdf => 'Iz PDF-ja';

  @override
  String get sectionSecurity => 'Varnost';

  @override
  String get sectionEdit => 'Urejanje';

  @override
  String get toolMerge => 'Združi';

  @override
  String get toolMergeKeywords => 'zdruzevanje spoji sestavi povezi dodaj';

  @override
  String get toolMergeSubtitle =>
      'PDF, Word, slike in besedilo v enem dokumentu';

  @override
  String get toolRectoVerso => 'Obojestransko';

  @override
  String get toolRectoVersoKeywords =>
      'dupleks prepletanje skeniranje sode lihe dve strani';

  @override
  String get toolRectoVersoSubtitle => 'Dva skena, spet v pravem vrstnem redu';

  @override
  String get toolImagesToPdf => 'Slike v PDF';

  @override
  String get toolImagesToPdfKeywords =>
      'fotografija jpg jpeg png slike album kamera';

  @override
  String get toolImagesToPdfSubtitle =>
      'Fotografije in posnetki zaslona v enem dokumentu';

  @override
  String get toolPdfToWord => 'PDF v Word';

  @override
  String get toolPdfToWordKeywords =>
      'docx urejevalnik besedila urejljivo pretvori doc';

  @override
  String get toolPdfToWordSubtitle =>
      'Besedilo in tabele, z možnostjo urejanja';

  @override
  String get toolOrganize => 'Uredi PDF';

  @override
  String get toolOrganizeKeywords =>
      'razdeli loci izlusci prerazporedi vrstni red strani izbrisi';

  @override
  String get toolOrganizeSubtitle => 'Deljenje, izluščanje, razporejanje';

  @override
  String get toolExcelToPdf => 'Excel v PDF';

  @override
  String get toolExcelToPdfKeywords => 'preglednica xlsx delovni zvezek list';

  @override
  String get toolPptxToPdf => 'PowerPoint v PDF';

  @override
  String get toolPptxToPdfKeywords => 'pptx prosojnica predstavitev slides';

  @override
  String get toolHtmlToPdf => 'Spletna stran v PDF';

  @override
  String get toolHtmlToPdfKeywords => 'html splet internet url povezava clanek';

  @override
  String get toolScan => 'Skeniraj dokument';

  @override
  String get toolScanKeywords =>
      'kamera fotografija digitaliziraj skener papir';

  @override
  String get toolPdfToExcel => 'PDF v Excel';

  @override
  String get toolPdfToExcelKeywords =>
      'preglednica xlsx tabela izlusci podatke';

  @override
  String get toolPdfToPptx => 'PDF v PowerPoint';

  @override
  String get toolPdfToPptxKeywords => 'pptx prosojnica predstavitev slides';

  @override
  String get toolPdfToImages => 'PDF v slike';

  @override
  String get toolPdfToImagesKeywords =>
      'jpg png fotografija izvozi posnetek zaslona slika';

  @override
  String get toolOcr => 'Besedilo za iskanje (OCR)';

  @override
  String get toolOcrKeywords => 'prepoznavanje znaki skenirano kopiraj oznaci';

  @override
  String get toolPdfA => 'Pretvori v PDF/A';

  @override
  String get toolPdfAKeywords => 'arhiviranje standard dolgorocna hramba iso';

  @override
  String get toolProtect => 'Zaščiti PDF';

  @override
  String get toolProtectKeywords =>
      'geslo kljucavnica sifriraj zakleni zascita';

  @override
  String get toolUnlock => 'Odkleni PDF';

  @override
  String get toolUnlockKeywords =>
      'odstrani geslo odpri desifriraj odkleni kljucavnica';

  @override
  String get toolRepair => 'Popravi PDF';

  @override
  String get toolRepairKeywords =>
      'poskodovan neberljiv pokvarjen obnovi napaka';

  @override
  String get toolRedact => 'Prekrij v PDF-ju';

  @override
  String get toolRedactKeywords =>
      'skrij pocrni anonimiziraj zaupno izbrisi cenzura';

  @override
  String get toolEdit => 'Uredi besedilo v PDF-ju';

  @override
  String get toolEditKeywords => 'besedilo spremeni popravi opomba pisi';

  @override
  String get toolSign => 'Podpiši';

  @override
  String get toolSignKeywords => 'podpis parafa pogodba roka';

  @override
  String get toolWatermark => 'Vodni žig';

  @override
  String get toolWatermarkKeywords => 'watermark zig zaupno osnutek oznaka';

  @override
  String get toolPageNumbers => 'Številke strani';

  @override
  String get toolPageNumbersKeywords =>
      'oštevilčenje paginacija ostevilci stevilke';

  @override
  String get toolCrop => 'Obreži PDF';

  @override
  String get toolCropKeywords => 'rezanje robovi obrezovanje velikost';

  @override
  String get toolCompare => 'Primerjaj PDF-je';

  @override
  String get toolCompareKeywords =>
      'razlika razlicice diff spremembe primerjaj';

  @override
  String get searchHint => 'Združi, geslo, vodni žig…';

  @override
  String get searchClear => 'Počisti';

  @override
  String searchNoResultTitle(String query) {
    return 'Za »$query« ni nobenega orodja.';
  }

  @override
  String get searchNoResultBody =>
      'Poskusite z obliko, ki jo imate pri roki — »Word«, »Excel«, »fotografija« — ali s tem, kar želite narediti: »podpiši«, »razdeli«, »geslo«.';

  @override
  String get actionUndo => 'Razveljavi';

  @override
  String get actionApply => 'Uporabi';

  @override
  String get actionChoose => 'Izberi';

  @override
  String get actionChoosePdf => 'Izberi PDF';

  @override
  String get actionChooseFiles => 'Izberi datoteke';

  @override
  String get actionConvert => 'Pretvori';

  @override
  String get actionFinish => 'Zaključi';

  @override
  String get actionBack => 'Nazaj';

  @override
  String get actionAdd => 'Dodaj';

  @override
  String get noFileChosen => 'Nobena datoteka ni izbrana';

  @override
  String errorExportFailed(String detail) {
    return 'Izvoz ni uspel: $detail';
  }

  @override
  String errorShareFailed(String detail) {
    return 'Deljenje ni uspelo: $detail';
  }

  @override
  String errorOpenFailed(String detail) {
    return 'Datoteke ni bilo mogoče odpreti: $detail';
  }

  @override
  String errorConversionFailed(String detail) {
    return 'Pretvorba ni uspela: $detail';
  }

  @override
  String errorOnFile(String name, String detail) {
    return '$name: $detail';
  }

  @override
  String get errorPickPdf => 'Izberite datoteko PDF.';

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
      other: '$count strani',
      few: '$count strani',
      two: '$count strani',
      one: '$count stran',
    );
    return '$_temp0';
  }

  @override
  String pageCountOfTotal(int kept, int total) {
    String _temp0 = intl.Intl.pluralLogic(
      kept,
      locale: localeName,
      other: '$kept strani',
      few: '$kept strani',
      two: '$kept strani',
      one: '$kept stran',
    );
    return '$_temp0 od $total';
  }

  @override
  String pageOfTotal(int current, int total) {
    return 'Stran $current od $total';
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
  String get formatText => 'Besedilo';

  @override
  String get mergeAddFile => 'Dodaj datoteko';

  @override
  String get mergeAddHint => 'PDF, Word, slike ali besedilo';

  @override
  String get mergeEmptyTitle => 'En sam dokument';

  @override
  String get mergeEmptyBody =>
      'Dodajte PDF-je, Wordove datoteke, slike ali besedilo. Pred izvozom jih lahko prerazporedite in izpustite strani.';

  @override
  String get mergeNeedOnePage =>
      'Dodajte vsaj eno datoteko s stranjo za vključitev.';

  @override
  String get mergeProgress => 'Združevanje…';

  @override
  String mergeFailed(String detail) {
    return 'Združevanje ni uspelo: $detail';
  }

  @override
  String mergeRemoved(String name) {
    return '$name odstranjena.';
  }

  @override
  String mergeRemoveTooltip(String name) {
    return 'Odstrani $name';
  }

  @override
  String mergeMoveSemantics(String name) {
    return 'Premakni $name';
  }

  @override
  String get mergeRotateAll => 'Zavrti vse strani';

  @override
  String mergePreviewAndExport(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count strani',
      few: '$count strani',
      two: '$count strani',
      one: '$count stran',
    );
    return 'Predogled in izvoz ($_temp0)';
  }

  @override
  String previewTitle(String size) {
    return 'Predogled · $size';
  }

  @override
  String previewZoomPage(int number) {
    return 'Stran $number, povečaj';
  }

  @override
  String get previewPageUnreadable => 'Strani ni mogoče prebrati.';

  @override
  String previewExportWhat(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count strani',
      few: '$count strani',
      two: '$count strani',
      one: '$count stran',
    );
    return 'PDF · $_temp0';
  }

  @override
  String get compressTitle => 'Pomanjšanje';

  @override
  String compressBody(String size) {
    return 'Trenutna velikost: $size. Izberite raven — ocenjena velikost se pokaže pred uporabo.';
  }

  @override
  String get compressEstimating => 'Ocenjevanje…';

  @override
  String get compressProgress => 'Pomanjševanje…';

  @override
  String compressFailed(String detail) {
    return 'Pomanjšanje ni uspelo: $detail';
  }

  @override
  String get protectEmptyTitle => 'Zakleni z geslom';

  @override
  String get protectEmptyBody =>
      'PDF se brez gesla, ki ga izberete, ne bo več odprl. Shranite ga: obnoviti ga ni mogoče.';

  @override
  String get protectSubtitle => 'Šifriran bo z AES 256 bitov';

  @override
  String get protectPassword => 'Geslo';

  @override
  String get protectConfirmPassword => 'Potrdi geslo';

  @override
  String get protectShowPasswords => 'Pokaži gesli';

  @override
  String get protectHidePasswords => 'Skrij gesli';

  @override
  String get protectMismatch => 'Gesli se razlikujeta.';

  @override
  String get protectWarning =>
      'Zapišite si ga: brez njega dokument za vedno postane neberljiv. Obnovitev ni mogoča — ne z vaše strani ne s strani aplikacije.';

  @override
  String get protectAlreadyProtected =>
      'Ta datoteka je že zaščitena — najprej uporabite Odkleni PDF.';

  @override
  String get protectProgress => 'Zaščita poteka…';

  @override
  String protectFailed(String detail) {
    return 'Zaščita ni uspela: $detail';
  }

  @override
  String get protectAction => 'Zaščiti';

  @override
  String get protectResultTitle => 'PDF je zaščiten';

  @override
  String get protectResultDetail =>
      'Šifriran z AES 256 bitov. Za odpiranje bo potrebno geslo.';

  @override
  String get protectExportWhat => 'PDF, zaščiten z geslom';

  @override
  String get unlockEmptyTitle => 'Odstrani geslo';

  @override
  String get unlockEmptyBody =>
      'Potrebujete trenutno geslo dokumenta. Ko je odstranjeno, se PDF odpira prosto.';

  @override
  String get unlockAcceptsProtectedPdf => 'Zaščiten PDF';

  @override
  String get unlockChooseProtectedPdf => 'Izberi zaščiten PDF';

  @override
  String get unlockCurrentPassword => 'Trenutno geslo';

  @override
  String get unlockWrongPassword => 'Napačno geslo.';

  @override
  String get unlockProgress => 'Odklepanje…';

  @override
  String unlockFailed(String detail) {
    return 'Odklepanje ni uspelo: $detail';
  }

  @override
  String get unlockAction => 'Odkleni';

  @override
  String get repairEmptyTitle => 'Popravi poškodovano datoteko';

  @override
  String get repairEmptyBody =>
      'Notranja zgradba poškodovanega PDF-ja se sestavi znova. Kar je mogoče rešiti, bo rešeno.';

  @override
  String get repairProgress => 'Popravljanje…';

  @override
  String get repairFailed =>
      'Te datoteke ni mogoče popraviti — morda je preveč poškodovana.';

  @override
  String get repairAction => 'Popravi';

  @override
  String get pdfToWordEmptyTitle => 'Word, ki ga je mogoče urejati';

  @override
  String get pdfToWordEmptyBody =>
      'Besedilo in struktura PDF-ja se preneseta v dokument .docx, ki ga lahko znova odprete in urejate.';

  @override
  String get pdfToWordAnalyzing => 'Analiza dokumenta…';

  @override
  String get pdfToWordAnalysisPending => 'Analiza čaka';

  @override
  String pdfToWordAnalysisFailed(String detail) {
    return 'Analiza ni uspela: $detail';
  }

  @override
  String get pdfLocked => 'Ta PDF je zaščiten z geslom. Najprej ga odklenite.';

  @override
  String get pdfToWordConverting => 'Pretvarjanje v Word…';

  @override
  String get pdfToWordSummaryTitle => 'Najdena vsebina';

  @override
  String pdfToWordParagraphCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count odstavkov',
      few: '$count odstavki',
      two: '$count odstavka',
      one: '$count odstavek',
    );
    return '$_temp0';
  }

  @override
  String pdfToWordHeadingCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count naslovov',
      few: '$count naslovi',
      two: '$count naslova',
      one: '$count naslov',
    );
    return '$_temp0';
  }

  @override
  String pdfToWordTableCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count tabel',
      few: '$count tabele',
      two: '$count tabeli',
      one: '$count tabela',
    );
    return '$_temp0';
  }

  @override
  String get pdfToWordNoTables =>
      'Nobena tabela ni bila najdena: če jo vaš PDF vsebuje, bodo njene vrstice pretvorjene v odstavke.';

  @override
  String get pdfToWordCaveat =>
      'Pretvorba prenese besedilo, oblikovanje in tabele, ne pa tudi natančne postavitve: položaj slik in stolpcev se ne ohrani, slike pa ne preidejo v Wordov dokument.';

  @override
  String get pdfToWordScanWarning =>
      'Ta PDF je videti kot sken: nobenega besedila ni bilo najdenega. Najprej uporabite orodje Besedilo za iskanje (OCR), nato se vrnite in pretvorite dobljeni PDF.';

  @override
  String get pdfToWordResultTitle => 'Wordov dokument je pripravljen';

  @override
  String pdfToWordResultDetail(String name, String size) {
    return '$name — $size';
  }

  @override
  String get pdfToWordExportWhat => 'Wordov dokument';

  @override
  String get pdfToWordConvertAction => 'Pretvori v Word';

  @override
  String get actionConvertAgain => 'Pretvori znova';

  @override
  String errorSaveFailed(String detail) {
    return 'Shranjevanje ni bilo mogoče: $detail';
  }

  @override
  String get rectoVersoIntro =>
      'Enostranski podajalnik da dve datoteki: lihe strani po vrsti, sode pa pogosto v obratnem vrstnem redu. Izberite obe, da se dokument spet sestavi.';

  @override
  String get rectoVersoOddSlot => 'Datoteka z lihimi stranmi (sprednja stran)';

  @override
  String get rectoVersoEvenSlot => 'Datoteka s sodimi stranmi (hrbtna stran)';

  @override
  String get rectoVersoReversed => 'Druga datoteka je v obratnem vrstnem redu';

  @override
  String get rectoVersoReversedHint =>
      'To je najpogostejši primer, zato je vnaprej označeno';

  @override
  String rectoVersoPreview(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count strani',
      few: '$count strani',
      two: '$count strani',
      one: '$count stran',
    );
    return 'Predogled prepletanja ($_temp0)';
  }

  @override
  String get rectoVersoProgress => 'Prepletanje…';

  @override
  String fileWithPageCount(String name, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count strani',
      few: '$count strani',
      two: '$count strani',
      one: '$count stran',
    );
    return '$name · $_temp0';
  }

  @override
  String get actionPreviewAndExport => 'Predogled in izvoz';

  @override
  String errorOpenFailedShort(String detail) {
    return 'Odpiranje ni bilo mogoče: $detail';
  }

  @override
  String errorGeneric(String detail) {
    return 'Ni uspelo: $detail';
  }

  @override
  String get actionConvertToPdf => 'Pretvori v PDF';

  @override
  String get convertProgress => 'Pretvarjanje…';

  @override
  String get excelEmptyTitle => 'Delovni zvezek kot PDF';

  @override
  String get excelEmptyBody =>
      'Listi datoteke .xlsx postanejo strani PDF, pripravljene za pošiljanje ali tiskanje.';

  @override
  String get excelChooseWorkbook => 'Izberi delovni zvezek';

  @override
  String get excelChooseXlsx => 'Izberi delovni zvezek .xlsx';

  @override
  String get excelLegacyFormat =>
      'Oblika .xls (stara dvojiška Excelova oblika) ni podprta. Shranite datoteko kot .xlsx in poskusite znova.';

  @override
  String get excelWrongFormat =>
      'Izberite Excelov delovni zvezek v obliki .xlsx.';

  @override
  String excelUnreadable(String detail) {
    return 'Delovnega zvezka ni mogoče prebrati: $detail';
  }

  @override
  String excelSheetsAndRows(int sheets, int rows) {
    String _temp0 = intl.Intl.pluralLogic(
      sheets,
      locale: localeName,
      other: '$sheets listov',
      few: '$sheets listi',
      two: '$sheets lista',
      one: '$sheets list',
    );
    String _temp1 = intl.Intl.pluralLogic(
      rows,
      locale: localeName,
      other: '$rows vrstic',
      few: '$rows vrstice',
      two: '$rows vrstici',
      one: '$rows vrstica',
    );
    return '$_temp0 · skupaj $_temp1';
  }

  @override
  String get excelSheetsDetected => 'Najdeni listi';

  @override
  String get excelEmptySheet => 'Prazen list';

  @override
  String excelSheetDimensions(int rows, int columns) {
    String _temp0 = intl.Intl.pluralLogic(
      rows,
      locale: localeName,
      other: '$rows vrstic',
      few: '$rows vrstice',
      two: '$rows vrstici',
      one: '$rows vrstica',
    );
    String _temp1 = intl.Intl.pluralLogic(
      columns,
      locale: localeName,
      other: '$columns stolpcev',
      few: '$columns stolpci',
      two: '$columns stolpca',
      one: '$columns stolpec',
    );
    return '$_temp0 × $_temp1';
  }

  @override
  String get excelRepeatHeader => 'Ponovi vrstico glave na vsaki strani';

  @override
  String get excelRepeatHeaderHint =>
      'Prva vrstica lista se znova izriše na vrhu vsake strani tabele.';

  @override
  String get excelCaveat =>
      'Kaj pretvorba prenese: besedilo celic tako, kot je shranjeno v datoteki (vključno z zadnjim izračunanim rezultatom formul), prvo vrstico krepko in mrežo.\n\nČesa ne: barv, pisav, oblik števil, spojenih celic, slik, grafikonov in samih formul. Stolpci se zožijo, da se prilegajo širini strani; na zelo širokih listih se besedilo preozkih celic skrajša z »…«.';

  @override
  String get pptxEmptyTitle => 'Predstavitev kot PDF';

  @override
  String get pptxEmptyBody =>
      'Ena ležeča stran 16:9 na prosojnico, z naslovom in alinejami. Besedilo se prenese; izvorne slike, oblike in ozadja ne.\n\nPodprta oblika: .pptx. Starejšo datoteko .ppt je treba najprej shraniti kot .pptx iz PowerPointa.';

  @override
  String get pptxChoosePresentation => 'Izberi predstavitev';

  @override
  String get pptxTextOnlyTitle => 'Pretvori se le besedilo';

  @override
  String get pptxTextOnlyBody =>
      'Besedilo vsake prosojnice se prenese. Izvorne slike, oblike, ozadja, barve in postavitve se ne ohranijo: dobljeni PDF je preprosta in berljiva postavitev, ne zvesta kopija vaše predstavitve.';

  @override
  String pptxSlideCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count prosojnic',
      few: '$count prosojnice',
      two: '$count prosojnici',
      one: '$count prosojnica',
    );
    return '$_temp0';
  }

  @override
  String get pptxSlidesDetected => 'Najdene prosojnice';

  @override
  String pptxMoreSlides(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count prosojnic',
      few: '$count prosojnice',
      two: '$count prosojnici',
      one: '$count prosojnica',
    );
    return 'in še $_temp0…';
  }

  @override
  String get pptxUntitledSlide => 'Brez naslova';

  @override
  String get pptxEmptySlide => 'Brez besedila (samo slika ali oblika)';

  @override
  String pptxTextLineCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count vrstic besedila',
      few: '$count vrstice besedila',
      two: '$count vrstici besedila',
      one: '$count vrstica besedila',
    );
    return '$_temp0';
  }

  @override
  String pptxReadFailed(String detail) {
    return 'Branje ni bilo mogoče: $detail';
  }

  @override
  String get compressLevelLight => 'Rahlo';

  @override
  String get compressLevelMedium => 'Srednje';

  @override
  String get compressLevelStrong => 'Močno';

  @override
  String get pptxQualityStandard => 'Standardna (150 dpi)';

  @override
  String get pptxQualityHigh => 'Visoka (220 dpi)';

  @override
  String get pdfToExcelEmptyTitle => 'Vrni tabele';

  @override
  String get pdfToExcelEmptyBody =>
      'Tabele iz PDF-ja se izluščijo v Excelov delovni zvezek. Oblikovanje se ne ohrani, vrednosti pa da.';

  @override
  String pdfToExcelPagesAnalyzed(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'analiziranih $count strani',
      few: 'analizirane $count strani',
      two: 'analizirani $count strani',
      one: 'analizirana $count stran',
    );
    return '$_temp0';
  }

  @override
  String pdfToExcelAnalysisFailed(String detail) {
    return 'Analiza ni mogoča. PDF je morda zaščiten z geslom ali poškodovan. ($detail)';
  }

  @override
  String get pdfToExcelNothingToExport =>
      'Ni kaj izvoziti: nobena tabela ni bila najdena.';

  @override
  String get pdfToExcelBuilding => 'Ustvarjanje delovnega zvezka…';

  @override
  String get pdfToExcelIncludeParagraphs =>
      'Vključi tudi besedilo zunaj tabel (ena vrstica na odstavek)';

  @override
  String get pdfToExcelIncludeParagraphsHint =>
      'Uporabno pri polstrukturiranem dokumentu: besedilo pride v stolpec A, za tabelami te strani.';

  @override
  String get pdfToExcelCaveatTitle => 'Česa pretvorba ne ohrani';

  @override
  String get pdfToExcelCaveat =>
      'Zaznavanje se opira na položaj besedila na strani: tabele brez pravilnega obrobja, spojene celice in zelo nepravilni stolpci se lahko napačno razdelijo. Skeniran PDF (slika) ne vsebuje besedila, ki bi ga bilo mogoče izluščiti, in ne bo dal ničesar. Barve, formule in slike se ne prenesejo nikoli: le besedilne vrednosti.';

  @override
  String pdfToExcelTablesFound(int tables, int pages) {
    String _temp0 = intl.Intl.pluralLogic(
      tables,
      locale: localeName,
      other: 'najdenih $tables tabel',
      few: 'najdene $tables tabele',
      two: 'najdeni $tables tabeli',
      one: 'najdena $tables tabela',
    );
    String _temp1 = intl.Intl.pluralLogic(
      pages,
      locale: localeName,
      other: '$pages straneh',
      few: '$pages straneh',
      two: '$pages straneh',
      one: '$pages strani',
    );
    return '$_temp0 na $_temp1';
  }

  @override
  String pdfToExcelPagesConcerned(String pages) {
    return 'Zadevne strani: $pages';
  }

  @override
  String pdfToExcelParagraphsOutside(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count odstavkov zunaj tabel',
      few: '$count odstavki zunaj tabel',
      two: '$count odstavka zunaj tabel',
      one: '$count odstavek zunaj tabel',
    );
    return '$_temp0';
  }

  @override
  String get pdfToExcelScannedWarning =>
      'Iz tega PDF-ja ni bilo mogoče izluščiti besedila: skoraj zagotovo gre za skeniran dokument (slike strani). Preglednica iz njega ne more ničesar potegniti; najprej uporabite orodje za prepoznavanje besedila (OCR).';

  @override
  String get pdfToExcelNoTableWarning =>
      'V tem dokumentu ni bila prepoznana nobena zgradba tabele. Besedilo je tu, a ni razporejeno v pravilne stolpce. Namesto neberljivega delovnega zvezka raje zgoraj vklopite »Vključi tudi besedilo zunaj tabel« ali uporabite »PDF v Word«, ki bolje ohranja odstavke.';

  @override
  String get pdfToExcelResultTitle => 'Delovni zvezek je pripravljen';

  @override
  String get pdfToExcelExportWhat => 'Excelov delovni zvezek';

  @override
  String get pdfToExcelConvertAction => 'Pretvori v Excel';

  @override
  String resultNameAndSize(String name, String size) {
    return '$name — $size';
  }

  @override
  String get pdfToPptxEmptyTitle => 'Ena prosojnica na stran';

  @override
  String get pdfToPptxEmptyBody =>
      'PDF postane povsem enaka PowerPointova predstavitev. Vsaka stran pride kot slika: postavitev je zvesta, besedila pa v PowerPointu ne bo mogoče urejati.';

  @override
  String pdfToPptxOpenFailed(String detail) {
    return 'Tega PDF-ja ni bilo mogoče odpreti: $detail';
  }

  @override
  String get pdfToPptxConverting => 'Pretvarjanje v PowerPoint…';

  @override
  String pdfToPptxPagesToSlides(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count strani',
      few: '$count strani',
      two: '$count strani',
      one: '$count stran',
    );
    String _temp1 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count prosojnic',
      few: '$count prosojnice',
      two: '$count prosojnici',
      one: '$count prosojnica',
    );
    return '$_temp0 > $_temp1';
  }

  @override
  String get pdfToPptxEmptyDocument => 'Prazen dokument';

  @override
  String get qualityLabel => 'Kakovost';

  @override
  String get pdfToPptxQualityHint =>
      'Višja ločljivost da ostrejše prosojnice, a občutno težjo datoteko.';

  @override
  String pdfToPptxHeavyWarning(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count stranmi',
      few: '$count stranmi',
      two: '$count stranema',
      one: '$count stranjo',
    );
    return 'Pozor: pri visoki kakovosti lahko predstavitev z $_temp0 tehta več deset MB in se dolgo odpira. Če niste prepričani, izberite Standardno.';
  }

  @override
  String get goodToKnow => 'Dobro je vedeti';

  @override
  String get pdfToPptxCaveat =>
      'Vsaka prosojnica je slika strani: postavitev je enaka kot v PDF-ju, besedila pa v PowerPointu ne bo mogoče urejati.\nZa besedilo, ki ga je mogoče urejati, raje uporabite »PDF v Word«.\nPredstavitev ima le eno velikost prosojnice: prevzame se s prve strani, strani drugačne velikosti pa se poravnajo na sredino.';

  @override
  String get pdfToPptxResultTitle => 'Predstavitev je pripravljena';

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
      other: '$count prosojnic',
      few: '$count prosojnice',
      two: '$count prosojnici',
      one: '$count prosojnica',
    );
    return '$name — $_temp0 · $size · $quality';
  }

  @override
  String get notSavedYet =>
      'Datoteke še ni v vaši napravi: shranite jo ali jo delite.';

  @override
  String get pdfToPptxChangeQuality => 'Spremeni kakovost';

  @override
  String get pdfToPptxConvertAction => 'Pretvori v PowerPoint';

  @override
  String pdfToPptxExportWhat(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count prosojnic',
      few: '$count prosojnice',
      two: '$count prosojnici',
      one: '$count prosojnica',
    );
    return 'PowerPointova predstavitev · $_temp0';
  }

  @override
  String get formatLabel => 'Oblika';

  @override
  String get actionExport => 'Izvozi';

  @override
  String get imageQualityWeb => 'Splet (72 dpi)';

  @override
  String get imageQualityStandard => 'Standardna (150 dpi)';

  @override
  String get imageQualityHigh => 'Visoka kakovost (300 dpi)';

  @override
  String get pdfToImagesEmptyTitle => 'Ena slika na stran';

  @override
  String get pdfToImagesEmptyBody =>
      'Izberite PDF: vsaka stran bo prišla ven kot slika, v ločljivosti, ki jo nastavite zatem.';

  @override
  String pdfToImagesNotAPdf(String name) {
    return '$name: izberite datoteko PDF.';
  }

  @override
  String errorLoadFailed(String detail) {
    return 'Nalaganje ni uspelo: $detail';
  }

  @override
  String get pdfToImagesProgress => 'Izvažanje…';

  @override
  String pdfToImagesExportWhat(int count, String format) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count slik $format',
      few: '$count slike $format',
      two: '$count sliki $format',
      one: '$count slika $format',
    );
    return '$_temp0';
  }

  @override
  String get pdfaEmptyTitle => 'Arhiviraj za dolgo';

  @override
  String get pdfaEmptyBody =>
      'PDF/A je oblika za arhiviranje, ki jo zahtevajo mnoge ustanove. Dokument se pretvori, ne da bi izgubil svoj videz.';

  @override
  String get pdfaConformanceLevel => 'Raven skladnosti';

  @override
  String get pdfaA1bDetail =>
      'Najstrožja in najširše sprejeta raven. Izberite jo, če niste prepričani.';

  @override
  String get pdfaA2bDetail =>
      'Temelji na PDF 1.7: učinkovitejše stiskanje, nekoliko lažje datoteke.';

  @override
  String get pdfaA3bDetail =>
      'Kot A-2b, a dopušča priloge (pogosto zahtevano pri elektronskem izdajanju računov).';

  @override
  String pdfaConvertingTo(String level) {
    return 'Pretvarjanje v $level…';
  }

  @override
  String get pdfaCaveatTitle => 'Kaj pretvorba spremeni';

  @override
  String pdfaCaveat(int dpi) {
    return 'Vsaka stran se znova izriše kot slika pri $dpi dpi: besedilo postane slika, postavitev pa se ustali. Prav to naredi datoteko resnično skladno, ne da bi bila odvisna od pisav izvornega dokumenta, v zameno pa besedila ni več mogoče označiti ali iskati, povezave in obrazci izginejo, datoteka pa postane težja.';
  }

  @override
  String pdfaOpenFailed(String detail) {
    return 'Tega PDF-ja ni bilo mogoče odpreti: $detail';
  }

  @override
  String get imagesToPdfEmptyTitle => 'Slike v enem PDF-ju';

  @override
  String get imagesToPdfEmptyBody =>
      'JPG, PNG, WebP, HEIC — dodajte svoje slike in sestavile se bodo v vrstnem redu, ki ga izberete.';

  @override
  String get imagesToPdfChoose => 'Izberi slike';

  @override
  String get imagesToPdfAdd => 'Dodaj slike';

  @override
  String imagesToPdfRejected(String names) {
    return 'Preskočeno (ni slika): $names';
  }

  @override
  String get imagesToPdfBuilding => 'Ustvarjanje PDF-ja…';

  @override
  String imagesToPdfBuildFailed(String detail) {
    return 'Ustvarjanje ni uspelo: $detail';
  }

  @override
  String imagesToPdfCreateAction(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count slik',
      few: '$count slike',
      two: '$count sliki',
      one: '$count slika',
    );
    return 'Ustvari PDF ($_temp0)';
  }

  @override
  String get actionRotate => 'Zavrti';

  @override
  String get actionRemove => 'Odstrani';

  @override
  String get htmlTitle => 'HTML / spletna stran v PDF';

  @override
  String get htmlIntro =>
      'Spremenite spletno stran ali kodo HTML v PDF velikosti A4. Izris opravi brskalnik, vgrajen v Android, zato je postavitev takšna kot pri tiskanju iz Chroma.';

  @override
  String get htmlModeUrl => 'Spletni naslov';

  @override
  String get htmlModeCode => 'Koda HTML';

  @override
  String get htmlUrlLabel => 'Naslov strani';

  @override
  String get htmlUrlHint => 'https://primer.si/clanek';

  @override
  String get htmlCodeLabel => 'Koda HTML';

  @override
  String get htmlCodeHint => '<h1>Naslov</h1>\n<p>Besedilo…</p>';

  @override
  String get htmlUrlBadScheme =>
      'Naslov se mora začeti s http:// ali https://.';

  @override
  String get htmlUrlIncomplete => 'Vnesite celoten spletni naslov.';

  @override
  String get htmlCodeEmpty => 'Prilepite kodo HTML za pretvorbo.';

  @override
  String get htmlLoadingUrl => 'Nalaganje strani in pretvarjanje…';

  @override
  String get htmlConverting => 'Pretvarjanje HTML-ja…';

  @override
  String get htmlNetworkNotice =>
      'Potrebna je internetna povezava: to je edino orodje v aplikaciji, ki mora prenesti stran. Strani, ki zahtevajo prijavo, pasico o piškotkih ali veliko JavaScripta, lahko pridejo nepopolne.';

  @override
  String get htmlOfflineNotice =>
      'HTML in CSS, zapisana neposredno v strani, se izrišeta brez povezave. Nasprotno pa slike, slogovne predloge ali pisave, ki se pridobijo z zunanjega spletnega naslova, potrebujejo internetno povezavo.';

  @override
  String get watermarkEmptyTitle => 'Dodaj vodni žig';

  @override
  String get watermarkEmptyBody =>
      'Besedilo po vaši izbiri se ponavlja v ozadju vseh strani — da dokument označite kot zaupen ali kot osnutek.';

  @override
  String get watermarkEmptyNote => 'Izvoz je brezplačen in brez omejitev.';

  @override
  String get watermarkTextLabel => 'Besedilo vodnega žiga';

  @override
  String get watermarkDefaultText => 'ZAUPNO';

  @override
  String get watermarkNeedText => 'Vnesite besedilo vodnega žiga.';

  @override
  String watermarkOpacity(int percent) {
    return 'Motnost: $percent %';
  }

  @override
  String watermarkRotation(int degrees) {
    return 'Kot zasuka: $degrees°';
  }

  @override
  String watermarkFontSize(int points) {
    return 'Velikost besedila: $points pt';
  }

  @override
  String get watermarkColor => 'Barva';

  @override
  String get colorGrey => 'Siva';

  @override
  String get colorRed => 'Rdeča';

  @override
  String get colorBlue => 'Modra';

  @override
  String get colorBlack => 'Črna';

  @override
  String get watermarkProgress => 'Dodajanje vodnega žiga…';

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
  String get pageNumbersEmptyTitle => 'Oštevilči strani';

  @override
  String get pageNumbersEmptyBody =>
      'Izberite PDF, nato položaj in obliko številk, ki bodo dodane na vsako stran.';

  @override
  String get positionLabel => 'Položaj';

  @override
  String get positionBottomCenter => 'Spodaj na sredini';

  @override
  String get positionBottomRight => 'Spodaj desno';

  @override
  String get positionTopCenter => 'Zgoraj na sredini';

  @override
  String get positionTopRight => 'Zgoraj desno';

  @override
  String get pageNumbersFormatPlain => 'N';

  @override
  String get pageNumbersFormatOfTotal => 'N / skupaj';

  @override
  String get pageNumbersStart => 'Začetna številka';

  @override
  String get pageNumbersProgress => 'Oštevilčevanje…';

  @override
  String get organizeEmptyTitle => 'Vzemi PDF spet v roke';

  @override
  String get organizeEmptyBody =>
      'Odprite dokument, da ga razdelite, iz njega izluščite strani ali jim spremenite vrstni red.';

  @override
  String get organizeOpenFile => 'Odpri datoteko';

  @override
  String get organizeNothingToExport => 'Ni strani za izvoz.';

  @override
  String organizePagesKept(int kept, int total) {
    String _temp0 = intl.Intl.pluralLogic(
      kept,
      locale: localeName,
      other: 'ohranjenih $kept strani',
      few: 'ohranjene $kept strani',
      two: 'ohranjeni $kept strani',
      one: 'ohranjena $kept stran',
    );
    return '$_temp0 od $total';
  }

  @override
  String get organizePageExcluded => 'Izpuščena';

  @override
  String organizePageMoved(int from) {
    return 'Premaknjena s položaja $from';
  }

  @override
  String organizePageTitle(int number) {
    return 'Stran $number';
  }

  @override
  String organizeExcludePage(int number) {
    return 'Izpusti stran $number';
  }

  @override
  String organizeIncludePage(int number) {
    return 'Vključi stran $number';
  }

  @override
  String organizeMovePage(int number) {
    return 'Premakni stran $number';
  }

  @override
  String get organizeExtract => 'Izlušči';

  @override
  String get organizeSplit => 'Razdeli';

  @override
  String get organizePreview => 'Predogled';

  @override
  String get organizeExtractTitle => 'Izlušči obseg strani';

  @override
  String organizeRangeLabel(int start, int end) {
    return 'Strani od $start do $end';
  }

  @override
  String get organizeSplitTitle => 'Razdeli na več datotek';

  @override
  String organizeFileCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count datotek',
      few: '$count datoteke',
      two: '$count datoteki',
      one: '$count datoteka',
    );
    return '$_temp0';
  }

  @override
  String organizeSplitFailed(String detail) {
    return 'Deljenje ni uspelo: $detail';
  }

  @override
  String get scanNoCamera => 'V tej napravi ni na voljo nobene kamere.';

  @override
  String scanCameraFailed(String detail) {
    return 'Kamere ni bilo mogoče zagnati: $detail';
  }

  @override
  String get scanCropToolbar => 'Prilagodi';

  @override
  String scanCaptureFailed(String detail) {
    return 'Zajem ni uspel: $detail';
  }

  @override
  String get scanPermissionBody =>
      'Za skeniranje dokumenta je potreben dostop do kamere.';

  @override
  String get scanGrantPermission => 'Dovoli kamero';

  @override
  String get actionRetry => 'Poskusi znova';

  @override
  String get scanNoPageYet => 'Zaenkrat še nobene strani.';

  @override
  String scanFinishAction(int count) {
    return 'Zaključi · $count';
  }

  @override
  String get signTitle => 'Podpiši PDF';

  @override
  String get signIntro =>
      'Na stran PDF-ja postavite svoj ročno narisan podpis. To je zgolj risba, dodana dokumentu, ne pa overjen elektronski podpis.';

  @override
  String get signChooseSubtitle => 'Izberite dokument za podpis';

  @override
  String get signPickPage => 'Izberite stran za podpis.';

  @override
  String get signDrawTitle => 'Nariši moj podpis';

  @override
  String get signDrawBody =>
      'Rišite s prstom kot po papirju. S tem na stran postavite risbo — to ni overjen elektronski podpis.';

  @override
  String get signNeedDrawing => 'Narišite podpis, preden nadaljujete.';

  @override
  String get signClear => 'Počisti';

  @override
  String get signValidate => 'Potrdi';

  @override
  String get signPlaceBody =>
      'Povlecite podpis na želeno mesto na strani, nato se dotaknite Zaključi.';

  @override
  String get signPageUnavailable => 'Strani ni bilo mogoče prikazati.';

  @override
  String get signProgress => 'Dodajanje podpisa…';

  @override
  String get editTitle => 'Označi dokument';

  @override
  String get editEmptyBody =>
      'Dodajajte besedilo ali označujte odlomke neposredno na obstoječem PDF-ju.';

  @override
  String get editAddTextTitle => 'Dodaj besedilo';

  @override
  String get editTextHint => 'Vaše besedilo';

  @override
  String editFontSize(int size) {
    return 'Velikost besedila: $size';
  }

  @override
  String get editNeedAnnotation =>
      'Preden zaključite, dodajte vsaj eno opombo.';

  @override
  String get editProgress => 'Uveljavljanje opomb…';

  @override
  String get editChooseOther => 'Izberi drug PDF';

  @override
  String get editUndoTooltip => 'Razveljavi zadnjo opombo';

  @override
  String get editModeText => 'Besedilo';

  @override
  String get editModeHighlight => 'Označi';

  @override
  String get editPageUnavailable => 'Te strani ni bilo mogoče prikazati.';

  @override
  String get ocrEmptyTitle => 'Naredi besedilo iskljivo';

  @override
  String get ocrEmptyBody =>
      'Besedilo skeniranega PDF-ja se prepozna in nevidno doda čez sliko. Videz strani se ne spremeni.';

  @override
  String get ocrWrongFormat => 'Izberite PDF ali sliko (JPG, PNG…).';

  @override
  String get ocrProgress => 'Prepoznavanje…';

  @override
  String ocrFailed(String detail) {
    return 'Prepoznavanje ni uspelo: $detail';
  }

  @override
  String get ocrRunAction => 'Zaženi prepoznavanje';

  @override
  String get ocrResultTitle => 'Rezultat OCR';

  @override
  String ocrResultBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'analiziranih $count strani',
      few: 'analizirane $count strani',
      two: 'analizirani $count strani',
      one: 'analizirana $count stran',
    );
    return '$_temp0. PDF za iskanje je pripravljen, prepoznano besedilo pa lahko tudi kopirate.';
  }

  @override
  String get ocrCopyText => 'Kopiraj besedilo';

  @override
  String get ocrTextCopied => 'Besedilo je kopirano.';

  @override
  String get redactIntro =>
      'Trajno skrijte dele PDF-ja (imena, naslove, zneske). Za razliko od preprostega črnega pravokotnika, položenega čez, se skrito besedilo iz datoteke zares odstrani, ne le prekrije: ni ga več mogoče označiti ali kopirati.';

  @override
  String get redactChooseSubtitle => 'Izberite dokument za prekrivanje';

  @override
  String get redactCaveat =>
      'Dobro je vedeti: da se skrito besedilo odstrani, se vsaka stran dokumenta znova pretvori v sliko (200 dpi). Rezultat zato ni več PDF, v katerem bi bilo mogoče označiti besedilo, dobljena datoteka pa je navadno težja od izvirne.';

  @override
  String get redactEmptyPdf => 'Ta PDF ne vsebuje nobene strani.';

  @override
  String redactOpenFailed(String detail) {
    return 'Tega PDF-ja ni bilo mogoče odpreti (morda je zaščiten z geslom): $detail';
  }

  @override
  String redactPageRenderFailed(int number, String detail) {
    return 'Strani $number ni bilo mogoče prikazati: $detail';
  }

  @override
  String get redactUndoTooltip => 'Razveljavi zadnje območje';

  @override
  String get redactInstructions =>
      'Povlecite s prstom po strani, da začrtate območje za skritje. Prekrito besedilo bo iz datoteke zares odstranjeno, ne le prekrito.';

  @override
  String get redactPagePrevious => 'Prejšnja stran';

  @override
  String get redactPageNext => 'Naslednja stran';

  @override
  String redactPager(int current, int total) {
    return 'Stran $current / $total';
  }

  @override
  String get redactNoZone => 'Nobeno območje ni začrtano';

  @override
  String redactZoneCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count območij za skritje',
      few: '$count območja za skritje',
      two: '$count območji za skritje',
      one: '$count območje za skritje',
    );
    return '$_temp0';
  }

  @override
  String get redactOtherPdf => 'Drug PDF';

  @override
  String get redactAction => 'Prekrij';

  @override
  String get redactProgress => 'Prekrivanje…';

  @override
  String get cropEmptyTitle => 'Obreži robove';

  @override
  String get cropEmptyBody =>
      'Izberite PDF, nato povlecite s prstom po predogledu, da določite območje, ki naj se ohrani.';

  @override
  String get cropTooSmall => 'Izbrano območje je premajhno.';

  @override
  String get cropProgress => 'Obrezovanje…';

  @override
  String cropFailed(String detail) {
    return 'Obrezovanje ni uspelo: $detail';
  }

  @override
  String get cropKeptArea => 'Ohranjeno območje';

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
  String get cropFullPage => 'Cela stran';

  @override
  String get cropAllPages => 'Uporabi na vseh straneh';

  @override
  String get cropAllPagesOn => 'Na vsaki strani se izreže isto območje.';

  @override
  String get cropAllPagesOff => 'Obreže se le stran 1, druge ostanejo cele.';

  @override
  String get cropCaveat =>
      'Obrezovanje zmanjša stran: vsebina zunaj območja se ne prikazuje in ne tiska več.';

  @override
  String get cropAction => 'Obreži';

  @override
  String get compareTitle => 'Primerjaj dva PDF-ja';

  @override
  String get compareEmptyTitle => 'Kaj se je spremenilo';

  @override
  String get compareEmptyBody =>
      'Izberite dve različici istega PDF-ja. Dodani in odstranjeni odlomki bodo postavljeni drug ob drugega, stran za stranjo.';

  @override
  String get compareSlotA => 'Datoteka A';

  @override
  String get compareSlotB => 'Datoteka B';

  @override
  String get compareAction => 'Primerjaj';

  @override
  String get compareProgress => 'Primerjanje…';

  @override
  String compareFailed(String detail) {
    return 'Primerjava ni uspela: $detail';
  }

  @override
  String compareChangedPages(int changed, int total) {
    String _temp0 = intl.Intl.pluralLogic(
      changed,
      locale: localeName,
      other: '$changed strani se razlikuje',
      few: '$changed strani se razlikujejo',
      two: '$changed strani se razlikujeta',
      one: '$changed stran se razlikuje',
    );
    return '$_temp0 od $total';
  }

  @override
  String get compareNoDifference =>
      'Med datotekama ni bila zaznana nobena razlika.';

  @override
  String comparePageHeading(int number) {
    return 'Stran $number';
  }

  @override
  String organizeFilesCreated(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'ustvarjenih $count datotek',
      few: 'ustvarjene $count datoteke',
      two: 'ustvarjeni $count datoteki',
      one: 'ustvarjena $count datoteka',
    );
    return '$_temp0';
  }

  @override
  String organizePartTitle(int number) {
    return 'Del $number';
  }
}
