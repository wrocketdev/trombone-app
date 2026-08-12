// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Dutch Flemish (`nl`).
class LNl extends L {
  LNl([String locale = 'nl']) : super(locale);

  @override
  String get appTitle => 'Trombone — PDF, Scan & Word';

  @override
  String get appWordmark => 'Trombone';

  @override
  String get actionSave => 'Opslaan';

  @override
  String get actionShare => 'Delen';

  @override
  String get actionCompress => 'Verkleinen';

  @override
  String get actionDone => 'Klaar';

  @override
  String get actionCancel => 'Annuleren';

  @override
  String get actionChange => 'Wijzigen';

  @override
  String get actionContinue => 'Doorgaan';

  @override
  String get actionOpening => 'Bezig met openen…';

  @override
  String get actionRemoveFile => 'Dit bestand verwijderen';

  @override
  String get progressPreparing => 'Voorbereiden…';

  @override
  String progressPercent(int percent) {
    return '$percent%';
  }

  @override
  String get emptyReassurance =>
      'Gratis exporteren, zonder watermerk of limiet.';

  @override
  String get emptyAcceptedFormats => 'Toegestane formaten';

  @override
  String get exportSavedTitle => 'Opgeslagen.';

  @override
  String get exportSavedBody =>
      'Onder de naam en in de map die je zojuist hebt gekozen. Zonder watermerk, zonder limiet, niets te ontgrendelen.';

  @override
  String get exportSaveDialogTitle => 'Pdf opslaan';

  @override
  String pageTileIncluded(int number) {
    return 'Pagina $number, opgenomen. Tik om weg te laten.';
  }

  @override
  String pageTileExcluded(int number) {
    return 'Pagina $number, weggelaten. Tik om op te nemen.';
  }

  @override
  String pageTileRotate(int number) {
    return 'Pagina $number draaien';
  }

  @override
  String sectionHeaderSemantics(String title, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count hulpmiddelen',
      one: '$count hulpmiddel',
    );
    return '$title, $_temp0';
  }

  @override
  String toolCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count hulpmiddelen',
      one: '$count hulpmiddel',
    );
    return '$_temp0';
  }

  @override
  String get homePromise =>
      'Maak je document en exporteer het.\nGeen muur aan het eind.';

  @override
  String get homeChipNoAccount => 'Zonder account';

  @override
  String get homeChipNoWatermark => 'Zonder watermerk';

  @override
  String get homeChipUnlimited => 'Onbeperkt exporteren';

  @override
  String get homeSearchTooltip => 'Zoek een hulpmiddel';

  @override
  String get homeColophon =>
      'Bij het opslaan wordt niets tegen betaling ontgrendeld. Exporteren is gratis, zonder watermerk en zonder limiet op het aantal.';

  @override
  String get sectionFeatured => 'Uitgelicht';

  @override
  String get sectionToPdf => 'Naar pdf';

  @override
  String get sectionFromPdf => 'Vanuit pdf';

  @override
  String get sectionSecurity => 'Beveiliging';

  @override
  String get sectionEdit => 'Bewerken';

  @override
  String get toolMerge => 'Samenvoegen';

  @override
  String get toolMergeKeywords =>
      'combineren verbinden bundelen samenvoegen toevoegen';

  @override
  String get toolMergeSubtitle =>
      'Pdf, Word, afbeeldingen en tekst in één document';

  @override
  String get toolRectoVerso => 'Dubbelzijdig';

  @override
  String get toolRectoVersoKeywords =>
      'duplex sorteren scan even oneven twee zijden';

  @override
  String get toolRectoVersoSubtitle => 'Twee scans, weer op volgorde';

  @override
  String get toolImagesToPdf => 'Afbeeldingen naar pdf';

  @override
  String get toolImagesToPdfKeywords =>
      'foto jpg jpeg png fotos album camera afbeelding';

  @override
  String get toolImagesToPdfSubtitle =>
      'Foto’s en schermafbeeldingen in één document';

  @override
  String get toolPdfToWord => 'Pdf naar Word';

  @override
  String get toolPdfToWordKeywords =>
      'docx tekstverwerker bewerkbaar omzetten doc';

  @override
  String get toolPdfToWordSubtitle => 'Tekst en tabellen, bewerkbaar';

  @override
  String get toolOrganize => 'Pdf ordenen';

  @override
  String get toolOrganizeKeywords =>
      'splitsen scheiden uitnemen herschikken volgorde paginas verwijderen';

  @override
  String get toolOrganizeSubtitle => 'Splitsen, uitnemen, herschikken';

  @override
  String get toolExcelToPdf => 'Excel naar pdf';

  @override
  String get toolExcelToPdfKeywords =>
      'spreadsheet xlsx werkmap blad rekenblad';

  @override
  String get toolPptxToPdf => 'PowerPoint naar pdf';

  @override
  String get toolPptxToPdfKeywords => 'pptx dia presentatie slides';

  @override
  String get toolHtmlToPdf => 'Webpagina naar pdf';

  @override
  String get toolHtmlToPdfKeywords => 'html website internet url link artikel';

  @override
  String get toolScan => 'Document scannen';

  @override
  String get toolScanKeywords => 'camera foto digitaliseren scan papier';

  @override
  String get toolPdfToExcel => 'Pdf naar Excel';

  @override
  String get toolPdfToExcelKeywords =>
      'spreadsheet xlsx tabel uitnemen gegevens';

  @override
  String get toolPdfToPptx => 'Pdf naar PowerPoint';

  @override
  String get toolPdfToPptxKeywords => 'pptx dia presentatie slides';

  @override
  String get toolPdfToImages => 'Pdf naar afbeeldingen';

  @override
  String get toolPdfToImagesKeywords =>
      'jpg png foto exporteren schermafbeelding';

  @override
  String get toolOcr => 'Doorzoekbare tekst (OCR)';

  @override
  String get toolOcrKeywords =>
      'tekstherkenning tekens gescand kopieren selecteren';

  @override
  String get toolPdfA => 'Omzetten naar PDF/A';

  @override
  String get toolPdfAKeywords => 'archivering norm lange termijn bewaring iso';

  @override
  String get toolProtect => 'Pdf beveiligen';

  @override
  String get toolProtectKeywords =>
      'wachtwoord slot versleutelen vergrendelen beveiligen';

  @override
  String get toolUnlock => 'Pdf ontgrendelen';

  @override
  String get toolUnlockKeywords =>
      'wachtwoord verwijderen openen ontsleutelen slot';

  @override
  String get toolRepair => 'Pdf repareren';

  @override
  String get toolRepairKeywords =>
      'beschadigd onleesbaar kapot herstellen fout';

  @override
  String get toolRedact => 'Pdf onleesbaar maken';

  @override
  String get toolRedactKeywords =>
      'verbergen zwart maken anonimiseren vertrouwelijk wissen';

  @override
  String get toolEdit => 'Pdf bewerken';

  @override
  String get toolEditKeywords =>
      'tekst wijzigen corrigeren annoteren schrijven';

  @override
  String get toolSign => 'Ondertekenen';

  @override
  String get toolSignKeywords => 'handtekening paraaf contract hand';

  @override
  String get toolWatermark => 'Watermerk';

  @override
  String get toolWatermarkKeywords =>
      'watermark stempel vertrouwelijk concept markering';

  @override
  String get toolPageNumbers => 'Paginanummers';

  @override
  String get toolPageNumbersKeywords =>
      'paginering folio nummeren cijfers nummers';

  @override
  String get toolCrop => 'Pdf bijsnijden';

  @override
  String get toolCropKeywords => 'snijden marges bijsnijden randen grootte';

  @override
  String get toolCompare => 'Pdf’s vergelijken';

  @override
  String get toolCompareKeywords =>
      'verschil versies diff wijzigingen vergelijken';

  @override
  String get searchHint => 'Samenvoegen, wachtwoord, watermerk…';

  @override
  String get searchClear => 'Wissen';

  @override
  String searchNoResultTitle(String query) {
    return 'Geen hulpmiddel voor ‘$query’.';
  }

  @override
  String get searchNoResultBody =>
      'Probeer het formaat dat je bij de hand hebt — ‘Word’, ‘Excel’, ‘foto’ — of wat je ermee wilt doen: ‘ondertekenen’, ‘splitsen’, ‘wachtwoord’.';

  @override
  String get actionUndo => 'Ongedaan maken';

  @override
  String get actionApply => 'Toepassen';

  @override
  String get actionChoose => 'Kiezen';

  @override
  String get actionChoosePdf => 'Kies een pdf';

  @override
  String get actionChooseFiles => 'Kies bestanden';

  @override
  String get actionConvert => 'Omzetten';

  @override
  String get actionFinish => 'Voltooien';

  @override
  String get actionBack => 'Terug';

  @override
  String get actionAdd => 'Toevoegen';

  @override
  String get noFileChosen => 'Geen bestand gekozen';

  @override
  String errorExportFailed(String detail) {
    return 'Exporteren mislukt: $detail';
  }

  @override
  String errorShareFailed(String detail) {
    return 'Delen mislukt: $detail';
  }

  @override
  String errorOpenFailed(String detail) {
    return 'Het bestand kon niet worden geopend: $detail';
  }

  @override
  String errorConversionFailed(String detail) {
    return 'Omzetten mislukt: $detail';
  }

  @override
  String errorOnFile(String name, String detail) {
    return '$name: $detail';
  }

  @override
  String get errorPickPdf => 'Kies een pdf-bestand.';

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
      other: '$count pagina’s',
      one: '$count pagina',
    );
    return '$_temp0';
  }

  @override
  String pageCountOfTotal(int kept, int total) {
    String _temp0 = intl.Intl.pluralLogic(
      kept,
      locale: localeName,
      other: '$kept pagina’s',
      one: '$kept pagina',
    );
    return '$_temp0 van $total';
  }

  @override
  String pageOfTotal(int current, int total) {
    return 'Pagina $current van $total';
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
  String get formatImages => 'Afbeeldingen';

  @override
  String get formatText => 'Tekst';

  @override
  String get mergeAddFile => 'Bestand toevoegen';

  @override
  String get mergeAddHint => 'Pdf, Word, afbeeldingen of tekst';

  @override
  String get mergeEmptyTitle => 'Eén enkel document';

  @override
  String get mergeEmptyBody =>
      'Voeg pdf’s, Word-bestanden, afbeeldingen of tekst toe. Voor het exporteren kun je ze herschikken en pagina’s weglaten.';

  @override
  String get mergeNeedOnePage =>
      'Voeg ten minste één bestand met een op te nemen pagina toe.';

  @override
  String get mergeProgress => 'Bezig met samenvoegen…';

  @override
  String mergeFailed(String detail) {
    return 'Samenvoegen mislukt: $detail';
  }

  @override
  String mergeRemoved(String name) {
    return '$name verwijderd.';
  }

  @override
  String mergeRemoveTooltip(String name) {
    return '$name verwijderen';
  }

  @override
  String mergeMoveSemantics(String name) {
    return '$name verplaatsen';
  }

  @override
  String get mergeRotateAll => 'Alle pagina’s draaien';

  @override
  String mergePreviewAndExport(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count pagina’s',
      one: '$count pagina',
    );
    return 'Voorbeeld en exporteren ($_temp0)';
  }

  @override
  String previewTitle(String size) {
    return 'Voorbeeld · $size';
  }

  @override
  String previewZoomPage(int number) {
    return 'Pagina $number, vergroten';
  }

  @override
  String get previewPageUnreadable => 'Pagina onleesbaar.';

  @override
  String previewExportWhat(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count pagina’s',
      one: '$count pagina',
    );
    return 'PDF · $_temp0';
  }

  @override
  String get compressTitle => 'Verkleining';

  @override
  String compressBody(String size) {
    return 'Huidige grootte: $size. Kies een niveau — de geschatte grootte verschijnt voor het toepassen.';
  }

  @override
  String get compressEstimating => 'Bezig met schatten…';

  @override
  String get compressProgress => 'Bezig met verkleinen…';

  @override
  String compressFailed(String detail) {
    return 'Verkleinen mislukt: $detail';
  }

  @override
  String get protectEmptyTitle => 'Achter een wachtwoord zetten';

  @override
  String get protectEmptyBody =>
      'De pdf gaat niet meer open zonder het wachtwoord dat je kiest. Bewaar het: het kan niet worden hersteld.';

  @override
  String get protectSubtitle => 'Wordt versleuteld met AES 256-bit';

  @override
  String get protectPassword => 'Wachtwoord';

  @override
  String get protectConfirmPassword => 'Wachtwoord bevestigen';

  @override
  String get protectShowPasswords => 'Wachtwoorden tonen';

  @override
  String get protectHidePasswords => 'Wachtwoorden verbergen';

  @override
  String get protectMismatch => 'De twee wachtwoorden verschillen.';

  @override
  String get protectWarning =>
      'Schrijf het ergens op: zonder dat wachtwoord wordt het document voorgoed onleesbaar. Herstel is niet mogelijk, niet door jou en niet door de app.';

  @override
  String get protectAlreadyProtected =>
      'Dit bestand is al beveiligd — gebruik eerst Pdf ontgrendelen.';

  @override
  String get protectProgress => 'Bezig met beveiligen…';

  @override
  String protectFailed(String detail) {
    return 'Beveiligen mislukt: $detail';
  }

  @override
  String get protectAction => 'Beveiligen';

  @override
  String get protectResultTitle => 'Pdf beveiligd';

  @override
  String get protectResultDetail =>
      'Versleuteld met AES 256-bit. Het wachtwoord is nodig om hem te openen.';

  @override
  String get protectExportWhat => 'Met wachtwoord beveiligde pdf';

  @override
  String get unlockEmptyTitle => 'Het wachtwoord verwijderen';

  @override
  String get unlockEmptyBody =>
      'Je hebt het huidige wachtwoord van het document nodig. Eenmaal verwijderd gaat de pdf gewoon open.';

  @override
  String get unlockAcceptsProtectedPdf => 'Beveiligde pdf';

  @override
  String get unlockChooseProtectedPdf => 'Kies een beveiligde pdf';

  @override
  String get unlockCurrentPassword => 'Huidig wachtwoord';

  @override
  String get unlockWrongPassword => 'Onjuist wachtwoord.';

  @override
  String get unlockProgress => 'Bezig met ontgrendelen…';

  @override
  String unlockFailed(String detail) {
    return 'Ontgrendelen mislukt: $detail';
  }

  @override
  String get unlockAction => 'Ontgrendelen';

  @override
  String get repairEmptyTitle => 'Een beschadigd bestand repareren';

  @override
  String get repairEmptyBody =>
      'De interne structuur van een beschadigde pdf wordt opnieuw opgebouwd. Wat te redden valt, wordt gered.';

  @override
  String get repairProgress => 'Bezig met repareren…';

  @override
  String get repairFailed =>
      'Dit bestand kan niet worden gerepareerd — het is mogelijk te zwaar beschadigd.';

  @override
  String get repairAction => 'Repareren';

  @override
  String get pdfToWordEmptyTitle => 'Een bewerkbaar Word-bestand';

  @override
  String get pdfToWordEmptyBody =>
      'De tekst en de structuur van de pdf worden overgezet naar een .docx-document dat je opnieuw kunt openen en corrigeren.';

  @override
  String get pdfToWordAnalyzing => 'Document analyseren…';

  @override
  String get pdfToWordAnalysisPending => 'Analyse in afwachting';

  @override
  String pdfToWordAnalysisFailed(String detail) {
    return 'Analyse mislukt: $detail';
  }

  @override
  String get pdfLocked =>
      'Deze pdf is met een wachtwoord beveiligd. Ontgrendel hem eerst.';

  @override
  String get pdfToWordConverting => 'Omzetten naar Word…';

  @override
  String get pdfToWordSummaryTitle => 'Gevonden inhoud';

  @override
  String pdfToWordParagraphCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count alinea’s',
      one: '$count alinea',
    );
    return '$_temp0';
  }

  @override
  String pdfToWordHeadingCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count koppen',
      one: '$count kop',
    );
    return '$_temp0';
  }

  @override
  String pdfToWordTableCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count tabellen',
      one: '$count tabel',
    );
    return '$_temp0';
  }

  @override
  String get pdfToWordNoTables =>
      'Geen tabel gevonden: als je pdf er toch een bevat, worden de rijen ervan omgezet naar alinea’s.';

  @override
  String get pdfToWordCaveat =>
      'De omzetting geeft de tekst, de opmaak en de tabellen weer, maar niet de exacte lay-out: de plaats van afbeeldingen en kolommen blijft niet behouden, en afbeeldingen gaan niet mee naar het Word-document.';

  @override
  String get pdfToWordScanWarning =>
      'Deze pdf lijkt een scan: er is geen tekst gevonden. Gebruik eerst het hulpmiddel Doorzoekbare tekst (OCR) en zet daarna de verkregen pdf om.';

  @override
  String get pdfToWordResultTitle => 'Word-document klaar';

  @override
  String pdfToWordResultDetail(String name, String size) {
    return '$name — $size';
  }

  @override
  String get pdfToWordExportWhat => 'Word-document';

  @override
  String get pdfToWordConvertAction => 'Omzetten naar Word';

  @override
  String get actionConvertAgain => 'Opnieuw omzetten';

  @override
  String errorSaveFailed(String detail) {
    return 'Opslaan niet mogelijk: $detail';
  }

  @override
  String get rectoVersoIntro =>
      'Een enkelzijdige invoer levert twee bestanden op: de oneven pagina’s op volgorde, de even pagina’s vaak in omgekeerde volgorde. Kies ze allebei om ze weer samen te voegen.';

  @override
  String get rectoVersoOddSlot => 'Bestand met de oneven pagina’s (voorzijde)';

  @override
  String get rectoVersoEvenSlot => 'Bestand met de even pagina’s (achterzijde)';

  @override
  String get rectoVersoReversed =>
      'Het tweede bestand staat in omgekeerde volgorde';

  @override
  String get rectoVersoReversedHint =>
      'Dat is het gebruikelijke geval, daarom standaard aangevinkt';

  @override
  String rectoVersoPreview(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count pagina’s',
      one: '$count pagina',
    );
    return 'Voorbeeld van de samenvoeging ($_temp0)';
  }

  @override
  String get rectoVersoProgress => 'Bezig met samenvoegen…';

  @override
  String fileWithPageCount(String name, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count pagina’s',
      one: '$count pagina',
    );
    return '$name · $_temp0';
  }

  @override
  String get actionPreviewAndExport => 'Voorbeeld en exporteren';

  @override
  String errorOpenFailedShort(String detail) {
    return 'Openen niet mogelijk: $detail';
  }

  @override
  String errorGeneric(String detail) {
    return 'Mislukt: $detail';
  }

  @override
  String get actionConvertToPdf => 'Omzetten naar pdf';

  @override
  String get convertProgress => 'Bezig met omzetten…';

  @override
  String get excelEmptyTitle => 'Een werkmap als pdf';

  @override
  String get excelEmptyBody =>
      'De bladen van een .xlsx-bestand worden pdf-pagina’s, klaar om te versturen of af te drukken.';

  @override
  String get excelChooseWorkbook => 'Kies een werkmap';

  @override
  String get excelChooseXlsx => 'Kies een .xlsx-werkmap';

  @override
  String get excelLegacyFormat =>
      'Het formaat .xls (het oude binaire Excel-formaat) wordt niet ondersteund. Sla het bestand op als .xlsx en probeer het opnieuw.';

  @override
  String get excelWrongFormat => 'Kies een Excel-werkmap in .xlsx.';

  @override
  String excelUnreadable(String detail) {
    return 'Werkmap onleesbaar: $detail';
  }

  @override
  String excelSheetsAndRows(int sheets, int rows) {
    String _temp0 = intl.Intl.pluralLogic(
      sheets,
      locale: localeName,
      other: '$sheets bladen',
      one: '$sheets blad',
    );
    String _temp1 = intl.Intl.pluralLogic(
      rows,
      locale: localeName,
      other: '$rows rijen in totaal',
      one: '$rows rij in totaal',
    );
    return '$_temp0 · $_temp1';
  }

  @override
  String get excelSheetsDetected => 'Gevonden bladen';

  @override
  String get excelEmptySheet => 'Leeg blad';

  @override
  String excelSheetDimensions(int rows, int columns) {
    String _temp0 = intl.Intl.pluralLogic(
      rows,
      locale: localeName,
      other: '$rows rijen',
      one: '$rows rij',
    );
    String _temp1 = intl.Intl.pluralLogic(
      columns,
      locale: localeName,
      other: '$columns kolommen',
      one: '$columns kolom',
    );
    return '$_temp0 × $_temp1';
  }

  @override
  String get excelRepeatHeader => 'Kopregel op elke pagina herhalen';

  @override
  String get excelRepeatHeaderHint =>
      'De eerste rij van het blad wordt boven aan elke pagina van de tabel opnieuw getekend.';

  @override
  String get excelCaveat =>
      'Wat de omzetting overneemt: de celtekst zoals die in het bestand is opgeslagen (inclusief het laatst berekende resultaat van formules), de eerste rij vet en een raster.\n\nWat niet: kleuren, lettertypen, getalnotaties, samengevoegde cellen, afbeeldingen, grafieken en de formules zelf. Kolommen worden versmald om binnen de paginabreedte te passen; op zeer brede bladen wordt de tekst van te smalle cellen afgekapt met ‘…’.';

  @override
  String get pptxEmptyTitle => 'Een presentatie als pdf';

  @override
  String get pptxEmptyBody =>
      'Eén liggende 16:9-pagina per dia, met de titel en de opsommingstekens. De tekst wordt overgenomen; de oorspronkelijke afbeeldingen, vormen en achtergronden niet.\n\nToegestaan formaat: .pptx. Een ouder .ppt-bestand moet eerst in PowerPoint als .pptx worden opgeslagen.';

  @override
  String get pptxChoosePresentation => 'Kies een presentatie';

  @override
  String get pptxTextOnlyTitle => 'Alleen de tekst wordt omgezet';

  @override
  String get pptxTextOnlyBody =>
      'De tekst van elke dia wordt overgenomen. De oorspronkelijke afbeeldingen, vormen, achtergronden, kleuren en lay-outs blijven niet behouden: de verkregen pdf is een eenvoudige, leesbare lay-out, geen getrouwe kopie van je presentatie.';

  @override
  String pptxSlideCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count dia’s',
      one: '$count dia',
    );
    return '$_temp0';
  }

  @override
  String get pptxSlidesDetected => 'Gevonden dia’s';

  @override
  String pptxMoreSlides(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count dia’s',
      one: '$count dia',
    );
    return 'en nog $_temp0…';
  }

  @override
  String get pptxUntitledSlide => 'Zonder titel';

  @override
  String get pptxEmptySlide => 'Geen tekst (alleen afbeelding of vorm)';

  @override
  String pptxTextLineCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count regels tekst',
      one: '$count regel tekst',
    );
    return '$_temp0';
  }

  @override
  String pptxReadFailed(String detail) {
    return 'Lezen niet mogelijk: $detail';
  }

  @override
  String get compressLevelLight => 'Licht';

  @override
  String get compressLevelMedium => 'Gemiddeld';

  @override
  String get compressLevelStrong => 'Sterk';

  @override
  String get pptxQualityStandard => 'Standaard (150 dpi)';

  @override
  String get pptxQualityHigh => 'Hoog (220 dpi)';

  @override
  String get pdfToExcelEmptyTitle => 'De tabellen terughalen';

  @override
  String get pdfToExcelEmptyBody =>
      'De tabellen van een pdf worden overgezet naar een Excel-werkmap. De opmaak blijft niet behouden, de waarden wel.';

  @override
  String pdfToExcelPagesAnalyzed(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count pagina’s geanalyseerd',
      one: '$count pagina geanalyseerd',
    );
    return '$_temp0';
  }

  @override
  String pdfToExcelAnalysisFailed(String detail) {
    return 'Analyse niet mogelijk. De pdf is mogelijk met een wachtwoord beveiligd of beschadigd. ($detail)';
  }

  @override
  String get pdfToExcelNothingToExport =>
      'Niets te exporteren: geen tabel gevonden.';

  @override
  String get pdfToExcelBuilding => 'Werkmap maken…';

  @override
  String get pdfToExcelIncludeParagraphs =>
      'Ook tekst buiten de tabellen opnemen (één rij per alinea)';

  @override
  String get pdfToExcelIncludeParagraphsHint =>
      'Handig bij een half gestructureerd document: de tekst komt in kolom A, na de tabellen van de pagina.';

  @override
  String get pdfToExcelCaveatTitle => 'Wat de omzetting niet behoudt';

  @override
  String get pdfToExcelCaveat =>
      'De herkenning berust op de plaats van de tekst op de pagina: tabellen zonder regelmatige randen, samengevoegde cellen en zeer onregelmatige kolommen kunnen verkeerd worden opgedeeld. Een gescande pdf (een afbeelding) bevat geen uitleesbare tekst en levert niets op. Kleuren, formules en afbeeldingen worden nooit overgenomen: alleen de tekstwaarden.';

  @override
  String pdfToExcelTablesFound(int tables, int pages) {
    String _temp0 = intl.Intl.pluralLogic(
      tables,
      locale: localeName,
      other: '$tables tabellen gevonden',
      one: '$tables tabel gevonden',
    );
    String _temp1 = intl.Intl.pluralLogic(
      pages,
      locale: localeName,
      other: '$pages pagina’s',
      one: '$pages pagina',
    );
    return '$_temp0 op $_temp1';
  }

  @override
  String pdfToExcelPagesConcerned(String pages) {
    return 'Betrokken pagina’s: $pages';
  }

  @override
  String pdfToExcelParagraphsOutside(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count alinea’s buiten de tabellen',
      one: '$count alinea buiten de tabellen',
    );
    return '$_temp0';
  }

  @override
  String get pdfToExcelScannedWarning =>
      'Uit deze pdf kon geen tekst worden gehaald: het gaat vrijwel zeker om een gescand document (afbeeldingen van pagina’s). Een spreadsheet kan er niets mee; gebruik eerst het hulpmiddel voor tekstherkenning (OCR).';

  @override
  String get pdfToExcelNoTableWarning =>
      'In dit document is geen tabelstructuur herkend. De tekst staat er wel, maar niet in regelmatige kolommen. Zet hierboven ‘Ook tekst buiten de tabellen opnemen’ aan in plaats van een onleesbare werkmap te maken, of gebruik ‘Pdf naar Word’, dat alinea’s beter bewaart.';

  @override
  String get pdfToExcelResultTitle => 'Werkmap klaar';

  @override
  String get pdfToExcelExportWhat => 'Excel-werkmap';

  @override
  String get pdfToExcelConvertAction => 'Omzetten naar Excel';

  @override
  String resultNameAndSize(String name, String size) {
    return '$name — $size';
  }

  @override
  String get pdfToPptxEmptyTitle => 'Eén dia per pagina';

  @override
  String get pdfToPptxEmptyBody =>
      'De pdf wordt een identieke PowerPoint-presentatie. Elke pagina komt binnen als afbeelding: de lay-out is getrouw, maar de tekst is in PowerPoint niet bewerkbaar.';

  @override
  String pdfToPptxOpenFailed(String detail) {
    return 'Deze pdf kon niet worden geopend: $detail';
  }

  @override
  String get pdfToPptxConverting => 'Omzetten naar PowerPoint…';

  @override
  String pdfToPptxPagesToSlides(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count pagina’s',
      one: '$count pagina',
    );
    String _temp1 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count dia’s',
      one: '$count dia',
    );
    return '$_temp0 > $_temp1';
  }

  @override
  String get pdfToPptxEmptyDocument => 'Leeg document';

  @override
  String get qualityLabel => 'Kwaliteit';

  @override
  String get pdfToPptxQualityHint =>
      'Een hogere resolutie geeft scherpere dia’s maar een duidelijk zwaarder bestand.';

  @override
  String pdfToPptxHeavyWarning(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count pagina’s',
      one: '$count pagina',
    );
    return 'Let op: in hoge kwaliteit kan een presentatie van $_temp0 tientallen MB’s wegen en traag openen. Kies bij twijfel Standaard.';
  }

  @override
  String get goodToKnow => 'Goed om te weten';

  @override
  String get pdfToPptxCaveat =>
      'Elke dia is een afbeelding van de pagina: de lay-out is gelijk aan de pdf, maar de tekst is in PowerPoint niet bewerkbaar.\nGebruik liever ‘Pdf naar Word’ om bewerkbare tekst terug te krijgen.\nEen presentatie heeft maar één diaformaat: dat komt van de eerste pagina, en pagina’s van een ander formaat worden erbinnen gecentreerd.';

  @override
  String get pdfToPptxResultTitle => 'Presentatie klaar';

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
      other: '$count dia’s',
      one: '$count dia',
    );
    return '$name — $_temp0 · $size · $quality';
  }

  @override
  String get notSavedYet =>
      'Het bestand staat nog niet op je toestel: sla het op of deel het.';

  @override
  String get pdfToPptxChangeQuality => 'Kwaliteit wijzigen';

  @override
  String get pdfToPptxConvertAction => 'Omzetten naar PowerPoint';

  @override
  String pdfToPptxExportWhat(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count dia’s',
      one: '$count dia',
    );
    return 'PowerPoint-presentatie · $_temp0';
  }

  @override
  String get formatLabel => 'Formaat';

  @override
  String get actionExport => 'Exporteren';

  @override
  String get imageQualityWeb => 'Web (72 dpi)';

  @override
  String get imageQualityStandard => 'Standaard (150 dpi)';

  @override
  String get imageQualityHigh => 'Hoge kwaliteit (300 dpi)';

  @override
  String get pdfToImagesEmptyTitle => 'Eén afbeelding per pagina';

  @override
  String get pdfToImagesEmptyBody =>
      'Kies een pdf: elke pagina komt eruit als afbeelding, in de resolutie die je daarna instelt.';

  @override
  String pdfToImagesNotAPdf(String name) {
    return '$name: kies een pdf-bestand.';
  }

  @override
  String errorLoadFailed(String detail) {
    return 'Laden mislukt: $detail';
  }

  @override
  String get pdfToImagesProgress => 'Bezig met exporteren…';

  @override
  String pdfToImagesExportWhat(int count, String format) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count $format-afbeeldingen',
      one: '$count $format-afbeelding',
    );
    return '$_temp0';
  }

  @override
  String get pdfaEmptyTitle => 'Voor lange tijd archiveren';

  @override
  String get pdfaEmptyBody =>
      'PDF/A is het archiefformaat dat veel overheidsinstanties eisen. Het document wordt omgezet zonder zijn uiterlijk te verliezen.';

  @override
  String get pdfaConformanceLevel => 'Conformiteitsniveau';

  @override
  String get pdfaA1bDetail =>
      'Het strengste en meest algemeen aanvaarde niveau. Kies dit bij twijfel.';

  @override
  String get pdfaA2bDetail =>
      'Gebaseerd op PDF 1.7: doeltreffender compressie, iets lichtere bestanden.';

  @override
  String get pdfaA3bDetail =>
      'Zoals A-2b, maar staat bijlagen toe (vaak vereist voor elektronisch factureren).';

  @override
  String pdfaConvertingTo(String level) {
    return 'Omzetten naar $level…';
  }

  @override
  String get pdfaCaveatTitle => 'Wat de omzetting verandert';

  @override
  String pdfaCaveat(int dpi) {
    return 'Elke pagina wordt op $dpi dpi opnieuw als afbeelding getekend: de tekst wordt een afbeelding en de lay-out ligt vast. Juist daardoor is het bestand echt conform zonder af te hangen van de lettertypen van het oorspronkelijke document, maar in ruil daarvoor is de tekst niet meer te selecteren of te doorzoeken, verdwijnen links en formulieren, en wordt het bestand zwaarder.';
  }

  @override
  String pdfaOpenFailed(String detail) {
    return 'Deze pdf kon niet worden geopend: $detail';
  }

  @override
  String get imagesToPdfEmptyTitle => 'Afbeeldingen in één pdf';

  @override
  String get imagesToPdfEmptyBody =>
      'JPG, PNG, WebP, HEIC — voeg je afbeeldingen toe en ze worden samengevoegd in de volgorde die je kiest.';

  @override
  String get imagesToPdfChoose => 'Kies afbeeldingen';

  @override
  String get imagesToPdfAdd => 'Afbeeldingen toevoegen';

  @override
  String imagesToPdfRejected(String names) {
    return 'Overgeslagen (geen afbeelding): $names';
  }

  @override
  String get imagesToPdfBuilding => 'Pdf maken…';

  @override
  String imagesToPdfBuildFailed(String detail) {
    return 'Maken mislukt: $detail';
  }

  @override
  String imagesToPdfCreateAction(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count afbeeldingen',
      one: '$count afbeelding',
    );
    return 'Pdf maken ($_temp0)';
  }

  @override
  String get actionRotate => 'Draaien';

  @override
  String get actionRemove => 'Verwijderen';

  @override
  String get htmlTitle => 'HTML / webpagina naar pdf';

  @override
  String get htmlIntro =>
      'Zet een webpagina of HTML-code om in een A4-pdf. Het renderen gebeurt door de in Android ingebouwde browser, dus de lay-out is die van een afdruk vanuit Chrome.';

  @override
  String get htmlModeUrl => 'Webadres';

  @override
  String get htmlModeCode => 'HTML-code';

  @override
  String get htmlUrlLabel => 'Adres van de pagina';

  @override
  String get htmlUrlHint => 'https://voorbeeld.nl/artikel';

  @override
  String get htmlCodeLabel => 'HTML-code';

  @override
  String get htmlCodeHint => '<h1>Kop</h1>\n<p>Tekst…</p>';

  @override
  String get htmlUrlBadScheme =>
      'Het adres moet beginnen met http:// of https://.';

  @override
  String get htmlUrlIncomplete => 'Voer een volledig webadres in.';

  @override
  String get htmlCodeEmpty => 'Plak HTML-code om om te zetten.';

  @override
  String get htmlLoadingUrl => 'Pagina laden en omzetten…';

  @override
  String get htmlConverting => 'HTML omzetten…';

  @override
  String get htmlNetworkNotice =>
      'Een internetverbinding is nodig: dit is het enige hulpmiddel in de app dat de pagina moet downloaden. Pagina’s die inloggen, een cookiebanner of veel JavaScript vereisen, kunnen onvolledig uitkomen.';

  @override
  String get htmlOfflineNotice =>
      'HTML en CSS die rechtstreeks in de pagina staan, worden offline weergegeven. Afbeeldingen, stijlbladen of lettertypen die van een extern webadres worden gehaald, hebben wel een internetverbinding nodig.';

  @override
  String get watermarkEmptyTitle => 'Een watermerk aanbrengen';

  @override
  String get watermarkEmptyBody =>
      'Een tekst naar keuze wordt op de achtergrond van alle pagina’s herhaald — om een document als vertrouwelijk of als concept te merken.';

  @override
  String get watermarkEmptyNote =>
      'Gratis exporteren en zonder limiet op het aantal.';

  @override
  String get watermarkTextLabel => 'Tekst van het watermerk';

  @override
  String get watermarkDefaultText => 'VERTROUWELIJK';

  @override
  String get watermarkNeedText => 'Voer een tekst voor het watermerk in.';

  @override
  String watermarkOpacity(int percent) {
    return 'Dekking: $percent%';
  }

  @override
  String watermarkRotation(int degrees) {
    return 'Draaihoek: $degrees°';
  }

  @override
  String watermarkFontSize(int points) {
    return 'Tekstgrootte: $points pt';
  }

  @override
  String get watermarkColor => 'Kleur';

  @override
  String get colorGrey => 'Grijs';

  @override
  String get colorRed => 'Rood';

  @override
  String get colorBlue => 'Blauw';

  @override
  String get colorBlack => 'Zwart';

  @override
  String get watermarkProgress => 'Watermerk aanbrengen…';

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
  String get pageNumbersEmptyTitle => 'De pagina’s nummeren';

  @override
  String get pageNumbersEmptyBody =>
      'Kies een pdf en daarna de plaats en de vorm van de nummers die op elke pagina komen.';

  @override
  String get positionLabel => 'Positie';

  @override
  String get positionBottomCenter => 'Onder midden';

  @override
  String get positionBottomRight => 'Onder rechts';

  @override
  String get positionTopCenter => 'Boven midden';

  @override
  String get positionTopRight => 'Boven rechts';

  @override
  String get pageNumbersFormatPlain => 'N';

  @override
  String get pageNumbersFormatOfTotal => 'N / totaal';

  @override
  String get pageNumbersStart => 'Beginnummer';

  @override
  String get pageNumbersProgress => 'Bezig met nummeren…';

  @override
  String get organizeEmptyTitle => 'Een pdf weer ter hand nemen';

  @override
  String get organizeEmptyBody =>
      'Open een document om het te splitsen, er pagina’s uit te nemen of de volgorde te wijzigen.';

  @override
  String get organizeOpenFile => 'Een bestand openen';

  @override
  String get organizeNothingToExport => 'Geen pagina om te exporteren.';

  @override
  String organizePagesKept(int kept, int total) {
    String _temp0 = intl.Intl.pluralLogic(
      kept,
      locale: localeName,
      other: '$kept pagina’s behouden',
      one: '$kept pagina behouden',
    );
    return '$_temp0 van $total';
  }

  @override
  String get organizePageExcluded => 'Weggelaten';

  @override
  String organizePageMoved(int from) {
    return 'Verplaatst vanaf positie $from';
  }

  @override
  String organizePageTitle(int number) {
    return 'Pagina $number';
  }

  @override
  String organizeExcludePage(int number) {
    return 'Pagina $number weglaten';
  }

  @override
  String organizeIncludePage(int number) {
    return 'Pagina $number opnemen';
  }

  @override
  String organizeMovePage(int number) {
    return 'Pagina $number verplaatsen';
  }

  @override
  String get organizeExtract => 'Uitnemen';

  @override
  String get organizeSplit => 'Splitsen';

  @override
  String get organizePreview => 'Voorbeeld';

  @override
  String get organizeExtractTitle => 'Een reeks pagina’s uitnemen';

  @override
  String organizeRangeLabel(int start, int end) {
    return 'Pagina’s $start tot $end';
  }

  @override
  String get organizeSplitTitle => 'In meerdere bestanden splitsen';

  @override
  String organizeFileCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count bestanden',
      one: '$count bestand',
    );
    return '$_temp0';
  }

  @override
  String organizeSplitFailed(String detail) {
    return 'Splitsen mislukt: $detail';
  }

  @override
  String get scanNoCamera => 'Geen camera beschikbaar op dit toestel.';

  @override
  String scanCameraFailed(String detail) {
    return 'De camera kon niet worden gestart: $detail';
  }

  @override
  String get scanCropToolbar => 'Bijstellen';

  @override
  String scanCaptureFailed(String detail) {
    return 'Opname mislukt: $detail';
  }

  @override
  String get scanPermissionBody =>
      'Toegang tot de camera is nodig om een document te scannen.';

  @override
  String get scanGrantPermission => 'Camera toestaan';

  @override
  String get actionRetry => 'Opnieuw proberen';

  @override
  String get scanNoPageYet => 'Nog geen pagina.';

  @override
  String scanFinishAction(int count) {
    return 'Voltooien · $count';
  }

  @override
  String get signTitle => 'Een pdf ondertekenen';

  @override
  String get signIntro =>
      'Zet je met de hand getekende handtekening op een pagina van een pdf. Het is louter een tekening die aan het document wordt toegevoegd, geen gecertificeerde elektronische handtekening.';

  @override
  String get signChooseSubtitle => 'Kies het document dat je wilt ondertekenen';

  @override
  String get signPickPage => 'Kies de pagina die je wilt ondertekenen.';

  @override
  String get signDrawTitle => 'Mijn handtekening tekenen';

  @override
  String get signDrawBody =>
      'Teken met je vinger zoals op papier. Dit zet een tekening op de pagina — het is geen gecertificeerde elektronische handtekening.';

  @override
  String get signNeedDrawing => 'Teken een handtekening voordat je doorgaat.';

  @override
  String get signClear => 'Wissen';

  @override
  String get signValidate => 'Bevestigen';

  @override
  String get signPlaceBody =>
      'Sleep de handtekening naar de gewenste plaats op de pagina en tik dan op Voltooien.';

  @override
  String get signPageUnavailable => 'De pagina kon niet worden weergegeven.';

  @override
  String get signProgress => 'Handtekening toevoegen…';

  @override
  String get editTitle => 'Een document annoteren';

  @override
  String get editEmptyBody =>
      'Voeg tekst toe of markeer passages rechtstreeks op een bestaande pdf.';

  @override
  String get editAddTextTitle => 'Tekst toevoegen';

  @override
  String get editTextHint => 'Jouw tekst';

  @override
  String editFontSize(int size) {
    return 'Tekstgrootte: $size';
  }

  @override
  String get editNeedAnnotation =>
      'Voeg ten minste één annotatie toe voordat je voltooit.';

  @override
  String get editProgress => 'Annotaties toepassen…';

  @override
  String get editChooseOther => 'Een andere pdf kiezen';

  @override
  String get editUndoTooltip => 'Laatste annotatie ongedaan maken';

  @override
  String get editModeText => 'Tekst';

  @override
  String get editModeHighlight => 'Markeren';

  @override
  String get editPageUnavailable => 'Deze pagina kon niet worden weergegeven.';

  @override
  String get ocrEmptyTitle => 'De tekst doorzoekbaar maken';

  @override
  String get ocrEmptyBody =>
      'De tekst van een gescande pdf wordt herkend en onzichtbaar over de afbeelding gelegd. De pagina verandert niet van uiterlijk.';

  @override
  String get ocrWrongFormat => 'Kies een pdf of een afbeelding (JPG, PNG…).';

  @override
  String get ocrProgress => 'Bezig met herkennen…';

  @override
  String ocrFailed(String detail) {
    return 'Herkenning mislukt: $detail';
  }

  @override
  String get ocrRunAction => 'Herkenning starten';

  @override
  String get ocrResultTitle => 'Resultaat van de OCR';

  @override
  String ocrResultBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count pagina’s geanalyseerd',
      one: '$count pagina geanalyseerd',
    );
    return '$_temp0. De doorzoekbare pdf is klaar, en je kunt ook alle herkende tekst kopiëren.';
  }

  @override
  String get ocrCopyText => 'Tekst kopiëren';

  @override
  String get ocrTextCopied => 'Tekst gekopieerd.';

  @override
  String get redactIntro =>
      'Verberg definitief delen van een pdf (namen, adressen, bedragen). Anders dan bij een simpele zwarte rechthoek erover wordt de verborgen tekst echt uit het bestand verwijderd, niet alleen bedekt: hij kan niet meer worden geselecteerd of gekopieerd.';

  @override
  String get redactChooseSubtitle =>
      'Kies het document dat je onleesbaar wilt maken';

  @override
  String get redactCaveat =>
      'Goed om te weten: om de verborgen tekst te verwijderen wordt elke pagina van het document weer in een afbeelding omgezet (200 dpi). Het resultaat is daardoor geen pdf meer waarvan je de tekst kunt selecteren, en het verkregen bestand is meestal zwaarder dan het origineel.';

  @override
  String get redactEmptyPdf => 'Deze pdf bevat geen enkele pagina.';

  @override
  String redactOpenFailed(String detail) {
    return 'Deze pdf kon niet worden geopend (hij is mogelijk met een wachtwoord beveiligd): $detail';
  }

  @override
  String redactPageRenderFailed(int number, String detail) {
    return 'Pagina $number kon niet worden weergegeven: $detail';
  }

  @override
  String get redactUndoTooltip => 'Laatste gebied ongedaan maken';

  @override
  String get redactInstructions =>
      'Sleep je vinger over de pagina om een gebied te tekenen dat verborgen moet worden. De bedekte tekst wordt echt uit het bestand verwijderd, niet alleen bedekt.';

  @override
  String get redactPagePrevious => 'Vorige pagina';

  @override
  String get redactPageNext => 'Volgende pagina';

  @override
  String redactPager(int current, int total) {
    return 'Pagina $current / $total';
  }

  @override
  String get redactNoZone => 'Geen gebied getekend';

  @override
  String redactZoneCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count te verbergen gebieden',
      one: '$count te verbergen gebied',
    );
    return '$_temp0';
  }

  @override
  String get redactOtherPdf => 'Andere pdf';

  @override
  String get redactAction => 'Onleesbaar maken';

  @override
  String get redactProgress => 'Bezig met onleesbaar maken…';

  @override
  String get cropEmptyTitle => 'De marges bijsnijden';

  @override
  String get cropEmptyBody =>
      'Kies een pdf en sleep dan je vinger over het voorbeeld om het gebied af te bakenen dat je wilt behouden.';

  @override
  String get cropTooSmall => 'Het gekozen gebied is te klein.';

  @override
  String get cropProgress => 'Bezig met bijsnijden…';

  @override
  String cropFailed(String detail) {
    return 'Bijsnijden mislukt: $detail';
  }

  @override
  String get cropKeptArea => 'Behouden gebied';

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
  String get cropFullPage => 'Hele pagina';

  @override
  String get cropAllPages => 'Op alle pagina’s toepassen';

  @override
  String get cropAllPagesOn =>
      'Op elke pagina wordt hetzelfde gebied uitgesneden.';

  @override
  String get cropAllPagesOff =>
      'Alleen pagina 1 wordt bijgesneden, de andere blijven heel.';

  @override
  String get cropCaveat =>
      'Bijsnijden verkleint de pagina: inhoud buiten het gebied wordt niet meer weergegeven of afgedrukt.';

  @override
  String get cropAction => 'Bijsnijden';

  @override
  String get compareTitle => 'Twee pdf’s vergelijken';

  @override
  String get compareEmptyTitle => 'Wat er is veranderd';

  @override
  String get compareEmptyBody =>
      'Kies twee versies van dezelfde pdf. Toegevoegde en verwijderde passages worden pagina voor pagina naast elkaar gezet.';

  @override
  String get compareSlotA => 'Bestand A';

  @override
  String get compareSlotB => 'Bestand B';

  @override
  String get compareAction => 'Vergelijken';

  @override
  String get compareProgress => 'Bezig met vergelijken…';

  @override
  String compareFailed(String detail) {
    return 'Vergelijking mislukt: $detail';
  }

  @override
  String compareChangedPages(int changed, int total) {
    String _temp0 = intl.Intl.pluralLogic(
      changed,
      locale: localeName,
      other: '$changed pagina’s wijken af',
      one: '$changed pagina wijkt af',
    );
    return '$_temp0 van $total';
  }

  @override
  String get compareNoDifference =>
      'Geen verschil gevonden tussen de twee bestanden.';

  @override
  String comparePageHeading(int number) {
    return 'Pagina $number';
  }

  @override
  String organizeFilesCreated(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count bestanden gemaakt',
      one: '$count bestand gemaakt',
    );
    return '$_temp0';
  }

  @override
  String organizePartTitle(int number) {
    return 'Deel $number';
  }
}
