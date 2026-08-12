// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Modern Greek (`el`).
class LEl extends L {
  LEl([String locale = 'el']) : super(locale);

  @override
  String get appTitle => 'Κλιπ — PDF, Scan & Word';

  @override
  String get appWordmark => 'Τρομπόνι';

  @override
  String get actionSave => 'Εκτός';

  @override
  String get actionShare => 'Μερίδιο';

  @override
  String get actionCompress => 'Κομπρέσα';

  @override
  String get actionDone => 'Πεπερασμένος';

  @override
  String get actionCancel => 'Ματαίωση';

  @override
  String get actionChange => 'Να αλλάξει';

  @override
  String get actionContinue => 'Συνεχίζω';

  @override
  String get actionOpening => 'Ανοιγμα…';

  @override
  String get actionRemoveFile => 'Καταργήστε αυτό το αρχείο';

  @override
  String get progressPreparing => 'Παρασκευή…';

  @override
  String progressPercent(int percent) {
    return '$percent %';
  }

  @override
  String get emptyReassurance => 'Δωρεάν εξαγωγή, χωρίς υδατογράφημα ή όριο.';

  @override
  String get emptyAcceptedFormats => 'Αποδεκτές μορφές';

  @override
  String get exportSavedTitle => 'Είναι καταγεγραμμένο.';

  @override
  String get exportSavedBody =>
      'Κάτω από το όνομα και στο φάκελο που μόλις επιλέξατε. Χωρίς υδατογράφημα, χωρίς όρια, τίποτα για ξεκλείδωμα.';

  @override
  String get exportSaveDialogTitle => 'Αποθήκευση PDF';

  @override
  String pageTileIncluded(int number) {
    return 'Σελίδα $number, περιλαμβάνεται. Αγγίξτε για να το μετακινήσετε στην άκρη.';
  }

  @override
  String pageTileExcluded(int number) {
    return 'Σελίδα $number, απορρίφθηκε. Αγγίξτε για να το συμπεριλάβετε.';
  }

  @override
  String pageTileRotate(int number) {
    return 'Περιστροφή σελίδας $number';
  }

  @override
  String sectionHeaderSemantics(String title, int count) {
    return '$title, $count εργαλεία';
  }

  @override
  String toolCount(int count) {
    return '$count εργαλεία';
  }

  @override
  String get homePromise =>
      'Δημιουργήστε το έγγραφό σας, εξάγετε το.\nΧωρίς τοίχο στο τέλος.';

  @override
  String get homeChipNoAccount => 'Χωρίς λογαριασμό';

  @override
  String get homeChipNoWatermark => 'Χωρίς υδατογράφημα';

  @override
  String get homeChipUnlimited => 'Απεριόριστη εξαγωγή';

  @override
  String get homeSearchTooltip => 'Βρείτε ένα εργαλείο';

  @override
  String get homeColophon =>
      'Τίποτα δεν ξεκλειδώνεται έναντι πληρωμής κατά την εγγραφή. Η εξαγωγή είναι δωρεάν, χωρίς υδατογράφημα και χωρίς όριο αριθμού.';

  @override
  String get sectionFeatured => 'Προτεινόμενα';

  @override
  String get sectionToPdf => 'Στο PDF';

  @override
  String get sectionFromPdf => 'Από PDF';

  @override
  String get sectionSecurity => 'Ασφάλεια';

  @override
  String get sectionEdit => 'Εκδίδω';

  @override
  String get toolMerge => 'Συγχώνευση';

  @override
  String get toolMergeKeywords =>
      'συναρμολογώ συνδυάζω ένωση ενώνω ανασυγκρότηση ενώνουμε συνενώνουμε';

  @override
  String get toolMergeSubtitle =>
      'PDF, Word, εικόνες και κείμενο σε ένα έγγραφο';

  @override
  String get toolRectoVerso => 'Διπλής όψης';

  @override
  String get toolRectoVersoKeywords =>
      'διπλής όψης ενδιάμεση σάρωση άρτιος περιττός';

  @override
  String get toolRectoVersoSubtitle =>
      'Δύο σαρώσεις, επανατοποθετημένες σε σειρά';

  @override
  String get toolImagesToPdf => 'Εικόνες σε PDF';

  @override
  String get toolImagesToPdfKeywords =>
      'φωτογραφία jpg jpeg png συσκευή άλμπουμ φωτογραφιών';

  @override
  String get toolImagesToPdfSubtitle => 'Φωτογραφίες και λήψεις σε ένα έγγραφο';

  @override
  String get toolPdfToWord => 'PDF σε Word';

  @override
  String get toolPdfToWordKeywords =>
      'docx επεξεργάσιμο επεξεργαστή κειμένου μετατροπή';

  @override
  String get toolPdfToWordSubtitle => 'Κείμενο και πίνακες, επεξεργάσιμο';

  @override
  String get toolOrganize => 'Οργανώστε ένα PDF';

  @override
  String get toolOrganizeKeywords =>
      'διαίρεση ξεχωριστά απόσπασμα αναδιάταξη σελίδων παραγγελίας διαγραφή';

  @override
  String get toolOrganizeSubtitle => 'Διαίρεση, εξαγωγή, αναδιάταξη';

  @override
  String get toolExcelToPdf => 'Excel σε PDF';

  @override
  String get toolExcelToPdfKeywords =>
      'xlsx φύλλο υπολογισμού βιβλίου εργασίας υπολογιστικού φύλλου';

  @override
  String get toolPptxToPdf => 'PowerPoint σε PDF';

  @override
  String get toolPptxToPdfKeywords => 'Διαφάνειες παρουσίασης διαφανειών pptx';

  @override
  String get toolHtmlToPdf => 'Ιστοσελίδα σε PDF';

  @override
  String get toolHtmlToPdfKeywords => 'html άρθρο με σύνδεσμο url ιστότοπου';

  @override
  String get toolScan => 'Σαρώστε ένα έγγραφο';

  @override
  String get toolScanKeywords =>
      'φωτογραφική μηχανή φωτογραφική ψηφιοποίηση χαρτί σάρωσης συσκευής';

  @override
  String get toolPdfToExcel => 'PDF σε Excel';

  @override
  String get toolPdfToExcelKeywords =>
      'xlsx εξαγωγή δεδομένων πίνακα υπολογιστικών φύλλων';

  @override
  String get toolPdfToPptx => 'PDF σε PowerPoint';

  @override
  String get toolPdfToPptxKeywords => 'Διαφάνειες παρουσίασης διαφανειών pptx';

  @override
  String get toolPdfToImages => 'PDF σε εικόνες';

  @override
  String get toolPdfToImagesKeywords => 'Λήψη εξαγωγής φωτογραφιών jpg png';

  @override
  String get toolOcr => 'Κείμενο με δυνατότητα αναζήτησης (OCR)';

  @override
  String get toolOcrKeywords =>
      'αναγνώριση χαρακτήρων σάρωση αντιγραφής επιλέξτε';

  @override
  String get toolPdfA => 'Μετατροπή σε PDF/A';

  @override
  String get toolPdfAKeywords =>
      'αρχειοθέτηση τυπικής μακροπρόθεσμης διατήρησης';

  @override
  String get toolProtect => 'Προστασία PDF';

  @override
  String get toolProtectKeywords =>
      'λουκέτο κωδικού πρόσβασης κρυπτογράφηση κλειδαριά ασφαλή';

  @override
  String get toolUnlock => 'Ξεκλείδωμα PDF';

  @override
  String get toolUnlockKeywords =>
      'αφαίρεση κωδικού πρόσβασης άνοιγμα αποκρυπτογράφηση ξεκλειδώματος λουκέτο';

  @override
  String get toolRepair => 'Επισκευή PDF';

  @override
  String get toolRepairKeywords =>
      'κατεστραμμένο μη αναγνώσιμο κατεστραμμένο σφάλμα ανάκτησης';

  @override
  String get toolRedact => 'Διορθώστε ένα PDF';

  @override
  String get toolRedactKeywords =>
      'απόκρυψη μαύρη ανωνυμοποίηση εμπιστευτική διαγραφή';

  @override
  String get toolEdit => 'Επεξεργασία PDF';

  @override
  String get toolEditKeywords => 'κείμενο τροποποίηση σωστή σχολιασμός εγγραφή';

  @override
  String get toolSign => 'Σημείο';

  @override
  String get toolSignKeywords => 'υπογραφή αρχικής σύμβασης χέρι';

  @override
  String get toolWatermark => 'Αφανής σφραγίδα χάρτου';

  @override
  String get toolWatermarkKeywords =>
      'υδατογράφημα εμπιστευτικό σχέδιο σφραγίδας';

  @override
  String get toolPageNumbers => 'Αριθμοί σελίδων';

  @override
  String get toolPageNumbersKeywords => 'αριθμοί φυλλαδίου σελιδοποίησης';

  @override
  String get toolCrop => 'Περικοπή ενός PDF';

  @override
  String get toolCropKeywords => 'κομμένα περιθώρια μέγεθος άκρων καλλιέργειας';

  @override
  String get toolCompare => 'Συγκρίνετε PDF';

  @override
  String get toolCompareKeywords => 'διαφορά εκδόσεις διαφορετικές αλλαγές';

  @override
  String get searchHint => 'Συγχώνευση, κωδικός πρόσβασης, υδατογράφημα…';

  @override
  String get searchClear => 'Να σβήσει';

  @override
  String searchNoResultTitle(String query) {
    return 'Δεν υπάρχουν εργαλεία για το \"$query\".';
  }

  @override
  String get searchNoResultBody =>
      'Δοκιμάστε τη μορφή που έχετε στη διάθεσή σας - \"Word\", \"Excel\", \"photo\" - ή οτιδήποτε άλλο θέλετε να κάνετε με αυτό: \"υπογραφή\", \"διαίρεση\", \"κωδικός πρόσβασης\".';

  @override
  String get actionUndo => 'Ματαίωση';

  @override
  String get actionApply => 'Εφαρμόζω';

  @override
  String get actionChoose => 'Επιλέγω';

  @override
  String get actionChoosePdf => 'Επιλέξτε ένα PDF';

  @override
  String get actionChooseFiles => 'Επιλέξτε αρχεία';

  @override
  String get actionConvert => 'Μετατρέπω';

  @override
  String get actionFinish => 'Για να τελειώσει';

  @override
  String get actionBack => 'Πίσω';

  @override
  String get actionAdd => 'Προσθέτω';

  @override
  String get noFileChosen => 'Δεν έχει επιλεγεί αρχείο';

  @override
  String errorExportFailed(String detail) {
    return 'Η εξαγωγή απέτυχε: $detail';
  }

  @override
  String errorShareFailed(String detail) {
    return 'Η κοινή χρήση απέτυχε: $detail';
  }

  @override
  String errorOpenFailed(String detail) {
    return 'Δεν είναι δυνατό το άνοιγμα του αρχείου: $detail';
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
    return '$value ο';
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
    return '$count σελίδες';
  }

  @override
  String pageCountOfTotal(int kept, int total) {
    return '$kept σελίδες από $total';
  }

  @override
  String pageOfTotal(int current, int total) {
    return 'Σελίδα $current σε $total';
  }

  @override
  String get formatPdf => 'PDF';

  @override
  String get formatWord => 'Λέξη';

  @override
  String get formatExcel => 'Προέχω';

  @override
  String get formatPowerPoint => 'Power point';

  @override
  String get formatImages => 'Εικόνες';

  @override
  String get formatText => 'Κείμενο';

  @override
  String get mergeAddFile => 'Προσθέστε ένα αρχείο';

  @override
  String get mergeAddHint => 'PDF, Word, εικόνες ή κείμενο';

  @override
  String get mergeEmptyTitle => 'Ένα μόνο έγγραφο';

  @override
  String get mergeEmptyBody =>
      'Προσθέστε αρχεία PDF, αρχεία Word, εικόνες ή κείμενο. Μπορείτε να τα αναδιατάξετε και να αφαιρέσετε σελίδες πριν από την εξαγωγή.';

  @override
  String get mergeNeedOnePage =>
      'Προσθέστε τουλάχιστον ένα αρχείο με μια σελίδα για συμπερίληψη.';

  @override
  String get mergeProgress => 'Συγχώνευση σε εξέλιξη...';

  @override
  String mergeFailed(String detail) {
    return 'Η συγχώνευση απέτυχε: $detail';
  }

  @override
  String mergeRemoved(String name) {
    return 'Το $name καταργήθηκε.';
  }

  @override
  String mergeRemoveTooltip(String name) {
    return 'Αφαιρέστε το $name';
  }

  @override
  String mergeMoveSemantics(String name) {
    return 'Μετακίνηση $name';
  }

  @override
  String get mergeRotateAll => 'Περιστροφή όλων των σελίδων';

  @override
  String mergePreviewAndExport(int count) {
    return 'Προεπισκόπηση και εξαγωγή ($count σελίδες)';
  }

  @override
  String previewTitle(String size) {
    return 'Επισκόπηση · $size';
  }

  @override
  String previewZoomPage(int number) {
    return 'Σελίδα $number, μεγέθυνση';
  }

  @override
  String get previewPageUnreadable => 'Σελίδα δυσανάγνωστη.';

  @override
  String previewExportWhat(int count) {
    return 'PDF · $count σελίδες';
  }

  @override
  String get compressTitle => 'Συμπίεση';

  @override
  String compressBody(String size) {
    return 'Τρέχον μέγεθος: $size. Επιλέξτε ένα επίπεδο — το εκτιμώμενο μέγεθος εμφανίζεται πριν από την εφαρμογή.';
  }

  @override
  String get compressEstimating => 'Εκτίμηση…';

  @override
  String get compressProgress => 'Συμπίεση σε εξέλιξη...';

  @override
  String compressFailed(String detail) {
    return 'Η συμπίεση απέτυχε: $detail';
  }

  @override
  String get protectEmptyTitle => 'Βάλτε κάτω από τον κωδικό πρόσβασης';

  @override
  String get protectEmptyBody =>
      'Το PDF δεν θα ανοίγει πλέον χωρίς τον κωδικό πρόσβασης που έχετε επιλέξει. Κρατήστε το: δεν μπορεί να ανακτηθεί.';

  @override
  String get protectSubtitle => 'Θα είναι κρυπτογραφημένο σε AES 256-bit';

  @override
  String get protectPassword => 'Σύνθημα';

  @override
  String get protectConfirmPassword => 'Επιβεβαίωση κωδικού πρόσβασης';

  @override
  String get protectShowPasswords => 'Εμφάνιση κωδικών πρόσβασης';

  @override
  String get protectHidePasswords => 'Απόκρυψη κωδικών πρόσβασης';

  @override
  String get protectMismatch => 'Οι δύο κωδικοί πρόσβασης διαφέρουν.';

  @override
  String get protectWarning =>
      'Γράψτε το κάπου: χωρίς αυτό, το έγγραφο γίνεται μόνιμα δυσανάγνωστο. Δεν είναι δυνατή η ανάκτηση, ούτε από εσάς ούτε από την εφαρμογή.';

  @override
  String get protectAlreadyProtected =>
      'Αυτό το αρχείο είναι ήδη προστατευμένο — χρησιμοποιήστε πρώτα Ξεκλείδωμα PDF.';

  @override
  String get protectProgress => 'Προστασία σε εξέλιξη…';

  @override
  String protectFailed(String detail) {
    return 'Η προστασία απέτυχε: $detail';
  }

  @override
  String get protectAction => 'Προστατεύω';

  @override
  String get protectResultTitle => 'Προστατευμένο PDF';

  @override
  String get protectResultDetail =>
      'Κρυπτογραφημένο σε AES 256 bit. Θα χρειαστείτε τον κωδικό πρόσβασης για να το ανοίξετε.';

  @override
  String get protectExportWhat => 'PDF με κωδικό πρόσβασης';

  @override
  String get unlockEmptyTitle => 'Αφαίρεση κωδικού πρόσβασης';

  @override
  String get unlockEmptyBody =>
      'Χρειάζεστε τον τρέχοντα κωδικό πρόσβασης για το έγγραφο. Μόλις αφαιρεθεί, το PDF θα ανοίξει ελεύθερα.';

  @override
  String get unlockAcceptsProtectedPdf => 'Προστατευμένο PDF';

  @override
  String get unlockChooseProtectedPdf => 'Επιλέξτε ένα προστατευμένο PDF';

  @override
  String get unlockCurrentPassword => 'Τρέχων κωδικός πρόσβασης';

  @override
  String get unlockWrongPassword => 'Λανθασμένος κωδικός πρόσβασης.';

  @override
  String get unlockProgress => 'Ξεκλείδωμα σε εξέλιξη…';

  @override
  String unlockFailed(String detail) {
    return 'Αποτυχία ξεκλειδώματος: $detail';
  }

  @override
  String get unlockAction => 'Ξεκλειδώνω';

  @override
  String get repairEmptyTitle => 'Επισκευάστε ένα κατεστραμμένο αρχείο';

  @override
  String get repairEmptyBody =>
      'Η εσωτερική δομή ενός κατεστραμμένου PDF ανακατασκευάζεται. Ό,τι είναι διασώσιμο θα είναι και διασώσιμο.';

  @override
  String get repairProgress => 'Επισκευή σε εξέλιξη…';

  @override
  String get repairFailed =>
      'Αυτό το αρχείο δεν μπορεί να επιδιορθωθεί — μπορεί να είναι πολύ κατεστραμμένο.';

  @override
  String get repairAction => 'Διορθώνω';

  @override
  String get pdfToWordEmptyTitle => 'Ένα επεξεργάσιμο Word';

  @override
  String get pdfToWordEmptyBody =>
      'Το κείμενο και η δομή του PDF μεταφέρονται σε ένα έγγραφο .docx που μπορείτε να ανοίξετε ξανά και να διορθώσετε.';

  @override
  String get pdfToWordAnalyzing => 'Ανάλυση του εγγράφου…';

  @override
  String get pdfToWordAnalysisPending => 'Η ανάλυση εκκρεμεί';

  @override
  String pdfToWordAnalysisFailed(String detail) {
    return 'Δεν είναι δυνατή η σάρωση: $detail';
  }

  @override
  String get pdfLocked =>
      'Αυτό το PDF προστατεύεται με κωδικό πρόσβασης. Ξεκλειδώστε το πρώτα.';

  @override
  String get pdfToWordConverting => 'Μετατροπή σε Word…';

  @override
  String get pdfToWordSummaryTitle => 'Εντοπίστηκε περιεχόμενο';

  @override
  String pdfToWordParagraphCount(int count) {
    return '$count παραγράφους';
  }

  @override
  String pdfToWordHeadingCount(int count) {
    return '$count τίτλοι';
  }

  @override
  String pdfToWordTableCount(int count) {
    return '$count πίνακες';
  }

  @override
  String get pdfToWordNoTables =>
      'Δεν εντοπίστηκαν πίνακες: εάν το PDF σας περιέχει, οι γραμμές του θα μετατραπούν σε παραγράφους.';

  @override
  String get pdfToWordCaveat =>
      'Η μετατροπή αναπαράγει το κείμενο, τη μορφοποίηση και τους πίνακες, αλλά όχι την ακριβή διάταξη: η θέση των εικόνων και των στηλών δεν διατηρείται και οι εικόνες δεν περιλαμβάνονται στο έγγραφο του Word.';

  @override
  String get pdfToWordScanWarning =>
      'Αυτό το PDF φαίνεται να είναι σάρωση: δεν βρέθηκε κείμενο. Χρησιμοποιήστε πρώτα το εργαλείο αναζήτησης κειμένου (OCR) και μετά επιστρέψτε και μετατρέψτε το PDF που προκύπτει.';

  @override
  String get pdfToWordResultTitle => 'Έτοιμο έγγραφο του Word';

  @override
  String pdfToWordResultDetail(String name, String size) {
    return '$name — $size';
  }

  @override
  String get pdfToWordExportWhat => 'Έγγραφο του Word';

  @override
  String get pdfToWordConvertAction => 'Μετατροπή σε Word';

  @override
  String get actionConvertAgain => 'Μετατροπή ξανά';

  @override
  String errorSaveFailed(String detail) {
    return 'Δεν είναι δυνατή η εγγραφή: $detail';
  }

  @override
  String get rectoVersoIntro =>
      'Ένας τροφοδότης μονής όψης παράγει δύο αρχεία: μονές σελίδες με σειρά, ζυγές σελίδες συχνά με αντίστροφη σειρά. Επιλέξτε και τα δύο για να τα ανασυνθέσετε.';

  @override
  String get rectoVersoOddSlot => 'Αρχείο Μονών Σελίδων (Μονής Όψης)';

  @override
  String get rectoVersoEvenSlot => 'Αρχείο ζυγών σελίδων (πίσω)';

  @override
  String get rectoVersoReversed => 'Το δεύτερο αρχείο έχει αντίστροφη σειρά';

  @override
  String get rectoVersoReversedHint =>
      'Αυτή είναι η πιο συνηθισμένη περίπτωση, που ελέγχεται από προεπιλογή';

  @override
  String rectoVersoPreview(int count) {
    return 'Επισκόπηση παρεμβολής ($count σελίδες)';
  }

  @override
  String get rectoVersoProgress => 'Η παρέμβαση σε εξέλιξη…';

  @override
  String fileWithPageCount(String name, int count) {
    return '$name · $count σελίδες';
  }

  @override
  String get actionPreviewAndExport => 'Προεπισκόπηση και εξαγωγή';

  @override
  String errorOpenFailedShort(String detail) {
    return 'Δεν είναι δυνατό το άνοιγμα: $detail';
  }

  @override
  String errorGeneric(String detail) {
    return 'Απέτυχε: $detail';
  }

  @override
  String get actionConvertToPdf => 'Μετατροπή σε PDF';

  @override
  String get convertProgress => 'Μετατροπή σε εξέλιξη...';

  @override
  String get excelEmptyTitle => 'Ένα βιβλίο εργασίας PDF';

  @override
  String get excelEmptyBody =>
      'Τα φύλλα σε ένα αρχείο .xlsx γίνονται σελίδες PDF, έτοιμες για αποστολή ή εκτύπωση.';

  @override
  String get excelChooseWorkbook => 'Επιλέξτε ένα συνδετικό';

  @override
  String get excelChooseXlsx => 'Επιλέξτε ένα βιβλίο εργασίας .xlsx';

  @override
  String get excelLegacyFormat =>
      'Η μορφή .xls (παλιά δυαδική μορφή του Excel) δεν υποστηρίζεται. Αποθηκεύστε το αρχείο ως .xlsx και δοκιμάστε ξανά.';

  @override
  String get excelWrongFormat => 'Επιλέξτε ένα βιβλίο εργασίας Excel .xlsx.';

  @override
  String excelUnreadable(String detail) {
    return 'Μη αναγνώσιμος φάκελος: $detail';
  }

  @override
  String excelSheetsAndRows(int sheets, int rows) {
    return '$sheets φύλλα · $rows σειρές συνολικά';
  }

  @override
  String get excelSheetsDetected => 'Εντοπίστηκαν φύλλα';

  @override
  String get excelEmptySheet => 'Άδειο φύλλο';

  @override
  String excelSheetDimensions(int rows, int columns) {
    return '$rows σειρές × $columns στήλες';
  }

  @override
  String get excelRepeatHeader =>
      'Επαναλάβετε τη γραμμή κεφαλίδας σε κάθε σελίδα';

  @override
  String get excelRepeatHeaderHint =>
      'Η πρώτη σειρά του φύλλου σχεδιάζεται εκ νέου στην κορυφή κάθε σελίδας πίνακα.';

  @override
  String get excelCaveat =>
      'Τι χρειάζεται η μετατροπή: το κείμενο των κελιών όπως είναι αποθηκευμένο στο αρχείο (συμπεριλαμβανομένου του τελευταίου υπολογισμένου αποτελέσματος των τύπων), την πρώτη έντονη γραμμή και ένα πλέγμα.\n\nΤι δεν περιλαμβάνεται: χρώματα, γραμματοσειρές, μορφές αριθμών, συγχωνευμένα κελιά, εικόνες, γραφικά και οι ίδιοι οι τύποι. Οι στήλες μειώνονται για να ταιριάζουν στο πλάτος της σελίδας. σε πολύ πλατιά φύλλα, το κείμενο σε κελιά που είναι πολύ στενά περικόπτεται με \"...\".';

  @override
  String get pptxEmptyTitle => 'Παρουσίαση σε PDF';

  @override
  String get pptxEmptyBody =>
      'Μία οριζόντια σελίδα 16:9 ανά διαφάνεια, συμπεριλαμβανομένων του τίτλου και των κουκκίδων. Το κείμενο επαναλαμβάνεται. οι αρχικές εικόνες, τα σχήματα και τα φόντο δεν είναι.\n\nΑποδεκτή μορφή: .pptx. Ένα παλιό αρχείο .ppt πρέπει πρώτα να αποθηκευτεί ξανά ως .pptx από το PowerPoint.';

  @override
  String get pptxChoosePresentation => 'Επιλέξτε μια παρουσίαση';

  @override
  String get pptxTextOnlyTitle => 'Μόνο μετατροπή κειμένου';

  @override
  String get pptxTextOnlyBody =>
      'Το κείμενο κάθε διαφάνειας επαναλαμβάνεται. Οι αρχικές εικόνες, τα σχήματα, τα φόντο, τα χρώματα και οι διατάξεις δεν διατηρούνται: το PDF που προκύπτει είναι μια απλή, ευανάγνωστη διάταξη, όχι ένα πιστό αντίγραφο της παρουσίασής σας.';

  @override
  String pptxSlideCount(int count) {
    return '$count διαφάνειες';
  }

  @override
  String get pptxSlidesDetected => 'Εντοπίστηκαν διαφάνειες';

  @override
  String pptxMoreSlides(int count) {
    return 'και $count άλλες διαφάνειες…';
  }

  @override
  String get pptxUntitledSlide => 'Χωρίς τίτλο';

  @override
  String get pptxEmptySlide => 'Χωρίς κείμενο (μόνο εικόνα ή σχήμα)';

  @override
  String pptxTextLineCount(int count) {
    return '$count γραμμές κειμένου';
  }

  @override
  String pptxReadFailed(String detail) {
    return 'Δεν είναι δυνατή η ανάγνωση: $detail';
  }

  @override
  String get compressLevelLight => 'Φως';

  @override
  String get compressLevelMedium => 'Μέσος';

  @override
  String get compressLevelStrong => 'Φόρτε';

  @override
  String get pptxQualityStandard => 'Τυπικό (150 dpi)';

  @override
  String get pptxQualityHigh => 'Υψηλό (220 dpi)';

  @override
  String get pdfToExcelEmptyTitle => 'Ανάκτηση πινάκων';

  @override
  String get pdfToExcelEmptyBody =>
      'Οι πίνακες από ένα PDF εξάγονται σε ένα βιβλίο εργασίας του Excel. Η μορφοποίηση δεν διατηρείται, οι τιμές είναι.';

  @override
  String pdfToExcelPagesAnalyzed(int count) {
    return 'Αναλύθηκαν $count σελίδες';
  }

  @override
  String pdfToExcelAnalysisFailed(String detail) {
    return 'Αδύνατη η ανάλυση. Το PDF ενδέχεται να προστατεύεται με κωδικό πρόσβασης ή να έχει καταστραφεί. ($detail)';
  }

  @override
  String get pdfToExcelNothingToExport =>
      'Δεν υπάρχει τίποτα για εξαγωγή: δεν εντοπίστηκε πίνακας.';

  @override
  String get pdfToExcelBuilding => 'Δημιουργία βιβλίου εργασίας…';

  @override
  String get pdfToExcelIncludeParagraphs =>
      'Συμπεριλάβετε επίσης κείμενο εκτός πινάκων (μία γραμμή ανά παράγραφο)';

  @override
  String get pdfToExcelIncludeParagraphsHint =>
      'Χρήσιμο για ένα ημιδομημένο έγγραφο: το κείμενο τοποθετείται στη στήλη Α, μετά τους πίνακες της σελίδας.';

  @override
  String get pdfToExcelCaveatTitle => 'Αυτό που δεν διατηρεί η μετατροπή';

  @override
  String get pdfToExcelCaveat =>
      'Η ανίχνευση βασίζεται στη θέση του κειμένου στη σελίδα: οι πίνακες χωρίς κανονικό περίγραμμα, συγχωνευμένα κελιά και πολύ ακανόνιστες στήλες ενδέχεται να έχουν κακή κοπή. Ένα σαρωμένο PDF (εικόνα) δεν περιέχει κείμενο με δυνατότητα εξαγωγής και δεν θα αποφέρει τίποτα. Τα χρώματα, οι τύποι και οι εικόνες δεν περιλαμβάνονται ποτέ: περιλαμβάνονται μόνο οι τιμές κειμένου.';

  @override
  String pdfToExcelTablesFound(int tables, int pages) {
    return 'Εντοπίστηκαν πίνακες $tables σε $pages σελίδες';
  }

  @override
  String pdfToExcelPagesConcerned(String pages) {
    return 'Σελίδες που επηρεάζονται: $pages';
  }

  @override
  String pdfToExcelParagraphsOutside(int count) {
    return '$count παράγραφοι εκτός πινάκων';
  }

  @override
  String get pdfToExcelScannedWarning =>
      'Δεν ήταν δυνατή η εξαγωγή κειμένου από αυτό το PDF: πιθανότατα πρόκειται για σαρωμένο έγγραφο (εικόνες σελίδας). Ένα υπολογιστικό φύλλο δεν μπορεί να βγάλει τίποτα από αυτό. χρησιμοποιήστε πρώτα το εργαλείο αναγνώρισης κειμένου (OCR).';

  @override
  String get pdfToExcelNoTableWarning =>
      'Δεν αναγνωρίστηκε δομή πίνακα σε αυτό το έγγραφο. Το κείμενο υπάρχει, αλλά δεν είναι ταξινομημένο σε κανονικές στήλες. Αντί να δημιουργήσετε ένα μη αναγνώσιμο βιβλίο εργασίας, ενεργοποιήστε την επιλογή \"Συμπεριλαμβάνεται επίσης κείμενο μη πίνακα\" παραπάνω ή χρησιμοποιήστε το \"PDF σε Word\" που διατηρεί καλύτερα τις παραγράφους.';

  @override
  String get pdfToExcelResultTitle => 'Έτοιμο συνδετικό';

  @override
  String get pdfToExcelExportWhat => 'Βιβλίο εργασίας του Excel';

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
      'Το PDF γίνεται μια πανομοιότυπη παρουσίαση PowerPoint. Κάθε σελίδα έρχεται με τη μορφή εικόνας: η διάταξη είναι πιστή, αλλά το κείμενο δεν θα είναι επεξεργάσιμο στο PowerPoint.';

  @override
  String pdfToPptxOpenFailed(String detail) {
    return 'Δεν είναι δυνατό το άνοιγμα αυτού του PDF: $detail';
  }

  @override
  String get pdfToPptxConverting => 'Μετατροπή σε PowerPoint…';

  @override
  String pdfToPptxPagesToSlides(int count) {
    return '$count σελίδες > $count διαφάνειες';
  }

  @override
  String get pdfToPptxEmptyDocument => 'Κενό έγγραφο';

  @override
  String get qualityLabel => 'Ποιότητα';

  @override
  String get pdfToPptxQualityHint =>
      'Μια υψηλότερη ανάλυση έχει ως αποτέλεσμα πιο ευκρινείς διαφάνειες αλλά ένα σημαντικά μεγαλύτερο αρχείο.';

  @override
  String pdfToPptxHeavyWarning(int count) {
    return 'Προειδοποίηση: σε υψηλή ποιότητα, μια παρουσίαση $count σελίδων μπορεί να ζυγίζει αρκετές δεκάδες MB και να χρειαστεί πολύς χρόνος για να ανοίξει. Επιλέξτε Standard όταν έχετε αμφιβολίες.';
  }

  @override
  String get goodToKnow => 'Δηλαδή';

  @override
  String get pdfToPptxCaveat =>
      'Κάθε διαφάνεια είναι μια εικόνα της σελίδας: η διάταξη είναι ίδια με το PDF, αλλά το κείμενο δεν θα είναι επεξεργάσιμο στο PowerPoint.\nΓια να ανακτήσετε επεξεργάσιμο κείμενο, χρησιμοποιήστε αντί αυτού το \"PDF σε Word\".\nΜια παρουσίαση έχει μόνο μία μορφή διαφάνειας: λαμβάνεται από την πρώτη σελίδα και σελίδες διαφορετικών μορφών βρίσκονται στο κέντρο της.';

  @override
  String get pdfToPptxResultTitle => 'Έτοιμη η παρουσίαση';

  @override
  String pdfToPptxResultDetail(
    String name,
    int count,
    String size,
    String quality,
  ) {
    return '$name — $count διαφάνειες · $size · $quality';
  }

  @override
  String get notSavedYet =>
      'Το αρχείο δεν βρίσκεται ακόμα στη συσκευή σας: αποθηκεύστε το ή μοιραστείτε το.';

  @override
  String get pdfToPptxChangeQuality => 'Αλλαγή ποιότητας';

  @override
  String get pdfToPptxConvertAction => 'Μετατροπή σε PowerPoint';

  @override
  String pdfToPptxExportWhat(int count) {
    return 'Παρουσίαση PowerPoint · $count διαφάνειες';
  }

  @override
  String get formatLabel => 'Σχήμα και διάταξις βιβλίου';

  @override
  String get actionExport => 'Εξαγωγή';

  @override
  String get imageQualityWeb => 'Ιστός (72 dpi)';

  @override
  String get imageQualityStandard => 'Τυπικό (150 dpi)';

  @override
  String get imageQualityHigh => 'Υψηλή ποιότητα (300 dpi)';

  @override
  String get pdfToImagesEmptyTitle => 'Μία εικόνα ανά σελίδα';

  @override
  String get pdfToImagesEmptyBody =>
      'Επιλέξτε ένα PDF: κάθε σελίδα θα βγει ως εικόνα, με τον ορισμό που θα προσαρμόσετε στη συνέχεια.';

  @override
  String pdfToImagesNotAPdf(String name) {
    return '$name: Επιλέξτε ένα αρχείο PDF.';
  }

  @override
  String errorLoadFailed(String detail) {
    return 'Αποτυχία φόρτωσης: $detail';
  }

  @override
  String get pdfToImagesProgress => 'Εξαγωγή σε εξέλιξη…';

  @override
  String pdfToImagesExportWhat(int count, String format) {
    return '$count εικόνες $format';
  }

  @override
  String get pdfaEmptyTitle => 'Αρχειοθέτηση για μεγάλο χρονικό διάστημα';

  @override
  String get pdfaEmptyBody =>
      'Το PDF/A είναι η μορφή αρχειοθέτησης που απαιτείται από πολλές διοικήσεις. Το έγγραφο μετατρέπεται χωρίς να χάσει την εμφάνισή του.';

  @override
  String get pdfaConformanceLevel => 'Επίπεδο συμμόρφωσης';

  @override
  String get pdfaA1bDetail =>
      'Το πιο αυστηρό και παγκοσμίως αποδεκτό επίπεδο. Επιλέξτε όταν έχετε αμφιβολίες.';

  @override
  String get pdfaA2bDetail =>
      'Βασισμένο στο PDF 1.7: πιο αποτελεσματική συμπίεση, ελαφρώς ελαφρύτερα αρχεία.';

  @override
  String get pdfaA3bDetail =>
      'Όπως το A-2b, αλλά επιτρέπει συνημμένα (συχνά ζητούνται για ηλεκτρονική τιμολόγηση).';

  @override
  String pdfaConvertingTo(String level) {
    return 'Μετατροπή σε $level…';
  }

  @override
  String get pdfaCaveatTitle => 'Τι αλλάζει η μετατροπή';

  @override
  String pdfaCaveat(int dpi) {
    return 'Κάθε σελίδα επανασχεδιάζεται ως εικόνα σε $dpi dpi: το κείμενο γίνεται εικόνα, η διάταξη παγώνει. Αυτό είναι που κάνει το αρχείο πραγματικά συμβατό χωρίς να εξαρτάται από τις γραμματοσειρές του αρχικού εγγράφου, αλλά σε αντάλλαγμα το κείμενο δεν είναι πλέον επιλέξιμο ή αναζητήσιμο, οι σύνδεσμοι και οι φόρμες εξαφανίζονται και το αρχείο γίνεται βαρύτερο.';
  }

  @override
  String pdfaOpenFailed(String detail) {
    return 'Δεν είναι δυνατό το άνοιγμα αυτού του PDF: $detail';
  }

  @override
  String get imagesToPdfEmptyTitle => 'Εικόνες, ένα PDF';

  @override
  String get imagesToPdfEmptyBody =>
      'JPG, PNG, WebP, HEIC — προσθέστε τις εικόνες σας και θα συναρμολογηθούν με τη σειρά που επιλέγετε.';

  @override
  String get imagesToPdfChoose => 'Επιλέξτε εικόνες';

  @override
  String get imagesToPdfAdd => 'Προσθήκη εικόνων';

  @override
  String imagesToPdfRejected(String names) {
    return 'Παράλειψη (όχι εικόνα): $names';
  }

  @override
  String get imagesToPdfBuilding => 'Δημιουργία PDF...';

  @override
  String imagesToPdfBuildFailed(String detail) {
    return 'Η δημιουργία απέτυχε: $detail';
  }

  @override
  String imagesToPdfCreateAction(int count) {
    return 'Δημιουργήστε το PDF ($count εικόνες)';
  }

  @override
  String get actionRotate => 'Γυρίζω';

  @override
  String get actionRemove => 'Αποσύρω';

  @override
  String get htmlTitle => 'HTML / ιστοσελίδα σε PDF';

  @override
  String get htmlIntro =>
      'Μετατρέψτε μια ιστοσελίδα ή έναν κώδικα HTML σε PDF A4. Η απόδοση πραγματοποιείται από το πρόγραμμα περιήγησης που είναι ενσωματωμένο στο Android, επομένως η διάταξη είναι αυτή της εκτύπωσης από το Chrome.';

  @override
  String get htmlModeUrl => 'Διεύθυνση ιστότοπου';

  @override
  String get htmlModeCode => 'Κώδικας HTML';

  @override
  String get htmlUrlLabel => 'Διεύθυνση σελίδας';

  @override
  String get htmlUrlHint => 'https://example.fr/article';

  @override
  String get htmlCodeLabel => 'Κώδικας HTML';

  @override
  String get htmlCodeHint => '<h1>Τίτλος</h1>\n<p>Κείμενο…</p>';

  @override
  String get htmlUrlBadScheme =>
      'Η διεύθυνση πρέπει να ξεκινά με http:// ή https://.';

  @override
  String get htmlUrlIncomplete => 'Εισαγάγετε μια πλήρη διεύθυνση ιστού.';

  @override
  String get htmlCodeEmpty => 'Επικολλήστε κώδικα HTML για μετατροπή.';

  @override
  String get htmlLoadingUrl => 'Φόρτωση σελίδας και μετατροπή…';

  @override
  String get htmlConverting => 'Μετατροπή HTML σε εξέλιξη...';

  @override
  String get htmlNetworkNotice =>
      'Απαιτείται σύνδεση στο διαδίκτυο: είναι το μόνο εργαλείο στην εφαρμογή που πρέπει να κατεβάσει τη σελίδα. Σελίδες που απαιτούν σύνδεση λογαριασμού, banner cookie ή πολλή JavaScript ενδέχεται να είναι ελλιπείς.';

  @override
  String get htmlOfflineNotice =>
      'Τα HTML και CSS που είναι γραμμένα απευθείας στη σελίδα αποδίδονται εκτός σύνδεσης. Από την άλλη πλευρά, οι εικόνες, τα φύλλα στυλ ή οι γραμματοσειρές που καλούνται από μια εξωτερική διεύθυνση ιστού απαιτούν σύνδεση στο διαδίκτυο.';

  @override
  String get watermarkEmptyTitle => 'Προσθέστε ένα υδατογράφημα';

  @override
  String get watermarkEmptyBody =>
      'Το κείμενο της επιλογής σας επαναλαμβάνεται στο παρασκήνιο σε όλες τις σελίδες — για να επισημάνετε ένα έγγραφο ως εμπιστευτικό ή πρόχειρο.';

  @override
  String get watermarkEmptyNote => 'Δωρεάν εξαγωγή χωρίς όριο αριθμού.';

  @override
  String get watermarkTextLabel => 'Κείμενο υδατογραφήματος';

  @override
  String get watermarkDefaultText => 'ΕΜΠΙΣΤΕΥΤΙΚΟΣ';

  @override
  String get watermarkNeedText => 'Εισαγάγετε κείμενο για το υδατογράφημα.';

  @override
  String watermarkOpacity(int percent) {
    return 'Αδιαφάνεια: $percent %';
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
  String get colorGrey => 'Γκρί';

  @override
  String get colorRed => 'Κόκκινος';

  @override
  String get colorBlue => 'Μπλε';

  @override
  String get colorBlack => 'Μαύρος';

  @override
  String get watermarkProgress => 'Η εφαρμογή υδατογραφήματος σε εξέλιξη…';

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
  String get pageNumbersEmptyTitle => 'Αριθμήστε τις σελίδες';

  @override
  String get pageNumbersEmptyBody =>
      'Επιλέξτε ένα PDF και, στη συνέχεια, τη θέση και τη μορφή των αριθμών που θα προστεθούν σε κάθε σελίδα.';

  @override
  String get positionLabel => 'Θέση';

  @override
  String get positionBottomCenter => 'Κάτω κέντρο';

  @override
  String get positionBottomRight => 'Κάτω δεξιά';

  @override
  String get positionTopCenter => 'Κορυφαίο κέντρο';

  @override
  String get positionTopRight => 'Πάνω δεξιά';

  @override
  String get pageNumbersFormatPlain => 'Ν';

  @override
  String get pageNumbersFormatOfTotal => 'N / σύνολο';

  @override
  String get pageNumbersStart => 'Αριθμός έναρξης';

  @override
  String get pageNumbersProgress => 'Η αρίθμηση σε εξέλιξη…';

  @override
  String get organizeEmptyTitle => 'Συνέχιση ενός PDF στο χέρι';

  @override
  String get organizeEmptyBody =>
      'Ανοίξτε ένα έγγραφο για να το χωρίσετε, να εξαγάγετε σελίδες ή να αλλάξετε τη σειρά.';

  @override
  String get organizeOpenFile => 'Ανοίξτε ένα αρχείο';

  @override
  String get organizeNothingToExport => 'Δεν υπάρχουν σελίδες για εξαγωγή.';

  @override
  String organizePagesKept(int kept, int total) {
    return 'Διατηρήθηκαν $kept σελίδες από $total';
  }

  @override
  String get organizePageExcluded => 'Απορρίπτεται';

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
    return 'Απόρριψη σελίδας $number';
  }

  @override
  String organizeIncludePage(int number) {
    return 'Συμπεριλάβετε τη σελίδα $number';
  }

  @override
  String organizeMovePage(int number) {
    return 'Μετακίνηση σελίδας $number';
  }

  @override
  String get organizeExtract => 'Εκχύλισμα';

  @override
  String get organizeSplit => 'Χώρισμα';

  @override
  String get organizePreview => 'Πρεμιέρα';

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
    return '$count αρχεία';
  }

  @override
  String organizeSplitFailed(String detail) {
    return 'Αποτυχία τμήματος: $detail';
  }

  @override
  String get scanNoCamera =>
      'Δεν υπάρχει διαθέσιμη κάμερα σε αυτήν τη συσκευή.';

  @override
  String scanCameraFailed(String detail) {
    return 'Δεν είναι δυνατή η προετοιμασία της κάμερας: $detail';
  }

  @override
  String get scanCropToolbar => 'Προσαρμόζω';

  @override
  String scanCaptureFailed(String detail) {
    return 'Η λήψη απέτυχε: $detail';
  }

  @override
  String get scanPermissionBody =>
      'Απαιτείται πρόσβαση στην κάμερα για τη σάρωση ενός εγγράφου.';

  @override
  String get scanGrantPermission => 'Να επιτρέπεται η κάμερα';

  @override
  String get actionRetry => 'Προσπαθήστε ξανά';

  @override
  String get scanNoPageYet => 'Δεν υπάρχουν σελίδες αυτή τη στιγμή.';

  @override
  String scanFinishAction(int count) {
    return 'Φινίρισμα · $count';
  }

  @override
  String get signTitle => 'Υπογράψτε ένα PDF';

  @override
  String get signIntro =>
      'Προσθέστε την υπογραφή σας με το χέρι σε μια σελίδα ενός PDF. Είναι ένα απλό σχέδιο που προστέθηκε στο έγγραφο, όχι μια επικυρωμένη ηλεκτρονική υπογραφή.';

  @override
  String get signChooseSubtitle =>
      'Επιλέξτε το έγγραφο που θέλετε να υπογράψετε';

  @override
  String get signPickPage => 'Επιλέξτε τη σελίδα για υπογραφή.';

  @override
  String get signDrawTitle => 'Ζωγράφισε την υπογραφή μου';

  @override
  String get signDrawBody =>
      'Σχεδιάστε με το δάχτυλό σας όπως σε χαρτί. Αυτό τοποθετεί ένα σχέδιο στη σελίδα — δεν είναι πιστοποιημένη ηλεκτρονική υπογραφή.';

  @override
  String get signNeedDrawing => 'Σχεδιάστε μια υπογραφή πριν συνεχίσετε.';

  @override
  String get signClear => 'Να σβήσει';

  @override
  String get signValidate => 'Για επικύρωση';

  @override
  String get signPlaceBody =>
      'Σύρετε την υπογραφή στην επιθυμητή θέση στη σελίδα και, στη συνέχεια, πατήστε Τέλος.';

  @override
  String get signPageUnavailable => 'Δεν είναι δυνατή η εμφάνιση της σελίδας.';

  @override
  String get signProgress => 'Προσθήκη υπογραφής…';

  @override
  String get editTitle => 'Σημειώστε ένα έγγραφο';

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
  String get editChooseOther => 'Επιλέξτε άλλο PDF';

  @override
  String get editUndoTooltip => 'Αναίρεση τελευταίου σχολιασμού';

  @override
  String get editModeText => 'Κείμενο';

  @override
  String get editModeHighlight => 'Αποκορύφωμα';

  @override
  String get editPageUnavailable =>
      'Δεν είναι δυνατή η εμφάνιση αυτής της σελίδας.';

  @override
  String get ocrEmptyTitle => 'Κάντε αναζήτηση κειμένου';

  @override
  String get ocrEmptyBody =>
      'Το κείμενο ενός σαρωμένου PDF αναγνωρίζεται και προστίθεται πάνω από την εικόνα, αόρατα. Η σελίδα δεν αλλάζει εμφάνιση.';

  @override
  String get ocrWrongFormat =>
      'Επιλέξτε ένα PDF ή μια εικόνα (JPG, PNG, κ.λπ.).';

  @override
  String get ocrProgress => 'Αναγνώριση σε εξέλιξη…';

  @override
  String ocrFailed(String detail) {
    return 'Αποτυχία αναγνώρισης: $detail';
  }

  @override
  String get ocrRunAction => 'Έναρξη αναγνώρισης';

  @override
  String get ocrResultTitle => 'Αποτέλεσμα OCR';

  @override
  String ocrResultBody(int count) {
    return 'Αναλύθηκαν $count σελίδες. Το PDF με δυνατότητα αναζήτησης είναι έτοιμο και μπορείτε επίσης να αντιγράψετε όλο το αναγνωρισμένο κείμενο.';
  }

  @override
  String get ocrCopyText => 'Αντιγραφή κειμένου';

  @override
  String get ocrTextCopied => 'Το κείμενο αντιγράφηκε.';

  @override
  String get redactIntro =>
      'Μόνιμη απόκρυψη περιοχών ενός PDF (ονόματα, διευθύνσεις, ποσά). Σε αντίθεση με ένα απλό μαύρο ορθογώνιο που τοποθετείται στην κορυφή, το κρυφό κείμενο διαγράφεται στην πραγματικότητα από το αρχείο, όχι απλώς καλύπτεται: δεν μπορεί πλέον να επιλεγεί ή να αντιγραφεί.';

  @override
  String get redactChooseSubtitle => 'Επιλέξτε το έγγραφο για διόρθωση';

  @override
  String get redactCaveat =>
      'Σημείωση: για να αφαιρέσετε το κρυφό κείμενο, κάθε σελίδα του εγγράφου μετατρέπεται σε εικόνα (200 ppi). Επομένως, το αποτέλεσμα δεν είναι πλέον ένα PDF από το οποίο μπορεί να επιλεγεί το κείμενο και το αρχείο που προκύπτει είναι γενικά βαρύτερο από το αρχικό.';

  @override
  String get redactEmptyPdf => 'Αυτό το PDF δεν περιέχει σελίδες.';

  @override
  String redactOpenFailed(String detail) {
    return 'Δεν είναι δυνατό το άνοιγμα αυτού του PDF (μπορεί να προστατεύεται με κωδικό πρόσβασης): $detail';
  }

  @override
  String redactPageRenderFailed(int number, String detail) {
    return 'Η σελίδα $number δεν μπορεί να εμφανιστεί: $detail';
  }

  @override
  String get redactUndoTooltip => 'Αναίρεση τελευταίας ζώνης';

  @override
  String get redactInstructions =>
      'Σύρετε το δάχτυλό σας κατά μήκος της σελίδας για να σχεδιάσετε μια περιοχή για απόκρυψη. Το καλυμμένο κείμενο θα αφαιρεθεί πραγματικά από το αρχείο, όχι απλώς θα καλύπτεται.';

  @override
  String get redactPagePrevious => 'Προηγούμενη σελίδα';

  @override
  String get redactPageNext => 'Επόμενη σελίδα';

  @override
  String redactPager(int current, int total) {
    return 'Σελίδα $current / $total';
  }

  @override
  String get redactNoZone => 'Χωρίς οικόπεδο';

  @override
  String redactZoneCount(int count) {
    return '$count περιοχές για απόκρυψη';
  }

  @override
  String get redactOtherPdf => 'Άλλο PDF';

  @override
  String get redactAction => 'Συντάσσω';

  @override
  String get redactProgress => 'Διασκευή σε εξέλιξη…';

  @override
  String get cropEmptyTitle => 'Κόψτε τα περιθώρια';

  @override
  String get cropEmptyBody =>
      'Επιλέξτε ένα PDF και, στη συνέχεια, σύρετε το δάχτυλό σας στην προεπισκόπηση για να περιγράψετε την περιοχή που θέλετε να διατηρήσετε.';

  @override
  String get cropTooSmall => 'Η επιλεγμένη περιοχή είναι πολύ μικρή.';

  @override
  String get cropProgress => 'Περικοπή σε εξέλιξη…';

  @override
  String cropFailed(String detail) {
    return 'Η περικοπή απέτυχε: $detail';
  }

  @override
  String get cropKeptArea => 'Διατηρητέα περιοχή';

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
  String get cropFullPage => 'Ολοσέλιδος';

  @override
  String get cropAllPages => 'Εφαρμογή σε όλες τις σελίδες';

  @override
  String get cropAllPagesOn => 'Η ίδια περιοχή αποκόπτεται σε κάθε σελίδα.';

  @override
  String get cropAllPagesOff =>
      'Μόνο η σελίδα 1 έχει περικοπεί, οι υπόλοιπες διατηρούνται ολόκληρες.';

  @override
  String get cropCaveat =>
      'Η περικοπή μειώνει το μέγεθος της σελίδας: περιεχόμενο εκτός της περιοχής δεν εμφανίζεται πλέον ούτε εκτυπώνεται.';

  @override
  String get cropAction => 'Καλλιέργεια';

  @override
  String get compareTitle => 'Συγκρίνετε δύο αρχεία PDF';

  @override
  String get compareEmptyTitle => 'Τι έχει αλλάξει';

  @override
  String get compareEmptyBody =>
      'Επιλέξτε δύο εκδόσεις του ίδιου PDF. Τα αποσπάσματα που προστέθηκαν και διαγράφηκαν θα τοποθετηθούν το ένα δίπλα στο άλλο, σελίδα προς σελίδα.';

  @override
  String get compareSlotA => 'Αρχείο Α';

  @override
  String get compareSlotB => 'Αρχείο Β';

  @override
  String get compareAction => 'Συγκρίνω';

  @override
  String get compareProgress => 'Σύγκριση σε εξέλιξη…';

  @override
  String compareFailed(String detail) {
    return 'Η σύγκριση απέτυχε: $detail';
  }

  @override
  String compareChangedPages(int changed, int total) {
    return '$changed σελίδες διαφέρουν σε $total';
  }

  @override
  String get compareNoDifference =>
      'Δεν εντοπίστηκαν διαφορές μεταξύ των δύο αρχείων.';

  @override
  String comparePageHeading(int number) {
    return 'Σελίδα $number';
  }

  @override
  String organizeFilesCreated(int count) {
    return 'Δημιουργήθηκαν $count αρχεία';
  }

  @override
  String organizePartTitle(int number) {
    return 'Μέρος $number';
  }
}
