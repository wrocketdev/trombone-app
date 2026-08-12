// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Italian (`it`).
class LIt extends L {
  LIt([String locale = 'it']) : super(locale);

  @override
  String get appTitle => 'Trombone — PDF, Scanner e Word';

  @override
  String get appWordmark => 'Trombone';

  @override
  String get actionSave => 'Salva';

  @override
  String get actionShare => 'Condividi';

  @override
  String get actionCompress => 'Comprimi';

  @override
  String get actionDone => 'Fatto';

  @override
  String get actionCancel => 'Annulla';

  @override
  String get actionChange => 'Cambia';

  @override
  String get actionContinue => 'Continua';

  @override
  String get actionOpening => 'Apertura…';

  @override
  String get actionRemoveFile => 'Togli questo file';

  @override
  String get progressPreparing => 'Preparazione…';

  @override
  String progressPercent(int percent) {
    return '$percent %';
  }

  @override
  String get emptyReassurance =>
      'Esportazione gratuita, senza filigrana né limiti.';

  @override
  String get emptyAcceptedFormats => 'Formati accettati';

  @override
  String get exportSavedTitle => 'Salvato.';

  @override
  String get exportSavedBody =>
      'Con il nome e nella cartella che hai appena scelto. Senza filigrana, senza limiti, niente da sbloccare.';

  @override
  String get exportSaveDialogTitle => 'Salva il PDF';

  @override
  String pageTileIncluded(int number) {
    return 'Pagina $number, inclusa. Tocca per escluderla.';
  }

  @override
  String pageTileExcluded(int number) {
    return 'Pagina $number, esclusa. Tocca per includerla.';
  }

  @override
  String pageTileRotate(int number) {
    return 'Ruota la pagina $number';
  }

  @override
  String sectionHeaderSemantics(String title, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count strumenti',
      one: '$count strumento',
    );
    return '$title, $_temp0';
  }

  @override
  String toolCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count strumenti',
      one: '$count strumento',
    );
    return '$_temp0';
  }

  @override
  String get homePromise =>
      'Crea il tuo documento ed esportalo.\nNessun muro alla fine.';

  @override
  String get homeChipNoAccount => 'Senza account';

  @override
  String get homeChipNoWatermark => 'Senza filigrana';

  @override
  String get homeChipUnlimited => 'Esportazione illimitata';

  @override
  String get homeSearchTooltip => 'Cerca uno strumento';

  @override
  String get homeColophon =>
      'Al momento di salvare non si sblocca nulla a pagamento. L’esportazione è gratuita, senza filigrana e senza limiti di quantità.';

  @override
  String get sectionFeatured => 'In evidenza';

  @override
  String get sectionToPdf => 'Verso il PDF';

  @override
  String get sectionFromPdf => 'Dal PDF';

  @override
  String get sectionSecurity => 'Sicurezza';

  @override
  String get sectionEdit => 'Modificare';

  @override
  String get toolMerge => 'Unisci';

  @override
  String get toolMergeKeywords =>
      'unire combinare fondere raggruppare concatenare aggiungere';

  @override
  String get toolMergeSubtitle =>
      'PDF, Word, immagini e testo in un solo documento';

  @override
  String get toolRectoVerso => 'Fronte-retro';

  @override
  String get toolRectoVersoKeywords =>
      'duplex intercalare scansione pari dispari due lati';

  @override
  String get toolRectoVersoSubtitle => 'Due scansioni, di nuovo in ordine';

  @override
  String get toolImagesToPdf => 'Immagini in PDF';

  @override
  String get toolImagesToPdfKeywords =>
      'foto jpg jpeg png foto album fotocamera immagine';

  @override
  String get toolImagesToPdfSubtitle => 'Foto e schermate in un documento';

  @override
  String get toolPdfToWord => 'PDF in Word';

  @override
  String get toolPdfToWordKeywords =>
      'docx videoscrittura modificabile convertire doc';

  @override
  String get toolPdfToWordSubtitle => 'Testo e tabelle, modificabili';

  @override
  String get toolOrganize => 'Organizza un PDF';

  @override
  String get toolOrganizeKeywords =>
      'dividere separare estrarre riordinare ordine pagine eliminare';

  @override
  String get toolOrganizeSubtitle => 'Dividere, estrarre, riordinare';

  @override
  String get toolExcelToPdf => 'Excel in PDF';

  @override
  String get toolExcelToPdfKeywords =>
      'foglio di calcolo xlsx cartella foglio calcolo';

  @override
  String get toolPptxToPdf => 'PowerPoint in PDF';

  @override
  String get toolPptxToPdfKeywords => 'pptx diapositiva presentazione slide';

  @override
  String get toolHtmlToPdf => 'Pagina web in PDF';

  @override
  String get toolHtmlToPdfKeywords => 'html sito internet url link articolo';

  @override
  String get toolScan => 'Scansiona un documento';

  @override
  String get toolScanKeywords =>
      'fotocamera foto digitalizzare scansione carta';

  @override
  String get toolPdfToExcel => 'PDF in Excel';

  @override
  String get toolPdfToExcelKeywords =>
      'foglio di calcolo xlsx tabella estrarre dati';

  @override
  String get toolPdfToPptx => 'PDF in PowerPoint';

  @override
  String get toolPdfToPptxKeywords => 'pptx diapositiva presentazione slide';

  @override
  String get toolPdfToImages => 'PDF in immagini';

  @override
  String get toolPdfToImagesKeywords =>
      'jpg png foto esportare schermata immagine';

  @override
  String get toolOcr => 'Testo ricercabile (OCR)';

  @override
  String get toolOcrKeywords =>
      'riconoscimento caratteri scansionato copiare selezionare';

  @override
  String get toolPdfA => 'Converti in PDF/A';

  @override
  String get toolPdfAKeywords =>
      'archiviazione norma lungo termine conservazione iso';

  @override
  String get toolProtect => 'Proteggi PDF';

  @override
  String get toolProtectKeywords =>
      'password lucchetto cifrare bloccare proteggere';

  @override
  String get toolUnlock => 'Sblocca PDF';

  @override
  String get toolUnlockKeywords =>
      'togliere password aprire decifrare sproteggere lucchetto';

  @override
  String get toolRepair => 'Ripara PDF';

  @override
  String get toolRepairKeywords =>
      'corrotto illeggibile danneggiato recuperare rotto errore';

  @override
  String get toolRedact => 'Oscura un PDF';

  @override
  String get toolRedactKeywords =>
      'nascondere annerire anonimizzare riservato cancellare censurare';

  @override
  String get toolEdit => 'Modifica PDF';

  @override
  String get toolEditKeywords =>
      'testo modificare correggere annotare scrivere';

  @override
  String get toolSign => 'Firma';

  @override
  String get toolSignKeywords => 'firma sigla contratto mano';

  @override
  String get toolWatermark => 'Filigrana';

  @override
  String get toolWatermarkKeywords =>
      'watermark timbro riservato bozza marchio';

  @override
  String get toolPageNumbers => 'Numeri di pagina';

  @override
  String get toolPageNumbersKeywords =>
      'impaginazione folio numerare cifre numeri';

  @override
  String get toolCrop => 'Ritaglia un PDF';

  @override
  String get toolCropKeywords => 'tagliare margini ritagliare bordi dimensione';

  @override
  String get toolCompare => 'Confronta PDF';

  @override
  String get toolCompareKeywords =>
      'differenza versioni diff modifiche confrontare';

  @override
  String get searchHint => 'Unisci, password, filigrana…';

  @override
  String get searchClear => 'Cancella';

  @override
  String searchNoResultTitle(String query) {
    return 'Nessuno strumento per «$query».';
  }

  @override
  String get searchNoResultBody =>
      'Prova con il formato che hai a portata di mano — «Word», «Excel», «foto» — o con quello che vuoi farne: «firmare», «dividere», «password».';

  @override
  String get actionUndo => 'Annulla';

  @override
  String get actionApply => 'Applica';

  @override
  String get actionChoose => 'Scegli';

  @override
  String get actionChoosePdf => 'Scegli un PDF';

  @override
  String get actionChooseFiles => 'Scegli i file';

  @override
  String get actionConvert => 'Converti';

  @override
  String get actionFinish => 'Termina';

  @override
  String get actionBack => 'Indietro';

  @override
  String get actionAdd => 'Aggiungi';

  @override
  String get noFileChosen => 'Nessun file scelto';

  @override
  String errorExportFailed(String detail) {
    return 'Esportazione non riuscita: $detail';
  }

  @override
  String errorShareFailed(String detail) {
    return 'Condivisione non riuscita: $detail';
  }

  @override
  String errorOpenFailed(String detail) {
    return 'Impossibile aprire il file: $detail';
  }

  @override
  String errorConversionFailed(String detail) {
    return 'Conversione non riuscita: $detail';
  }

  @override
  String errorOnFile(String name, String detail) {
    return '$name: $detail';
  }

  @override
  String get errorPickPdf => 'Scegli un file PDF.';

  @override
  String sizeBytes(String value) {
    return '$value B';
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
    return '~ $size';
  }

  @override
  String pageCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count pagine',
      one: '$count pagina',
    );
    return '$_temp0';
  }

  @override
  String pageCountOfTotal(int kept, int total) {
    String _temp0 = intl.Intl.pluralLogic(
      kept,
      locale: localeName,
      other: '$kept pagine',
      one: '$kept pagina',
    );
    return '$_temp0 su $total';
  }

  @override
  String pageOfTotal(int current, int total) {
    return 'Pagina $current di $total';
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
  String get formatImages => 'Immagini';

  @override
  String get formatText => 'Testo';

  @override
  String get mergeAddFile => 'Aggiungi un file';

  @override
  String get mergeAddHint => 'PDF, Word, immagini o testo';

  @override
  String get mergeEmptyTitle => 'Un solo documento';

  @override
  String get mergeEmptyBody =>
      'Aggiungi PDF, file Word, immagini o testo. Potrai riordinarli ed escludere pagine prima di esportare.';

  @override
  String get mergeNeedOnePage =>
      'Aggiungi almeno un file con una pagina da includere.';

  @override
  String get mergeProgress => 'Unione in corso…';

  @override
  String mergeFailed(String detail) {
    return 'Unione non riuscita: $detail';
  }

  @override
  String mergeRemoved(String name) {
    return '$name rimosso.';
  }

  @override
  String mergeRemoveTooltip(String name) {
    return 'Togli $name';
  }

  @override
  String mergeMoveSemantics(String name) {
    return 'Sposta $name';
  }

  @override
  String get mergeRotateAll => 'Ruota tutte le pagine';

  @override
  String mergePreviewAndExport(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count pagine',
      one: '$count pagina',
    );
    return 'Anteprima ed esporta ($_temp0)';
  }

  @override
  String previewTitle(String size) {
    return 'Anteprima · $size';
  }

  @override
  String previewZoomPage(int number) {
    return 'Pagina $number, ingrandisci';
  }

  @override
  String get previewPageUnreadable => 'Pagina illeggibile.';

  @override
  String previewExportWhat(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count pagine',
      one: '$count pagina',
    );
    return 'PDF · $_temp0';
  }

  @override
  String get compressTitle => 'Compressione';

  @override
  String compressBody(String size) {
    return 'Dimensione attuale: $size. Scegli un livello — la dimensione stimata appare prima di applicare.';
  }

  @override
  String get compressEstimating => 'Stima in corso…';

  @override
  String get compressProgress => 'Compressione in corso…';

  @override
  String compressFailed(String detail) {
    return 'Compressione non riuscita: $detail';
  }

  @override
  String get protectEmptyTitle => 'Mettere una password';

  @override
  String get protectEmptyBody =>
      'Il PDF non si aprirà più senza la password che scegli. Conservala: non può essere recuperata.';

  @override
  String get protectSubtitle => 'Sarà cifrato con AES a 256 bit';

  @override
  String get protectPassword => 'Password';

  @override
  String get protectConfirmPassword => 'Conferma la password';

  @override
  String get protectShowPasswords => 'Mostra le password';

  @override
  String get protectHidePasswords => 'Nascondi le password';

  @override
  String get protectMismatch => 'Le due password non coincidono.';

  @override
  String get protectWarning =>
      'Annotala da qualche parte: senza di essa il documento diventa illeggibile per sempre. Nessun recupero è possibile, né da parte tua né dell’applicazione.';

  @override
  String get protectAlreadyProtected =>
      'Questo file è già protetto — usa prima Sblocca PDF.';

  @override
  String get protectProgress => 'Protezione in corso…';

  @override
  String protectFailed(String detail) {
    return 'Protezione non riuscita: $detail';
  }

  @override
  String get protectAction => 'Proteggi';

  @override
  String get protectResultTitle => 'PDF protetto';

  @override
  String get protectResultDetail =>
      'Cifrato con AES a 256 bit. Servirà la password per aprirlo.';

  @override
  String get protectExportWhat => 'PDF protetto da password';

  @override
  String get unlockEmptyTitle => 'Togliere la password';

  @override
  String get unlockEmptyBody =>
      'Ti serve la password attuale del documento. Una volta tolta, il PDF si aprirà liberamente.';

  @override
  String get unlockAcceptsProtectedPdf => 'PDF protetto';

  @override
  String get unlockChooseProtectedPdf => 'Scegli un PDF protetto';

  @override
  String get unlockCurrentPassword => 'Password attuale';

  @override
  String get unlockWrongPassword => 'Password errata.';

  @override
  String get unlockProgress => 'Sblocco in corso…';

  @override
  String unlockFailed(String detail) {
    return 'Sblocco non riuscito: $detail';
  }

  @override
  String get unlockAction => 'Sblocca';

  @override
  String get repairEmptyTitle => 'Riparare un file rovinato';

  @override
  String get repairEmptyBody =>
      'La struttura interna di un PDF danneggiato viene ricostruita. Ciò che è recuperabile lo sarà.';

  @override
  String get repairProgress => 'Riparazione in corso…';

  @override
  String get repairFailed =>
      'Impossibile riparare questo file — forse è troppo danneggiato.';

  @override
  String get repairAction => 'Ripara';

  @override
  String get pdfToWordEmptyTitle => 'Un Word modificabile';

  @override
  String get pdfToWordEmptyBody =>
      'Il testo e la struttura del PDF vengono trasposti in un documento .docx che potrai riaprire e correggere.';

  @override
  String get pdfToWordAnalyzing => 'Analisi del documento…';

  @override
  String get pdfToWordAnalysisPending => 'Analisi in attesa';

  @override
  String pdfToWordAnalysisFailed(String detail) {
    return 'Analisi non riuscita: $detail';
  }

  @override
  String get pdfLocked => 'Questo PDF è protetto da password. Sbloccalo prima.';

  @override
  String get pdfToWordConverting => 'Conversione in Word…';

  @override
  String get pdfToWordSummaryTitle => 'Contenuto rilevato';

  @override
  String pdfToWordParagraphCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count paragrafi',
      one: '$count paragrafo',
    );
    return '$_temp0';
  }

  @override
  String pdfToWordHeadingCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count titoli',
      one: '$count titolo',
    );
    return '$_temp0';
  }

  @override
  String pdfToWordTableCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count tabelle',
      one: '$count tabella',
    );
    return '$_temp0';
  }

  @override
  String get pdfToWordNoTables =>
      'Nessuna tabella rilevata: se il tuo PDF ne contiene, le loro righe diventeranno paragrafi.';

  @override
  String get pdfToWordCaveat =>
      'La conversione riproduce il testo, la formattazione e le tabelle, ma non l’impaginazione esatta: la posizione delle immagini e delle colonne non viene conservata, e le immagini non passano nel documento Word.';

  @override
  String get pdfToWordScanWarning =>
      'Questo PDF sembra una scansione: non è stato trovato alcun testo. Usa prima lo strumento Testo ricercabile (OCR), poi torna a convertire il PDF ottenuto.';

  @override
  String get pdfToWordResultTitle => 'Documento Word pronto';

  @override
  String pdfToWordResultDetail(String name, String size) {
    return '$name — $size';
  }

  @override
  String get pdfToWordExportWhat => 'Documento Word';

  @override
  String get pdfToWordConvertAction => 'Converti in Word';

  @override
  String get actionConvertAgain => 'Converti di nuovo';

  @override
  String errorSaveFailed(String detail) {
    return 'Impossibile salvare: $detail';
  }

  @override
  String get rectoVersoIntro =>
      'Un alimentatore a facciata singola dà due file: le pagine dispari in ordine, le pari spesso in ordine inverso. Scegli entrambi per ricomporli.';

  @override
  String get rectoVersoOddSlot => 'File delle pagine dispari (fronte)';

  @override
  String get rectoVersoEvenSlot => 'File delle pagine pari (retro)';

  @override
  String get rectoVersoReversed => 'Il secondo file è in ordine inverso';

  @override
  String get rectoVersoReversedHint =>
      'È il caso più frequente, selezionato per impostazione predefinita';

  @override
  String rectoVersoPreview(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count pagine',
      one: '$count pagina',
    );
    return 'Anteprima dell’intercalazione ($_temp0)';
  }

  @override
  String get rectoVersoProgress => 'Intercalazione in corso…';

  @override
  String fileWithPageCount(String name, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count pagine',
      one: '$count pagina',
    );
    return '$name · $_temp0';
  }

  @override
  String get actionPreviewAndExport => 'Anteprima ed esporta';

  @override
  String errorOpenFailedShort(String detail) {
    return 'Impossibile aprire: $detail';
  }

  @override
  String errorGeneric(String detail) {
    return 'Non riuscito: $detail';
  }

  @override
  String get actionConvertToPdf => 'Converti in PDF';

  @override
  String get convertProgress => 'Conversione in corso…';

  @override
  String get excelEmptyTitle => 'Una cartella di lavoro in PDF';

  @override
  String get excelEmptyBody =>
      'I fogli di un file .xlsx diventano pagine PDF, pronte da inviare o stampare.';

  @override
  String get excelChooseWorkbook => 'Scegli una cartella di lavoro';

  @override
  String get excelChooseXlsx => 'Scegli una cartella .xlsx';

  @override
  String get excelLegacyFormat =>
      'Il formato .xls (il vecchio formato binario di Excel) non è supportato. Salva il file come .xlsx e riprova.';

  @override
  String get excelWrongFormat => 'Scegli una cartella di lavoro Excel .xlsx.';

  @override
  String excelUnreadable(String detail) {
    return 'Cartella illeggibile: $detail';
  }

  @override
  String excelSheetsAndRows(int sheets, int rows) {
    String _temp0 = intl.Intl.pluralLogic(
      sheets,
      locale: localeName,
      other: '$sheets fogli',
      one: '$sheets foglio',
    );
    String _temp1 = intl.Intl.pluralLogic(
      rows,
      locale: localeName,
      other: '$rows righe in totale',
      one: '$rows riga in totale',
    );
    return '$_temp0 · $_temp1';
  }

  @override
  String get excelSheetsDetected => 'Fogli rilevati';

  @override
  String get excelEmptySheet => 'Foglio vuoto';

  @override
  String excelSheetDimensions(int rows, int columns) {
    String _temp0 = intl.Intl.pluralLogic(
      rows,
      locale: localeName,
      other: '$rows righe',
      one: '$rows riga',
    );
    String _temp1 = intl.Intl.pluralLogic(
      columns,
      locale: localeName,
      other: '$columns colonne',
      one: '$columns colonna',
    );
    return '$_temp0 × $_temp1';
  }

  @override
  String get excelRepeatHeader =>
      'Ripeti la riga di intestazione su ogni pagina';

  @override
  String get excelRepeatHeaderHint =>
      'La prima riga del foglio viene ridisegnata in cima a ogni pagina della tabella.';

  @override
  String get excelCaveat =>
      'Ciò che la conversione riprende: il testo delle celle così com’è salvato nel file (compreso l’ultimo risultato calcolato delle formule), la prima riga in grassetto e una griglia.\n\nCiò che non riprende: colori, caratteri, formati numerici, celle unite, immagini, grafici e le formule stesse. Le colonne vengono ridotte per stare nella larghezza della pagina; sui fogli molto larghi, il testo delle celle troppo strette viene troncato con «…».';

  @override
  String get pptxEmptyTitle => 'Una presentazione in PDF';

  @override
  String get pptxEmptyBody =>
      'Una pagina orizzontale 16:9 per diapositiva, con il titolo e i punti elenco. Il testo viene ripreso; le immagini, le forme e gli sfondi originali no.\n\nFormato accettato: .pptx. Un vecchio file .ppt va prima risalvato come .pptx da PowerPoint.';

  @override
  String get pptxChoosePresentation => 'Scegli una presentazione';

  @override
  String get pptxTextOnlyTitle => 'Conversione del solo testo';

  @override
  String get pptxTextOnlyBody =>
      'Il testo di ogni diapositiva viene ripreso. Le immagini, le forme, gli sfondi, i colori e le impaginazioni originali non vengono conservati: il PDF ottenuto è un’impaginazione semplice e leggibile, non una copia fedele della tua presentazione.';

  @override
  String pptxSlideCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count diapositive',
      one: '$count diapositiva',
    );
    return '$_temp0';
  }

  @override
  String get pptxSlidesDetected => 'Diapositive rilevate';

  @override
  String pptxMoreSlides(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count diapositive',
      one: '$count diapositiva',
    );
    return 'e altre $_temp0…';
  }

  @override
  String get pptxUntitledSlide => 'Senza titolo';

  @override
  String get pptxEmptySlide => 'Nessun testo (solo immagine o forma)';

  @override
  String pptxTextLineCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count righe di testo',
      one: '$count riga di testo',
    );
    return '$_temp0';
  }

  @override
  String pptxReadFailed(String detail) {
    return 'Impossibile leggere: $detail';
  }

  @override
  String get compressLevelLight => 'Leggera';

  @override
  String get compressLevelMedium => 'Media';

  @override
  String get compressLevelStrong => 'Forte';

  @override
  String get pptxQualityStandard => 'Standard (150 dpi)';

  @override
  String get pptxQualityHigh => 'Alta (220 dpi)';

  @override
  String get pdfToExcelEmptyTitle => 'Recuperare le tabelle';

  @override
  String get pdfToExcelEmptyBody =>
      'Le tabelle di un PDF vengono estratte in una cartella di lavoro Excel. La formattazione non viene conservata, i valori sì.';

  @override
  String pdfToExcelPagesAnalyzed(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count pagine analizzate',
      one: '$count pagina analizzata',
    );
    return '$_temp0';
  }

  @override
  String pdfToExcelAnalysisFailed(String detail) {
    return 'Analisi impossibile. Il PDF potrebbe essere protetto da password o danneggiato. ($detail)';
  }

  @override
  String get pdfToExcelNothingToExport =>
      'Niente da esportare: nessuna tabella rilevata.';

  @override
  String get pdfToExcelBuilding => 'Creazione della cartella…';

  @override
  String get pdfToExcelIncludeParagraphs =>
      'Includi anche il testo fuori dalle tabelle (una riga per paragrafo)';

  @override
  String get pdfToExcelIncludeParagraphsHint =>
      'Utile per un documento semi-strutturato: il testo va nella colonna A, dopo le tabelle della pagina.';

  @override
  String get pdfToExcelCaveatTitle => 'Ciò che la conversione non conserva';

  @override
  String get pdfToExcelCaveat =>
      'Il rilevamento si basa sulla posizione del testo nella pagina: le tabelle senza bordi regolari, le celle unite e le colonne molto irregolari possono essere divise male. Un PDF scansionato (un’immagine) non contiene testo estraibile e non darà nulla. Colori, formule e immagini non vengono mai ripresi: solo i valori di testo.';

  @override
  String pdfToExcelTablesFound(int tables, int pages) {
    String _temp0 = intl.Intl.pluralLogic(
      tables,
      locale: localeName,
      other: '$tables tabelle rilevate',
      one: '$tables tabella rilevata',
    );
    String _temp1 = intl.Intl.pluralLogic(
      pages,
      locale: localeName,
      other: '$pages pagine',
      one: '$pages pagina',
    );
    return '$_temp0 su $_temp1';
  }

  @override
  String pdfToExcelPagesConcerned(String pages) {
    return 'Pagine interessate: $pages';
  }

  @override
  String pdfToExcelParagraphsOutside(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count paragrafi fuori dalle tabelle',
      one: '$count paragrafo fuori dalle tabelle',
    );
    return '$_temp0';
  }

  @override
  String get pdfToExcelScannedWarning =>
      'Da questo PDF non si è potuto estrarre alcun testo: quasi certamente è un documento scansionato (immagini di pagine). Un foglio di calcolo non può ricavarne nulla; usa prima lo strumento di riconoscimento del testo (OCR).';

  @override
  String get pdfToExcelNoTableWarning =>
      'In questo documento non è stata riconosciuta alcuna struttura di tabella. Il testo c’è, ma non è disposto in colonne regolari. Invece di produrre una cartella illeggibile, attiva sopra «Includi anche il testo fuori dalle tabelle», oppure usa «PDF in Word», che conserva meglio i paragrafi.';

  @override
  String get pdfToExcelResultTitle => 'Cartella pronta';

  @override
  String get pdfToExcelExportWhat => 'Cartella di lavoro Excel';

  @override
  String get pdfToExcelConvertAction => 'Converti in Excel';

  @override
  String resultNameAndSize(String name, String size) {
    return '$name — $size';
  }

  @override
  String get pdfToPptxEmptyTitle => 'Una diapositiva per pagina';

  @override
  String get pdfToPptxEmptyBody =>
      'Il PDF diventa una presentazione PowerPoint identica. Ogni pagina arriva come immagine: l’impaginazione è fedele, ma il testo non sarà modificabile in PowerPoint.';

  @override
  String pdfToPptxOpenFailed(String detail) {
    return 'Impossibile aprire questo PDF: $detail';
  }

  @override
  String get pdfToPptxConverting => 'Conversione in PowerPoint…';

  @override
  String pdfToPptxPagesToSlides(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count pagine',
      one: '$count pagina',
    );
    String _temp1 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count diapositive',
      one: '$count diapositiva',
    );
    return '$_temp0 > $_temp1';
  }

  @override
  String get pdfToPptxEmptyDocument => 'Documento vuoto';

  @override
  String get qualityLabel => 'Qualità';

  @override
  String get pdfToPptxQualityHint =>
      'Una risoluzione più alta dà diapositive più nitide ma un file nettamente più pesante.';

  @override
  String pdfToPptxHeavyWarning(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count pagine',
      one: '$count pagina',
    );
    return 'Attenzione: in alta qualità, una presentazione di $_temp0 può pesare svariate decine di MB ed essere lenta ad aprirsi. Nel dubbio scegli Standard.';
  }

  @override
  String get goodToKnow => 'Da sapere';

  @override
  String get pdfToPptxCaveat =>
      'Ogni diapositiva è un’immagine della pagina: l’impaginazione è identica al PDF, ma il testo non sarà modificabile in PowerPoint.\nPer recuperare testo modificabile, usa piuttosto «PDF in Word».\nUna presentazione ha un solo formato di diapositiva: viene preso dalla prima pagina, e le pagine di formato diverso vengono centrate all’interno.';

  @override
  String get pdfToPptxResultTitle => 'Presentazione pronta';

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
      other: '$count diapositive',
      one: '$count diapositiva',
    );
    return '$name — $_temp0 · $size · $quality';
  }

  @override
  String get notSavedYet =>
      'Il file non è ancora sul tuo dispositivo: salvalo o condividilo.';

  @override
  String get pdfToPptxChangeQuality => 'Cambia la qualità';

  @override
  String get pdfToPptxConvertAction => 'Converti in PowerPoint';

  @override
  String pdfToPptxExportWhat(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count diapositive',
      one: '$count diapositiva',
    );
    return 'Presentazione PowerPoint · $_temp0';
  }

  @override
  String get formatLabel => 'Formato';

  @override
  String get actionExport => 'Esporta';

  @override
  String get imageQualityWeb => 'Web (72 dpi)';

  @override
  String get imageQualityStandard => 'Standard (150 dpi)';

  @override
  String get imageQualityHigh => 'Alta qualità (300 dpi)';

  @override
  String get pdfToImagesEmptyTitle => 'Un’immagine per pagina';

  @override
  String get pdfToImagesEmptyBody =>
      'Scegli un PDF: ogni pagina ne uscirà come immagine, alla risoluzione che imposti dopo.';

  @override
  String pdfToImagesNotAPdf(String name) {
    return '$name: scegli un file PDF.';
  }

  @override
  String errorLoadFailed(String detail) {
    return 'Caricamento non riuscito: $detail';
  }

  @override
  String get pdfToImagesProgress => 'Esportazione in corso…';

  @override
  String pdfToImagesExportWhat(int count, String format) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count immagini $format',
      one: '$count immagine $format',
    );
    return '$_temp0';
  }

  @override
  String get pdfaEmptyTitle => 'Archiviare a lungo termine';

  @override
  String get pdfaEmptyBody =>
      'Il PDF/A è il formato di archiviazione richiesto da molte amministrazioni. Il documento viene convertito senza perdere il suo aspetto.';

  @override
  String get pdfaConformanceLevel => 'Livello di conformità';

  @override
  String get pdfaA1bDetail =>
      'Il livello più rigoroso e più universalmente accettato. Da scegliere nel dubbio.';

  @override
  String get pdfaA2bDetail =>
      'Basato su PDF 1.7: compressione più efficace, file un po’ più leggeri.';

  @override
  String get pdfaA3bDetail =>
      'Come l’A-2b, ma consente gli allegati (spesso richiesto per la fatturazione elettronica).';

  @override
  String pdfaConvertingTo(String level) {
    return 'Conversione in $level…';
  }

  @override
  String get pdfaCaveatTitle => 'Ciò che la conversione cambia';

  @override
  String pdfaCaveat(int dpi) {
    return 'Ogni pagina viene ridisegnata come immagine a $dpi dpi: il testo diventa un’immagine e l’impaginazione si fissa. È questo che rende il file realmente conforme senza dipendere dai caratteri del documento originale, ma in cambio il testo non è più selezionabile né ricercabile, i link e i moduli spariscono, e il file diventa più pesante.';
  }

  @override
  String pdfaOpenFailed(String detail) {
    return 'Impossibile aprire questo PDF: $detail';
  }

  @override
  String get imagesToPdfEmptyTitle => 'Immagini in un PDF';

  @override
  String get imagesToPdfEmptyBody =>
      'JPG, PNG, WebP, HEIC — aggiungi le tue immagini e saranno assemblate nell’ordine che scegli.';

  @override
  String get imagesToPdfChoose => 'Scegli le immagini';

  @override
  String get imagesToPdfAdd => 'Aggiungi immagini';

  @override
  String imagesToPdfRejected(String names) {
    return 'Ignorato (non è un’immagine): $names';
  }

  @override
  String get imagesToPdfBuilding => 'Creazione del PDF…';

  @override
  String imagesToPdfBuildFailed(String detail) {
    return 'Creazione non riuscita: $detail';
  }

  @override
  String imagesToPdfCreateAction(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count immagini',
      one: '$count immagine',
    );
    return 'Crea il PDF ($_temp0)';
  }

  @override
  String get actionRotate => 'Ruota';

  @override
  String get actionRemove => 'Togli';

  @override
  String get htmlTitle => 'HTML / pagina web in PDF';

  @override
  String get htmlIntro =>
      'Trasforma una pagina web o del codice HTML in un PDF A4. Il rendering è fatto dal browser integrato in Android, quindi l’impaginazione è quella di una stampa da Chrome.';

  @override
  String get htmlModeUrl => 'Indirizzo web';

  @override
  String get htmlModeCode => 'Codice HTML';

  @override
  String get htmlUrlLabel => 'Indirizzo della pagina';

  @override
  String get htmlUrlHint => 'https://esempio.it/articolo';

  @override
  String get htmlCodeLabel => 'Codice HTML';

  @override
  String get htmlCodeHint => '<h1>Titolo</h1>\n<p>Testo…</p>';

  @override
  String get htmlUrlBadScheme =>
      'L’indirizzo deve iniziare con http:// o https://.';

  @override
  String get htmlUrlIncomplete => 'Inserisci un indirizzo web completo.';

  @override
  String get htmlCodeEmpty => 'Incolla del codice HTML da convertire.';

  @override
  String get htmlLoadingUrl => 'Caricamento della pagina e conversione…';

  @override
  String get htmlConverting => 'Conversione dell’HTML…';

  @override
  String get htmlNetworkNotice =>
      'Serve una connessione a internet: è l’unico strumento dell’applicazione che deve scaricare la pagina. Le pagine che richiedono un accesso a un account, un banner dei cookie o molto JavaScript possono uscire incomplete.';

  @override
  String get htmlOfflineNotice =>
      'L’HTML e il CSS scritti direttamente nella pagina vengono resi offline. Le immagini, i fogli di stile o i caratteri richiamati da un indirizzo web esterno, invece, richiedono una connessione a internet.';

  @override
  String get watermarkEmptyTitle => 'Applicare una filigrana';

  @override
  String get watermarkEmptyBody =>
      'Un testo a tua scelta viene ripetuto sullo sfondo di tutte le pagine — per contrassegnare un documento come riservato o come bozza.';

  @override
  String get watermarkEmptyNote =>
      'Esportazione gratuita e senza limiti di quantità.';

  @override
  String get watermarkTextLabel => 'Testo della filigrana';

  @override
  String get watermarkDefaultText => 'RISERVATO';

  @override
  String get watermarkNeedText => 'Inserisci un testo per la filigrana.';

  @override
  String watermarkOpacity(int percent) {
    return 'Opacità: $percent %';
  }

  @override
  String watermarkRotation(int degrees) {
    return 'Angolo di rotazione: $degrees°';
  }

  @override
  String watermarkFontSize(int points) {
    return 'Dimensione del testo: $points pt';
  }

  @override
  String get watermarkColor => 'Colore';

  @override
  String get colorGrey => 'Grigio';

  @override
  String get colorRed => 'Rosso';

  @override
  String get colorBlue => 'Blu';

  @override
  String get colorBlack => 'Nero';

  @override
  String get watermarkProgress => 'Applicazione della filigrana…';

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
  String get pageNumbersEmptyTitle => 'Numerare le pagine';

  @override
  String get pageNumbersEmptyBody =>
      'Scegli un PDF, poi la posizione e il formato dei numeri che saranno aggiunti a ogni pagina.';

  @override
  String get positionLabel => 'Posizione';

  @override
  String get positionBottomCenter => 'In basso al centro';

  @override
  String get positionBottomRight => 'In basso a destra';

  @override
  String get positionTopCenter => 'In alto al centro';

  @override
  String get positionTopRight => 'In alto a destra';

  @override
  String get pageNumbersFormatPlain => 'N';

  @override
  String get pageNumbersFormatOfTotal => 'N / totale';

  @override
  String get pageNumbersStart => 'Numero iniziale';

  @override
  String get pageNumbersProgress => 'Numerazione in corso…';

  @override
  String get organizeEmptyTitle => 'Riprendere in mano un PDF';

  @override
  String get organizeEmptyBody =>
      'Apri un documento per dividerlo, estrarne pagine o cambiarne l’ordine.';

  @override
  String get organizeOpenFile => 'Apri un file';

  @override
  String get organizeNothingToExport => 'Nessuna pagina da esportare.';

  @override
  String organizePagesKept(int kept, int total) {
    String _temp0 = intl.Intl.pluralLogic(
      kept,
      locale: localeName,
      other: '$kept pagine conservate',
      one: '$kept pagina conservata',
    );
    return '$_temp0 su $total';
  }

  @override
  String get organizePageExcluded => 'Esclusa';

  @override
  String organizePageMoved(int from) {
    return 'Spostata dalla posizione $from';
  }

  @override
  String organizePageTitle(int number) {
    return 'Pagina $number';
  }

  @override
  String organizeExcludePage(int number) {
    return 'Escludi la pagina $number';
  }

  @override
  String organizeIncludePage(int number) {
    return 'Includi la pagina $number';
  }

  @override
  String organizeMovePage(int number) {
    return 'Sposta la pagina $number';
  }

  @override
  String get organizeExtract => 'Estrai';

  @override
  String get organizeSplit => 'Dividi';

  @override
  String get organizePreview => 'Anteprima';

  @override
  String get organizeExtractTitle => 'Estrarre un intervallo di pagine';

  @override
  String organizeRangeLabel(int start, int end) {
    return 'Pagine da $start a $end';
  }

  @override
  String get organizeSplitTitle => 'Dividere in più file';

  @override
  String organizeFileCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count file',
      one: '$count file',
    );
    return '$_temp0';
  }

  @override
  String organizeSplitFailed(String detail) {
    return 'Divisione non riuscita: $detail';
  }

  @override
  String get scanNoCamera =>
      'Nessuna fotocamera disponibile su questo dispositivo.';

  @override
  String scanCameraFailed(String detail) {
    return 'Impossibile avviare la fotocamera: $detail';
  }

  @override
  String get scanCropToolbar => 'Regola';

  @override
  String scanCaptureFailed(String detail) {
    return 'Scatto non riuscito: $detail';
  }

  @override
  String get scanPermissionBody =>
      'Per scansionare un documento serve l’accesso alla fotocamera.';

  @override
  String get scanGrantPermission => 'Consenti la fotocamera';

  @override
  String get actionRetry => 'Riprova';

  @override
  String get scanNoPageYet => 'Ancora nessuna pagina.';

  @override
  String scanFinishAction(int count) {
    return 'Termina · $count';
  }

  @override
  String get signTitle => 'Firmare un PDF';

  @override
  String get signIntro =>
      'Apponi la tua firma disegnata a mano su una pagina di un PDF. È semplicemente un disegno aggiunto al documento, non una firma elettronica certificata.';

  @override
  String get signChooseSubtitle => 'Seleziona il documento da firmare';

  @override
  String get signPickPage => 'Scegli la pagina da firmare.';

  @override
  String get signDrawTitle => 'Disegnare la mia firma';

  @override
  String get signDrawBody =>
      'Disegna con il dito come faresti su carta. Questo appone un disegno sulla pagina — non è una firma elettronica certificata.';

  @override
  String get signNeedDrawing => 'Disegna una firma prima di continuare.';

  @override
  String get signClear => 'Cancella';

  @override
  String get signValidate => 'Conferma';

  @override
  String get signPlaceBody =>
      'Trascina la firma dove vuoi sulla pagina, poi tocca Termina.';

  @override
  String get signPageUnavailable => 'Impossibile mostrare la pagina.';

  @override
  String get signProgress => 'Aggiunta della firma…';

  @override
  String get editTitle => 'Annotare un documento';

  @override
  String get editEmptyBody =>
      'Aggiungi del testo o evidenzia dei passaggi direttamente su un PDF esistente.';

  @override
  String get editAddTextTitle => 'Aggiungere del testo';

  @override
  String get editTextHint => 'Il tuo testo';

  @override
  String editFontSize(int size) {
    return 'Dimensione del testo: $size';
  }

  @override
  String get editNeedAnnotation =>
      'Aggiungi almeno un’annotazione prima di terminare.';

  @override
  String get editProgress => 'Applicazione delle annotazioni…';

  @override
  String get editChooseOther => 'Scegli un altro PDF';

  @override
  String get editUndoTooltip => 'Annulla l’ultima annotazione';

  @override
  String get editModeText => 'Testo';

  @override
  String get editModeHighlight => 'Evidenzia';

  @override
  String get editPageUnavailable => 'Impossibile mostrare questa pagina.';

  @override
  String get ocrEmptyTitle => 'Rendere il testo ricercabile';

  @override
  String get ocrEmptyBody =>
      'Il testo di un PDF scansionato viene riconosciuto e aggiunto sopra l’immagine, in modo invisibile. La pagina non cambia aspetto.';

  @override
  String get ocrWrongFormat => 'Scegli un PDF o un’immagine (JPG, PNG…).';

  @override
  String get ocrProgress => 'Riconoscimento in corso…';

  @override
  String ocrFailed(String detail) {
    return 'Riconoscimento non riuscito: $detail';
  }

  @override
  String get ocrRunAction => 'Avvia il riconoscimento';

  @override
  String get ocrResultTitle => 'Risultato dell’OCR';

  @override
  String ocrResultBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count pagine analizzate',
      one: '$count pagina analizzata',
    );
    return '$_temp0. Il PDF ricercabile è pronto, e puoi anche copiare tutto il testo riconosciuto.';
  }

  @override
  String get ocrCopyText => 'Copia il testo';

  @override
  String get ocrTextCopied => 'Testo copiato.';

  @override
  String get redactIntro =>
      'Nascondi definitivamente delle zone di un PDF (nomi, indirizzi, importi). A differenza di un semplice rettangolo nero messo sopra, il testo nascosto viene realmente eliminato dal file, non solo coperto: non può più essere selezionato né copiato.';

  @override
  String get redactChooseSubtitle => 'Seleziona il documento da oscurare';

  @override
  String get redactCaveat =>
      'Da sapere: per eliminare il testo nascosto, ogni pagina del documento viene riconvertita in immagine (200 dpi). Il risultato non è quindi più un PDF di cui si possa selezionare il testo, e il file ottenuto è di solito più pesante dell’originale.';

  @override
  String get redactEmptyPdf => 'Questo PDF non contiene alcuna pagina.';

  @override
  String redactOpenFailed(String detail) {
    return 'Impossibile aprire questo PDF (potrebbe essere protetto da password): $detail';
  }

  @override
  String redactPageRenderFailed(int number, String detail) {
    return 'Impossibile mostrare la pagina $number: $detail';
  }

  @override
  String get redactUndoTooltip => 'Annulla l’ultima zona';

  @override
  String get redactInstructions =>
      'Trascina il dito sulla pagina per tracciare una zona da nascondere. Il testo coperto sarà realmente eliminato dal file, non solo coperto.';

  @override
  String get redactPagePrevious => 'Pagina precedente';

  @override
  String get redactPageNext => 'Pagina successiva';

  @override
  String redactPager(int current, int total) {
    return 'Pagina $current / $total';
  }

  @override
  String get redactNoZone => 'Nessuna zona tracciata';

  @override
  String redactZoneCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count zone da nascondere',
      one: '$count zona da nascondere',
    );
    return '$_temp0';
  }

  @override
  String get redactOtherPdf => 'Altro PDF';

  @override
  String get redactAction => 'Oscura';

  @override
  String get redactProgress => 'Oscuramento in corso…';

  @override
  String get cropEmptyTitle => 'Ritagliare i margini';

  @override
  String get cropEmptyBody =>
      'Scegli un PDF, poi trascina il dito sull’anteprima per delimitare la zona da conservare.';

  @override
  String get cropTooSmall => 'La zona selezionata è troppo piccola.';

  @override
  String get cropProgress => 'Ritaglio in corso…';

  @override
  String cropFailed(String detail) {
    return 'Ritaglio non riuscito: $detail';
  }

  @override
  String get cropKeptArea => 'Zona conservata';

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
  String get cropFullPage => 'Pagina intera';

  @override
  String get cropAllPages => 'Applica a tutte le pagine';

  @override
  String get cropAllPagesOn =>
      'La stessa zona viene ritagliata su ogni pagina.';

  @override
  String get cropAllPagesOff =>
      'Solo la pagina 1 viene ritagliata, le altre restano intere.';

  @override
  String get cropCaveat =>
      'Il ritaglio riduce la dimensione della pagina: il contenuto fuori dalla zona non viene più mostrato né stampato.';

  @override
  String get cropAction => 'Ritaglia';

  @override
  String get compareTitle => 'Confrontare due PDF';

  @override
  String get compareEmptyTitle => 'Che cosa è cambiato';

  @override
  String get compareEmptyBody =>
      'Scegli due versioni di uno stesso PDF. I passaggi aggiunti ed eliminati saranno messi a confronto, pagina per pagina.';

  @override
  String get compareSlotA => 'File A';

  @override
  String get compareSlotB => 'File B';

  @override
  String get compareAction => 'Confronta';

  @override
  String get compareProgress => 'Confronto in corso…';

  @override
  String compareFailed(String detail) {
    return 'Confronto non riuscito: $detail';
  }

  @override
  String compareChangedPages(int changed, int total) {
    String _temp0 = intl.Intl.pluralLogic(
      changed,
      locale: localeName,
      other: '$changed pagine differiscono',
      one: '$changed pagina differisce',
    );
    return '$_temp0 su $total';
  }

  @override
  String get compareNoDifference =>
      'Nessuna differenza rilevata tra i due file.';

  @override
  String comparePageHeading(int number) {
    return 'Pagina $number';
  }

  @override
  String organizeFilesCreated(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count file creati',
      one: '$count file creato',
    );
    return '$_temp0';
  }

  @override
  String organizePartTitle(int number) {
    return 'Parte $number';
  }
}
