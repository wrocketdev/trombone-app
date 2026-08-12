// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Norwegian Bokmål (`nb`).
class LNb extends L {
  LNb([String locale = 'nb']) : super(locale);

  @override
  String get appTitle => 'Papirklipp — PDF, Skann og Word';

  @override
  String get appWordmark => 'Trombone';

  @override
  String get actionSave => 'Lagre';

  @override
  String get actionShare => 'Del';

  @override
  String get actionCompress => 'Komprimer';

  @override
  String get actionDone => 'Ferdig';

  @override
  String get actionCancel => 'Avbryt';

  @override
  String get actionChange => 'Endre';

  @override
  String get actionContinue => 'Fortsett';

  @override
  String get actionOpening => 'Åpner …';

  @override
  String get actionRemoveFile => 'Fjern denne filen';

  @override
  String get progressPreparing => 'Forberedelse...';

  @override
  String progressPercent(int percent) {
    return '$percent %';
  }

  @override
  String get emptyReassurance => 'Gratis eksport, uten vannmerke eller grense.';

  @override
  String get emptyAcceptedFormats => 'Godkjente formater';

  @override
  String get exportSavedTitle => 'Det er tatt opp.';

  @override
  String get exportSavedBody =>
      'Under navnet og i mappen du nettopp har valgt. Ingen vannmerke, ingen grenser, ingenting å låse opp.';

  @override
  String get exportSaveDialogTitle => 'Lagre PDF';

  @override
  String pageTileIncluded(int number) {
    return 'Side $number, inkludert. Trykk for å flytte den til side.';
  }

  @override
  String pageTileExcluded(int number) {
    return 'Side $number, forkastet. Trykk for å inkludere den.';
  }

  @override
  String pageTileRotate(int number) {
    return 'Roter siden $number';
  }

  @override
  String sectionHeaderSemantics(String title, int count) {
    return '$title, $count verktøy';
  }

  @override
  String toolCount(int count) {
    return '$count verktøy';
  }

  @override
  String get homePromise =>
      'Lag dokumentet ditt, eksporter det.\nIngen vegg på slutten.';

  @override
  String get homeChipNoAccount => 'Uten konto';

  @override
  String get homeChipNoWatermark => 'Uten vannmerke';

  @override
  String get homeChipUnlimited => 'Ubegrenset eksport';

  @override
  String get homeSearchTooltip => 'Finn et verktøy';

  @override
  String get homeColophon =>
      'Ingenting låses opp mot betaling ved registrering. Eksporten er gratis, uten vannmerke og uten antallsbegrensning.';

  @override
  String get sectionFeatured => 'Utvalgte';

  @override
  String get sectionToPdf => 'Til PDF-en';

  @override
  String get sectionFromPdf => 'Fra PDF';

  @override
  String get sectionSecurity => 'Sikkerhet';

  @override
  String get sectionEdit => 'Rediger';

  @override
  String get toolMerge => 'Slå sammen';

  @override
  String get toolMergeKeywords =>
      'sette sammen kombinere sammenføye omgruppere sammenføye sammen';

  @override
  String get toolMergeSubtitle => 'PDF, Word, bilder og tekst i ett dokument';

  @override
  String get toolRectoVerso => 'Dobbeltsidig';

  @override
  String get toolRectoVersoKeywords =>
      'dobbeltsidig intersperse skanning selv oddetall';

  @override
  String get toolRectoVersoSubtitle =>
      'To skanninger, satt tilbake i rekkefølge';

  @override
  String get toolImagesToPdf => 'Bilder til PDF';

  @override
  String get toolImagesToPdfKeywords => 'foto jpg jpeg png fotoalbum enhet';

  @override
  String get toolImagesToPdfSubtitle => 'Bilder og opptak i ett dokument';

  @override
  String get toolPdfToWord => 'PDF til Word';

  @override
  String get toolPdfToWordKeywords =>
      'docx redigerbar tekstbehandlerkonvertering';

  @override
  String get toolPdfToWordSubtitle => 'Tekst og tabeller, redigerbare';

  @override
  String get toolOrganize => 'Organiser en PDF';

  @override
  String get toolOrganizeKeywords =>
      'dele separate uttrekk ombestille rekkefølge sider slette';

  @override
  String get toolOrganizeSubtitle => 'Del opp, trekk ut, omorganiser';

  @override
  String get toolExcelToPdf => 'Excel til PDF';

  @override
  String get toolExcelToPdfKeywords => 'xlsx regneark arbeidsbok beregningsark';

  @override
  String get toolPptxToPdf => 'PowerPoint til PDF';

  @override
  String get toolPptxToPdfKeywords => 'pptx lysbildepresentasjon lysbilder';

  @override
  String get toolHtmlToPdf => 'Nettside til PDF';

  @override
  String get toolHtmlToPdfKeywords => 'html nettside url link artikkel';

  @override
  String get toolScan => 'Skann et dokument';

  @override
  String get toolScanKeywords => 'kamera foto digitalisere skanneenhet papir';

  @override
  String get toolPdfToExcel => 'PDF til Excel';

  @override
  String get toolPdfToExcelKeywords => 'xlsx regnearktabell trekke ut data';

  @override
  String get toolPdfToPptx => 'PDF til PowerPoint';

  @override
  String get toolPdfToPptxKeywords => 'pptx lysbildepresentasjon lysbilder';

  @override
  String get toolPdfToImages => 'PDF til bilder';

  @override
  String get toolPdfToImagesKeywords => 'jpg png bildeeksportfangst';

  @override
  String get toolOcr => 'Søkbar tekst (OCR)';

  @override
  String get toolOcrKeywords => 'tegngjenkjenning skanning kopi velge';

  @override
  String get toolPdfA => 'Konverter til PDF/A';

  @override
  String get toolPdfAKeywords => 'arkiveringsstandard langtidskonservering';

  @override
  String get toolProtect => 'Beskytt PDF';

  @override
  String get toolProtectKeywords => 'passord hengelås krypter lås sikker';

  @override
  String get toolUnlock => 'Lås opp PDF';

  @override
  String get toolUnlockKeywords =>
      'fjerne passord åpne dekryptere låse opp hengelås';

  @override
  String get toolRepair => 'Reparer PDF';

  @override
  String get toolRepairKeywords =>
      'ødelagt uleselig skadet gjenopprettingsfeil';

  @override
  String get toolRedact => 'Rediger en PDF';

  @override
  String get toolRedactKeywords =>
      'skjule svarte anonymisere konfidensiell sletting';

  @override
  String get toolEdit => 'Rediger PDF';

  @override
  String get toolEditKeywords => 'tekst modifiser riktig kommenter skriv';

  @override
  String get toolSign => 'Signer';

  @override
  String get toolSignKeywords => 'signatur første kontrakt hånd';

  @override
  String get toolWatermark => 'Vannmerke';

  @override
  String get toolWatermarkKeywords =>
      'vannmerke konfidensielt stempel utkast merke';

  @override
  String get toolPageNumbers => 'Sidetall';

  @override
  String get toolPageNumbersKeywords => 'pagineringsfolionummer';

  @override
  String get toolCrop => 'Beskjær en PDF';

  @override
  String get toolCropKeywords => 'skjære marger beskjæringskanter størrelse';

  @override
  String get toolCompare => 'Sammenlign PDF';

  @override
  String get toolCompareKeywords =>
      'forskjellige versjoner forskjellige endringer';

  @override
  String get searchHint => 'Slå sammen, passord, vannmerke ...';

  @override
  String get searchClear => 'Klart';

  @override
  String searchNoResultTitle(String query) {
    return 'Ingen verktøy for \"$query\".';
  }

  @override
  String get searchNoResultBody =>
      'Prøv formatet du har for hånden – “Word”, “Excel”, “photo” – eller hva du vil gjøre med det: “sign”, “divide”, “password”.';

  @override
  String get actionUndo => 'Avbryt';

  @override
  String get actionApply => 'Søk';

  @override
  String get actionChoose => 'Velg';

  @override
  String get actionChoosePdf => 'Velg en PDF';

  @override
  String get actionChooseFiles => 'Velg filer';

  @override
  String get actionConvert => 'Konverter';

  @override
  String get actionFinish => 'Fullfør';

  @override
  String get actionBack => 'Retur';

  @override
  String get actionAdd => 'Legg til';

  @override
  String get noFileChosen => 'Ingen fil er valgt';

  @override
  String errorExportFailed(String detail) {
    return 'Eksport mislyktes: $detail';
  }

  @override
  String errorShareFailed(String detail) {
    return 'Deling mislyktes: $detail';
  }

  @override
  String errorOpenFailed(String detail) {
    return 'Kan ikke åpne filen: $detail';
  }

  @override
  String errorConversionFailed(String detail) {
    return 'Konvertering mislyktes: $detail';
  }

  @override
  String errorOnFile(String name, String detail) {
    return '$name: $detail';
  }

  @override
  String get errorPickPdf => 'Velg en PDF-fil.';

  @override
  String sizeBytes(String value) {
    return '$value o';
  }

  @override
  String sizeKb(String value) {
    return '$value KB';
  }

  @override
  String sizeMb(String value) {
    return '$value MB';
  }

  @override
  String sizeApprox(String size) {
    return '~$size';
  }

  @override
  String pageCount(int count) {
    return '$count sider';
  }

  @override
  String pageCountOfTotal(int kept, int total) {
    return '$kept sider av $total';
  }

  @override
  String pageOfTotal(int current, int total) {
    return 'Side $current på $total';
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
  String get formatText => 'Tekst';

  @override
  String get mergeAddFile => 'Legg til en fil';

  @override
  String get mergeAddHint => 'PDF, Word, bilder eller tekst';

  @override
  String get mergeEmptyTitle => 'Et enkelt dokument';

  @override
  String get mergeEmptyBody =>
      'Legg til PDF-er, Word-filer, bilder eller tekst. Du kan omorganisere dem og fjerne sider før du eksporterer.';

  @override
  String get mergeNeedOnePage =>
      'Legg til minst én fil med en side som skal inkluderes.';

  @override
  String get mergeProgress => 'Sammenslåing pågår...';

  @override
  String mergeFailed(String detail) {
    return 'Sammenslåing mislyktes: $detail';
  }

  @override
  String mergeRemoved(String name) {
    return '$name fjernet.';
  }

  @override
  String mergeRemoveTooltip(String name) {
    return 'Fjern $name';
  }

  @override
  String mergeMoveSemantics(String name) {
    return 'Flytt $name';
  }

  @override
  String get mergeRotateAll => 'Roter alle sider';

  @override
  String mergePreviewAndExport(int count) {
    return 'Forhåndsvisning og eksport ($count sider)';
  }

  @override
  String previewTitle(String size) {
    return 'Oversikt · $size';
  }

  @override
  String previewZoomPage(int number) {
    return 'Side $number, forstørre';
  }

  @override
  String get previewPageUnreadable => 'Uleselig side.';

  @override
  String previewExportWhat(int count) {
    return 'PDF · $count sider';
  }

  @override
  String get compressTitle => 'Komprimering';

  @override
  String compressBody(String size) {
    return 'Nåværende størrelse: $size. Velg et nivå – beregnet størrelse vises før påføring.';
  }

  @override
  String get compressEstimating => 'Anslå...';

  @override
  String get compressProgress => 'Komprimering pågår...';

  @override
  String compressFailed(String detail) {
    return 'Komprimering mislyktes: $detail';
  }

  @override
  String get protectEmptyTitle => 'Sett under passord';

  @override
  String get protectEmptyBody =>
      'PDF-filen åpnes ikke lenger uten passordet du velger. Behold den: den kan ikke gjenopprettes.';

  @override
  String get protectSubtitle => 'Vil bli kryptert i 256-bit AES';

  @override
  String get protectPassword => 'Passord';

  @override
  String get protectConfirmPassword => 'Bekreft passord';

  @override
  String get protectShowPasswords => 'Vis passord';

  @override
  String get protectHidePasswords => 'Skjul passord';

  @override
  String get protectMismatch => 'De to passordene er forskjellige.';

  @override
  String get protectWarning =>
      'Skriv det ned et sted: uten det blir dokumentet permanent uleselig. Ingen gjenoppretting er mulig, verken av deg eller applikasjonen.';

  @override
  String get protectAlreadyProtected =>
      'Denne filen er allerede beskyttet – bruk Unlock PDF først.';

  @override
  String get protectProgress => 'Beskyttelse pågår...';

  @override
  String protectFailed(String detail) {
    return 'Beskyttelse mislyktes: $detail';
  }

  @override
  String get protectAction => 'Beskytt';

  @override
  String get protectResultTitle => 'Beskyttet PDF';

  @override
  String get protectResultDetail =>
      'Kryptert i AES 256 bits. Du trenger passordet for å åpne det.';

  @override
  String get protectExportWhat => 'Passordbeskyttet PDF';

  @override
  String get unlockEmptyTitle => 'Fjern passord';

  @override
  String get unlockEmptyBody =>
      'Du trenger gjeldende passord for dokumentet. Når den er fjernet, åpnes PDF-en fritt.';

  @override
  String get unlockAcceptsProtectedPdf => 'Beskyttet PDF';

  @override
  String get unlockChooseProtectedPdf => 'Velg en beskyttet PDF';

  @override
  String get unlockCurrentPassword => 'Gjeldende passord';

  @override
  String get unlockWrongPassword => 'Feil passord.';

  @override
  String get unlockProgress => 'Låser opp pågår …';

  @override
  String unlockFailed(String detail) {
    return 'Kunne ikke låse opp: $detail';
  }

  @override
  String get unlockAction => 'Lås opp';

  @override
  String get repairEmptyTitle => 'Reparer en skadet fil';

  @override
  String get repairEmptyBody =>
      'Den interne strukturen til en skadet PDF rekonstrueres. Det som er bergbart vil være bergbart.';

  @override
  String get repairProgress => 'Reparasjon pågår...';

  @override
  String get repairFailed =>
      'Denne filen kan ikke repareres – den kan være for skadet.';

  @override
  String get repairAction => 'Reparasjon';

  @override
  String get pdfToWordEmptyTitle => 'Et redigerbart Word';

  @override
  String get pdfToWordEmptyBody =>
      'Teksten og strukturen til PDF-filen transponeres til et .docx-dokument som du kan åpne på nytt og korrigere.';

  @override
  String get pdfToWordAnalyzing => 'Analyse av dokumentet...';

  @override
  String get pdfToWordAnalysisPending => 'Analyse venter';

  @override
  String pdfToWordAnalysisFailed(String detail) {
    return 'Kan ikke skanne: $detail';
  }

  @override
  String get pdfLocked =>
      'Denne PDF-filen er passordbeskyttet. Lås den opp først.';

  @override
  String get pdfToWordConverting => 'Konverterer til Word …';

  @override
  String get pdfToWordSummaryTitle => 'Innhold oppdaget';

  @override
  String pdfToWordParagraphCount(int count) {
    return '$count avsnitt';
  }

  @override
  String pdfToWordHeadingCount(int count) {
    return '$count titler';
  }

  @override
  String pdfToWordTableCount(int count) {
    return '$count tabeller';
  }

  @override
  String get pdfToWordNoTables =>
      'Ingen tabeller oppdaget: Hvis PDF-filen inneholder noen, vil linjene bli konvertert til avsnitt.';

  @override
  String get pdfToWordCaveat =>
      'Konverteringen gjengir teksten, formateringen og tabellene, men ikke den nøyaktige layouten: posisjonen til bilder og kolonner er ikke bevart, og bildene er ikke inkludert i Word-dokumentet.';

  @override
  String get pdfToWordScanWarning =>
      'Denne PDF-en ser ut til å være skannet: ingen tekst ble funnet. Bruk søkbar tekst (OCR)-verktøyet først, kom så tilbake og konverter den resulterende PDF-filen.';

  @override
  String get pdfToWordResultTitle => 'Word-dokumentet er klart';

  @override
  String pdfToWordResultDetail(String name, String size) {
    return '$name — $size';
  }

  @override
  String get pdfToWordExportWhat => 'Word-dokument';

  @override
  String get pdfToWordConvertAction => 'Konverter til Word';

  @override
  String get actionConvertAgain => 'Konverter igjen';

  @override
  String errorSaveFailed(String detail) {
    return 'Kan ikke registrere: $detail';
  }

  @override
  String get rectoVersoIntro =>
      'En enkeltsidig mater produserer to filer: oddetallssider i rekkefølge, partallssider ofte i omvendt rekkefølge. Velg begge for å komponere dem på nytt.';

  @override
  String get rectoVersoOddSlot => 'Odd-sider-fil (ensidig)';

  @override
  String get rectoVersoEvenSlot => 'Partalls-fil (tilbake)';

  @override
  String get rectoVersoReversed => 'Den andre filen er i omvendt rekkefølge';

  @override
  String get rectoVersoReversedHint =>
      'Dette er det vanligste tilfellet, merket som standard';

  @override
  String rectoVersoPreview(int count) {
    return 'Interleaving-oversikt ($count sider)';
  }

  @override
  String get rectoVersoProgress => 'Interleaving pågår...';

  @override
  String fileWithPageCount(String name, int count) {
    return '$name · $count sider';
  }

  @override
  String get actionPreviewAndExport => 'Forhåndsvis og eksporter';

  @override
  String errorOpenFailedShort(String detail) {
    return 'Kan ikke åpne: $detail';
  }

  @override
  String errorGeneric(String detail) {
    return 'Mislyktes: $detail';
  }

  @override
  String get actionConvertToPdf => 'Konverter til PDF';

  @override
  String get convertProgress => 'Konvertering pågår...';

  @override
  String get excelEmptyTitle => 'En PDF-arbeidsbok';

  @override
  String get excelEmptyBody =>
      'Ark i en .xlsx-fil blir PDF-sider, klare til å sende eller skrive ut.';

  @override
  String get excelChooseWorkbook => 'Velg en perm';

  @override
  String get excelChooseXlsx => 'Velg en .xlsx-arbeidsbok';

  @override
  String get excelLegacyFormat =>
      '.xls-formatet (gammelt Excel-binærformat) støttes ikke. Lagre filen som .xlsx og prøv igjen.';

  @override
  String get excelWrongFormat => 'Velg en Excel .xlsx-arbeidsbok.';

  @override
  String excelUnreadable(String detail) {
    return 'Uleselig mappe: $detail';
  }

  @override
  String excelSheetsAndRows(int sheets, int rows) {
    return '$sheets ark · $rows rader totalt';
  }

  @override
  String get excelSheetsDetected => 'Blader oppdaget';

  @override
  String get excelEmptySheet => 'Tomt ark';

  @override
  String excelSheetDimensions(int rows, int columns) {
    return '$rows rader × $columns kolonner';
  }

  @override
  String get excelRepeatHeader => 'Gjenta overskriftslinjen på hver side';

  @override
  String get excelRepeatHeaderHint =>
      'Den første raden av arket tegnes på nytt øverst på hver tabellside.';

  @override
  String get excelCaveat =>
      'Hva konverteringen krever: teksten til cellene slik den er lagret i filen (inkludert det siste beregnede resultatet av formlene), den første fete linjen og et rutenett.\n\nHva er ikke inkludert: farger, fonter, tallformater, sammenslåtte celler, bilder, grafikk og selve formlene. Kolonnene er redusert for å passe til bredden på siden; på svært brede ark avkortes teksten i celler som er for smale av \"...\".';

  @override
  String get pptxEmptyTitle => 'En presentasjon i PDF';

  @override
  String get pptxEmptyBody =>
      'Én 16:9 liggende side per lysbilde, inkludert tittel og kuler. Teksten gjentas; de originale bildene, formene og bakgrunnene er ikke det.\n\nAkseptert format: .pptx. En gammel .ppt-fil må først lagres på nytt som .pptx fra PowerPoint.';

  @override
  String get pptxChoosePresentation => 'Velg en presentasjon';

  @override
  String get pptxTextOnlyTitle => 'Kun konvertering av tekst';

  @override
  String get pptxTextOnlyBody =>
      'Teksten til hvert lysbilde gjentas. De originale bildene, formene, bakgrunnene, fargene og layoutene er ikke bevart: den resulterende PDF-filen er en enkel, lesbar layout, ikke en tro kopi av presentasjonen din.';

  @override
  String pptxSlideCount(int count) {
    return '$count lysbilder';
  }

  @override
  String get pptxSlidesDetected => 'Lysbilder oppdaget';

  @override
  String pptxMoreSlides(int count) {
    return 'og $count andre lysbilder …';
  }

  @override
  String get pptxUntitledSlide => 'Uten tittel';

  @override
  String get pptxEmptySlide => 'Ingen tekst (kun bilde eller form)';

  @override
  String pptxTextLineCount(int count) {
    return '$count linjer med tekst';
  }

  @override
  String pptxReadFailed(String detail) {
    return 'Kan ikke lese: $detail';
  }

  @override
  String get compressLevelLight => 'Lys';

  @override
  String get compressLevelMedium => 'Gjennomsnittlig';

  @override
  String get compressLevelStrong => 'Sterk';

  @override
  String get pptxQualityStandard => 'Standard (150 dpi)';

  @override
  String get pptxQualityHigh => 'Høy (220 dpi)';

  @override
  String get pdfToExcelEmptyTitle => 'Hent tabeller';

  @override
  String get pdfToExcelEmptyBody =>
      'Tabeller fra en PDF-fil trekkes ut til en Excel-arbeidsbok. Formateringen er ikke bevart, verdiene er det.';

  @override
  String pdfToExcelPagesAnalyzed(int count) {
    return '$count sider analysert';
  }

  @override
  String pdfToExcelAnalysisFailed(String detail) {
    return 'Analyse umulig. PDF-filen kan være passordbeskyttet eller skadet. ($detail)';
  }

  @override
  String get pdfToExcelNothingToExport =>
      'Ingenting å eksportere: ingen tabell oppdaget.';

  @override
  String get pdfToExcelBuilding => 'Oppretter arbeidsboken …';

  @override
  String get pdfToExcelIncludeParagraphs =>
      'Ta også med tekst utenfor tabeller (én linje per avsnitt)';

  @override
  String get pdfToExcelIncludeParagraphsHint =>
      'Nyttig for et semistrukturert dokument: teksten plasseres i kolonne A, etter tabellene på siden.';

  @override
  String get pdfToExcelCaveatTitle => 'Hva konverteringen ikke bevarer';

  @override
  String get pdfToExcelCaveat =>
      'Deteksjon er basert på plasseringen av teksten på siden: Tabeller uten en vanlig kantlinje, sammenslåtte celler og svært uregelmessige kolonner kan være dårlig kuttet. En skannet PDF (bilde) inneholder ingen tekst som kan pakkes ut og vil ikke gi noe. Farger, formler og bilder er aldri inkludert: bare tekstverdier er med.';

  @override
  String pdfToExcelTablesFound(int tables, int pages) {
    return '$tables tabeller oppdaget på $pages sider';
  }

  @override
  String pdfToExcelPagesConcerned(String pages) {
    return 'Berørte sider: $pages';
  }

  @override
  String pdfToExcelParagraphsOutside(int count) {
    return '$count avsnitt utenfor tabeller';
  }

  @override
  String get pdfToExcelScannedWarning =>
      'Ingen tekst kunne trekkes ut fra denne PDF-en: det er mest sannsynlig et skannet dokument (sidebilder). Et regneark kan ikke få noe ut av dette; Bruk først tekstgjenkjenningsverktøyet (OCR).';

  @override
  String get pdfToExcelNoTableWarning =>
      'Ingen tabellstruktur ble gjenkjent i dette dokumentet. Teksten er der, men den er ikke ordnet i vanlige spalter. I stedet for å lage en uleselig arbeidsbok, aktiver \"Inkluder også ikke-tabelltekst\" ovenfor, eller bruk \"PDF til Word\" som bevarer avsnitt bedre.';

  @override
  String get pdfToExcelResultTitle => 'Perm klar';

  @override
  String get pdfToExcelExportWhat => 'Excel arbeidsbok';

  @override
  String get pdfToExcelConvertAction => 'Konverter til Excel';

  @override
  String resultNameAndSize(String name, String size) {
    return '$name — $size';
  }

  @override
  String get pdfToPptxEmptyTitle => 'Ett lysbilde per side';

  @override
  String get pdfToPptxEmptyBody =>
      'PDF-en blir en identisk PowerPoint-presentasjon. Hver side kommer i form av et bilde: layouten er trofast, men teksten vil ikke kunne redigeres i PowerPoint.';

  @override
  String pdfToPptxOpenFailed(String detail) {
    return 'Kan ikke åpne denne PDF-en: $detail';
  }

  @override
  String get pdfToPptxConverting => 'Konverterer til PowerPoint …';

  @override
  String pdfToPptxPagesToSlides(int count) {
    return '$count sider > $count lysbilder';
  }

  @override
  String get pdfToPptxEmptyDocument => 'Tomt dokument';

  @override
  String get qualityLabel => 'Kvalitet';

  @override
  String get pdfToPptxQualityHint =>
      'En høyere oppløsning gir skarpere lysbilder, men en betydelig større fil.';

  @override
  String pdfToPptxHeavyWarning(int count) {
    return 'Advarsel: i høy kvalitet kan en presentasjon på $count sider veie flere titalls MB og ta lang tid å åpne. Velg Standard når du er i tvil.';
  }

  @override
  String get goodToKnow => 'Å vite';

  @override
  String get pdfToPptxCaveat =>
      'Hvert lysbilde er et bilde av siden: layouten er identisk med PDF, men teksten vil ikke kunne redigeres i PowerPoint.\nFor å hente redigerbar tekst, bruk \"PDF til Word\" i stedet.\nEn presentasjon har bare ett lysbildeformat: den er hentet fra den første siden, og sider med forskjellige formater er sentrert i den.';

  @override
  String get pdfToPptxResultTitle => 'Presentasjon klar';

  @override
  String pdfToPptxResultDetail(
    String name,
    int count,
    String size,
    String quality,
  ) {
    return '$name — $count lysbilder · $size · $quality';
  }

  @override
  String get notSavedYet =>
      'Filen er ikke på enheten din ennå: lagre den eller del den.';

  @override
  String get pdfToPptxChangeQuality => 'Endre kvalitet';

  @override
  String get pdfToPptxConvertAction => 'Konverter til PowerPoint';

  @override
  String pdfToPptxExportWhat(int count) {
    return 'PowerPoint-presentasjon · $count lysbilder';
  }

  @override
  String get formatLabel => 'Format';

  @override
  String get actionExport => 'Eksporter';

  @override
  String get imageQualityWeb => 'Internett (72 dpi)';

  @override
  String get imageQualityStandard => 'Standard (150 dpi)';

  @override
  String get imageQualityHigh => 'Høy kvalitet (300 dpi)';

  @override
  String get pdfToImagesEmptyTitle => 'Ett bilde per side';

  @override
  String get pdfToImagesEmptyBody =>
      'Velg en PDF: hver side vil komme ut som et bilde, med definisjonen som du deretter justerer.';

  @override
  String pdfToImagesNotAPdf(String name) {
    return '$name: Velg en PDF-fil.';
  }

  @override
  String errorLoadFailed(String detail) {
    return 'Kunne ikke laste: $detail';
  }

  @override
  String get pdfToImagesProgress => 'Eksport pågår …';

  @override
  String pdfToImagesExportWhat(int count, String format) {
    return '$count bilder $format';
  }

  @override
  String get pdfaEmptyTitle => 'Arkiver i lang tid';

  @override
  String get pdfaEmptyBody =>
      'PDF/A er arkiveringsformatet som kreves av mange administrasjoner. Dokumentet konverteres uten å miste utseendet.';

  @override
  String get pdfaConformanceLevel => 'Samsvarsnivå';

  @override
  String get pdfaA1bDetail =>
      'Det strengeste og mest universelt aksepterte nivået. Velg når du er i tvil.';

  @override
  String get pdfaA2bDetail =>
      'Basert på PDF 1.7: mer effektiv komprimering, litt lettere filer.';

  @override
  String get pdfaA3bDetail =>
      'Som A-2b, men tillater vedlegg (ofte etterspurt for elektronisk fakturering).';

  @override
  String pdfaConvertingTo(String level) {
    return 'Konvertering til $level...';
  }

  @override
  String get pdfaCaveatTitle => 'Hva konverteringen endrer';

  @override
  String pdfaCaveat(int dpi) {
    return 'Hver side tegnes på nytt som et bilde ved $dpi dpi: teksten blir et bilde, oppsettet fryses. Det er dette som gjør filen virkelig kompatibel uten å være avhengig av fontene til originaldokumentet, men til gjengjeld er teksten ikke lenger valgbar eller søkbar, koblingene og skjemaene forsvinner, og filen blir tyngre.';
  }

  @override
  String pdfaOpenFailed(String detail) {
    return 'Kan ikke åpne denne PDF-en: $detail';
  }

  @override
  String get imagesToPdfEmptyTitle => 'Bilder, en PDF';

  @override
  String get imagesToPdfEmptyBody =>
      'JPG, PNG, WebP, HEIC – legg til bildene dine og de vil bli satt sammen i den rekkefølgen du velger.';

  @override
  String get imagesToPdfChoose => 'Velg bilder';

  @override
  String get imagesToPdfAdd => 'Legg til bilder';

  @override
  String imagesToPdfRejected(String names) {
    return 'Hoppet over (ikke et bilde): $names';
  }

  @override
  String get imagesToPdfBuilding => 'Oppretter PDF-en...';

  @override
  String imagesToPdfBuildFailed(String detail) {
    return 'Opprettelsen mislyktes: $detail';
  }

  @override
  String imagesToPdfCreateAction(int count) {
    return 'Lag PDF-en ($count bilder)';
  }

  @override
  String get actionRotate => 'Roter';

  @override
  String get actionRemove => 'Fjern';

  @override
  String get htmlTitle => 'HTML / nettside til PDF';

  @override
  String get htmlIntro =>
      'Gjør om en nettside eller HTML-kode til A4 PDF. Gjengivelsen utføres av nettleseren integrert i Android, oppsettet er derfor som for utskrift fra Chrome.';

  @override
  String get htmlModeUrl => 'Nettstedets adresse';

  @override
  String get htmlModeCode => 'HTML-kode';

  @override
  String get htmlUrlLabel => 'Sideadresse';

  @override
  String get htmlUrlHint => 'https://example.fr/artikkel';

  @override
  String get htmlCodeLabel => 'HTML-kode';

  @override
  String get htmlCodeHint => '<h1>Tittel</h1>\n<p>Tekst...</p>';

  @override
  String get htmlUrlBadScheme =>
      'Adressen må begynne med http:// eller https://.';

  @override
  String get htmlUrlIncomplete => 'Skriv inn en fullstendig nettadresse.';

  @override
  String get htmlCodeEmpty => 'Lim inn HTML-kode for å konvertere.';

  @override
  String get htmlLoadingUrl => 'Laster inn siden og konverterer …';

  @override
  String get htmlConverting => 'HTML-konvertering pågår...';

  @override
  String get htmlNetworkNotice =>
      'En internettforbindelse er nødvendig: det er det eneste verktøyet i applikasjonen som må laste ned siden. Sider som krever en kontopålogging, et informasjonskapselbanner eller mye JavaScript kan bli ufullstendige.';

  @override
  String get htmlOfflineNotice =>
      'HTML og CSS skrevet direkte til siden gjengis offline. På den annen side krever bilder, stilark eller fonter som kalles av en ekstern nettadresse en internettforbindelse.';

  @override
  String get watermarkEmptyTitle => 'Legg til et vannmerke';

  @override
  String get watermarkEmptyBody =>
      'Valgt tekst gjentas i bakgrunnen på alle sider – for å merke et dokument som konfidensielt eller utkast.';

  @override
  String get watermarkEmptyNote => 'Gratis eksport uten antall grenser.';

  @override
  String get watermarkTextLabel => 'Vannmerketekst';

  @override
  String get watermarkDefaultText => 'KONFIDENSIELT';

  @override
  String get watermarkNeedText => 'Skriv inn tekst for vannmerket.';

  @override
  String watermarkOpacity(int percent) {
    return 'Opasitet: $percent %';
  }

  @override
  String watermarkRotation(int degrees) {
    return 'Rotasjonsvinkel: $degrees°';
  }

  @override
  String watermarkFontSize(int points) {
    return 'Tekststørrelse: $points pt';
  }

  @override
  String get watermarkColor => 'Farge';

  @override
  String get colorGrey => 'Grå';

  @override
  String get colorRed => 'Rødt';

  @override
  String get colorBlue => 'Blått';

  @override
  String get colorBlack => 'Svart';

  @override
  String get watermarkProgress => 'Vannmerkeapplikasjon pågår...';

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
  String get pageNumbersEmptyTitle => 'Nummerer sidene';

  @override
  String get pageNumbersEmptyBody =>
      'Velg en PDF, og deretter plasseringen og formatet til tallene som skal legges til på hver side.';

  @override
  String get positionLabel => 'Posisjon';

  @override
  String get positionBottomCenter => 'Nederst i midten';

  @override
  String get positionBottomRight => 'Nederst til høyre';

  @override
  String get positionTopCenter => 'Øverst i midten';

  @override
  String get positionTopRight => 'Øverst til høyre';

  @override
  String get pageNumbersFormatPlain => 'N';

  @override
  String get pageNumbersFormatOfTotal => 'N / totalt';

  @override
  String get pageNumbersStart => 'Startnummer';

  @override
  String get pageNumbersProgress => 'Nummerering pågår …';

  @override
  String get organizeEmptyTitle => 'Gjenoppta en PDF i hånden';

  @override
  String get organizeEmptyBody =>
      'Åpne et dokument for å dele det, trekke ut sider eller endre rekkefølgen.';

  @override
  String get organizeOpenFile => 'Åpne en fil';

  @override
  String get organizeNothingToExport => 'Ingen sider å eksportere.';

  @override
  String organizePagesKept(int kept, int total) {
    return '$kept sider beholdt av $total';
  }

  @override
  String get organizePageExcluded => 'Forkastet';

  @override
  String organizePageMoved(int from) {
    return 'Flyttet fra posisjon $from';
  }

  @override
  String organizePageTitle(int number) {
    return 'Side $number';
  }

  @override
  String organizeExcludePage(int number) {
    return 'Kast side $number';
  }

  @override
  String organizeIncludePage(int number) {
    return 'Inkluder side $number';
  }

  @override
  String organizeMovePage(int number) {
    return 'Flytt side $number';
  }

  @override
  String get organizeExtract => 'Utdrag';

  @override
  String get organizeSplit => 'Del opp';

  @override
  String get organizePreview => 'Oversikt';

  @override
  String get organizeExtractTitle => 'Trekk ut et sideområde';

  @override
  String organizeRangeLabel(int start, int end) {
    return 'Sidene $start til $end';
  }

  @override
  String get organizeSplitTitle => 'Del opp i flere filer';

  @override
  String organizeFileCount(int count) {
    return '$count filer';
  }

  @override
  String organizeSplitFailed(String detail) {
    return 'Divisjonsfeil: $detail';
  }

  @override
  String get scanNoCamera => 'Ingen kamera tilgjengelig på denne enheten.';

  @override
  String scanCameraFailed(String detail) {
    return 'Kan ikke initialisere kamera: $detail';
  }

  @override
  String get scanCropToolbar => 'Juster';

  @override
  String scanCaptureFailed(String detail) {
    return 'Opptak mislyktes: $detail';
  }

  @override
  String get scanPermissionBody =>
      'Tilgang til kameraet kreves for å skanne et dokument.';

  @override
  String get scanGrantPermission => 'Tillat kamera';

  @override
  String get actionRetry => 'Prøv igjen';

  @override
  String get scanNoPageYet => 'Ingen sider for øyeblikket.';

  @override
  String scanFinishAction(int count) {
    return 'Finish · $count';
  }

  @override
  String get signTitle => 'Signer en PDF';

  @override
  String get signIntro =>
      'Legg til din håndtegnede signatur på en side i en PDF. Det er en enkel tegning lagt til dokumentet, ikke en sertifisert elektronisk signatur.';

  @override
  String get signChooseSubtitle => 'Velg dokumentet du vil signere';

  @override
  String get signPickPage => 'Velg siden du vil signere.';

  @override
  String get signDrawTitle => 'Tegn signaturen min';

  @override
  String get signDrawBody =>
      'Tegn med fingeren som på papir. Dette setter et design på siden - det er ikke en sertifisert elektronisk signatur.';

  @override
  String get signNeedDrawing => 'Tegn en signatur før du fortsetter.';

  @override
  String get signClear => 'Klart';

  @override
  String get signValidate => 'Bekreft';

  @override
  String get signPlaceBody =>
      'Dra signaturen til ønsket plassering på siden, og trykk deretter på Fullfør.';

  @override
  String get signPageUnavailable => 'Kan ikke vise siden.';

  @override
  String get signProgress => 'Legger til signaturen …';

  @override
  String get editTitle => 'Kommenter et dokument';

  @override
  String get editEmptyBody =>
      'Legg til tekst eller marker passasjer direkte i en eksisterende PDF.';

  @override
  String get editAddTextTitle => 'Legg til tekst';

  @override
  String get editTextHint => 'Teksten din';

  @override
  String editFontSize(int size) {
    return 'Tekststørrelse: $size';
  }

  @override
  String get editNeedAnnotation =>
      'Legg til minst én merknad før du fullfører.';

  @override
  String get editProgress => 'Bruk av merknader...';

  @override
  String get editChooseOther => 'Velg en annen PDF';

  @override
  String get editUndoTooltip => 'Angre siste merknad';

  @override
  String get editModeText => 'Tekst';

  @override
  String get editModeHighlight => 'Marker';

  @override
  String get editPageUnavailable => 'Kan ikke vise denne siden.';

  @override
  String get ocrEmptyTitle => 'Gjør tekst søkbar';

  @override
  String get ocrEmptyBody =>
      'Teksten i en skannet PDF gjenkjennes og legges til over bildet, usynlig. Siden endrer ikke utseende.';

  @override
  String get ocrWrongFormat => 'Velg en PDF eller et bilde (JPG, PNG, etc.).';

  @override
  String get ocrProgress => 'Anerkjennelse pågår...';

  @override
  String ocrFailed(String detail) {
    return 'Kunne ikke gjenkjenne: $detail';
  }

  @override
  String get ocrRunAction => 'Start gjenkjenning';

  @override
  String get ocrResultTitle => 'OCR-resultat';

  @override
  String ocrResultBody(int count) {
    return '$count sider analysert. Den søkbare PDF-en er klar, og du kan også kopiere all gjenkjent tekst.';
  }

  @override
  String get ocrCopyText => 'Kopier tekst';

  @override
  String get ocrTextCopied => 'Tekst kopiert.';

  @override
  String get redactIntro =>
      'Skjul områder av en PDF permanent (navn, adresser, beløp). I motsetning til et enkelt svart rektangel plassert på toppen, blir den skjulte teksten faktisk slettet fra filen, ikke bare dekket: den kan ikke lenger velges eller kopieres.';

  @override
  String get redactChooseSubtitle => 'Velg dokumentet som skal redigeres';

  @override
  String get redactCaveat =>
      'Merk: For å fjerne skjult tekst, konverteres hver side i dokumentet til et bilde (200 ppi). Resultatet er derfor ikke lenger en PDF som teksten kan velges fra, og den resulterende filen er generelt tyngre enn originalen.';

  @override
  String get redactEmptyPdf => 'Denne PDF-en inneholder ingen sider.';

  @override
  String redactOpenFailed(String detail) {
    return 'Kan ikke åpne denne PDF-en (den kan være passordbeskyttet): $detail';
  }

  @override
  String redactPageRenderFailed(int number, String detail) {
    return '$number-siden kan ikke vises: $detail';
  }

  @override
  String get redactUndoTooltip => 'Angre siste sone';

  @override
  String get redactInstructions =>
      'Dra fingeren over siden for å tegne et område du vil skjule. Dekket tekst vil faktisk bli fjernet fra filen, ikke bare dekket.';

  @override
  String get redactPagePrevious => 'Forrige side';

  @override
  String get redactPageNext => 'Neste side';

  @override
  String redactPager(int current, int total) {
    return 'Side $current / $total';
  }

  @override
  String get redactNoZone => 'Ikke inntegnet areal';

  @override
  String redactZoneCount(int count) {
    return '$count områder å skjule';
  }

  @override
  String get redactOtherPdf => 'Annen PDF';

  @override
  String get redactAction => 'Rediger';

  @override
  String get redactProgress => 'Redaksjon pågår …';

  @override
  String get cropEmptyTitle => 'Beskjær margene';

  @override
  String get cropEmptyBody =>
      'Velg en PDF-fil, og dra fingeren over forhåndsvisningen for å skissere området du vil beholde.';

  @override
  String get cropTooSmall => 'Det valgte området er for lite.';

  @override
  String get cropProgress => 'Trimming pågår...';

  @override
  String cropFailed(String detail) {
    return 'Trimming mislyktes: $detail';
  }

  @override
  String get cropKeptArea => 'Fredet område';

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
  String get cropFullPage => 'Helside';

  @override
  String get cropAllPages => 'Bruk på alle sider';

  @override
  String get cropAllPagesOn => 'Det samme området er kuttet ut på hver side.';

  @override
  String get cropAllPagesOff =>
      'Bare side 1 beskjæres, de andre beholdes hele.';

  @override
  String get cropCaveat =>
      'Beskjæring reduserer størrelsen på siden: innhold utenfor området vises eller skrives ikke lenger ut.';

  @override
  String get cropAction => 'Beskjære';

  @override
  String get compareTitle => 'Sammenlign to PDF-er';

  @override
  String get compareEmptyTitle => 'Hva har endret seg';

  @override
  String get compareEmptyBody =>
      'Velg to versjoner av samme PDF. De lagte og slettede passasjene vil bli plassert ved siden av hverandre, side for side.';

  @override
  String get compareSlotA => 'Fil A';

  @override
  String get compareSlotB => 'Fil B';

  @override
  String get compareAction => 'Sammenlign';

  @override
  String get compareProgress => 'Sammenligning pågår...';

  @override
  String compareFailed(String detail) {
    return 'Sammenligning mislyktes: $detail';
  }

  @override
  String compareChangedPages(int changed, int total) {
    return '$changed sider er forskjellige på $total';
  }

  @override
  String get compareNoDifference =>
      'Ingen forskjeller oppdaget mellom de to filene.';

  @override
  String comparePageHeading(int number) {
    return 'Side $number';
  }

  @override
  String organizeFilesCreated(int count) {
    return '$count filer opprettet';
  }

  @override
  String organizePartTitle(int number) {
    return 'Del $number';
  }
}
