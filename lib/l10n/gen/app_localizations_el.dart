// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Modern Greek (`el`).
class LEl extends L {
  LEl([String locale = 'el']) : super(locale);

  @override
  String get appTitle => 'Trombone — PDF, Σάρωση & Word';

  @override
  String get appWordmark => 'Trombone';

  @override
  String get actionSave => 'Αποθήκευση';

  @override
  String get actionShare => 'Κοινοποίηση';

  @override
  String get actionCompress => 'Συμπίεση';

  @override
  String get actionDone => 'Τέλος';

  @override
  String get actionCancel => 'Ακύρωση';

  @override
  String get actionChange => 'Αλλαγή';

  @override
  String get actionContinue => 'Συνέχεια';

  @override
  String get actionOpening => 'Άνοιγμα…';

  @override
  String get actionRemoveFile => 'Αφαίρεση αυτού του αρχείου';

  @override
  String get progressPreparing => 'Προετοιμασία…';

  @override
  String progressPercent(int percent) {
    return '$percent%';
  }

  @override
  String get emptyReassurance => 'Δωρεάν εξαγωγή, χωρίς υδατογράφημα ή όριο.';

  @override
  String get emptyAcceptedFormats => 'Αποδεκτές μορφές';

  @override
  String get exportSavedTitle => 'Αποθηκεύτηκε.';

  @override
  String get exportSavedBody =>
      'Με το όνομα και στον φάκελο που μόλις επιλέξατε. Χωρίς υδατογράφημα, χωρίς όρια, τίποτα να ξεκλειδώσετε.';

  @override
  String get exportSaveDialogTitle => 'Αποθήκευση PDF';

  @override
  String pageTileIncluded(int number) {
    return 'Σελίδα $number, περιλαμβάνεται. Πατήστε για να την εξαιρέσετε.';
  }

  @override
  String pageTileExcluded(int number) {
    return 'Σελίδα $number, εξαιρέθηκε. Πατήστε για να την συμπεριλάβετε.';
  }

  @override
  String pageTileRotate(int number) {
    return 'Περιστροφή σελίδας $number';
  }

  @override
  String sectionHeaderSemantics(String title, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count εργαλεία',
      one: '$count εργαλείο',
    );
    return '$title, $_temp0';
  }

  @override
  String toolCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count εργαλεία',
      one: '$count εργαλείο',
    );
    return '$_temp0';
  }

  @override
  String get homePromise =>
      'Φτιάξτε το έγγραφό σας, εξάγετέ το.\nΧωρίς κρυφές χρεώσεις στο τέλος.';

  @override
  String get homeChipNoAccount => 'Χωρίς λογαριασμό';

  @override
  String get homeChipNoWatermark => 'Χωρίς υδατογράφημα';

  @override
  String get homeChipUnlimited => 'Απεριόριστη εξαγωγή';

  @override
  String get homeSearchTooltip => 'Αναζήτηση εργαλείου';

  @override
  String get homeColophon =>
      'Κατά την αποθήκευση δεν ξεκλειδώνει τίποτα με πληρωμή. Η εξαγωγή είναι δωρεάν, χωρίς υδατογράφημα και χωρίς όρια.';

  @override
  String get sectionFeatured => 'Προτεινόμενα';

  @override
  String get sectionToPdf => 'Προς PDF';

  @override
  String get sectionFromPdf => 'Από PDF';

  @override
  String get sectionSecurity => 'Ασφάλεια';

  @override
  String get sectionEdit => 'Επεξεργασία';

  @override
  String get toolMerge => 'Συγχώνευση';

  @override
  String get toolMergeKeywords =>
      'συγχώνευση ένωση συνδυασμός συνένωση combine merge ενώνω';

  @override
  String get toolMergeSubtitle =>
      'PDF, Word, εικόνες και κείμενο σε ένα έγγραφο';

  @override
  String get toolRectoVerso => 'Διπλής όψης';

  @override
  String get toolRectoVersoKeywords =>
      'διπλής όψης σάρωση μονές ζυγές σελίδες recto verso interleave';

  @override
  String get toolRectoVersoSubtitle => 'Δύο σαρώσεις, ξανά στη σειρά';

  @override
  String get toolImagesToPdf => 'Εικόνες σε PDF';

  @override
  String get toolImagesToPdfKeywords =>
      'φωτογραφία jpg jpeg png άλμπουμ φωτογραφίες κάμερα';

  @override
  String get toolImagesToPdfSubtitle =>
      'Φωτογραφίες και στιγμιότυπα σε ένα έγγραφο';

  @override
  String get toolPdfToWord => 'PDF σε Word';

  @override
  String get toolPdfToWordKeywords =>
      'docx επεξεργασία κειμένου μετατροπή word';

  @override
  String get toolPdfToWordSubtitle => 'Κείμενο και πίνακες, επεξεργάσιμα';

  @override
  String get toolOrganize => 'Οργάνωση PDF';

  @override
  String get toolOrganizeKeywords =>
      'διαχωρισμός εξαγωγή αναδιάταξη σελίδες διαγραφή σειρά';

  @override
  String get toolOrganizeSubtitle => 'Διαχωρισμός, εξαγωγή, αναδιάταξη';

  @override
  String get toolExcelToPdf => 'Excel σε PDF';

  @override
  String get toolExcelToPdfKeywords =>
      'xlsx υπολογιστικό φύλλο βιβλίο εργασίας excel';

  @override
  String get toolPptxToPdf => 'PowerPoint σε PDF';

  @override
  String get toolPptxToPdfKeywords => 'pptx διαφάνειες παρουσίαση slides';

  @override
  String get toolHtmlToPdf => 'Ιστοσελίδα σε PDF';

  @override
  String get toolHtmlToPdfKeywords =>
      'html ιστότοπος url σύνδεσμος άρθρο σελίδα';

  @override
  String get toolScan => 'Σάρωση εγγράφου';

  @override
  String get toolScanKeywords =>
      'κάμερα φωτογραφία σάρωση ψηφιοποίηση χαρτί scan';

  @override
  String get toolPdfToExcel => 'PDF σε Excel';

  @override
  String get toolPdfToExcelKeywords => 'xlsx πίνακας εξαγωγή δεδομένα excel';

  @override
  String get toolPdfToPptx => 'PDF σε PowerPoint';

  @override
  String get toolPdfToPptxKeywords => 'pptx διαφάνειες παρουσίαση slides';

  @override
  String get toolPdfToImages => 'PDF σε εικόνες';

  @override
  String get toolPdfToImagesKeywords =>
      'jpg png φωτογραφία εξαγωγή στιγμιότυπο';

  @override
  String get toolOcr => 'Αναζητήσιμο κείμενο (OCR)';

  @override
  String get toolOcrKeywords =>
      'αναγνώριση χαρακτήρων σάρωση αντιγραφή επιλογή ocr';

  @override
  String get toolPdfA => 'Μετατροπή σε PDF/A';

  @override
  String get toolPdfAKeywords =>
      'αρχειοθέτηση πρότυπο μακροχρόνια διατήρηση pdf/a';

  @override
  String get toolProtect => 'Προστασία PDF';

  @override
  String get toolProtectKeywords =>
      'κωδικός λουκέτο κρυπτογράφηση κλείδωμα ασφάλεια password';

  @override
  String get toolUnlock => 'Ξεκλείδωμα PDF';

  @override
  String get toolUnlockKeywords =>
      'αφαίρεση κωδικού άνοιγμα αποκρυπτογράφηση ξεκλείδωμα password';

  @override
  String get toolRepair => 'Επιδιόρθωση PDF';

  @override
  String get toolRepairKeywords =>
      'κατεστραμμένο μη αναγνώσιμο ανάκτηση σφάλμα repair';

  @override
  String get toolRedact => 'Απόκρυψη περιεχομένου';

  @override
  String get toolRedactKeywords =>
      'απόκρυψη κάλυψη ανωνυμοποίηση εμπιστευτικό διαγραφή redact';

  @override
  String get toolEdit => 'Επεξεργασία PDF';

  @override
  String get toolEditKeywords =>
      'κείμενο τροποποίηση διόρθωση σχολιασμός εγγραφή';

  @override
  String get toolSign => 'Υπογραφή';

  @override
  String get toolSignKeywords => 'υπογραφή μονογραφή συμβόλαιο χέρι sign';

  @override
  String get toolWatermark => 'Υδατογράφημα';

  @override
  String get toolWatermarkKeywords =>
      'watermark υδατογράφημα σφραγίδα εμπιστευτικό πρόχειρο';

  @override
  String get toolPageNumbers => 'Αρίθμηση σελίδων';

  @override
  String get toolPageNumbersKeywords =>
      'αρίθμηση σελιδοποίηση αριθμοί σελίδων folio';

  @override
  String get toolCrop => 'Περικοπή PDF';

  @override
  String get toolCropKeywords => 'περικοπή περιθώρια άκρες μέγεθος crop';

  @override
  String get toolCompare => 'Σύγκριση PDF';

  @override
  String get toolCompareKeywords => 'διαφορά εκδόσεις diff αλλαγές σύγκριση';

  @override
  String get searchHint => 'Συγχώνευση, κωδικός, υδατογράφημα…';

  @override
  String get searchClear => 'Εκκαθάριση';

  @override
  String searchNoResultTitle(String query) {
    return 'Κανένα εργαλείο για «$query».';
  }

  @override
  String get searchNoResultBody =>
      'Δοκιμάστε τη μορφή που έχετε στη διάθεσή σας — «Word», «Excel», «φωτογραφία» — ή αυτό που θέλετε να κάνετε: «υπογραφή», «διαχωρισμός», «κωδικός».';

  @override
  String get actionUndo => 'Αναίρεση';

  @override
  String get actionApply => 'Εφαρμογή';

  @override
  String get actionChoose => 'Επιλογή';

  @override
  String get actionChoosePdf => 'Επιλογή PDF';

  @override
  String get actionChooseFiles => 'Επιλογή αρχείων';

  @override
  String get actionConvert => 'Μετατροπή';

  @override
  String get actionFinish => 'Ολοκλήρωση';

  @override
  String get actionBack => 'Πίσω';

  @override
  String get actionAdd => 'Προσθήκη';

  @override
  String get noFileChosen => 'Δεν έχει επιλεγεί αρχείο';

  @override
  String errorExportFailed(String detail) {
    return 'Η εξαγωγή απέτυχε: $detail';
  }

  @override
  String errorShareFailed(String detail) {
    return 'Η κοινοποίηση απέτυχε: $detail';
  }

  @override
  String errorOpenFailed(String detail) {
    return 'Δεν ήταν δυνατό το άνοιγμα του αρχείου: $detail';
  }

  @override
  String errorConversionFailed(String detail) {
    return 'Η μετατροπή απέτυχε: $detail';
  }

  @override
  String errorOnFile(String name, String detail) {
    return '$name: $detail';
  }

  @override
  String get errorPickPdf => 'Επιλέξτε ένα αρχείο PDF.';

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
      other: '$count σελίδες',
      one: '$count σελίδα',
    );
    return '$_temp0';
  }

  @override
  String pageCountOfTotal(int kept, int total) {
    String _temp0 = intl.Intl.pluralLogic(
      kept,
      locale: localeName,
      other: '$kept σελίδες',
      one: '$kept σελίδα',
    );
    return '$_temp0 από $total';
  }

  @override
  String pageOfTotal(int current, int total) {
    return 'Σελίδα $current από $total';
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
  String get formatImages => 'Εικόνες';

  @override
  String get formatText => 'Κείμενο';

  @override
  String get mergeAddFile => 'Προσθήκη αρχείου';

  @override
  String get mergeAddHint => 'PDF, Word, εικόνες ή κείμενο';

  @override
  String get mergeEmptyTitle => 'Ένα μόνο έγγραφο';

  @override
  String get mergeEmptyBody =>
      'Προσθέστε PDF, αρχεία Word, εικόνες ή κείμενο. Μπορείτε να τα αναδιατάξετε και να εξαιρέσετε σελίδες πριν την εξαγωγή.';

  @override
  String get mergeNeedOnePage =>
      'Προσθέστε τουλάχιστον ένα αρχείο με σελίδα προς συμπερίληψη.';

  @override
  String get mergeProgress => 'Συγχώνευση σε εξέλιξη…';

  @override
  String mergeFailed(String detail) {
    return 'Η συγχώνευση απέτυχε: $detail';
  }

  @override
  String mergeRemoved(String name) {
    return 'Το $name αφαιρέθηκε.';
  }

  @override
  String mergeRemoveTooltip(String name) {
    return 'Αφαίρεση $name';
  }

  @override
  String mergeMoveSemantics(String name) {
    return 'Μετακίνηση $name';
  }

  @override
  String get mergeRotateAll => 'Περιστροφή όλων των σελίδων';

  @override
  String mergePreviewAndExport(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count σελίδες',
      one: '$count σελίδα',
    );
    return 'Προεπισκόπηση και εξαγωγή ($_temp0)';
  }

  @override
  String previewTitle(String size) {
    return 'Προεπισκόπηση · $size';
  }

  @override
  String previewZoomPage(int number) {
    return 'Σελίδα $number, μεγέθυνση';
  }

  @override
  String get previewPageUnreadable => 'Η σελίδα δεν είναι αναγνώσιμη.';

  @override
  String previewExportWhat(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count σελίδες',
      one: '$count σελίδα',
    );
    return 'PDF · $_temp0';
  }

  @override
  String get compressTitle => 'Συμπίεση';

  @override
  String compressBody(String size) {
    return 'Τρέχον μέγεθος: $size. Επιλέξτε ένα επίπεδο — το εκτιμώμενο μέγεθος εμφανίζεται πριν την εφαρμογή.';
  }

  @override
  String get compressEstimating => 'Εκτίμηση…';

  @override
  String get compressProgress => 'Συμπίεση σε εξέλιξη…';

  @override
  String compressFailed(String detail) {
    return 'Η συμπίεση απέτυχε: $detail';
  }

  @override
  String get protectEmptyTitle => 'Προστασία με κωδικό';

  @override
  String get protectEmptyBody =>
      'Το PDF δεν θα ανοίγει πλέον χωρίς τον κωδικό που θα επιλέξετε. Κρατήστε τον: δεν μπορεί να ανακτηθεί.';

  @override
  String get protectSubtitle => 'Θα κρυπτογραφηθεί με AES 256 bits';

  @override
  String get protectPassword => 'Κωδικός';

  @override
  String get protectConfirmPassword => 'Επιβεβαίωση κωδικού';

  @override
  String get protectShowPasswords => 'Εμφάνιση κωδικών';

  @override
  String get protectHidePasswords => 'Απόκρυψη κωδικών';

  @override
  String get protectMismatch => 'Οι δύο κωδικοί διαφέρουν.';

  @override
  String get protectWarning =>
      'Σημειώστε τον κάπου: χωρίς αυτόν, το έγγραφο γίνεται οριστικά μη αναγνώσιμο. Δεν υπάρχει καμία δυνατότητα ανάκτησης, ούτε από εσάς ούτε από την εφαρμογή.';

  @override
  String get protectAlreadyProtected =>
      'Αυτό το αρχείο είναι ήδη προστατευμένο — χρησιμοποιήστε πρώτα το Ξεκλείδωμα PDF.';

  @override
  String get protectProgress => 'Προστασία σε εξέλιξη…';

  @override
  String protectFailed(String detail) {
    return 'Η προστασία απέτυχε: $detail';
  }

  @override
  String get protectAction => 'Προστασία';

  @override
  String get protectResultTitle => 'Προστατευμένο PDF';

  @override
  String get protectResultDetail =>
      'Κρυπτογραφημένο με AES 256 bits. Θα χρειαστεί ο κωδικός για να ανοίξει.';

  @override
  String get protectExportWhat => 'PDF με προστασία κωδικού';

  @override
  String get unlockEmptyTitle => 'Αφαίρεση κωδικού';

  @override
  String get unlockEmptyBody =>
      'Χρειάζεστε τον τρέχοντα κωδικό του εγγράφου. Μόλις αφαιρεθεί, το PDF θα ανοίγει ελεύθερα.';

  @override
  String get unlockAcceptsProtectedPdf => 'Προστατευμένο PDF';

  @override
  String get unlockChooseProtectedPdf => 'Επιλογή προστατευμένου PDF';

  @override
  String get unlockCurrentPassword => 'Τρέχων κωδικός';

  @override
  String get unlockWrongPassword => 'Λάθος κωδικός.';

  @override
  String get unlockProgress => 'Ξεκλείδωμα σε εξέλιξη…';

  @override
  String unlockFailed(String detail) {
    return 'Το ξεκλείδωμα απέτυχε: $detail';
  }

  @override
  String get unlockAction => 'Ξεκλείδωμα';

  @override
  String get repairEmptyTitle => 'Επιδιόρθωση κατεστραμμένου αρχείου';

  @override
  String get repairEmptyBody =>
      'Η εσωτερική δομή ενός κατεστραμμένου PDF ανακατασκευάζεται. Ό,τι μπορεί να διασωθεί, θα διασωθεί.';

  @override
  String get repairProgress => 'Επιδιόρθωση σε εξέλιξη…';

  @override
  String get repairFailed =>
      'Δεν είναι δυνατή η επιδιόρθωση αυτού του αρχείου — ίσως είναι πολύ κατεστραμμένο.';

  @override
  String get repairAction => 'Επιδιόρθωση';

  @override
  String get pdfToWordEmptyTitle => 'Ένα επεξεργάσιμο Word';

  @override
  String get pdfToWordEmptyBody =>
      'Το κείμενο και η δομή του PDF μεταφέρονται σε ένα έγγραφο .docx που μπορείτε να ανοίξετε ξανά και να επεξεργαστείτε.';

  @override
  String get pdfToWordAnalyzing => 'Ανάλυση εγγράφου…';

  @override
  String get pdfToWordAnalysisPending => 'Η ανάλυση εκκρεμεί';

  @override
  String pdfToWordAnalysisFailed(String detail) {
    return 'Η ανάλυση απέτυχε: $detail';
  }

  @override
  String get pdfLocked =>
      'Αυτό το PDF προστατεύεται με κωδικό. Ξεκλειδώστε το πρώτα.';

  @override
  String get pdfToWordConverting => 'Μετατροπή σε Word…';

  @override
  String get pdfToWordSummaryTitle => 'Περιεχόμενο που εντοπίστηκε';

  @override
  String pdfToWordParagraphCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count παράγραφοι',
      one: '$count παράγραφος',
    );
    return '$_temp0';
  }

  @override
  String pdfToWordHeadingCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count τίτλοι',
      one: '$count τίτλος',
    );
    return '$_temp0';
  }

  @override
  String pdfToWordTableCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count πίνακες',
      one: '$count πίνακας',
    );
    return '$_temp0';
  }

  @override
  String get pdfToWordNoTables =>
      'Δεν εντοπίστηκε κανένας πίνακας: αν το PDF σας περιέχει, οι γραμμές του θα μετατραπούν σε παραγράφους.';

  @override
  String get pdfToWordCaveat =>
      'Η μετατροπή αναπαράγει το κείμενο, τη μορφοποίηση και τους πίνακες, αλλά όχι την ακριβή διάταξη: η θέση των εικόνων και των στηλών δεν διατηρείται, και οι εικόνες δεν περιλαμβάνονται στο έγγραφο Word.';

  @override
  String get pdfToWordScanWarning =>
      'Αυτό το PDF μοιάζει με σάρωση: δεν βρέθηκε κείμενο. Χρησιμοποιήστε πρώτα το εργαλείο «Αναζητήσιμο κείμενο (OCR)» και μετά επιστρέψτε για να μετατρέψετε το PDF που προκύπτει.';

  @override
  String get pdfToWordResultTitle => 'Έγγραφο Word έτοιμο';

  @override
  String pdfToWordResultDetail(String name, String size) {
    return '$name — $size';
  }

  @override
  String get pdfToWordExportWhat => 'Έγγραφο Word';

  @override
  String get pdfToWordConvertAction => 'Μετατροπή σε Word';

  @override
  String get actionConvertAgain => 'Νέα μετατροπή';

  @override
  String errorSaveFailed(String detail) {
    return 'Η αποθήκευση απέτυχε: $detail';
  }

  @override
  String get rectoVersoIntro =>
      'Ένας τροφοδότης μονής όψης δίνει δύο αρχεία: τις μονές σελίδες στη σειρά και τις ζυγές συχνά σε αντίστροφη σειρά. Επιλέξτε και τα δύο για να τις ανασυνθέσετε.';

  @override
  String get rectoVersoOddSlot => 'Αρχείο μονών σελίδων (εμπρός όψη)';

  @override
  String get rectoVersoEvenSlot => 'Αρχείο ζυγών σελίδων (πίσω όψη)';

  @override
  String get rectoVersoReversed =>
      'Το δεύτερο αρχείο είναι σε αντίστροφη σειρά';

  @override
  String get rectoVersoReversedHint =>
      'Είναι η πιο συνηθισμένη περίπτωση, επιλεγμένη από προεπιλογή';

  @override
  String rectoVersoPreview(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count σελίδες',
      one: '$count σελίδα',
    );
    return 'Προεπισκόπηση εναλλαγής ($_temp0)';
  }

  @override
  String get rectoVersoProgress => 'Εναλλαγή σελίδων σε εξέλιξη…';

  @override
  String fileWithPageCount(String name, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count σελίδες',
      one: '$count σελίδα',
    );
    return '$name · $_temp0';
  }

  @override
  String get actionPreviewAndExport => 'Προεπισκόπηση και εξαγωγή';

  @override
  String errorOpenFailedShort(String detail) {
    return 'Δεν ήταν δυνατό το άνοιγμα: $detail';
  }

  @override
  String errorGeneric(String detail) {
    return 'Αποτυχία: $detail';
  }

  @override
  String get actionConvertToPdf => 'Μετατροπή σε PDF';

  @override
  String get convertProgress => 'Μετατροπή σε εξέλιξη…';

  @override
  String get excelEmptyTitle => 'Ένα βιβλίο εργασίας σε PDF';

  @override
  String get excelEmptyBody =>
      'Τα φύλλα ενός αρχείου .xlsx γίνονται σελίδες PDF, έτοιμες για αποστολή ή εκτύπωση.';

  @override
  String get excelChooseWorkbook => 'Επιλογή βιβλίου εργασίας';

  @override
  String get excelChooseXlsx => 'Επιλογή βιβλίου εργασίας .xlsx';

  @override
  String get excelLegacyFormat =>
      'Η μορφή .xls (παλιά δυαδική μορφή του Excel) δεν υποστηρίζεται. Αποθηκεύστε το αρχείο ως .xlsx και δοκιμάστε ξανά.';

  @override
  String get excelWrongFormat => 'Επιλέξτε ένα βιβλίο εργασίας Excel .xlsx.';

  @override
  String excelUnreadable(String detail) {
    return 'Το βιβλίο εργασίας δεν είναι αναγνώσιμο: $detail';
  }

  @override
  String excelSheetsAndRows(int sheets, int rows) {
    String _temp0 = intl.Intl.pluralLogic(
      sheets,
      locale: localeName,
      other: '$sheets φύλλα',
      one: '$sheets φύλλο',
    );
    String _temp1 = intl.Intl.pluralLogic(
      rows,
      locale: localeName,
      other: '$rows γραμμές συνολικά',
      one: '$rows γραμμή συνολικά',
    );
    return '$_temp0 · $_temp1';
  }

  @override
  String get excelSheetsDetected => 'Φύλλα που εντοπίστηκαν';

  @override
  String get excelEmptySheet => 'Κενό φύλλο';

  @override
  String excelSheetDimensions(int rows, int columns) {
    String _temp0 = intl.Intl.pluralLogic(
      rows,
      locale: localeName,
      other: '$rows γραμμές',
      one: '$rows γραμμή',
    );
    String _temp1 = intl.Intl.pluralLogic(
      columns,
      locale: localeName,
      other: '$columns στήλες',
      one: '$columns στήλη',
    );
    return '$_temp0 × $_temp1';
  }

  @override
  String get excelRepeatHeader =>
      'Επανάληψη της γραμμής επικεφαλίδας σε κάθε σελίδα';

  @override
  String get excelRepeatHeaderHint =>
      'Η πρώτη γραμμή του φύλλου σχεδιάζεται ξανά στο πάνω μέρος κάθε σελίδας του πίνακα.';

  @override
  String get excelCaveat =>
      'Τι αναπαράγει η μετατροπή: το κείμενο των κελιών όπως είναι αποθηκευμένο στο αρχείο (μαζί με το τελευταίο υπολογισμένο αποτέλεσμα των τύπων), την πρώτη γραμμή με έντονη γραφή και ένα πλέγμα.\n\nΤι δεν αναπαράγει: χρώματα, γραμματοσειρές, μορφές αριθμών, συγχωνευμένα κελιά, εικόνες, γραφήματα και τους ίδιους τους τύπους. Οι στήλες συρρικνώνονται για να χωρέσουν στο πλάτος της σελίδας· σε πολύ φαρδιά φύλλα, το κείμενο των πολύ στενών κελιών περικόπτεται με «…».';

  @override
  String get pptxEmptyTitle => 'Μια παρουσίαση σε PDF';

  @override
  String get pptxEmptyBody =>
      'Μία οριζόντια σελίδα 16:9 ανά διαφάνεια, με τον τίτλο και τις κουκκίδες. Το κείμενο αναπαράγεται· οι αρχικές εικόνες, τα σχήματα και τα φόντα όχι.\n\nΑποδεκτή μορφή: .pptx. Ένα παλιό αρχείο .ppt πρέπει πρώτα να αποθηκευτεί ξανά ως .pptx από το PowerPoint.';

  @override
  String get pptxChoosePresentation => 'Επιλογή παρουσίασης';

  @override
  String get pptxTextOnlyTitle => 'Μόνο μετατροπή κειμένου';

  @override
  String get pptxTextOnlyBody =>
      'Το κείμενο κάθε διαφάνειας αναπαράγεται. Οι αρχικές εικόνες, τα σχήματα, τα φόντα, τα χρώματα και οι διατάξεις δεν διατηρούνται: το PDF που προκύπτει έχει μια απλή, ευανάγνωστη διάταξη, όχι ένα πιστό αντίγραφο της παρουσίασής σας.';

  @override
  String pptxSlideCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count διαφάνειες',
      one: '$count διαφάνεια',
    );
    return '$_temp0';
  }

  @override
  String get pptxSlidesDetected => 'Διαφάνειες που εντοπίστηκαν';

  @override
  String pptxMoreSlides(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ακόμη διαφάνειες',
      one: '$count ακόμη διαφάνεια',
    );
    return 'και $_temp0…';
  }

  @override
  String get pptxUntitledSlide => 'Χωρίς τίτλο';

  @override
  String get pptxEmptySlide => 'Χωρίς κείμενο (μόνο εικόνα ή σχήμα)';

  @override
  String pptxTextLineCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count γραμμές κειμένου',
      one: '$count γραμμή κειμένου',
    );
    return '$_temp0';
  }

  @override
  String pptxReadFailed(String detail) {
    return 'Η ανάγνωση απέτυχε: $detail';
  }

  @override
  String get compressLevelLight => 'Ελαφριά';

  @override
  String get compressLevelMedium => 'Μεσαία';

  @override
  String get compressLevelStrong => 'Ισχυρή';

  @override
  String get pptxQualityStandard => 'Κανονική (150 dpi)';

  @override
  String get pptxQualityHigh => 'Υψηλή (220 dpi)';

  @override
  String get pdfToExcelEmptyTitle => 'Ανάκτηση των πινάκων';

  @override
  String get pdfToExcelEmptyBody =>
      'Οι πίνακες ενός PDF εξάγονται σε βιβλίο εργασίας του Excel. Η μορφοποίηση δεν διατηρείται· οι τιμές διατηρούνται.';

  @override
  String pdfToExcelPagesAnalyzed(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count σελίδες αναλύθηκαν',
      one: '$count σελίδα αναλύθηκε',
    );
    return '$_temp0';
  }

  @override
  String pdfToExcelAnalysisFailed(String detail) {
    return 'Η ανάλυση απέτυχε. Το PDF μπορεί να προστατεύεται με κωδικό ή να είναι κατεστραμμένο. ($detail)';
  }

  @override
  String get pdfToExcelNothingToExport =>
      'Τίποτα προς εξαγωγή: δεν εντοπίστηκε πίνακας.';

  @override
  String get pdfToExcelBuilding => 'Δημιουργία βιβλίου εργασίας…';

  @override
  String get pdfToExcelIncludeParagraphs =>
      'Συμπερίληψη και του κειμένου εκτός πινάκων (μία γραμμή ανά παράγραφο)';

  @override
  String get pdfToExcelIncludeParagraphsHint =>
      'Χρήσιμο για ημιδομημένα έγγραφα: το κείμενο τοποθετείται στη στήλη A, μετά τους πίνακες της σελίδας.';

  @override
  String get pdfToExcelCaveatTitle => 'Τι δεν διατηρεί η μετατροπή';

  @override
  String get pdfToExcelCaveat =>
      'Ο εντοπισμός βασίζεται στη θέση του κειμένου στη σελίδα: πίνακες χωρίς κανονικά περιγράμματα, συγχωνευμένα κελιά και πολύ ακανόνιστες στήλες μπορεί να κοπούν λάθος. Ένα σαρωμένο PDF (εικόνα) δεν περιέχει εξαγώγιμο κείμενο και δεν θα δώσει τίποτα. Χρώματα, τύποι και εικόνες δεν αναπαράγονται ποτέ: μόνο οι τιμές κειμένου.';

  @override
  String pdfToExcelTablesFound(int tables, int pages) {
    String _temp0 = intl.Intl.pluralLogic(
      tables,
      locale: localeName,
      other: '$tables πίνακες εντοπίστηκαν',
      one: '$tables πίνακας εντοπίστηκε',
    );
    String _temp1 = intl.Intl.pluralLogic(
      pages,
      locale: localeName,
      other: '$pages σελίδες',
      one: '$pages σελίδα',
    );
    return '$_temp0 σε $_temp1';
  }

  @override
  String pdfToExcelPagesConcerned(String pages) {
    return 'Σελίδες που αφορά: $pages';
  }

  @override
  String pdfToExcelParagraphsOutside(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count παράγραφοι εκτός πινάκων',
      one: '$count παράγραφος εκτός πινάκων',
    );
    return '$_temp0';
  }

  @override
  String get pdfToExcelScannedWarning =>
      'Δεν ήταν δυνατή η εξαγωγή κειμένου από αυτό το PDF: πρόκειται σχεδόν σίγουρα για σαρωμένο έγγραφο (εικόνες σελίδων). Ένα υπολογιστικό φύλλο δεν μπορεί να βγάλει τίποτα από αυτό· χρησιμοποιήστε πρώτα το εργαλείο αναγνώρισης κειμένου (OCR).';

  @override
  String get pdfToExcelNoTableWarning =>
      'Δεν αναγνωρίστηκε καμία δομή πίνακα σε αυτό το έγγραφο. Το κείμενο υπάρχει, αλλά δεν είναι τοποθετημένο σε κανονικές στήλες. Αντί να παραχθεί ένα μη αναγνώσιμο βιβλίο εργασίας, ενεργοποιήστε την επιλογή «Συμπερίληψη και του κειμένου εκτός πινάκων» παραπάνω ή χρησιμοποιήστε το «PDF σε Word» που διατηρεί καλύτερα τις παραγράφους.';

  @override
  String get pdfToExcelResultTitle => 'Βιβλίο εργασίας έτοιμο';

  @override
  String get pdfToExcelExportWhat => 'Βιβλίο εργασίας Excel';

  @override
  String get pdfToExcelConvertAction => 'Μετατροπή σε Excel';

  @override
  String resultNameAndSize(String name, String size) {
    return '$name — $size';
  }

  @override
  String get pdfToPptxEmptyTitle => 'Μία διαφάνεια ανά σελίδα';

  @override
  String get pdfToPptxEmptyBody =>
      'Το PDF γίνεται πανομοιότυπη παρουσίαση PowerPoint. Κάθε σελίδα φτάνει ως εικόνα: η διάταξη είναι πιστή, αλλά το κείμενο δεν θα είναι επεξεργάσιμο στο PowerPoint.';

  @override
  String pdfToPptxOpenFailed(String detail) {
    return 'Δεν ήταν δυνατό το άνοιγμα αυτού του PDF: $detail';
  }

  @override
  String get pdfToPptxConverting => 'Μετατροπή σε PowerPoint…';

  @override
  String pdfToPptxPagesToSlides(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count σελίδες',
      one: '$count σελίδα',
    );
    String _temp1 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count διαφάνειες',
      one: '$count διαφάνεια',
    );
    return '$_temp0 > $_temp1';
  }

  @override
  String get pdfToPptxEmptyDocument => 'Κενό έγγραφο';

  @override
  String get qualityLabel => 'Ποιότητα';

  @override
  String get pdfToPptxQualityHint =>
      'Μια υψηλότερη ανάλυση δίνει πιο ευκρινείς διαφάνειες αλλά αισθητά βαρύτερο αρχείο.';

  @override
  String pdfToPptxHeavyWarning(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count σελίδων',
      one: '$count σελίδας',
    );
    return 'Προσοχή: σε υψηλή ποιότητα, μια παρουσίαση $_temp0 μπορεί να ζυγίζει δεκάδες MB και να αργεί να ανοίξει. Επιλέξτε Κανονική αν έχετε αμφιβολία.';
  }

  @override
  String get goodToKnow => 'Καλό να ξέρετε';

  @override
  String get pdfToPptxCaveat =>
      'Κάθε διαφάνεια είναι εικόνα της σελίδας: η διάταξη είναι ίδια με το PDF, αλλά το κείμενο δεν θα είναι επεξεργάσιμο στο PowerPoint.\nΓια να ανακτήσετε επεξεργάσιμο κείμενο, χρησιμοποιήστε το «PDF σε Word».\nΜια παρουσίαση έχει μόνο μία μορφή διαφάνειας: λαμβάνεται από την πρώτη σελίδα, και οι σελίδες διαφορετικής μορφής κεντράρονται μέσα σε αυτήν.';

  @override
  String get pdfToPptxResultTitle => 'Παρουσίαση έτοιμη';

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
      other: '$count διαφάνειες',
      one: '$count διαφάνεια',
    );
    return '$name — $_temp0 · $size · $quality';
  }

  @override
  String get notSavedYet =>
      'Το αρχείο δεν βρίσκεται ακόμη στη συσκευή σας: αποθηκεύστε το ή μοιραστείτε το.';

  @override
  String get pdfToPptxChangeQuality => 'Αλλαγή ποιότητας';

  @override
  String get pdfToPptxConvertAction => 'Μετατροπή σε PowerPoint';

  @override
  String pdfToPptxExportWhat(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count διαφάνειες',
      one: '$count διαφάνεια',
    );
    return 'Παρουσίαση PowerPoint · $_temp0';
  }

  @override
  String get formatLabel => 'Μορφή';

  @override
  String get actionExport => 'Εξαγωγή';

  @override
  String get imageQualityWeb => 'Ιστού (72 dpi)';

  @override
  String get imageQualityStandard => 'Κανονική (150 dpi)';

  @override
  String get imageQualityHigh => 'Υψηλή ποιότητα (300 dpi)';

  @override
  String get pdfToImagesEmptyTitle => 'Μία εικόνα ανά σελίδα';

  @override
  String get pdfToImagesEmptyBody =>
      'Επιλέξτε ένα PDF: κάθε σελίδα θα βγει ως εικόνα, στην ανάλυση που θα ρυθμίσετε στη συνέχεια.';

  @override
  String pdfToImagesNotAPdf(String name) {
    return '$name: επιλέξτε ένα αρχείο PDF.';
  }

  @override
  String errorLoadFailed(String detail) {
    return 'Η φόρτωση απέτυχε: $detail';
  }

  @override
  String get pdfToImagesProgress => 'Εξαγωγή σε εξέλιξη…';

  @override
  String pdfToImagesExportWhat(int count, String format) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count εικόνες',
      one: '$count εικόνα',
    );
    return '$_temp0 $format';
  }

  @override
  String get pdfaEmptyTitle => 'Αρχειοθέτηση για μακροχρόνια διατήρηση';

  @override
  String get pdfaEmptyBody =>
      'Το PDF/A είναι η μορφή αρχειοθέτησης που απαιτούν πολλές δημόσιες υπηρεσίες. Το έγγραφο μετατρέπεται χωρίς να χάσει την εμφάνισή του.';

  @override
  String get pdfaConformanceLevel => 'Επίπεδο συμμόρφωσης';

  @override
  String get pdfaA1bDetail =>
      'Το πιο αυστηρό και πιο ευρέως αποδεκτό επίπεδο. Επιλέξτε το αν έχετε αμφιβολία.';

  @override
  String get pdfaA2bDetail =>
      'Βασίζεται στο PDF 1.7: πιο αποδοτική συμπίεση, ελαφρώς μικρότερα αρχεία.';

  @override
  String get pdfaA3bDetail =>
      'Όπως το A-2b, αλλά επιτρέπει συνημμένα (συχνά απαιτείται για την ηλεκτρονική τιμολόγηση).';

  @override
  String pdfaConvertingTo(String level) {
    return 'Μετατροπή σε $level…';
  }

  @override
  String get pdfaCaveatTitle => 'Τι αλλάζει η μετατροπή';

  @override
  String pdfaCaveat(int dpi) {
    return 'Κάθε σελίδα σχεδιάζεται ξανά ως εικόνα στα $dpi dpi: το κείμενο γίνεται εικόνα και η διάταξη παγώνει. Αυτό κάνει το αρχείο πραγματικά συμμορφωμένο χωρίς να εξαρτάται από τις γραμματοσειρές του αρχικού εγγράφου, αλλά σε αντάλλαγμα το κείμενο δεν είναι πλέον επιλέξιμο ούτε αναζητήσιμο, οι σύνδεσμοι και οι φόρμες εξαφανίζονται και το αρχείο γίνεται βαρύτερο.';
  }

  @override
  String pdfaOpenFailed(String detail) {
    return 'Δεν ήταν δυνατό το άνοιγμα αυτού του PDF: $detail';
  }

  @override
  String get imagesToPdfEmptyTitle => 'Εικόνες σε ένα PDF';

  @override
  String get imagesToPdfEmptyBody =>
      'JPG, PNG, WebP, HEIC — προσθέστε τις εικόνες σας και θα συναρμολογηθούν με τη σειρά που θα επιλέξετε.';

  @override
  String get imagesToPdfChoose => 'Επιλογή εικόνων';

  @override
  String get imagesToPdfAdd => 'Προσθήκη εικόνων';

  @override
  String imagesToPdfRejected(String names) {
    return 'Παραλείφθηκε (δεν είναι εικόνα): $names';
  }

  @override
  String get imagesToPdfBuilding => 'Δημιουργία PDF…';

  @override
  String imagesToPdfBuildFailed(String detail) {
    return 'Η δημιουργία απέτυχε: $detail';
  }

  @override
  String imagesToPdfCreateAction(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count εικόνες',
      one: '$count εικόνα',
    );
    return 'Δημιουργία PDF ($_temp0)';
  }

  @override
  String get actionRotate => 'Περιστροφή';

  @override
  String get actionRemove => 'Αφαίρεση';

  @override
  String get htmlTitle => 'HTML / ιστοσελίδα σε PDF';

  @override
  String get htmlIntro =>
      'Μετατρέψτε μια ιστοσελίδα ή κώδικα HTML σε PDF A4. Η απόδοση γίνεται από το ενσωματωμένο πρόγραμμα περιήγησης του Android, οπότε η διάταξη είναι αυτή μιας εκτύπωσης από το Chrome.';

  @override
  String get htmlModeUrl => 'Διεύθυνση ιστού';

  @override
  String get htmlModeCode => 'Κώδικας HTML';

  @override
  String get htmlUrlLabel => 'Διεύθυνση σελίδας';

  @override
  String get htmlUrlHint => 'https://example.gr/arthro';

  @override
  String get htmlCodeLabel => 'Κώδικας HTML';

  @override
  String get htmlCodeHint => '<h1>Τίτλος</h1>\n<p>Κείμενο…</p>';

  @override
  String get htmlUrlBadScheme =>
      'Η διεύθυνση πρέπει να αρχίζει με http:// ή https://.';

  @override
  String get htmlUrlIncomplete => 'Εισαγάγετε μια πλήρη διεύθυνση ιστού.';

  @override
  String get htmlCodeEmpty => 'Επικολλήστε κώδικα HTML για μετατροπή.';

  @override
  String get htmlLoadingUrl => 'Φόρτωση σελίδας και μετατροπή…';

  @override
  String get htmlConverting => 'Μετατροπή HTML σε εξέλιξη…';

  @override
  String get htmlNetworkNotice =>
      'Απαιτείται σύνδεση στο διαδίκτυο: είναι το μόνο εργαλείο της εφαρμογής που πρέπει να κατεβάσει τη σελίδα. Σελίδες που απαιτούν σύνδεση σε λογαριασμό, banner cookies ή πολλή JavaScript μπορεί να βγουν ελλιπείς.';

  @override
  String get htmlOfflineNotice =>
      'Το HTML και το CSS που είναι γραμμένα απευθείας στη σελίδα αποδίδονται χωρίς σύνδεση. Αντίθετα, εικόνες, φύλλα στυλ ή γραμματοσειρές που καλούνται από εξωτερική διεύθυνση ιστού απαιτούν σύνδεση στο διαδίκτυο.';

  @override
  String get watermarkEmptyTitle => 'Προσθήκη υδατογραφήματος';

  @override
  String get watermarkEmptyBody =>
      'Ένα κείμενο της επιλογής σας επαναλαμβάνεται στο φόντο όλων των σελίδων — για να σημάνετε ένα έγγραφο ως εμπιστευτικό ή πρόχειρο.';

  @override
  String get watermarkEmptyNote => 'Δωρεάν εξαγωγή, χωρίς όρια.';

  @override
  String get watermarkTextLabel => 'Κείμενο υδατογραφήματος';

  @override
  String get watermarkDefaultText => 'ΕΜΠΙΣΤΕΥΤΙΚΟ';

  @override
  String get watermarkNeedText => 'Εισαγάγετε κείμενο για το υδατογράφημα.';

  @override
  String watermarkOpacity(int percent) {
    return 'Αδιαφάνεια: $percent%';
  }

  @override
  String watermarkRotation(int degrees) {
    return 'Γωνία περιστροφής: $degrees°';
  }

  @override
  String watermarkFontSize(int points) {
    return 'Μέγεθος κειμένου: $points pt';
  }

  @override
  String get watermarkColor => 'Χρώμα';

  @override
  String get colorGrey => 'Γκρι';

  @override
  String get colorRed => 'Κόκκινο';

  @override
  String get colorBlue => 'Μπλε';

  @override
  String get colorBlack => 'Μαύρο';

  @override
  String get watermarkProgress => 'Εφαρμογή υδατογραφήματος σε εξέλιξη…';

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
  String get pageNumbersEmptyTitle => 'Αρίθμηση σελίδων';

  @override
  String get pageNumbersEmptyBody =>
      'Επιλέξτε ένα PDF και μετά τη θέση και τη μορφή των αριθμών που θα προστεθούν σε κάθε σελίδα.';

  @override
  String get positionLabel => 'Θέση';

  @override
  String get positionBottomCenter => 'Κάτω κέντρο';

  @override
  String get positionBottomRight => 'Κάτω δεξιά';

  @override
  String get positionTopCenter => 'Πάνω κέντρο';

  @override
  String get positionTopRight => 'Πάνω δεξιά';

  @override
  String get pageNumbersFormatPlain => 'Ν';

  @override
  String get pageNumbersFormatOfTotal => 'Ν / σύνολο';

  @override
  String get pageNumbersStart => 'Αριθμός έναρξης';

  @override
  String get pageNumbersProgress => 'Αρίθμηση σε εξέλιξη…';

  @override
  String get organizeEmptyTitle => 'Αναλάβετε ξανά τον έλεγχο ενός PDF';

  @override
  String get organizeEmptyBody =>
      'Ανοίξτε ένα έγγραφο για να το χωρίσετε, να εξαγάγετε σελίδες ή να αλλάξετε τη σειρά τους.';

  @override
  String get organizeOpenFile => 'Άνοιγμα αρχείου';

  @override
  String get organizeNothingToExport => 'Καμία σελίδα προς εξαγωγή.';

  @override
  String organizePagesKept(int kept, int total) {
    String _temp0 = intl.Intl.pluralLogic(
      kept,
      locale: localeName,
      other: '$kept σελίδες διατηρήθηκαν',
      one: '$kept σελίδα διατηρήθηκε',
    );
    return '$_temp0 από $total';
  }

  @override
  String get organizePageExcluded => 'Εξαιρέθηκε';

  @override
  String organizePageMoved(int from) {
    return 'Μετακινήθηκε από τη θέση $from';
  }

  @override
  String organizePageTitle(int number) {
    return 'Σελίδα $number';
  }

  @override
  String organizeExcludePage(int number) {
    return 'Εξαίρεση σελίδας $number';
  }

  @override
  String organizeIncludePage(int number) {
    return 'Συμπερίληψη σελίδας $number';
  }

  @override
  String organizeMovePage(int number) {
    return 'Μετακίνηση σελίδας $number';
  }

  @override
  String get organizeExtract => 'Εξαγωγή';

  @override
  String get organizeSplit => 'Διαχωρισμός';

  @override
  String get organizePreview => 'Προεπισκόπηση';

  @override
  String get organizeExtractTitle => 'Εξαγωγή εύρους σελίδων';

  @override
  String organizeRangeLabel(int start, int end) {
    return 'Σελίδες $start έως $end';
  }

  @override
  String get organizeSplitTitle => 'Διαχωρισμός σε πολλά αρχεία';

  @override
  String organizeFileCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count αρχεία',
      one: '$count αρχείο',
    );
    return '$_temp0';
  }

  @override
  String organizeSplitFailed(String detail) {
    return 'Ο διαχωρισμός απέτυχε: $detail';
  }

  @override
  String get scanNoCamera =>
      'Δεν υπάρχει διαθέσιμη κάμερα σε αυτήν τη συσκευή.';

  @override
  String scanCameraFailed(String detail) {
    return 'Δεν ήταν δυνατή η εκκίνηση της κάμερας: $detail';
  }

  @override
  String get scanCropToolbar => 'Προσαρμογή';

  @override
  String scanCaptureFailed(String detail) {
    return 'Η λήψη απέτυχε: $detail';
  }

  @override
  String get scanPermissionBody =>
      'Απαιτείται πρόσβαση στην κάμερα για τη σάρωση εγγράφου.';

  @override
  String get scanGrantPermission => 'Να επιτραπεί η κάμερα';

  @override
  String get actionRetry => 'Δοκιμή ξανά';

  @override
  String get scanNoPageYet => 'Καμία σελίδα ακόμη.';

  @override
  String scanFinishAction(int count) {
    return 'Ολοκλήρωση · $count';
  }

  @override
  String get signTitle => 'Υπογραφή PDF';

  @override
  String get signIntro =>
      'Βάλτε τη χειρόγραφη υπογραφή σας σε μια σελίδα ενός PDF. Είναι ένα απλό σχέδιο που προστίθεται στο έγγραφο, όχι πιστοποιημένη ηλεκτρονική υπογραφή.';

  @override
  String get signChooseSubtitle => 'Επιλέξτε το έγγραφο προς υπογραφή';

  @override
  String get signPickPage => 'Επιλέξτε τη σελίδα για υπογραφή.';

  @override
  String get signDrawTitle => 'Σχεδιάστε την υπογραφή μου';

  @override
  String get signDrawBody =>
      'Σχεδιάστε με το δάχτυλό σας όπως στο χαρτί. Αυτό τοποθετεί ένα σχέδιο στη σελίδα — δεν είναι πιστοποιημένη ηλεκτρονική υπογραφή.';

  @override
  String get signNeedDrawing => 'Σχεδιάστε μια υπογραφή πριν συνεχίσετε.';

  @override
  String get signClear => 'Εκκαθάριση';

  @override
  String get signValidate => 'Επιβεβαίωση';

  @override
  String get signPlaceBody =>
      'Σύρετε την υπογραφή στο σημείο που θέλετε στη σελίδα και μετά πατήστε Ολοκλήρωση.';

  @override
  String get signPageUnavailable => 'Δεν ήταν δυνατή η εμφάνιση της σελίδας.';

  @override
  String get signProgress => 'Προσθήκη υπογραφής…';

  @override
  String get editTitle => 'Σχολιασμός εγγράφου';

  @override
  String get editEmptyBody =>
      'Προσθέστε κείμενο ή επισημάνετε αποσπάσματα απευθείας σε ένα υπάρχον PDF.';

  @override
  String get editAddTextTitle => 'Προσθήκη κειμένου';

  @override
  String get editTextHint => 'Το κείμενό σας';

  @override
  String editFontSize(int size) {
    return 'Μέγεθος κειμένου: $size';
  }

  @override
  String get editNeedAnnotation =>
      'Προσθέστε τουλάχιστον έναν σχολιασμό πριν ολοκληρώσετε.';

  @override
  String get editProgress => 'Εφαρμογή σχολιασμών…';

  @override
  String get editChooseOther => 'Επιλογή άλλου PDF';

  @override
  String get editUndoTooltip => 'Αναίρεση του τελευταίου σχολιασμού';

  @override
  String get editModeText => 'Κείμενο';

  @override
  String get editModeHighlight => 'Επισήμανση';

  @override
  String get editPageUnavailable =>
      'Δεν ήταν δυνατή η εμφάνιση αυτής της σελίδας.';

  @override
  String get ocrEmptyTitle => 'Κάντε το κείμενο αναζητήσιμο';

  @override
  String get ocrEmptyBody =>
      'Το κείμενο ενός σαρωμένου PDF αναγνωρίζεται και προστίθεται πάνω από την εικόνα, αόρατα. Η σελίδα δεν αλλάζει εμφάνιση.';

  @override
  String get ocrWrongFormat => 'Επιλέξτε ένα PDF ή μια εικόνα (JPG, PNG…).';

  @override
  String get ocrProgress => 'Αναγνώριση σε εξέλιξη…';

  @override
  String ocrFailed(String detail) {
    return 'Η αναγνώριση απέτυχε: $detail';
  }

  @override
  String get ocrRunAction => 'Έναρξη αναγνώρισης';

  @override
  String get ocrResultTitle => 'Αποτέλεσμα OCR';

  @override
  String ocrResultBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count σελίδες αναλύθηκαν',
      one: '$count σελίδα αναλύθηκε',
    );
    return '$_temp0. Το αναζητήσιμο PDF είναι έτοιμο και μπορείτε επίσης να αντιγράψετε όλο το αναγνωρισμένο κείμενο.';
  }

  @override
  String get ocrCopyText => 'Αντιγραφή κειμένου';

  @override
  String get ocrTextCopied => 'Το κείμενο αντιγράφηκε.';

  @override
  String get redactIntro =>
      'Αποκρύψτε οριστικά περιοχές ενός PDF (ονόματα, διευθύνσεις, ποσά). Σε αντίθεση με ένα απλό μαύρο ορθογώνιο από πάνω, το κρυμμένο κείμενο διαγράφεται πραγματικά από το αρχείο, όχι απλώς καλύπτεται: δεν μπορεί πλέον να επιλεγεί ή να αντιγραφεί.';

  @override
  String get redactChooseSubtitle =>
      'Επιλέξτε το έγγραφο για απόκρυψη περιεχομένου';

  @override
  String get redactCaveat =>
      'Καλό να ξέρετε: για να αφαιρεθεί το κρυμμένο κείμενο, κάθε σελίδα του εγγράφου μετατρέπεται ξανά σε εικόνα (200 dpi). Το αποτέλεσμα δεν είναι πλέον PDF με επιλέξιμο κείμενο, και το αρχείο που προκύπτει είναι συνήθως βαρύτερο από το αρχικό.';

  @override
  String get redactEmptyPdf => 'Αυτό το PDF δεν περιέχει καμία σελίδα.';

  @override
  String redactOpenFailed(String detail) {
    return 'Δεν ήταν δυνατό το άνοιγμα αυτού του PDF (ίσως προστατεύεται με κωδικό): $detail';
  }

  @override
  String redactPageRenderFailed(int number, String detail) {
    return 'Δεν ήταν δυνατή η εμφάνιση της σελίδας $number: $detail';
  }

  @override
  String get redactUndoTooltip => 'Αναίρεση της τελευταίας περιοχής';

  @override
  String get redactInstructions =>
      'Σύρετε το δάχτυλό σας πάνω στη σελίδα για να σχεδιάσετε μια περιοχή προς απόκρυψη. Το κείμενο που καλύπτεται θα διαγραφεί πραγματικά από το αρχείο, όχι απλώς θα καλυφθεί.';

  @override
  String get redactPagePrevious => 'Προηγούμενη σελίδα';

  @override
  String get redactPageNext => 'Επόμενη σελίδα';

  @override
  String redactPager(int current, int total) {
    return 'Σελίδα $current / $total';
  }

  @override
  String get redactNoZone => 'Καμία περιοχή δεν σχεδιάστηκε';

  @override
  String redactZoneCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count περιοχές προς απόκρυψη',
      one: '$count περιοχή προς απόκρυψη',
    );
    return '$_temp0';
  }

  @override
  String get redactOtherPdf => 'Άλλο PDF';

  @override
  String get redactAction => 'Απόκρυψη';

  @override
  String get redactProgress => 'Απόκρυψη σε εξέλιξη…';

  @override
  String get cropEmptyTitle => 'Περικοπή περιθωρίων';

  @override
  String get cropEmptyBody =>
      'Επιλέξτε ένα PDF και μετά σύρετε το δάχτυλό σας πάνω στην προεπισκόπηση για να ορίσετε την περιοχή που θα διατηρηθεί.';

  @override
  String get cropTooSmall => 'Η επιλεγμένη περιοχή είναι πολύ μικρή.';

  @override
  String get cropProgress => 'Περικοπή σε εξέλιξη…';

  @override
  String cropFailed(String detail) {
    return 'Η περικοπή απέτυχε: $detail';
  }

  @override
  String get cropKeptArea => 'Περιοχή που διατηρήθηκε';

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
  String get cropFullPage => 'Ολόκληρη η σελίδα';

  @override
  String get cropAllPages => 'Εφαρμογή σε όλες τις σελίδες';

  @override
  String get cropAllPagesOn => 'Η ίδια περιοχή κόβεται σε κάθε σελίδα.';

  @override
  String get cropAllPagesOff =>
      'Μόνο η σελίδα 1 περικόπτεται· οι υπόλοιπες διατηρούνται ολόκληρες.';

  @override
  String get cropCaveat =>
      'Η περικοπή μειώνει το μέγεθος της σελίδας: το περιεχόμενο εκτός της περιοχής δεν εμφανίζεται ούτε εκτυπώνεται πλέον.';

  @override
  String get cropAction => 'Περικοπή';

  @override
  String get compareTitle => 'Σύγκριση δύο PDF';

  @override
  String get compareEmptyTitle => 'Τι άλλαξε';

  @override
  String get compareEmptyBody =>
      'Επιλέξτε δύο εκδόσεις του ίδιου PDF. Τα αποσπάσματα που προστέθηκαν και αφαιρέθηκαν θα τοποθετηθούν το ένα δίπλα στο άλλο, σελίδα προς σελίδα.';

  @override
  String get compareSlotA => 'Αρχείο A';

  @override
  String get compareSlotB => 'Αρχείο B';

  @override
  String get compareAction => 'Σύγκριση';

  @override
  String get compareProgress => 'Σύγκριση σε εξέλιξη…';

  @override
  String compareFailed(String detail) {
    return 'Η σύγκριση απέτυχε: $detail';
  }

  @override
  String compareChangedPages(int changed, int total) {
    String _temp0 = intl.Intl.pluralLogic(
      changed,
      locale: localeName,
      other: '$changed σελίδες διαφέρουν',
      one: '$changed σελίδα διαφέρει',
    );
    return '$_temp0 από $total';
  }

  @override
  String get compareNoDifference =>
      'Δεν εντοπίστηκε καμία διαφορά μεταξύ των δύο αρχείων.';

  @override
  String comparePageHeading(int number) {
    return 'Σελίδα $number';
  }

  @override
  String organizeFilesCreated(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count αρχεία δημιουργήθηκαν',
      one: '$count αρχείο δημιουργήθηκε',
    );
    return '$_temp0';
  }

  @override
  String organizePartTitle(int number) {
    return 'Μέρος $number';
  }
}
