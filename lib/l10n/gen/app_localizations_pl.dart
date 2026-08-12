// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Polish (`pl`).
class LPl extends L {
  LPl([String locale = 'pl']) : super(locale);

  @override
  String get appTitle => 'Trombone — PDF, skan i Word';

  @override
  String get appWordmark => 'Trombone';

  @override
  String get actionSave => 'Zapisz';

  @override
  String get actionShare => 'Udostępnij';

  @override
  String get actionCompress => 'Zmniejsz';

  @override
  String get actionDone => 'Gotowe';

  @override
  String get actionCancel => 'Anuluj';

  @override
  String get actionChange => 'Zmień';

  @override
  String get actionContinue => 'Dalej';

  @override
  String get actionOpening => 'Otwieranie…';

  @override
  String get actionRemoveFile => 'Usuń ten plik';

  @override
  String get progressPreparing => 'Przygotowywanie…';

  @override
  String progressPercent(int percent) {
    return '$percent%';
  }

  @override
  String get emptyReassurance =>
      'Eksport za darmo, bez znaku wodnego i bez limitu.';

  @override
  String get emptyAcceptedFormats => 'Obsługiwane formaty';

  @override
  String get exportSavedTitle => 'Zapisano.';

  @override
  String get exportSavedBody =>
      'Pod nazwą i w folderze, które właśnie wybrałeś. Bez znaku wodnego, bez limitu, nic do odblokowania.';

  @override
  String get exportSaveDialogTitle => 'Zapisz PDF';

  @override
  String pageTileIncluded(int number) {
    return 'Strona $number, uwzględniona. Dotknij, aby pominąć.';
  }

  @override
  String pageTileExcluded(int number) {
    return 'Strona $number, pominięta. Dotknij, aby uwzględnić.';
  }

  @override
  String pageTileRotate(int number) {
    return 'Obróć stronę $number';
  }

  @override
  String sectionHeaderSemantics(String title, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count narzędzia',
      many: '$count narzędzi',
      few: '$count narzędzia',
      one: '$count narzędzie',
    );
    return '$title, $_temp0';
  }

  @override
  String toolCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count narzędzia',
      many: '$count narzędzi',
      few: '$count narzędzia',
      one: '$count narzędzie',
    );
    return '$_temp0';
  }

  @override
  String get homePromise =>
      'Zrób swój dokument i wyeksportuj go.\nŻadnej ściany na końcu.';

  @override
  String get homeChipNoAccount => 'Bez konta';

  @override
  String get homeChipNoWatermark => 'Bez znaku wodnego';

  @override
  String get homeChipUnlimited => 'Eksport bez limitu';

  @override
  String get homeSearchTooltip => 'Szukaj narzędzia';

  @override
  String get homeColophon =>
      'Przy zapisywaniu nic nie odblokowuje się za opłatą. Eksport jest darmowy, bez znaku wodnego i bez ograniczenia liczby.';

  @override
  String get sectionFeatured => 'Polecane';

  @override
  String get sectionToPdf => 'Do PDF';

  @override
  String get sectionFromPdf => 'Z PDF';

  @override
  String get sectionSecurity => 'Bezpieczeństwo';

  @override
  String get sectionEdit => 'Edycja';

  @override
  String get toolMerge => 'Połącz';

  @override
  String get toolMergeKeywords => 'scal polacz zlacz zgrupuj dolacz zlozyc';

  @override
  String get toolMergeSubtitle =>
      'PDF, Word, obrazy i tekst w jednym dokumencie';

  @override
  String get toolRectoVerso => 'Dwustronnie';

  @override
  String get toolRectoVersoKeywords =>
      'duplex przeplot skan parzyste nieparzyste dwie strony';

  @override
  String get toolRectoVersoSubtitle => 'Dwa skany, znów po kolei';

  @override
  String get toolImagesToPdf => 'Obrazy na PDF';

  @override
  String get toolImagesToPdfKeywords =>
      'zdjecie jpg jpeg png zdjecia album aparat obraz';

  @override
  String get toolImagesToPdfSubtitle =>
      'Zdjęcia i zrzuty ekranu w jednym dokumencie';

  @override
  String get toolPdfToWord => 'PDF na Word';

  @override
  String get toolPdfToWordKeywords =>
      'docx edytor tekstu edytowalny konwertuj doc';

  @override
  String get toolPdfToWordSubtitle => 'Tekst i tabele, edytowalne';

  @override
  String get toolOrganize => 'Uporządkuj PDF';

  @override
  String get toolOrganizeKeywords =>
      'podziel rozdziel wyodrebnij zmien kolejnosc strony usun';

  @override
  String get toolOrganizeSubtitle => 'Dzielenie, wyodrębnianie, kolejność';

  @override
  String get toolExcelToPdf => 'Excel na PDF';

  @override
  String get toolExcelToPdfKeywords =>
      'arkusz kalkulacyjny xlsx skoroszyt arkusz';

  @override
  String get toolPptxToPdf => 'PowerPoint na PDF';

  @override
  String get toolPptxToPdfKeywords => 'pptx slajd prezentacja slides';

  @override
  String get toolHtmlToPdf => 'Strona WWW na PDF';

  @override
  String get toolHtmlToPdfKeywords => 'html witryna internet url link artykul';

  @override
  String get toolScan => 'Zeskanuj dokument';

  @override
  String get toolScanKeywords => 'aparat zdjecie digitalizuj skaner papier';

  @override
  String get toolPdfToExcel => 'PDF na Excel';

  @override
  String get toolPdfToExcelKeywords =>
      'arkusz kalkulacyjny xlsx tabela wyodrebnij dane';

  @override
  String get toolPdfToPptx => 'PDF na PowerPoint';

  @override
  String get toolPdfToPptxKeywords => 'pptx slajd prezentacja slides';

  @override
  String get toolPdfToImages => 'PDF na obrazy';

  @override
  String get toolPdfToImagesKeywords => 'jpg png zdjecie eksportuj zrzut obraz';

  @override
  String get toolOcr => 'Tekst wyszukiwalny (OCR)';

  @override
  String get toolOcrKeywords =>
      'rozpoznawanie znaki zeskanowany kopiuj zaznacz';

  @override
  String get toolPdfA => 'Konwertuj na PDF/A';

  @override
  String get toolPdfAKeywords =>
      'archiwizacja norma dlugoterminowe przechowywanie iso';

  @override
  String get toolProtect => 'Zabezpiecz PDF';

  @override
  String get toolProtectKeywords => 'haslo klodka szyfruj zablokuj zabezpiecz';

  @override
  String get toolUnlock => 'Odblokuj PDF';

  @override
  String get toolUnlockKeywords =>
      'usun haslo otworz odszyfruj odbezpiecz klodka';

  @override
  String get toolRepair => 'Napraw PDF';

  @override
  String get toolRepairKeywords =>
      'uszkodzony nieczytelny zepsuty odzyskaj blad';

  @override
  String get toolRedact => 'Zamaż PDF';

  @override
  String get toolRedactKeywords =>
      'ukryj zaczernij anonimizuj poufne usun cenzura';

  @override
  String get toolEdit => 'Edytuj PDF';

  @override
  String get toolEditKeywords => 'tekst zmien popraw dodaj notatke pisz';

  @override
  String get toolSign => 'Podpisz';

  @override
  String get toolSignKeywords => 'podpis parafa umowa reka';

  @override
  String get toolWatermark => 'Znak wodny';

  @override
  String get toolWatermarkKeywords =>
      'watermark pieczec poufne szkic oznaczenie';

  @override
  String get toolPageNumbers => 'Numery stron';

  @override
  String get toolPageNumbersKeywords =>
      'paginacja numeracja numeruj cyfry numery';

  @override
  String get toolCrop => 'Przytnij PDF';

  @override
  String get toolCropKeywords => 'przytnij marginesy kadruj krawedzie rozmiar';

  @override
  String get toolCompare => 'Porównaj PDF';

  @override
  String get toolCompareKeywords => 'roznica wersje diff zmiany porownaj';

  @override
  String get searchHint => 'Połącz, hasło, znak wodny…';

  @override
  String get searchClear => 'Wyczyść';

  @override
  String searchNoResultTitle(String query) {
    return 'Brak narzędzia dla „$query”.';
  }

  @override
  String get searchNoResultBody =>
      'Spróbuj podać format, który masz pod ręką — „Word”, „Excel”, „zdjęcie” — albo to, co chcesz z nim zrobić: „podpisz”, „podziel”, „hasło”.';

  @override
  String get actionUndo => 'Cofnij';

  @override
  String get actionApply => 'Zastosuj';

  @override
  String get actionChoose => 'Wybierz';

  @override
  String get actionChoosePdf => 'Wybierz PDF';

  @override
  String get actionChooseFiles => 'Wybierz pliki';

  @override
  String get actionConvert => 'Konwertuj';

  @override
  String get actionFinish => 'Zakończ';

  @override
  String get actionBack => 'Wstecz';

  @override
  String get actionAdd => 'Dodaj';

  @override
  String get noFileChosen => 'Nie wybrano pliku';

  @override
  String errorExportFailed(String detail) {
    return 'Eksport nie powiódł się: $detail';
  }

  @override
  String errorShareFailed(String detail) {
    return 'Udostępnianie nie powiodło się: $detail';
  }

  @override
  String errorOpenFailed(String detail) {
    return 'Nie udało się otworzyć pliku: $detail';
  }

  @override
  String errorConversionFailed(String detail) {
    return 'Konwersja nie powiodła się: $detail';
  }

  @override
  String errorOnFile(String name, String detail) {
    return '$name: $detail';
  }

  @override
  String get errorPickPdf => 'Wybierz plik PDF.';

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
      other: '$count strony',
      many: '$count stron',
      few: '$count strony',
      one: '$count strona',
    );
    return '$_temp0';
  }

  @override
  String pageCountOfTotal(int kept, int total) {
    String _temp0 = intl.Intl.pluralLogic(
      kept,
      locale: localeName,
      other: '$kept strony',
      many: '$kept stron',
      few: '$kept strony',
      one: '$kept strona',
    );
    return '$_temp0 z $total';
  }

  @override
  String pageOfTotal(int current, int total) {
    return 'Strona $current z $total';
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
  String get formatImages => 'Obrazy';

  @override
  String get formatText => 'Tekst';

  @override
  String get mergeAddFile => 'Dodaj plik';

  @override
  String get mergeAddHint => 'PDF, Word, obrazy lub tekst';

  @override
  String get mergeEmptyTitle => 'Jeden dokument';

  @override
  String get mergeEmptyBody =>
      'Dodaj pliki PDF, Word, obrazy lub tekst. Przed eksportem będzie można zmienić ich kolejność i pominąć strony.';

  @override
  String get mergeNeedOnePage =>
      'Dodaj przynajmniej jeden plik ze stroną do uwzględnienia.';

  @override
  String get mergeProgress => 'Łączenie…';

  @override
  String mergeFailed(String detail) {
    return 'Łączenie nie powiodło się: $detail';
  }

  @override
  String mergeRemoved(String name) {
    return 'Usunięto $name.';
  }

  @override
  String mergeRemoveTooltip(String name) {
    return 'Usuń $name';
  }

  @override
  String mergeMoveSemantics(String name) {
    return 'Przenieś $name';
  }

  @override
  String get mergeRotateAll => 'Obróć wszystkie strony';

  @override
  String mergePreviewAndExport(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count strony',
      many: '$count stron',
      few: '$count strony',
      one: '$count strona',
    );
    return 'Podgląd i eksport ($_temp0)';
  }

  @override
  String previewTitle(String size) {
    return 'Podgląd · $size';
  }

  @override
  String previewZoomPage(int number) {
    return 'Strona $number, powiększ';
  }

  @override
  String get previewPageUnreadable => 'Strona nieczytelna.';

  @override
  String previewExportWhat(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count strony',
      many: '$count stron',
      few: '$count strony',
      one: '$count strona',
    );
    return 'PDF · $_temp0';
  }

  @override
  String get compressTitle => 'Zmniejszanie';

  @override
  String compressBody(String size) {
    return 'Obecny rozmiar: $size. Wybierz poziom — szacowany rozmiar pojawi się przed zastosowaniem.';
  }

  @override
  String get compressEstimating => 'Szacowanie…';

  @override
  String get compressProgress => 'Zmniejszanie…';

  @override
  String compressFailed(String detail) {
    return 'Zmniejszanie nie powiodło się: $detail';
  }

  @override
  String get protectEmptyTitle => 'Zabezpiecz hasłem';

  @override
  String get protectEmptyBody =>
      'PDF nie otworzy się już bez hasła, które wybierzesz. Zachowaj je: nie da się go odzyskać.';

  @override
  String get protectSubtitle => 'Zostanie zaszyfrowany algorytmem AES 256-bit';

  @override
  String get protectPassword => 'Hasło';

  @override
  String get protectConfirmPassword => 'Potwierdź hasło';

  @override
  String get protectShowPasswords => 'Pokaż hasła';

  @override
  String get protectHidePasswords => 'Ukryj hasła';

  @override
  String get protectMismatch => 'Hasła się różnią.';

  @override
  String get protectWarning =>
      'Zapisz je gdzieś: bez niego dokument stanie się nieczytelny na zawsze. Odzyskanie nie jest możliwe — ani przez Ciebie, ani przez aplikację.';

  @override
  String get protectAlreadyProtected =>
      'Ten plik jest już zabezpieczony — użyj najpierw Odblokuj PDF.';

  @override
  String get protectProgress => 'Zabezpieczanie…';

  @override
  String protectFailed(String detail) {
    return 'Zabezpieczanie nie powiodło się: $detail';
  }

  @override
  String get protectAction => 'Zabezpiecz';

  @override
  String get protectResultTitle => 'PDF zabezpieczony';

  @override
  String get protectResultDetail =>
      'Zaszyfrowany algorytmem AES 256-bit. Do otwarcia potrzebne będzie hasło.';

  @override
  String get protectExportWhat => 'PDF zabezpieczony hasłem';

  @override
  String get unlockEmptyTitle => 'Usuń hasło';

  @override
  String get unlockEmptyBody =>
      'Potrzebujesz obecnego hasła dokumentu. Po jego usunięciu PDF będzie się otwierał bez przeszkód.';

  @override
  String get unlockAcceptsProtectedPdf => 'Zabezpieczony PDF';

  @override
  String get unlockChooseProtectedPdf => 'Wybierz zabezpieczony PDF';

  @override
  String get unlockCurrentPassword => 'Obecne hasło';

  @override
  String get unlockWrongPassword => 'Nieprawidłowe hasło.';

  @override
  String get unlockProgress => 'Odblokowywanie…';

  @override
  String unlockFailed(String detail) {
    return 'Odblokowanie nie powiodło się: $detail';
  }

  @override
  String get unlockAction => 'Odblokuj';

  @override
  String get repairEmptyTitle => 'Napraw uszkodzony plik';

  @override
  String get repairEmptyBody =>
      'Wewnętrzna struktura uszkodzonego PDF zostaje odtworzona. To, co da się odzyskać, zostanie odzyskane.';

  @override
  String get repairProgress => 'Naprawianie…';

  @override
  String get repairFailed =>
      'Nie da się naprawić tego pliku — może być zbyt uszkodzony.';

  @override
  String get repairAction => 'Napraw';

  @override
  String get pdfToWordEmptyTitle => 'Edytowalny plik Word';

  @override
  String get pdfToWordEmptyBody =>
      'Tekst i struktura PDF zostają przeniesione do dokumentu .docx, który będzie można ponownie otworzyć i poprawić.';

  @override
  String get pdfToWordAnalyzing => 'Analiza dokumentu…';

  @override
  String get pdfToWordAnalysisPending => 'Analiza oczekuje';

  @override
  String pdfToWordAnalysisFailed(String detail) {
    return 'Analiza nie powiodła się: $detail';
  }

  @override
  String get pdfLocked =>
      'Ten PDF jest zabezpieczony hasłem. Najpierw go odblokuj.';

  @override
  String get pdfToWordConverting => 'Konwersja do Worda…';

  @override
  String get pdfToWordSummaryTitle => 'Wykryta zawartość';

  @override
  String pdfToWordParagraphCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count akapitu',
      many: '$count akapitów',
      few: '$count akapity',
      one: '$count akapit',
    );
    return '$_temp0';
  }

  @override
  String pdfToWordHeadingCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count nagłówka',
      many: '$count nagłówków',
      few: '$count nagłówki',
      one: '$count nagłówek',
    );
    return '$_temp0';
  }

  @override
  String pdfToWordTableCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count tabeli',
      many: '$count tabel',
      few: '$count tabele',
      one: '$count tabela',
    );
    return '$_temp0';
  }

  @override
  String get pdfToWordNoTables =>
      'Nie wykryto żadnej tabeli: jeśli Twój PDF jakąś zawiera, jej wiersze zostaną zamienione na akapity.';

  @override
  String get pdfToWordCaveat =>
      'Konwersja odtwarza tekst, formatowanie i tabele, ale nie dokładny układ: położenie obrazów i kolumn nie zostaje zachowane, a obrazy nie trafiają do dokumentu Word.';

  @override
  String get pdfToWordScanWarning =>
      'Ten PDF wygląda na skan: nie znaleziono żadnego tekstu. Użyj najpierw narzędzia Tekst wyszukiwalny (OCR), a potem wróć i przekonwertuj otrzymany PDF.';

  @override
  String get pdfToWordResultTitle => 'Dokument Word gotowy';

  @override
  String pdfToWordResultDetail(String name, String size) {
    return '$name — $size';
  }

  @override
  String get pdfToWordExportWhat => 'Dokument Word';

  @override
  String get pdfToWordConvertAction => 'Konwertuj do Worda';

  @override
  String get actionConvertAgain => 'Konwertuj ponownie';

  @override
  String errorSaveFailed(String detail) {
    return 'Nie udało się zapisać: $detail';
  }

  @override
  String get rectoVersoIntro =>
      'Podajnik jednostronny daje dwa pliki: strony nieparzyste po kolei, a parzyste często w odwrotnej kolejności. Wybierz oba, aby je złożyć z powrotem.';

  @override
  String get rectoVersoOddSlot => 'Plik ze stronami nieparzystymi (awers)';

  @override
  String get rectoVersoEvenSlot => 'Plik ze stronami parzystymi (rewers)';

  @override
  String get rectoVersoReversed => 'Drugi plik jest w odwrotnej kolejności';

  @override
  String get rectoVersoReversedHint =>
      'To najczęstszy przypadek, dlatego zaznaczone domyślnie';

  @override
  String rectoVersoPreview(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count strony',
      many: '$count stron',
      few: '$count strony',
      one: '$count strona',
    );
    return 'Podgląd przeplotu ($_temp0)';
  }

  @override
  String get rectoVersoProgress => 'Przeplatanie…';

  @override
  String fileWithPageCount(String name, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count strony',
      many: '$count stron',
      few: '$count strony',
      one: '$count strona',
    );
    return '$name · $_temp0';
  }

  @override
  String get actionPreviewAndExport => 'Podgląd i eksport';

  @override
  String errorOpenFailedShort(String detail) {
    return 'Nie udało się otworzyć: $detail';
  }

  @override
  String errorGeneric(String detail) {
    return 'Niepowodzenie: $detail';
  }

  @override
  String get actionConvertToPdf => 'Konwertuj na PDF';

  @override
  String get convertProgress => 'Konwersja…';

  @override
  String get excelEmptyTitle => 'Skoroszyt jako PDF';

  @override
  String get excelEmptyBody =>
      'Arkusze pliku .xlsx stają się stronami PDF, gotowymi do wysłania lub wydruku.';

  @override
  String get excelChooseWorkbook => 'Wybierz skoroszyt';

  @override
  String get excelChooseXlsx => 'Wybierz skoroszyt .xlsx';

  @override
  String get excelLegacyFormat =>
      'Format .xls (stary binarny format Excela) nie jest obsługiwany. Zapisz plik jako .xlsx i spróbuj ponownie.';

  @override
  String get excelWrongFormat => 'Wybierz skoroszyt Excela w formacie .xlsx.';

  @override
  String excelUnreadable(String detail) {
    return 'Skoroszyt nieczytelny: $detail';
  }

  @override
  String excelSheetsAndRows(int sheets, int rows) {
    String _temp0 = intl.Intl.pluralLogic(
      sheets,
      locale: localeName,
      other: '$sheets arkusza',
      many: '$sheets arkuszy',
      few: '$sheets arkusze',
      one: '$sheets arkusz',
    );
    String _temp1 = intl.Intl.pluralLogic(
      rows,
      locale: localeName,
      other: '$rows wiersza łącznie',
      many: '$rows wierszy łącznie',
      few: '$rows wiersze łącznie',
      one: '$rows wiersz łącznie',
    );
    return '$_temp0 · $_temp1';
  }

  @override
  String get excelSheetsDetected => 'Wykryte arkusze';

  @override
  String get excelEmptySheet => 'Pusty arkusz';

  @override
  String excelSheetDimensions(int rows, int columns) {
    String _temp0 = intl.Intl.pluralLogic(
      rows,
      locale: localeName,
      other: '$rows wiersza',
      many: '$rows wierszy',
      few: '$rows wiersze',
      one: '$rows wiersz',
    );
    String _temp1 = intl.Intl.pluralLogic(
      columns,
      locale: localeName,
      other: '$columns kolumny',
      many: '$columns kolumn',
      few: '$columns kolumny',
      one: '$columns kolumna',
    );
    return '$_temp0 × $_temp1';
  }

  @override
  String get excelRepeatHeader => 'Powtarzaj wiersz nagłówka na każdej stronie';

  @override
  String get excelRepeatHeaderHint =>
      'Pierwszy wiersz arkusza jest rysowany ponownie u góry każdej strony tabeli.';

  @override
  String get excelCaveat =>
      'Co konwersja przenosi: tekst komórek w postaci zapisanej w pliku (łącznie z ostatnim obliczonym wynikiem formuł), pierwszy wiersz pogrubiony i siatkę.\n\nCzego nie przenosi: kolorów, czcionek, formatów liczb, komórek scalonych, obrazów, wykresów ani samych formuł. Kolumny są zwężane, aby zmieściły się na szerokości strony; w bardzo szerokich arkuszach tekst zbyt wąskich komórek zostaje ucięty znakiem „…”.';

  @override
  String get pptxEmptyTitle => 'Prezentacja jako PDF';

  @override
  String get pptxEmptyBody =>
      'Jedna pozioma strona 16:9 na slajd, z tytułem i punktami. Tekst zostaje przeniesiony; pierwotne obrazy, kształty i tła nie.\n\nObsługiwany format: .pptx. Starszy plik .ppt trzeba najpierw zapisać jako .pptx w PowerPoincie.';

  @override
  String get pptxChoosePresentation => 'Wybierz prezentację';

  @override
  String get pptxTextOnlyTitle => 'Konwersja samego tekstu';

  @override
  String get pptxTextOnlyBody =>
      'Tekst każdego slajdu zostaje przeniesiony. Pierwotne obrazy, kształty, tła, kolory i układy nie są zachowane: otrzymany PDF to prosty, czytelny układ, a nie wierna kopia Twojej prezentacji.';

  @override
  String pptxSlideCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count slajdu',
      many: '$count slajdów',
      few: '$count slajdy',
      one: '$count slajd',
    );
    return '$_temp0';
  }

  @override
  String get pptxSlidesDetected => 'Wykryte slajdy';

  @override
  String pptxMoreSlides(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count slajdu',
      many: '$count slajdów',
      few: '$count slajdy',
      one: '$count slajd',
    );
    return 'i jeszcze $_temp0…';
  }

  @override
  String get pptxUntitledSlide => 'Bez tytułu';

  @override
  String get pptxEmptySlide => 'Brak tekstu (tylko obraz lub kształt)';

  @override
  String pptxTextLineCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count wiersza tekstu',
      many: '$count wierszy tekstu',
      few: '$count wiersze tekstu',
      one: '$count wiersz tekstu',
    );
    return '$_temp0';
  }

  @override
  String pptxReadFailed(String detail) {
    return 'Nie udało się odczytać: $detail';
  }

  @override
  String get compressLevelLight => 'Lekkie';

  @override
  String get compressLevelMedium => 'Średnie';

  @override
  String get compressLevelStrong => 'Mocne';

  @override
  String get pptxQualityStandard => 'Standardowa (150 dpi)';

  @override
  String get pptxQualityHigh => 'Wysoka (220 dpi)';

  @override
  String get pdfToExcelEmptyTitle => 'Odzyskaj tabele';

  @override
  String get pdfToExcelEmptyBody =>
      'Tabele z PDF zostają wyodrębnione do skoroszytu Excela. Formatowanie nie zostaje zachowane, wartości tak.';

  @override
  String pdfToExcelPagesAnalyzed(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'przeanalizowano $count strony',
      many: 'przeanalizowano $count stron',
      few: 'przeanalizowano $count strony',
      one: 'przeanalizowano $count stronę',
    );
    return '$_temp0';
  }

  @override
  String pdfToExcelAnalysisFailed(String detail) {
    return 'Analiza niemożliwa. PDF może być zabezpieczony hasłem lub uszkodzony. ($detail)';
  }

  @override
  String get pdfToExcelNothingToExport =>
      'Nie ma czego eksportować: nie wykryto żadnej tabeli.';

  @override
  String get pdfToExcelBuilding => 'Tworzenie skoroszytu…';

  @override
  String get pdfToExcelIncludeParagraphs =>
      'Uwzględnij też tekst spoza tabel (jeden wiersz na akapit)';

  @override
  String get pdfToExcelIncludeParagraphsHint =>
      'Przydatne przy dokumencie półstrukturalnym: tekst trafia do kolumny A, po tabelach danej strony.';

  @override
  String get pdfToExcelCaveatTitle => 'Czego konwersja nie zachowuje';

  @override
  String get pdfToExcelCaveat =>
      'Wykrywanie opiera się na położeniu tekstu na stronie: tabele bez regularnych obramowań, komórki scalone i bardzo nieregularne kolumny mogą zostać źle podzielone. Zeskanowany PDF (obraz) nie zawiera tekstu do odczytania i nic nie da. Kolory, formuły i obrazy nigdy nie są przenoszone: tylko wartości tekstowe.';

  @override
  String pdfToExcelTablesFound(int tables, int pages) {
    String _temp0 = intl.Intl.pluralLogic(
      tables,
      locale: localeName,
      other: 'wykryto $tables tabeli',
      many: 'wykryto $tables tabel',
      few: 'wykryto $tables tabele',
      one: 'wykryto $tables tabelę',
    );
    String _temp1 = intl.Intl.pluralLogic(
      pages,
      locale: localeName,
      other: '$pages stronach',
      many: '$pages stronach',
      few: '$pages stronach',
      one: '$pages stronie',
    );
    return '$_temp0 na $_temp1';
  }

  @override
  String pdfToExcelPagesConcerned(String pages) {
    return 'Strony, których to dotyczy: $pages';
  }

  @override
  String pdfToExcelParagraphsOutside(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count akapitu poza tabelami',
      many: '$count akapitów poza tabelami',
      few: '$count akapity poza tabelami',
      one: '$count akapit poza tabelami',
    );
    return '$_temp0';
  }

  @override
  String get pdfToExcelScannedWarning =>
      'Z tego PDF nie dało się wyodrębnić żadnego tekstu: to niemal na pewno dokument zeskanowany (obrazy stron). Arkusz kalkulacyjny nic z tego nie wyciągnie; użyj najpierw narzędzia do rozpoznawania tekstu (OCR).';

  @override
  String get pdfToExcelNoTableWarning =>
      'W tym dokumencie nie rozpoznano żadnej struktury tabeli. Tekst tam jest, ale nie układa się w regularne kolumny. Zamiast tworzyć nieczytelny skoroszyt, włącz powyżej „Uwzględnij też tekst spoza tabel” albo użyj „PDF na Word”, który lepiej zachowuje akapity.';

  @override
  String get pdfToExcelResultTitle => 'Skoroszyt gotowy';

  @override
  String get pdfToExcelExportWhat => 'Skoroszyt Excela';

  @override
  String get pdfToExcelConvertAction => 'Konwertuj do Excela';

  @override
  String resultNameAndSize(String name, String size) {
    return '$name — $size';
  }

  @override
  String get pdfToPptxEmptyTitle => 'Jeden slajd na stronę';

  @override
  String get pdfToPptxEmptyBody =>
      'PDF staje się identyczną prezentacją PowerPoint. Każda strona trafia tam jako obraz: układ jest wierny, ale tekstu nie da się edytować w PowerPoincie.';

  @override
  String pdfToPptxOpenFailed(String detail) {
    return 'Nie udało się otworzyć tego PDF: $detail';
  }

  @override
  String get pdfToPptxConverting => 'Konwersja do PowerPointa…';

  @override
  String pdfToPptxPagesToSlides(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count strony',
      many: '$count stron',
      few: '$count strony',
      one: '$count strona',
    );
    String _temp1 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count slajdu',
      many: '$count slajdów',
      few: '$count slajdy',
      one: '$count slajd',
    );
    return '$_temp0 > $_temp1';
  }

  @override
  String get pdfToPptxEmptyDocument => 'Pusty dokument';

  @override
  String get qualityLabel => 'Jakość';

  @override
  String get pdfToPptxQualityHint =>
      'Wyższa rozdzielczość daje ostrzejsze slajdy, ale wyraźnie cięższy plik.';

  @override
  String pdfToPptxHeavyWarning(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count strony',
      many: '$count stron',
      few: '$count strony',
      one: '$count stronę',
    );
    return 'Uwaga: w wysokiej jakości prezentacja licząca $_temp0 może ważyć kilkadziesiąt MB i długo się otwierać. W razie wątpliwości wybierz Standardową.';
  }

  @override
  String get goodToKnow => 'Warto wiedzieć';

  @override
  String get pdfToPptxCaveat =>
      'Każdy slajd jest obrazem strony: układ jest identyczny jak w PDF, ale tekstu nie da się edytować w PowerPoincie.\nAby odzyskać edytowalny tekst, użyj raczej „PDF na Word”.\nPrezentacja ma tylko jeden rozmiar slajdu: jest brany z pierwszej strony, a strony o innym rozmiarze są w nim wyśrodkowane.';

  @override
  String get pdfToPptxResultTitle => 'Prezentacja gotowa';

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
      other: '$count slajdu',
      many: '$count slajdów',
      few: '$count slajdy',
      one: '$count slajd',
    );
    return '$name — $_temp0 · $size · $quality';
  }

  @override
  String get notSavedYet =>
      'Pliku jeszcze nie ma na Twoim urządzeniu: zapisz go lub udostępnij.';

  @override
  String get pdfToPptxChangeQuality => 'Zmień jakość';

  @override
  String get pdfToPptxConvertAction => 'Konwertuj do PowerPointa';

  @override
  String pdfToPptxExportWhat(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count slajdu',
      many: '$count slajdów',
      few: '$count slajdy',
      one: '$count slajd',
    );
    return 'Prezentacja PowerPoint · $_temp0';
  }

  @override
  String get formatLabel => 'Format';

  @override
  String get actionExport => 'Eksportuj';

  @override
  String get imageQualityWeb => 'Web (72 dpi)';

  @override
  String get imageQualityStandard => 'Standardowa (150 dpi)';

  @override
  String get imageQualityHigh => 'Wysoka jakość (300 dpi)';

  @override
  String get pdfToImagesEmptyTitle => 'Jeden obraz na stronę';

  @override
  String get pdfToImagesEmptyBody =>
      'Wybierz PDF: każda strona wyjdzie jako obraz, w rozdzielczości, którą ustawisz w następnym kroku.';

  @override
  String pdfToImagesNotAPdf(String name) {
    return '$name: wybierz plik PDF.';
  }

  @override
  String errorLoadFailed(String detail) {
    return 'Wczytywanie nie powiodło się: $detail';
  }

  @override
  String get pdfToImagesProgress => 'Eksportowanie…';

  @override
  String pdfToImagesExportWhat(int count, String format) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count obrazu $format',
      many: '$count obrazów $format',
      few: '$count obrazy $format',
      one: '$count obraz $format',
    );
    return '$_temp0';
  }

  @override
  String get pdfaEmptyTitle => 'Archiwizuj na długo';

  @override
  String get pdfaEmptyBody =>
      'PDF/A to format archiwalny wymagany przez wiele urzędów. Dokument zostaje przekonwertowany bez utraty wyglądu.';

  @override
  String get pdfaConformanceLevel => 'Poziom zgodności';

  @override
  String get pdfaA1bDetail =>
      'Najbardziej rygorystyczny i najpowszechniej akceptowany poziom. Wybierz go w razie wątpliwości.';

  @override
  String get pdfaA2bDetail =>
      'Oparty na PDF 1.7: skuteczniejsza kompresja, nieco lżejsze pliki.';

  @override
  String get pdfaA3bDetail =>
      'Jak A-2b, ale dopuszcza załączniki (często wymagane przy fakturowaniu elektronicznym).';

  @override
  String pdfaConvertingTo(String level) {
    return 'Konwersja na $level…';
  }

  @override
  String get pdfaCaveatTitle => 'Co zmienia konwersja';

  @override
  String pdfaCaveat(int dpi) {
    return 'Każda strona zostaje narysowana od nowa jako obraz w $dpi dpi: tekst staje się obrazem, a układ zostaje utrwalony. Właśnie to sprawia, że plik jest naprawdę zgodny bez zależności od czcionek oryginalnego dokumentu, ale w zamian tekstu nie da się już zaznaczyć ani przeszukać, znikają odnośniki i formularze, a plik staje się cięższy.';
  }

  @override
  String pdfaOpenFailed(String detail) {
    return 'Nie udało się otworzyć tego PDF: $detail';
  }

  @override
  String get imagesToPdfEmptyTitle => 'Obrazy w jednym PDF';

  @override
  String get imagesToPdfEmptyBody =>
      'JPG, PNG, WebP, HEIC — dodaj swoje obrazy, a zostaną złożone w kolejności, którą wybierzesz.';

  @override
  String get imagesToPdfChoose => 'Wybierz obrazy';

  @override
  String get imagesToPdfAdd => 'Dodaj obrazy';

  @override
  String imagesToPdfRejected(String names) {
    return 'Pominięto (to nie obraz): $names';
  }

  @override
  String get imagesToPdfBuilding => 'Tworzenie PDF…';

  @override
  String imagesToPdfBuildFailed(String detail) {
    return 'Tworzenie nie powiodło się: $detail';
  }

  @override
  String imagesToPdfCreateAction(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count obrazu',
      many: '$count obrazów',
      few: '$count obrazy',
      one: '$count obraz',
    );
    return 'Utwórz PDF ($_temp0)';
  }

  @override
  String get actionRotate => 'Obróć';

  @override
  String get actionRemove => 'Usuń';

  @override
  String get htmlTitle => 'HTML / strona WWW na PDF';

  @override
  String get htmlIntro =>
      'Zamień stronę WWW albo kod HTML na PDF w formacie A4. Renderowaniem zajmuje się przeglądarka wbudowana w Androida, więc układ jest taki jak przy druku z Chrome.';

  @override
  String get htmlModeUrl => 'Adres WWW';

  @override
  String get htmlModeCode => 'Kod HTML';

  @override
  String get htmlUrlLabel => 'Adres strony';

  @override
  String get htmlUrlHint => 'https://przyklad.pl/artykul';

  @override
  String get htmlCodeLabel => 'Kod HTML';

  @override
  String get htmlCodeHint => '<h1>Tytuł</h1>\n<p>Tekst…</p>';

  @override
  String get htmlUrlBadScheme =>
      'Adres musi zaczynać się od http:// lub https://.';

  @override
  String get htmlUrlIncomplete => 'Wpisz pełny adres WWW.';

  @override
  String get htmlCodeEmpty => 'Wklej kod HTML do konwersji.';

  @override
  String get htmlLoadingUrl => 'Wczytywanie strony i konwersja…';

  @override
  String get htmlConverting => 'Konwersja HTML…';

  @override
  String get htmlNetworkNotice =>
      'Potrzebne jest połączenie z internetem: to jedyne narzędzie w aplikacji, które musi pobrać stronę. Strony wymagające logowania, baneru cookies albo dużej ilości JavaScriptu mogą wyjść niekompletne.';

  @override
  String get htmlOfflineNotice =>
      'HTML i CSS zapisane bezpośrednio na stronie są renderowane bez połączenia. Natomiast obrazy, arkusze stylów czy czcionki pobierane z zewnętrznego adresu wymagają połączenia z internetem.';

  @override
  String get watermarkEmptyTitle => 'Nałóż znak wodny';

  @override
  String get watermarkEmptyBody =>
      'Wybrany przez Ciebie tekst powtarza się w tle na wszystkich stronach — aby oznaczyć dokument jako poufny albo jako szkic.';

  @override
  String get watermarkEmptyNote =>
      'Eksport za darmo i bez ograniczenia liczby.';

  @override
  String get watermarkTextLabel => 'Tekst znaku wodnego';

  @override
  String get watermarkDefaultText => 'POUFNE';

  @override
  String get watermarkNeedText => 'Wpisz tekst znaku wodnego.';

  @override
  String watermarkOpacity(int percent) {
    return 'Krycie: $percent%';
  }

  @override
  String watermarkRotation(int degrees) {
    return 'Kąt obrotu: $degrees°';
  }

  @override
  String watermarkFontSize(int points) {
    return 'Wielkość tekstu: $points pt';
  }

  @override
  String get watermarkColor => 'Kolor';

  @override
  String get colorGrey => 'Szary';

  @override
  String get colorRed => 'Czerwony';

  @override
  String get colorBlue => 'Niebieski';

  @override
  String get colorBlack => 'Czarny';

  @override
  String get watermarkProgress => 'Nakładanie znaku wodnego…';

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
  String get pageNumbersEmptyTitle => 'Ponumeruj strony';

  @override
  String get pageNumbersEmptyBody =>
      'Wybierz PDF, a potem położenie i postać numerów, które trafią na każdą stronę.';

  @override
  String get positionLabel => 'Położenie';

  @override
  String get positionBottomCenter => 'Dół, środek';

  @override
  String get positionBottomRight => 'Dół, prawo';

  @override
  String get positionTopCenter => 'Góra, środek';

  @override
  String get positionTopRight => 'Góra, prawo';

  @override
  String get pageNumbersFormatPlain => 'N';

  @override
  String get pageNumbersFormatOfTotal => 'N / razem';

  @override
  String get pageNumbersStart => 'Numer początkowy';

  @override
  String get pageNumbersProgress => 'Numerowanie…';

  @override
  String get organizeEmptyTitle => 'Weź PDF z powrotem w swoje ręce';

  @override
  String get organizeEmptyBody =>
      'Otwórz dokument, aby go podzielić, wyodrębnić z niego strony albo zmienić ich kolejność.';

  @override
  String get organizeOpenFile => 'Otwórz plik';

  @override
  String get organizeNothingToExport => 'Brak strony do wyeksportowania.';

  @override
  String organizePagesKept(int kept, int total) {
    String _temp0 = intl.Intl.pluralLogic(
      kept,
      locale: localeName,
      other: 'zachowano $kept strony',
      many: 'zachowano $kept stron',
      few: 'zachowano $kept strony',
      one: 'zachowano $kept stronę',
    );
    return '$_temp0 z $total';
  }

  @override
  String get organizePageExcluded => 'Pominięta';

  @override
  String organizePageMoved(int from) {
    return 'Przeniesiona z pozycji $from';
  }

  @override
  String organizePageTitle(int number) {
    return 'Strona $number';
  }

  @override
  String organizeExcludePage(int number) {
    return 'Pomiń stronę $number';
  }

  @override
  String organizeIncludePage(int number) {
    return 'Uwzględnij stronę $number';
  }

  @override
  String organizeMovePage(int number) {
    return 'Przenieś stronę $number';
  }

  @override
  String get organizeExtract => 'Wyodrębnij';

  @override
  String get organizeSplit => 'Podziel';

  @override
  String get organizePreview => 'Podgląd';

  @override
  String get organizeExtractTitle => 'Wyodrębnij zakres stron';

  @override
  String organizeRangeLabel(int start, int end) {
    return 'Strony od $start do $end';
  }

  @override
  String get organizeSplitTitle => 'Podziel na kilka plików';

  @override
  String organizeFileCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count pliku',
      many: '$count plików',
      few: '$count pliki',
      one: '$count plik',
    );
    return '$_temp0';
  }

  @override
  String organizeSplitFailed(String detail) {
    return 'Podział nie powiódł się: $detail';
  }

  @override
  String get scanNoCamera => 'Na tym urządzeniu nie ma dostępnego aparatu.';

  @override
  String scanCameraFailed(String detail) {
    return 'Nie udało się uruchomić aparatu: $detail';
  }

  @override
  String get scanCropToolbar => 'Dopasuj';

  @override
  String scanCaptureFailed(String detail) {
    return 'Zdjęcie nie powiodło się: $detail';
  }

  @override
  String get scanPermissionBody =>
      'Do zeskanowania dokumentu potrzebny jest dostęp do aparatu.';

  @override
  String get scanGrantPermission => 'Zezwól na aparat';

  @override
  String get actionRetry => 'Spróbuj ponownie';

  @override
  String get scanNoPageYet => 'Jeszcze żadnej strony.';

  @override
  String scanFinishAction(int count) {
    return 'Zakończ · $count';
  }

  @override
  String get signTitle => 'Podpisz PDF';

  @override
  String get signIntro =>
      'Złóż odręcznie narysowany podpis na stronie PDF. To zwykły rysunek dodany do dokumentu, a nie kwalifikowany podpis elektroniczny.';

  @override
  String get signChooseSubtitle => 'Wybierz dokument do podpisania';

  @override
  String get signPickPage => 'Wybierz stronę do podpisania.';

  @override
  String get signDrawTitle => 'Narysuj mój podpis';

  @override
  String get signDrawBody =>
      'Rysuj palcem jak na papierze. To umieszcza rysunek na stronie — nie jest to kwalifikowany podpis elektroniczny.';

  @override
  String get signNeedDrawing => 'Narysuj podpis, zanim przejdziesz dalej.';

  @override
  String get signClear => 'Wyczyść';

  @override
  String get signValidate => 'Zatwierdź';

  @override
  String get signPlaceBody =>
      'Przeciągnij podpis w wybrane miejsce na stronie, a potem dotknij Zakończ.';

  @override
  String get signPageUnavailable => 'Nie udało się wyświetlić strony.';

  @override
  String get signProgress => 'Dodawanie podpisu…';

  @override
  String get editTitle => 'Dodaj notatki do dokumentu';

  @override
  String get editEmptyBody =>
      'Dodawaj tekst albo zaznaczaj fragmenty bezpośrednio na istniejącym PDF.';

  @override
  String get editAddTextTitle => 'Dodaj tekst';

  @override
  String get editTextHint => 'Twój tekst';

  @override
  String editFontSize(int size) {
    return 'Wielkość tekstu: $size';
  }

  @override
  String get editNeedAnnotation =>
      'Dodaj przynajmniej jedną notatkę, zanim zakończysz.';

  @override
  String get editProgress => 'Stosowanie notatek…';

  @override
  String get editChooseOther => 'Wybierz inny PDF';

  @override
  String get editUndoTooltip => 'Cofnij ostatnią notatkę';

  @override
  String get editModeText => 'Tekst';

  @override
  String get editModeHighlight => 'Zakreśl';

  @override
  String get editPageUnavailable => 'Nie udało się wyświetlić tej strony.';

  @override
  String get ocrEmptyTitle => 'Uczyń tekst wyszukiwalnym';

  @override
  String get ocrEmptyBody =>
      'Tekst zeskanowanego PDF zostaje rozpoznany i nałożony na obraz w sposób niewidoczny. Wygląd strony się nie zmienia.';

  @override
  String get ocrWrongFormat => 'Wybierz PDF albo obraz (JPG, PNG…).';

  @override
  String get ocrProgress => 'Rozpoznawanie…';

  @override
  String ocrFailed(String detail) {
    return 'Rozpoznawanie nie powiodło się: $detail';
  }

  @override
  String get ocrRunAction => 'Uruchom rozpoznawanie';

  @override
  String get ocrResultTitle => 'Wynik OCR';

  @override
  String ocrResultBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Przeanalizowano $count strony',
      many: 'Przeanalizowano $count stron',
      few: 'Przeanalizowano $count strony',
      one: 'Przeanalizowano $count stronę',
    );
    return '$_temp0. Wyszukiwalny PDF jest gotowy, a cały rozpoznany tekst możesz też skopiować.';
  }

  @override
  String get ocrCopyText => 'Kopiuj tekst';

  @override
  String get ocrTextCopied => 'Skopiowano tekst.';

  @override
  String get redactIntro =>
      'Zamaż na stałe fragmenty PDF (nazwiska, adresy, kwoty). W odróżnieniu od zwykłego czarnego prostokąta nałożonego z wierzchu, ukryty tekst zostaje naprawdę usunięty z pliku, a nie tylko przykryty: nie da się go już zaznaczyć ani skopiować.';

  @override
  String get redactChooseSubtitle => 'Wybierz dokument do zamazania';

  @override
  String get redactCaveat =>
      'Warto wiedzieć: aby usunąć ukryty tekst, każda strona dokumentu zostaje z powrotem zamieniona na obraz (200 dpi). Wynik nie jest więc już plikiem PDF, w którym da się zaznaczyć tekst, a otrzymany plik jest zwykle cięższy od oryginału.';

  @override
  String get redactEmptyPdf => 'Ten PDF nie zawiera żadnej strony.';

  @override
  String redactOpenFailed(String detail) {
    return 'Nie udało się otworzyć tego PDF (może być zabezpieczony hasłem): $detail';
  }

  @override
  String redactPageRenderFailed(int number, String detail) {
    return 'Nie udało się wyświetlić strony $number: $detail';
  }

  @override
  String get redactUndoTooltip => 'Cofnij ostatni obszar';

  @override
  String get redactInstructions =>
      'Przeciągnij palcem po stronie, aby zaznaczyć obszar do ukrycia. Zakryty tekst zostanie naprawdę usunięty z pliku, a nie tylko przykryty.';

  @override
  String get redactPagePrevious => 'Poprzednia strona';

  @override
  String get redactPageNext => 'Następna strona';

  @override
  String redactPager(int current, int total) {
    return 'Strona $current / $total';
  }

  @override
  String get redactNoZone => 'Nie zaznaczono żadnego obszaru';

  @override
  String redactZoneCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count obszaru do ukrycia',
      many: '$count obszarów do ukrycia',
      few: '$count obszary do ukrycia',
      one: '$count obszar do ukrycia',
    );
    return '$_temp0';
  }

  @override
  String get redactOtherPdf => 'Inny PDF';

  @override
  String get redactAction => 'Zamaż';

  @override
  String get redactProgress => 'Zamazywanie…';

  @override
  String get cropEmptyTitle => 'Przytnij marginesy';

  @override
  String get cropEmptyBody =>
      'Wybierz PDF, a potem przeciągnij palcem po podglądzie, aby wyznaczyć obszar do zachowania.';

  @override
  String get cropTooSmall => 'Zaznaczony obszar jest za mały.';

  @override
  String get cropProgress => 'Przycinanie…';

  @override
  String cropFailed(String detail) {
    return 'Przycinanie nie powiodło się: $detail';
  }

  @override
  String get cropKeptArea => 'Zachowany obszar';

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
  String get cropFullPage => 'Cała strona';

  @override
  String get cropAllPages => 'Zastosuj do wszystkich stron';

  @override
  String get cropAllPagesOn =>
      'Ten sam obszar jest wycinany na każdej stronie.';

  @override
  String get cropAllPagesOff =>
      'Przycinana jest tylko strona 1, pozostałe zostają w całości.';

  @override
  String get cropCaveat =>
      'Przycinanie zmniejsza rozmiar strony: treść poza obszarem nie jest już wyświetlana ani drukowana.';

  @override
  String get cropAction => 'Przytnij';

  @override
  String get compareTitle => 'Porównaj dwa PDF';

  @override
  String get compareEmptyTitle => 'Co się zmieniło';

  @override
  String get compareEmptyBody =>
      'Wybierz dwie wersje tego samego PDF. Dodane i usunięte fragmenty zostaną zestawione obok siebie, strona po stronie.';

  @override
  String get compareSlotA => 'Plik A';

  @override
  String get compareSlotB => 'Plik B';

  @override
  String get compareAction => 'Porównaj';

  @override
  String get compareProgress => 'Porównywanie…';

  @override
  String compareFailed(String detail) {
    return 'Porównanie nie powiodło się: $detail';
  }

  @override
  String compareChangedPages(int changed, int total) {
    String _temp0 = intl.Intl.pluralLogic(
      changed,
      locale: localeName,
      other: '$changed strony różni się',
      many: '$changed stron różni się',
      few: '$changed strony różnią się',
      one: '$changed strona różni się',
    );
    return '$_temp0 z $total';
  }

  @override
  String get compareNoDifference => 'Nie wykryto różnic między dwoma plikami.';

  @override
  String comparePageHeading(int number) {
    return 'Strona $number';
  }

  @override
  String organizeFilesCreated(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Utworzono $count pliku',
      many: 'Utworzono $count plików',
      few: 'Utworzono $count pliki',
      one: 'Utworzono $count plik',
    );
    return '$_temp0';
  }

  @override
  String organizePartTitle(int number) {
    return 'Część $number';
  }
}
