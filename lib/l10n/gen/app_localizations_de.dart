// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class LDe extends L {
  LDe([String locale = 'de']) : super(locale);

  @override
  String get appTitle => 'Trombone — PDF, Scan & Word';

  @override
  String get appWordmark => 'Trombone';

  @override
  String get actionSave => 'Speichern';

  @override
  String get actionShare => 'Teilen';

  @override
  String get actionCompress => 'Verkleinern';

  @override
  String get actionDone => 'Fertig';

  @override
  String get actionCancel => 'Abbrechen';

  @override
  String get actionChange => 'Ändern';

  @override
  String get actionContinue => 'Weiter';

  @override
  String get actionOpening => 'Wird geöffnet…';

  @override
  String get actionRemoveFile => 'Diese Datei entfernen';

  @override
  String get progressPreparing => 'Vorbereitung…';

  @override
  String progressPercent(int percent) {
    return '$percent %';
  }

  @override
  String get emptyReassurance =>
      'Export kostenlos, ohne Wasserzeichen und ohne Limit.';

  @override
  String get emptyAcceptedFormats => 'Zulässige Formate';

  @override
  String get exportSavedTitle => 'Gespeichert.';

  @override
  String get exportSavedBody =>
      'Unter dem Namen und im Ordner, den Sie gerade gewählt haben. Ohne Wasserzeichen, ohne Limit, nichts freizuschalten.';

  @override
  String get exportSaveDialogTitle => 'PDF speichern';

  @override
  String pageTileIncluded(int number) {
    return 'Seite $number, enthalten. Zum Aussortieren tippen.';
  }

  @override
  String pageTileExcluded(int number) {
    return 'Seite $number, aussortiert. Zum Aufnehmen tippen.';
  }

  @override
  String pageTileRotate(int number) {
    return 'Seite $number drehen';
  }

  @override
  String sectionHeaderSemantics(String title, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Werkzeuge',
      one: '$count Werkzeug',
    );
    return '$title, $_temp0';
  }

  @override
  String toolCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Werkzeuge',
      one: '$count Werkzeug',
    );
    return '$_temp0';
  }

  @override
  String get homePromise =>
      'Dokument erstellen, exportieren.\nKeine Bezahlschranke am Ende.';

  @override
  String get homeChipNoAccount => 'Ohne Konto';

  @override
  String get homeChipNoWatermark => 'Ohne Wasserzeichen';

  @override
  String get homeChipUnlimited => 'Export unbegrenzt';

  @override
  String get homeSearchTooltip => 'Werkzeug suchen';

  @override
  String get homeColophon =>
      'Beim Speichern wird nichts gegen Bezahlung freigeschaltet. Der Export ist kostenlos, ohne Wasserzeichen und ohne Limit.';

  @override
  String get sectionFeatured => 'Empfohlen';

  @override
  String get sectionToPdf => 'Zum PDF';

  @override
  String get sectionFromPdf => 'Aus dem PDF';

  @override
  String get sectionSecurity => 'Sicherheit';

  @override
  String get sectionEdit => 'Bearbeiten';

  @override
  String get toolMerge => 'Zusammenführen';

  @override
  String get toolMergeKeywords =>
      'verbinden kombinieren zusammenfugen mergen anhangen';

  @override
  String get toolMergeSubtitle =>
      'PDF, Word, Bilder und Text in einem Dokument';

  @override
  String get toolRectoVerso => 'Doppelseitig';

  @override
  String get toolRectoVersoKeywords =>
      'duplex sortieren scan gerade ungerade vorder ruckseite';

  @override
  String get toolRectoVersoSubtitle => 'Zwei Scans, wieder in Reihenfolge';

  @override
  String get toolImagesToPdf => 'Bilder zu PDF';

  @override
  String get toolImagesToPdfKeywords =>
      'foto jpg jpeg png fotos album kamera bild';

  @override
  String get toolImagesToPdfSubtitle =>
      'Fotos und Screenshots in einem Dokument';

  @override
  String get toolPdfToWord => 'PDF zu Word';

  @override
  String get toolPdfToWordKeywords =>
      'docx textverarbeitung bearbeitbar umwandeln doc';

  @override
  String get toolPdfToWordSubtitle => 'Text und Tabellen, bearbeitbar';

  @override
  String get toolOrganize => 'PDF ordnen';

  @override
  String get toolOrganizeKeywords =>
      'teilen trennen extrahieren sortieren reihenfolge seiten loschen';

  @override
  String get toolOrganizeSubtitle => 'Teilen, extrahieren, sortieren';

  @override
  String get toolExcelToPdf => 'Excel zu PDF';

  @override
  String get toolExcelToPdfKeywords =>
      'tabelle xlsx arbeitsmappe blatt kalkulation';

  @override
  String get toolPptxToPdf => 'PowerPoint zu PDF';

  @override
  String get toolPptxToPdfKeywords => 'pptx folie prasentation slides';

  @override
  String get toolHtmlToPdf => 'Webseite zu PDF';

  @override
  String get toolHtmlToPdfKeywords => 'html website internet url link artikel';

  @override
  String get toolScan => 'Dokument scannen';

  @override
  String get toolScanKeywords => 'kamera foto digitalisieren scan papier';

  @override
  String get toolPdfToExcel => 'PDF zu Excel';

  @override
  String get toolPdfToExcelKeywords =>
      'tabelle xlsx tabellen extrahieren daten';

  @override
  String get toolPdfToPptx => 'PDF zu PowerPoint';

  @override
  String get toolPdfToPptxKeywords => 'pptx folie prasentation slides';

  @override
  String get toolPdfToImages => 'PDF zu Bildern';

  @override
  String get toolPdfToImagesKeywords =>
      'jpg png foto exportieren screenshot bild';

  @override
  String get toolOcr => 'Durchsuchbarer Text (OCR)';

  @override
  String get toolOcrKeywords =>
      'texterkennung zeichen gescannt kopieren markieren';

  @override
  String get toolPdfA => 'In PDF/A umwandeln';

  @override
  String get toolPdfAKeywords => 'archivierung norm langzeit aufbewahrung iso';

  @override
  String get toolProtect => 'PDF schützen';

  @override
  String get toolProtectKeywords =>
      'passwort schloss verschlusseln sperren sichern kennwort';

  @override
  String get toolUnlock => 'PDF entsperren';

  @override
  String get toolUnlockKeywords =>
      'passwort entfernen offnen entschlusseln freigeben schloss';

  @override
  String get toolRepair => 'PDF reparieren';

  @override
  String get toolRepairKeywords =>
      'beschadigt unlesbar defekt wiederherstellen fehler';

  @override
  String get toolRedact => 'PDF schwärzen';

  @override
  String get toolRedactKeywords =>
      'verbergen schwarzen anonymisieren vertraulich loschen zensieren';

  @override
  String get toolEdit => 'PDF bearbeiten';

  @override
  String get toolEditKeywords =>
      'text andern korrigieren kommentieren schreiben';

  @override
  String get toolSign => 'Unterschreiben';

  @override
  String get toolSignKeywords => 'unterschrift signatur vertrag hand';

  @override
  String get toolWatermark => 'Wasserzeichen';

  @override
  String get toolWatermarkKeywords =>
      'watermark stempel vertraulich entwurf markierung';

  @override
  String get toolPageNumbers => 'Seitenzahlen';

  @override
  String get toolPageNumbersKeywords =>
      'paginierung folio nummerieren ziffern seitennummern';

  @override
  String get toolCrop => 'PDF zuschneiden';

  @override
  String get toolCropKeywords => 'schneiden rander beschneiden kanten grosse';

  @override
  String get toolCompare => 'PDF vergleichen';

  @override
  String get toolCompareKeywords =>
      'unterschied versionen diff anderungen vergleichen';

  @override
  String get searchHint => 'Zusammenführen, Passwort, Wasserzeichen…';

  @override
  String get searchClear => 'Löschen';

  @override
  String searchNoResultTitle(String query) {
    return 'Kein Werkzeug für „$query“.';
  }

  @override
  String get searchNoResultBody =>
      'Versuchen Sie es mit dem Format, das Sie zur Hand haben — „Word“, „Excel“, „Foto“ — oder mit dem, was Sie vorhaben: „unterschreiben“, „teilen“, „Passwort“.';

  @override
  String get actionUndo => 'Rückgängig';

  @override
  String get actionApply => 'Anwenden';

  @override
  String get actionChoose => 'Auswählen';

  @override
  String get actionChoosePdf => 'PDF auswählen';

  @override
  String get actionChooseFiles => 'Dateien auswählen';

  @override
  String get actionConvert => 'Umwandeln';

  @override
  String get actionFinish => 'Abschließen';

  @override
  String get actionBack => 'Zurück';

  @override
  String get actionAdd => 'Hinzufügen';

  @override
  String get noFileChosen => 'Keine Datei gewählt';

  @override
  String errorExportFailed(String detail) {
    return 'Export fehlgeschlagen: $detail';
  }

  @override
  String errorShareFailed(String detail) {
    return 'Teilen fehlgeschlagen: $detail';
  }

  @override
  String errorOpenFailed(String detail) {
    return 'Die Datei konnte nicht geöffnet werden: $detail';
  }

  @override
  String errorConversionFailed(String detail) {
    return 'Umwandlung fehlgeschlagen: $detail';
  }

  @override
  String errorOnFile(String name, String detail) {
    return '$name: $detail';
  }

  @override
  String get errorPickPdf => 'Bitte wählen Sie eine PDF-Datei.';

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
      other: '$count Seiten',
      one: '$count Seite',
    );
    return '$_temp0';
  }

  @override
  String pageCountOfTotal(int kept, int total) {
    String _temp0 = intl.Intl.pluralLogic(
      kept,
      locale: localeName,
      other: '$kept Seiten',
      one: '$kept Seite',
    );
    return '$_temp0 von $total';
  }

  @override
  String pageOfTotal(int current, int total) {
    return 'Seite $current von $total';
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
  String get mergeAddFile => 'Datei hinzufügen';

  @override
  String get mergeAddHint => 'PDF, Word, Bilder oder Text';

  @override
  String get mergeEmptyTitle => 'Ein einziges Dokument';

  @override
  String get mergeEmptyBody =>
      'Fügen Sie PDFs, Word-Dateien, Bilder oder Text hinzu. Vor dem Export können Sie die Reihenfolge ändern und Seiten aussortieren.';

  @override
  String get mergeNeedOnePage =>
      'Fügen Sie mindestens eine Datei mit einer Seite hinzu.';

  @override
  String get mergeProgress => 'Wird zusammengeführt…';

  @override
  String mergeFailed(String detail) {
    return 'Zusammenführen fehlgeschlagen: $detail';
  }

  @override
  String mergeRemoved(String name) {
    return '$name entfernt.';
  }

  @override
  String mergeRemoveTooltip(String name) {
    return '$name entfernen';
  }

  @override
  String mergeMoveSemantics(String name) {
    return '$name verschieben';
  }

  @override
  String get mergeRotateAll => 'Alle Seiten drehen';

  @override
  String mergePreviewAndExport(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Seiten',
      one: '$count Seite',
    );
    return 'Vorschau und Export ($_temp0)';
  }

  @override
  String previewTitle(String size) {
    return 'Vorschau · $size';
  }

  @override
  String previewZoomPage(int number) {
    return 'Seite $number, vergrößern';
  }

  @override
  String get previewPageUnreadable => 'Seite nicht lesbar.';

  @override
  String previewExportWhat(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Seiten',
      one: '$count Seite',
    );
    return 'PDF · $_temp0';
  }

  @override
  String get compressTitle => 'Verkleinerung';

  @override
  String compressBody(String size) {
    return 'Aktuelle Größe: $size. Wählen Sie eine Stufe — die geschätzte Größe erscheint vor dem Anwenden.';
  }

  @override
  String get compressEstimating => 'Wird geschätzt…';

  @override
  String get compressProgress => 'Wird verkleinert…';

  @override
  String compressFailed(String detail) {
    return 'Verkleinern fehlgeschlagen: $detail';
  }

  @override
  String get protectEmptyTitle => 'Mit Passwort schützen';

  @override
  String get protectEmptyBody =>
      'Das PDF öffnet sich nur noch mit dem Passwort, das Sie wählen. Bewahren Sie es auf: es lässt sich nicht wiederherstellen.';

  @override
  String get protectSubtitle => 'Wird mit AES 256 Bit verschlüsselt';

  @override
  String get protectPassword => 'Passwort';

  @override
  String get protectConfirmPassword => 'Passwort bestätigen';

  @override
  String get protectShowPasswords => 'Passwörter anzeigen';

  @override
  String get protectHidePasswords => 'Passwörter verbergen';

  @override
  String get protectMismatch => 'Die beiden Passwörter stimmen nicht überein.';

  @override
  String get protectWarning =>
      'Notieren Sie es sich: ohne das Passwort wird das Dokument endgültig unlesbar. Eine Wiederherstellung ist nicht möglich, weder durch Sie noch durch die App.';

  @override
  String get protectAlreadyProtected =>
      'Diese Datei ist bereits geschützt — verwenden Sie zuerst PDF entsperren.';

  @override
  String get protectProgress => 'Wird geschützt…';

  @override
  String protectFailed(String detail) {
    return 'Schützen fehlgeschlagen: $detail';
  }

  @override
  String get protectAction => 'Schützen';

  @override
  String get protectResultTitle => 'PDF geschützt';

  @override
  String get protectResultDetail =>
      'Mit AES 256 Bit verschlüsselt. Zum Öffnen wird das Passwort benötigt.';

  @override
  String get protectExportWhat => 'Passwortgeschütztes PDF';

  @override
  String get unlockEmptyTitle => 'Passwort entfernen';

  @override
  String get unlockEmptyBody =>
      'Sie brauchen das aktuelle Passwort des Dokuments. Danach lässt sich das PDF frei öffnen.';

  @override
  String get unlockAcceptsProtectedPdf => 'Geschütztes PDF';

  @override
  String get unlockChooseProtectedPdf => 'Geschütztes PDF auswählen';

  @override
  String get unlockCurrentPassword => 'Aktuelles Passwort';

  @override
  String get unlockWrongPassword => 'Falsches Passwort.';

  @override
  String get unlockProgress => 'Wird entsperrt…';

  @override
  String unlockFailed(String detail) {
    return 'Entsperren fehlgeschlagen: $detail';
  }

  @override
  String get unlockAction => 'Entsperren';

  @override
  String get repairEmptyTitle => 'Beschädigte Datei reparieren';

  @override
  String get repairEmptyBody =>
      'Die interne Struktur eines beschädigten PDFs wird neu aufgebaut. Was zu retten ist, wird gerettet.';

  @override
  String get repairProgress => 'Wird repariert…';

  @override
  String get repairFailed =>
      'Diese Datei lässt sich nicht reparieren — sie ist womöglich zu stark beschädigt.';

  @override
  String get repairAction => 'Reparieren';

  @override
  String get pdfToWordEmptyTitle => 'Ein bearbeitbares Word';

  @override
  String get pdfToWordEmptyBody =>
      'Text und Struktur des PDFs werden in ein .docx-Dokument übertragen, das Sie wieder öffnen und bearbeiten können.';

  @override
  String get pdfToWordAnalyzing => 'Dokument wird analysiert…';

  @override
  String get pdfToWordAnalysisPending => 'Analyse ausstehend';

  @override
  String pdfToWordAnalysisFailed(String detail) {
    return 'Analyse fehlgeschlagen: $detail';
  }

  @override
  String get pdfLocked =>
      'Dieses PDF ist passwortgeschützt. Entsperren Sie es zuerst.';

  @override
  String get pdfToWordConverting => 'Wird in Word umgewandelt…';

  @override
  String get pdfToWordSummaryTitle => 'Erkannter Inhalt';

  @override
  String pdfToWordParagraphCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Absätze',
      one: '$count Absatz',
    );
    return '$_temp0';
  }

  @override
  String pdfToWordHeadingCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Überschriften',
      one: '$count Überschrift',
    );
    return '$_temp0';
  }

  @override
  String pdfToWordTableCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Tabellen',
      one: '$count Tabelle',
    );
    return '$_temp0';
  }

  @override
  String get pdfToWordNoTables =>
      'Keine Tabelle erkannt: falls Ihr PDF welche enthält, werden deren Zeilen in Absätze umgewandelt.';

  @override
  String get pdfToWordCaveat =>
      'Die Umwandlung überträgt Text, Formatierung und Tabellen, aber nicht das genaue Layout: die Position von Bildern und Spalten bleibt nicht erhalten, und Bilder werden nicht ins Word-Dokument übernommen.';

  @override
  String get pdfToWordScanWarning =>
      'Dieses PDF scheint ein Scan zu sein: es wurde kein Text gefunden. Verwenden Sie zuerst das Werkzeug Durchsuchbarer Text (OCR) und wandeln Sie danach das erhaltene PDF um.';

  @override
  String get pdfToWordResultTitle => 'Word-Dokument fertig';

  @override
  String pdfToWordResultDetail(String name, String size) {
    return '$name — $size';
  }

  @override
  String get pdfToWordExportWhat => 'Word-Dokument';

  @override
  String get pdfToWordConvertAction => 'In Word umwandeln';

  @override
  String get actionConvertAgain => 'Erneut umwandeln';

  @override
  String errorSaveFailed(String detail) {
    return 'Speichern nicht möglich: $detail';
  }

  @override
  String get rectoVersoIntro =>
      'Ein einseitiger Einzug liefert zwei Dateien: die ungeraden Seiten der Reihe nach, die geraden oft in umgekehrter Reihenfolge. Wählen Sie beide, um sie wieder zusammenzusetzen.';

  @override
  String get rectoVersoOddSlot =>
      'Datei mit den ungeraden Seiten (Vorderseite)';

  @override
  String get rectoVersoEvenSlot => 'Datei mit den geraden Seiten (Rückseite)';

  @override
  String get rectoVersoReversed =>
      'Die zweite Datei ist in umgekehrter Reihenfolge';

  @override
  String get rectoVersoReversedHint =>
      'Das ist der häufigste Fall, deshalb voreingestellt';

  @override
  String rectoVersoPreview(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Seiten',
      one: '$count Seite',
    );
    return 'Vorschau der Zusammenführung ($_temp0)';
  }

  @override
  String get rectoVersoProgress => 'Wird zusammengesetzt…';

  @override
  String fileWithPageCount(String name, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Seiten',
      one: '$count Seite',
    );
    return '$name · $_temp0';
  }

  @override
  String get actionPreviewAndExport => 'Vorschau und Export';

  @override
  String errorOpenFailedShort(String detail) {
    return 'Öffnen nicht möglich: $detail';
  }

  @override
  String errorGeneric(String detail) {
    return 'Fehlgeschlagen: $detail';
  }

  @override
  String get actionConvertToPdf => 'In PDF umwandeln';

  @override
  String get convertProgress => 'Wird umgewandelt…';

  @override
  String get excelEmptyTitle => 'Eine Arbeitsmappe als PDF';

  @override
  String get excelEmptyBody =>
      'Die Blätter einer .xlsx-Datei werden zu PDF-Seiten, bereit zum Versenden oder Drucken.';

  @override
  String get excelChooseWorkbook => 'Arbeitsmappe auswählen';

  @override
  String get excelChooseXlsx => '.xlsx-Arbeitsmappe auswählen';

  @override
  String get excelLegacyFormat =>
      'Das Format .xls (das alte binäre Excel-Format) wird nicht unterstützt. Speichern Sie die Datei als .xlsx und versuchen Sie es erneut.';

  @override
  String get excelWrongFormat =>
      'Bitte wählen Sie eine Excel-Arbeitsmappe im Format .xlsx.';

  @override
  String excelUnreadable(String detail) {
    return 'Arbeitsmappe nicht lesbar: $detail';
  }

  @override
  String excelSheetsAndRows(int sheets, int rows) {
    String _temp0 = intl.Intl.pluralLogic(
      sheets,
      locale: localeName,
      other: '$sheets Blätter',
      one: '$sheets Blatt',
    );
    String _temp1 = intl.Intl.pluralLogic(
      rows,
      locale: localeName,
      other: '$rows Zeilen insgesamt',
      one: '$rows Zeile insgesamt',
    );
    return '$_temp0 · $_temp1';
  }

  @override
  String get excelSheetsDetected => 'Erkannte Blätter';

  @override
  String get excelEmptySheet => 'Leeres Blatt';

  @override
  String excelSheetDimensions(int rows, int columns) {
    String _temp0 = intl.Intl.pluralLogic(
      rows,
      locale: localeName,
      other: '$rows Zeilen',
      one: '$rows Zeile',
    );
    String _temp1 = intl.Intl.pluralLogic(
      columns,
      locale: localeName,
      other: '$columns Spalten',
      one: '$columns Spalte',
    );
    return '$_temp0 × $_temp1';
  }

  @override
  String get excelRepeatHeader => 'Kopfzeile auf jeder Seite wiederholen';

  @override
  String get excelRepeatHeaderHint =>
      'Die erste Zeile des Blattes wird oben auf jeder Seite der Tabelle erneut gezeichnet.';

  @override
  String get excelCaveat =>
      'Was die Umwandlung übernimmt: den Zellentext so, wie er in der Datei gespeichert ist (einschließlich des zuletzt berechneten Ergebnisses von Formeln), die erste Zeile fett und ein Gitternetz.\n\nWas sie nicht übernimmt: Farben, Schriften, Zahlenformate, verbundene Zellen, Bilder, Diagramme und die Formeln selbst. Spalten werden verkleinert, damit sie in die Seitenbreite passen; bei sehr breiten Blättern wird der Text zu schmaler Zellen mit „…“ abgeschnitten.';

  @override
  String get pptxEmptyTitle => 'Eine Präsentation als PDF';

  @override
  String get pptxEmptyBody =>
      'Eine Querformatseite im Format 16:9 pro Folie, mit Titel und Aufzählungspunkten. Der Text wird übernommen; die ursprünglichen Bilder, Formen und Hintergründe nicht.\n\nZulässiges Format: .pptx. Eine ältere .ppt-Datei muss zuerst in PowerPoint als .pptx gespeichert werden.';

  @override
  String get pptxChoosePresentation => 'Präsentation auswählen';

  @override
  String get pptxTextOnlyTitle => 'Nur Text wird umgewandelt';

  @override
  String get pptxTextOnlyBody =>
      'Der Text jeder Folie wird übernommen. Die ursprünglichen Bilder, Formen, Hintergründe, Farben und Layouts bleiben nicht erhalten: das erhaltene PDF ist ein schlichtes, gut lesbares Layout, keine getreue Kopie Ihrer Präsentation.';

  @override
  String pptxSlideCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Folien',
      one: '$count Folie',
    );
    return '$_temp0';
  }

  @override
  String get pptxSlidesDetected => 'Erkannte Folien';

  @override
  String pptxMoreSlides(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count weitere Folien',
      one: '$count weitere Folie',
    );
    return 'und $_temp0…';
  }

  @override
  String get pptxUntitledSlide => 'Ohne Titel';

  @override
  String get pptxEmptySlide => 'Kein Text (nur Bild oder Form)';

  @override
  String pptxTextLineCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Textzeilen',
      one: '$count Textzeile',
    );
    return '$_temp0';
  }

  @override
  String pptxReadFailed(String detail) {
    return 'Lesen nicht möglich: $detail';
  }

  @override
  String get compressLevelLight => 'Leicht';

  @override
  String get compressLevelMedium => 'Mittel';

  @override
  String get compressLevelStrong => 'Stark';

  @override
  String get pptxQualityStandard => 'Standard (150 dpi)';

  @override
  String get pptxQualityHigh => 'Hoch (220 dpi)';

  @override
  String get pdfToExcelEmptyTitle => 'Tabellen zurückholen';

  @override
  String get pdfToExcelEmptyBody =>
      'Die Tabellen eines PDFs werden in eine Excel-Arbeitsmappe übernommen. Die Formatierung bleibt nicht erhalten, die Werte schon.';

  @override
  String pdfToExcelPagesAnalyzed(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Seiten analysiert',
      one: '$count Seite analysiert',
    );
    return '$_temp0';
  }

  @override
  String pdfToExcelAnalysisFailed(String detail) {
    return 'Analyse nicht möglich. Das PDF ist vielleicht passwortgeschützt oder beschädigt. ($detail)';
  }

  @override
  String get pdfToExcelNothingToExport =>
      'Nichts zu exportieren: keine Tabelle erkannt.';

  @override
  String get pdfToExcelBuilding => 'Arbeitsmappe wird erstellt…';

  @override
  String get pdfToExcelIncludeParagraphs =>
      'Auch Text außerhalb von Tabellen aufnehmen (eine Zeile je Absatz)';

  @override
  String get pdfToExcelIncludeParagraphsHint =>
      'Nützlich bei halbstrukturierten Dokumenten: der Text landet in Spalte A, nach den Tabellen der Seite.';

  @override
  String get pdfToExcelCaveatTitle => 'Was die Umwandlung nicht erhält';

  @override
  String get pdfToExcelCaveat =>
      'Die Erkennung stützt sich auf die Position des Textes auf der Seite: Tabellen ohne regelmäßige Ränder, verbundene Zellen und sehr unregelmäßige Spalten können falsch getrennt werden. Ein gescanntes PDF (ein Bild) enthält keinen auslesbaren Text und ergibt nichts. Farben, Formeln und Bilder werden nie übernommen: nur die Textwerte.';

  @override
  String pdfToExcelTablesFound(int tables, int pages) {
    String _temp0 = intl.Intl.pluralLogic(
      tables,
      locale: localeName,
      other: '$tables Tabellen erkannt',
      one: '$tables Tabelle erkannt',
    );
    String _temp1 = intl.Intl.pluralLogic(
      pages,
      locale: localeName,
      other: '$pages Seiten',
      one: '$pages Seite',
    );
    return '$_temp0 auf $_temp1';
  }

  @override
  String pdfToExcelPagesConcerned(String pages) {
    return 'Betroffene Seiten: $pages';
  }

  @override
  String pdfToExcelParagraphsOutside(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Absätze außerhalb von Tabellen',
      one: '$count Absatz außerhalb von Tabellen',
    );
    return '$_temp0';
  }

  @override
  String get pdfToExcelScannedWarning =>
      'Aus diesem PDF ließ sich kein Text auslesen: es handelt sich mit großer Wahrscheinlichkeit um ein gescanntes Dokument (Bilder von Seiten). Eine Tabellenkalkulation kann damit nichts anfangen; verwenden Sie zuerst das Werkzeug zur Texterkennung (OCR).';

  @override
  String get pdfToExcelNoTableWarning =>
      'In diesem Dokument wurde keine Tabellenstruktur erkannt. Der Text ist da, aber er steht nicht in regelmäßigen Spalten. Statt eine unlesbare Arbeitsmappe zu erzeugen, schalten Sie oben „Auch Text außerhalb von Tabellen aufnehmen“ ein, oder verwenden Sie „PDF zu Word“, das Absätze besser erhält.';

  @override
  String get pdfToExcelResultTitle => 'Arbeitsmappe fertig';

  @override
  String get pdfToExcelExportWhat => 'Excel-Arbeitsmappe';

  @override
  String get pdfToExcelConvertAction => 'In Excel umwandeln';

  @override
  String resultNameAndSize(String name, String size) {
    return '$name — $size';
  }

  @override
  String get pdfToPptxEmptyTitle => 'Eine Folie pro Seite';

  @override
  String get pdfToPptxEmptyBody =>
      'Das PDF wird zu einer identischen PowerPoint-Präsentation. Jede Seite kommt als Bild an: das Layout ist originalgetreu, aber der Text lässt sich in PowerPoint nicht bearbeiten.';

  @override
  String pdfToPptxOpenFailed(String detail) {
    return 'Dieses PDF konnte nicht geöffnet werden: $detail';
  }

  @override
  String get pdfToPptxConverting => 'Wird in PowerPoint umgewandelt…';

  @override
  String pdfToPptxPagesToSlides(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Seiten',
      one: '$count Seite',
    );
    String _temp1 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Folien',
      one: '$count Folie',
    );
    return '$_temp0 > $_temp1';
  }

  @override
  String get pdfToPptxEmptyDocument => 'Leeres Dokument';

  @override
  String get qualityLabel => 'Qualität';

  @override
  String get pdfToPptxQualityHint =>
      'Eine höhere Auflösung ergibt schärfere Folien, aber eine deutlich größere Datei.';

  @override
  String pdfToPptxHeavyWarning(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Seiten',
      one: '$count Seite',
    );
    return 'Achtung: in hoher Qualität kann eine Präsentation mit $_temp0 mehrere Dutzend MB groß sein und lange zum Öffnen brauchen. Wählen Sie im Zweifel Standard.';
  }

  @override
  String get goodToKnow => 'Gut zu wissen';

  @override
  String get pdfToPptxCaveat =>
      'Jede Folie ist ein Bild der Seite: das Layout entspricht genau dem PDF, aber der Text lässt sich in PowerPoint nicht bearbeiten.\nUm bearbeitbaren Text zu erhalten, verwenden Sie besser „PDF zu Word“.\nEine Präsentation hat nur ein Foliformat: es wird von der ersten Seite übernommen, und Seiten anderer Größe werden darin zentriert.';

  @override
  String get pdfToPptxResultTitle => 'Präsentation fertig';

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
      other: '$count Folien',
      one: '$count Folie',
    );
    return '$name — $_temp0 · $size · $quality';
  }

  @override
  String get notSavedYet =>
      'Die Datei liegt noch nicht auf Ihrem Gerät: speichern oder teilen Sie sie.';

  @override
  String get pdfToPptxChangeQuality => 'Qualität ändern';

  @override
  String get pdfToPptxConvertAction => 'In PowerPoint umwandeln';

  @override
  String pdfToPptxExportWhat(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Folien',
      one: '$count Folie',
    );
    return 'PowerPoint-Präsentation · $_temp0';
  }

  @override
  String get formatLabel => 'Format';

  @override
  String get actionExport => 'Exportieren';

  @override
  String get imageQualityWeb => 'Web (72 dpi)';

  @override
  String get imageQualityStandard => 'Standard (150 dpi)';

  @override
  String get imageQualityHigh => 'Hohe Qualität (300 dpi)';

  @override
  String get pdfToImagesEmptyTitle => 'Ein Bild pro Seite';

  @override
  String get pdfToImagesEmptyBody =>
      'Wählen Sie ein PDF: jede Seite kommt als Bild heraus, in der Auflösung, die Sie danach einstellen.';

  @override
  String pdfToImagesNotAPdf(String name) {
    return '$name: bitte wählen Sie eine PDF-Datei.';
  }

  @override
  String errorLoadFailed(String detail) {
    return 'Laden fehlgeschlagen: $detail';
  }

  @override
  String get pdfToImagesProgress => 'Wird exportiert…';

  @override
  String pdfToImagesExportWhat(int count, String format) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count $format-Bilder',
      one: '$count $format-Bild',
    );
    return '$_temp0';
  }

  @override
  String get pdfaEmptyTitle => 'Langfristig archivieren';

  @override
  String get pdfaEmptyBody =>
      'PDF/A ist das Archivformat, das viele Behörden verlangen. Das Dokument wird umgewandelt, ohne sein Aussehen zu verlieren.';

  @override
  String get pdfaConformanceLevel => 'Konformitätsstufe';

  @override
  String get pdfaA1bDetail =>
      'Die strengste und am weitesten anerkannte Stufe. Im Zweifel diese wählen.';

  @override
  String get pdfaA2bDetail =>
      'Auf PDF 1.7 aufbauend: wirksamere Komprimierung, etwas kleinere Dateien.';

  @override
  String get pdfaA3bDetail =>
      'Wie A-2b, erlaubt aber Anhänge (wird oft für die elektronische Rechnungsstellung verlangt).';

  @override
  String pdfaConvertingTo(String level) {
    return 'Wird in $level umgewandelt…';
  }

  @override
  String get pdfaCaveatTitle => 'Was die Umwandlung verändert';

  @override
  String pdfaCaveat(int dpi) {
    return 'Jede Seite wird mit $dpi dpi als Bild neu gezeichnet: der Text wird zum Bild, das Layout ist festgelegt. Genau das macht die Datei wirklich konform, ohne von den Schriften des Ausgangsdokuments abzuhängen — im Gegenzug lässt sich der Text weder markieren noch durchsuchen, Links und Formulare verschwinden, und die Datei wird größer.';
  }

  @override
  String pdfaOpenFailed(String detail) {
    return 'Dieses PDF konnte nicht geöffnet werden: $detail';
  }

  @override
  String get imagesToPdfEmptyTitle => 'Bilder in einem PDF';

  @override
  String get imagesToPdfEmptyBody =>
      'JPG, PNG, WebP, HEIC — fügen Sie Ihre Bilder hinzu, sie werden in der von Ihnen gewählten Reihenfolge zusammengesetzt.';

  @override
  String get imagesToPdfChoose => 'Bilder auswählen';

  @override
  String get imagesToPdfAdd => 'Bilder hinzufügen';

  @override
  String imagesToPdfRejected(String names) {
    return 'Übersprungen (kein Bild): $names';
  }

  @override
  String get imagesToPdfBuilding => 'PDF wird erstellt…';

  @override
  String imagesToPdfBuildFailed(String detail) {
    return 'Erstellen fehlgeschlagen: $detail';
  }

  @override
  String imagesToPdfCreateAction(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Bilder',
      one: '$count Bild',
    );
    return 'PDF erstellen ($_temp0)';
  }

  @override
  String get actionRotate => 'Drehen';

  @override
  String get actionRemove => 'Entfernen';

  @override
  String get htmlTitle => 'HTML / Webseite zu PDF';

  @override
  String get htmlIntro =>
      'Verwandeln Sie eine Webseite oder HTML-Code in ein A4-PDF. Die Darstellung übernimmt der in Android eingebaute Browser, das Layout entspricht also einem Ausdruck aus Chrome.';

  @override
  String get htmlModeUrl => 'Webadresse';

  @override
  String get htmlModeCode => 'HTML-Code';

  @override
  String get htmlUrlLabel => 'Adresse der Seite';

  @override
  String get htmlUrlHint => 'https://beispiel.de/artikel';

  @override
  String get htmlCodeLabel => 'HTML-Code';

  @override
  String get htmlCodeHint => '<h1>Überschrift</h1>\n<p>Text…</p>';

  @override
  String get htmlUrlBadScheme =>
      'Die Adresse muss mit http:// oder https:// beginnen.';

  @override
  String get htmlUrlIncomplete => 'Geben Sie eine vollständige Webadresse ein.';

  @override
  String get htmlCodeEmpty => 'Fügen Sie HTML-Code zum Umwandeln ein.';

  @override
  String get htmlLoadingUrl => 'Seite wird geladen und umgewandelt…';

  @override
  String get htmlConverting => 'HTML wird umgewandelt…';

  @override
  String get htmlNetworkNotice =>
      'Eine Internetverbindung ist nötig: dies ist das einzige Werkzeug der App, das die Seite herunterladen muss. Seiten, die eine Anmeldung, ein Cookie-Banner oder viel JavaScript verlangen, können unvollständig herauskommen.';

  @override
  String get htmlOfflineNotice =>
      'HTML und CSS, die direkt in der Seite stehen, werden offline dargestellt. Bilder, Stylesheets oder Schriften, die von einer externen Webadresse geholt werden, brauchen dagegen eine Internetverbindung.';

  @override
  String get watermarkEmptyTitle => 'Wasserzeichen anbringen';

  @override
  String get watermarkEmptyBody =>
      'Ein Text Ihrer Wahl wird im Hintergrund auf allen Seiten wiederholt — um ein Dokument als vertraulich oder als Entwurf zu kennzeichnen.';

  @override
  String get watermarkEmptyNote => 'Kostenloser Export ohne Begrenzung.';

  @override
  String get watermarkTextLabel => 'Text des Wasserzeichens';

  @override
  String get watermarkDefaultText => 'VERTRAULICH';

  @override
  String get watermarkNeedText =>
      'Geben Sie einen Text für das Wasserzeichen ein.';

  @override
  String watermarkOpacity(int percent) {
    return 'Deckkraft: $percent %';
  }

  @override
  String watermarkRotation(int degrees) {
    return 'Drehwinkel: $degrees°';
  }

  @override
  String watermarkFontSize(int points) {
    return 'Textgröße: $points pt';
  }

  @override
  String get watermarkColor => 'Farbe';

  @override
  String get colorGrey => 'Grau';

  @override
  String get colorRed => 'Rot';

  @override
  String get colorBlue => 'Blau';

  @override
  String get colorBlack => 'Schwarz';

  @override
  String get watermarkProgress => 'Wasserzeichen wird angebracht…';

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
  String get pageNumbersEmptyTitle => 'Seiten nummerieren';

  @override
  String get pageNumbersEmptyBody =>
      'Wählen Sie ein PDF, dann Position und Format der Zahlen, die auf jede Seite kommen.';

  @override
  String get positionLabel => 'Position';

  @override
  String get positionBottomCenter => 'Unten Mitte';

  @override
  String get positionBottomRight => 'Unten rechts';

  @override
  String get positionTopCenter => 'Oben Mitte';

  @override
  String get positionTopRight => 'Oben rechts';

  @override
  String get pageNumbersFormatPlain => 'N';

  @override
  String get pageNumbersFormatOfTotal => 'N / gesamt';

  @override
  String get pageNumbersStart => 'Anfangszahl';

  @override
  String get pageNumbersProgress => 'Wird nummeriert…';

  @override
  String get organizeEmptyTitle => 'Ein PDF neu organisieren';

  @override
  String get organizeEmptyBody =>
      'Öffnen Sie ein Dokument, um es zu teilen, Seiten daraus zu entnehmen oder deren Reihenfolge zu ändern.';

  @override
  String get organizeOpenFile => 'Datei öffnen';

  @override
  String get organizeNothingToExport => 'Keine Seite zum Exportieren.';

  @override
  String organizePagesKept(int kept, int total) {
    String _temp0 = intl.Intl.pluralLogic(
      kept,
      locale: localeName,
      other: '$kept Seiten behalten',
      one: '$kept Seite behalten',
    );
    return '$_temp0 von $total';
  }

  @override
  String get organizePageExcluded => 'Aussortiert';

  @override
  String organizePageMoved(int from) {
    return 'Verschoben von Position $from';
  }

  @override
  String organizePageTitle(int number) {
    return 'Seite $number';
  }

  @override
  String organizeExcludePage(int number) {
    return 'Seite $number aussortieren';
  }

  @override
  String organizeIncludePage(int number) {
    return 'Seite $number aufnehmen';
  }

  @override
  String organizeMovePage(int number) {
    return 'Seite $number verschieben';
  }

  @override
  String get organizeExtract => 'Entnehmen';

  @override
  String get organizeSplit => 'Teilen';

  @override
  String get organizePreview => 'Vorschau';

  @override
  String get organizeExtractTitle => 'Einen Seitenbereich entnehmen';

  @override
  String organizeRangeLabel(int start, int end) {
    return 'Seiten $start bis $end';
  }

  @override
  String get organizeSplitTitle => 'In mehrere Dateien teilen';

  @override
  String organizeFileCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Dateien',
      one: '$count Datei',
    );
    return '$_temp0';
  }

  @override
  String organizeSplitFailed(String detail) {
    return 'Teilen fehlgeschlagen: $detail';
  }

  @override
  String get scanNoCamera => 'Auf diesem Gerät ist keine Kamera verfügbar.';

  @override
  String scanCameraFailed(String detail) {
    return 'Die Kamera ließ sich nicht starten: $detail';
  }

  @override
  String get scanCropToolbar => 'Anpassen';

  @override
  String scanCaptureFailed(String detail) {
    return 'Aufnahme fehlgeschlagen: $detail';
  }

  @override
  String get scanPermissionBody =>
      'Für das Scannen eines Dokuments wird Zugriff auf die Kamera benötigt.';

  @override
  String get scanGrantPermission => 'Kamera erlauben';

  @override
  String get actionRetry => 'Erneut versuchen';

  @override
  String get scanNoPageYet => 'Noch keine Seite.';

  @override
  String scanFinishAction(int count) {
    return 'Abschließen · $count';
  }

  @override
  String get signTitle => 'PDF unterschreiben';

  @override
  String get signIntro =>
      'Setzen Sie Ihre von Hand gezeichnete Unterschrift auf eine Seite eines PDFs. Das ist lediglich eine dem Dokument hinzugefügte Zeichnung, keine zertifizierte elektronische Signatur.';

  @override
  String get signChooseSubtitle =>
      'Wählen Sie das zu unterschreibende Dokument';

  @override
  String get signPickPage => 'Wählen Sie die Seite zum Unterschreiben.';

  @override
  String get signDrawTitle => 'Meine Unterschrift zeichnen';

  @override
  String get signDrawBody =>
      'Zeichnen Sie mit dem Finger wie auf Papier. Das setzt eine Zeichnung auf die Seite — es ist keine zertifizierte elektronische Signatur.';

  @override
  String get signNeedDrawing =>
      'Zeichnen Sie eine Unterschrift, bevor Sie fortfahren.';

  @override
  String get signClear => 'Löschen';

  @override
  String get signValidate => 'Bestätigen';

  @override
  String get signPlaceBody =>
      'Ziehen Sie die Unterschrift an die gewünschte Stelle der Seite und tippen Sie dann auf Abschließen.';

  @override
  String get signPageUnavailable => 'Die Seite konnte nicht angezeigt werden.';

  @override
  String get signProgress => 'Unterschrift wird hinzugefügt…';

  @override
  String get editTitle => 'Dokument kommentieren';

  @override
  String get editEmptyBody =>
      'Fügen Sie Text hinzu oder heben Sie Stellen direkt auf einem vorhandenen PDF hervor.';

  @override
  String get editAddTextTitle => 'Text hinzufügen';

  @override
  String get editTextHint => 'Ihr Text';

  @override
  String editFontSize(int size) {
    return 'Textgröße: $size';
  }

  @override
  String get editNeedAnnotation =>
      'Fügen Sie mindestens eine Anmerkung hinzu, bevor Sie abschließen.';

  @override
  String get editProgress => 'Anmerkungen werden angewendet…';

  @override
  String get editChooseOther => 'Anderes PDF auswählen';

  @override
  String get editUndoTooltip => 'Letzte Anmerkung rückgängig machen';

  @override
  String get editModeText => 'Text';

  @override
  String get editModeHighlight => 'Hervorheben';

  @override
  String get editPageUnavailable =>
      'Diese Seite konnte nicht angezeigt werden.';

  @override
  String get ocrEmptyTitle => 'Text durchsuchbar machen';

  @override
  String get ocrEmptyBody =>
      'Der Text eines gescannten PDFs wird erkannt und unsichtbar über das Bild gelegt. Die Seite verändert ihr Aussehen nicht.';

  @override
  String get ocrWrongFormat => 'Wählen Sie ein PDF oder ein Bild (JPG, PNG…).';

  @override
  String get ocrProgress => 'Wird erkannt…';

  @override
  String ocrFailed(String detail) {
    return 'Erkennung fehlgeschlagen: $detail';
  }

  @override
  String get ocrRunAction => 'Erkennung starten';

  @override
  String get ocrResultTitle => 'Ergebnis der OCR';

  @override
  String ocrResultBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Seiten analysiert',
      one: '$count Seite analysiert',
    );
    return '$_temp0. Das durchsuchbare PDF ist fertig, und Sie können auch den gesamten erkannten Text kopieren.';
  }

  @override
  String get ocrCopyText => 'Text kopieren';

  @override
  String get ocrTextCopied => 'Text kopiert.';

  @override
  String get redactIntro =>
      'Verbergen Sie Bereiche eines PDFs endgültig (Namen, Adressen, Beträge). Anders als bei einem einfachen schwarzen Rechteck darüber wird der verborgene Text wirklich aus der Datei entfernt, nicht nur überdeckt: er lässt sich weder markieren noch kopieren.';

  @override
  String get redactChooseSubtitle => 'Wählen Sie das zu schwärzende Dokument';

  @override
  String get redactCaveat =>
      'Gut zu wissen: um den verborgenen Text zu entfernen, wird jede Seite des Dokuments wieder in ein Bild umgewandelt (200 dpi). Das Ergebnis ist deshalb kein PDF mehr, dessen Text sich markieren lässt, und die erhaltene Datei ist meist größer als das Original.';

  @override
  String get redactEmptyPdf => 'Dieses PDF enthält keine Seite.';

  @override
  String redactOpenFailed(String detail) {
    return 'Dieses PDF konnte nicht geöffnet werden (es ist vielleicht passwortgeschützt): $detail';
  }

  @override
  String redactPageRenderFailed(int number, String detail) {
    return 'Seite $number konnte nicht angezeigt werden: $detail';
  }

  @override
  String get redactUndoTooltip => 'Letzten Bereich rückgängig machen';

  @override
  String get redactInstructions =>
      'Ziehen Sie den Finger über die Seite, um einen Bereich zum Verbergen aufzuziehen. Der überdeckte Text wird wirklich aus der Datei entfernt, nicht nur überdeckt.';

  @override
  String get redactPagePrevious => 'Vorherige Seite';

  @override
  String get redactPageNext => 'Nächste Seite';

  @override
  String redactPager(int current, int total) {
    return 'Seite $current / $total';
  }

  @override
  String get redactNoZone => 'Kein Bereich aufgezogen';

  @override
  String redactZoneCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Bereiche zu verbergen',
      one: '$count Bereich zu verbergen',
    );
    return '$_temp0';
  }

  @override
  String get redactOtherPdf => 'Anderes PDF';

  @override
  String get redactAction => 'Schwärzen';

  @override
  String get redactProgress => 'Wird geschwärzt…';

  @override
  String get cropEmptyTitle => 'Ränder beschneiden';

  @override
  String get cropEmptyBody =>
      'Wählen Sie ein PDF und ziehen Sie dann den Finger über die Vorschau, um den Bereich abzugrenzen, der erhalten bleiben soll.';

  @override
  String get cropTooSmall => 'Der gewählte Bereich ist zu klein.';

  @override
  String get cropProgress => 'Wird zugeschnitten…';

  @override
  String cropFailed(String detail) {
    return 'Zuschneiden fehlgeschlagen: $detail';
  }

  @override
  String get cropKeptArea => 'Erhaltener Bereich';

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
  String get cropFullPage => 'Ganze Seite';

  @override
  String get cropAllPages => 'Auf alle Seiten anwenden';

  @override
  String get cropAllPagesOn =>
      'Derselbe Bereich wird auf jeder Seite ausgeschnitten.';

  @override
  String get cropAllPagesOff =>
      'Nur Seite 1 wird zugeschnitten, die übrigen bleiben ganz.';

  @override
  String get cropCaveat =>
      'Das Zuschneiden verkleinert die Seite: Inhalt außerhalb des Bereichs wird weder angezeigt noch gedruckt.';

  @override
  String get cropAction => 'Zuschneiden';

  @override
  String get compareTitle => 'Zwei PDFs vergleichen';

  @override
  String get compareEmptyTitle => 'Was sich geändert hat';

  @override
  String get compareEmptyBody =>
      'Wählen Sie zwei Fassungen desselben PDFs. Hinzugefügte und entfernte Stellen werden Seite für Seite gegenübergestellt.';

  @override
  String get compareSlotA => 'Datei A';

  @override
  String get compareSlotB => 'Datei B';

  @override
  String get compareAction => 'Vergleichen';

  @override
  String get compareProgress => 'Wird verglichen…';

  @override
  String compareFailed(String detail) {
    return 'Vergleich fehlgeschlagen: $detail';
  }

  @override
  String compareChangedPages(int changed, int total) {
    String _temp0 = intl.Intl.pluralLogic(
      changed,
      locale: localeName,
      other: '$changed Seiten weichen ab',
      one: '$changed Seite weicht ab',
    );
    return '$_temp0 von $total';
  }

  @override
  String get compareNoDifference =>
      'Zwischen den beiden Dateien wurde kein Unterschied gefunden.';

  @override
  String comparePageHeading(int number) {
    return 'Seite $number';
  }

  @override
  String organizeFilesCreated(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Dateien erstellt',
      one: '$count Datei erstellt',
    );
    return '$_temp0';
  }

  @override
  String organizePartTitle(int number) {
    return 'Teil $number';
  }
}
