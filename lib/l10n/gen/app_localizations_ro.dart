// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Romanian Moldavian Moldovan (`ro`).
class LRo extends L {
  LRo([String locale = 'ro']) : super(locale);

  @override
  String get appTitle => 'Trombone — PDF, scanare și Word';

  @override
  String get appWordmark => 'Trombone';

  @override
  String get actionSave => 'Salvează';

  @override
  String get actionShare => 'Partajează';

  @override
  String get actionCompress => 'Micșorează';

  @override
  String get actionDone => 'Gata';

  @override
  String get actionCancel => 'Renunță';

  @override
  String get actionChange => 'Schimbă';

  @override
  String get actionContinue => 'Continuă';

  @override
  String get actionOpening => 'Se deschide…';

  @override
  String get actionRemoveFile => 'Scoate acest fișier';

  @override
  String get progressPreparing => 'Se pregătește…';

  @override
  String progressPercent(int percent) {
    return '$percent%';
  }

  @override
  String get emptyReassurance =>
      'Export gratuit, fără filigran și fără limită.';

  @override
  String get emptyAcceptedFormats => 'Formate acceptate';

  @override
  String get exportSavedTitle => 'Salvat.';

  @override
  String get exportSavedBody =>
      'Cu numele și în folderul pe care tocmai le-ați ales. Fără filigran, fără limită, nimic de deblocat.';

  @override
  String get exportSaveDialogTitle => 'Salvează PDF-ul';

  @override
  String pageTileIncluded(int number) {
    return 'Pagina $number, inclusă. Atingeți pentru a o scoate.';
  }

  @override
  String pageTileExcluded(int number) {
    return 'Pagina $number, scoasă. Atingeți pentru a o include.';
  }

  @override
  String pageTileRotate(int number) {
    return 'Rotește pagina $number';
  }

  @override
  String sectionHeaderSemantics(String title, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de instrumente',
      few: '$count instrumente',
      one: '$count instrument',
    );
    return '$title, $_temp0';
  }

  @override
  String toolCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de instrumente',
      few: '$count instrumente',
      one: '$count instrument',
    );
    return '$_temp0';
  }

  @override
  String get homePromise =>
      'Creați documentul și exportați-l.\nNiciun paywall la final.';

  @override
  String get homeChipNoAccount => 'Fără cont';

  @override
  String get homeChipNoWatermark => 'Fără filigran';

  @override
  String get homeChipUnlimited => 'Export nelimitat';

  @override
  String get homeSearchTooltip => 'Caută un instrument';

  @override
  String get homeColophon =>
      'La salvare nu se deblochează nimic contra cost. Exportul este gratuit, fără filigran și fără limite.';

  @override
  String get sectionFeatured => 'Recomandate';

  @override
  String get sectionToPdf => 'Spre PDF';

  @override
  String get sectionFromPdf => 'Din PDF';

  @override
  String get sectionSecurity => 'Securitate';

  @override
  String get sectionEdit => 'Editare';

  @override
  String get toolMerge => 'Îmbină';

  @override
  String get toolMergeKeywords =>
      'combina uneste alipeste grupeaza adauga concateneaza';

  @override
  String get toolMergeSubtitle =>
      'PDF, Word, imagini și text într-un singur document';

  @override
  String get toolRectoVerso => 'Față-verso';

  @override
  String get toolRectoVersoKeywords =>
      'duplex intercaleaza scanare par impar doua fete';

  @override
  String get toolRectoVersoSubtitle => 'Două scanări, din nou în ordine';

  @override
  String get toolImagesToPdf => 'Imagini în PDF';

  @override
  String get toolImagesToPdfKeywords =>
      'poza jpg jpeg png poze album camera imagine';

  @override
  String get toolImagesToPdfSubtitle =>
      'Poze și capturi într-un singur document';

  @override
  String get toolPdfToWord => 'PDF în Word';

  @override
  String get toolPdfToWordKeywords =>
      'docx procesor de text editabil converteste doc';

  @override
  String get toolPdfToWordSubtitle => 'Text și tabele, editabile';

  @override
  String get toolOrganize => 'Organizează un PDF';

  @override
  String get toolOrganizeKeywords =>
      'imparte separa extrage reordoneaza ordine pagini sterge';

  @override
  String get toolOrganizeSubtitle => 'Împărțire, extragere, reordonare';

  @override
  String get toolExcelToPdf => 'Excel în PDF';

  @override
  String get toolExcelToPdfKeywords =>
      'foaie de calcul xlsx registru foaie calcul';

  @override
  String get toolPptxToPdf => 'PowerPoint în PDF';

  @override
  String get toolPptxToPdfKeywords => 'pptx diapozitiv prezentare slides';

  @override
  String get toolHtmlToPdf => 'Pagină web în PDF';

  @override
  String get toolHtmlToPdfKeywords => 'html site internet url legatura articol';

  @override
  String get toolScan => 'Scanează un document';

  @override
  String get toolScanKeywords => 'camera poza digitalizeaza scaner hartie';

  @override
  String get toolPdfToExcel => 'PDF în Excel';

  @override
  String get toolPdfToExcelKeywords =>
      'foaie de calcul xlsx tabel extrage date';

  @override
  String get toolPdfToPptx => 'PDF în PowerPoint';

  @override
  String get toolPdfToPptxKeywords => 'pptx diapozitiv prezentare slides';

  @override
  String get toolPdfToImages => 'PDF în imagini';

  @override
  String get toolPdfToImagesKeywords => 'jpg png poza exporta captura imagine';

  @override
  String get toolOcr => 'Text căutabil (OCR)';

  @override
  String get toolOcrKeywords =>
      'recunoastere caractere scanat copiaza selecteaza';

  @override
  String get toolPdfA => 'Convertește în PDF/A';

  @override
  String get toolPdfAKeywords => 'arhivare standard termen lung pastrare iso';

  @override
  String get toolProtect => 'Protejează PDF-ul';

  @override
  String get toolProtectKeywords =>
      'parola lacat criptare blocheaza securizeaza';

  @override
  String get toolUnlock => 'Deblochează PDF-ul';

  @override
  String get toolUnlockKeywords =>
      'scoate parola deschide decripteaza deblocheaza lacat';

  @override
  String get toolRepair => 'Repară PDF-ul';

  @override
  String get toolRepairKeywords =>
      'deteriorat ilizibil stricat recupereaza eroare';

  @override
  String get toolRedact => 'Anonimizează un PDF';

  @override
  String get toolRedactKeywords =>
      'ascunde innegreste anonimizeaza confidential sterge cenzura';

  @override
  String get toolEdit => 'Editează PDF-ul';

  @override
  String get toolEditKeywords => 'text modifica corecteaza adnoteaza scrie';

  @override
  String get toolSign => 'Semnează';

  @override
  String get toolSignKeywords => 'semnatura parafa contract mana';

  @override
  String get toolWatermark => 'Filigran';

  @override
  String get toolWatermarkKeywords =>
      'watermark stampila confidential ciorna marcaj';

  @override
  String get toolPageNumbers => 'Numere de pagină';

  @override
  String get toolPageNumbersKeywords => 'paginare numerotare numeroteaza cifre';

  @override
  String get toolCrop => 'Decupează un PDF';

  @override
  String get toolCropKeywords => 'taie margini decupeaza laturi dimensiune';

  @override
  String get toolCompare => 'Compară PDF-uri';

  @override
  String get toolCompareKeywords =>
      'diferenta versiuni diff modificari compara';

  @override
  String get searchHint => 'Îmbină, parolă, filigran…';

  @override
  String get searchClear => 'Șterge';

  @override
  String searchNoResultTitle(String query) {
    return 'Niciun instrument pentru „$query”.';
  }

  @override
  String get searchNoResultBody =>
      'Încercați cu formatul pe care îl aveți la îndemână — „Word”, „Excel”, „poză” — sau cu ce vreți să faceți: „semnează”, „împarte”, „parolă”.';

  @override
  String get actionUndo => 'Anulează acțiunea';

  @override
  String get actionApply => 'Aplică';

  @override
  String get actionChoose => 'Alege';

  @override
  String get actionChoosePdf => 'Alege un PDF';

  @override
  String get actionChooseFiles => 'Alege fișiere';

  @override
  String get actionConvert => 'Convertește';

  @override
  String get actionFinish => 'Termină';

  @override
  String get actionBack => 'Înapoi';

  @override
  String get actionAdd => 'Adaugă';

  @override
  String get noFileChosen => 'Niciun fișier ales';

  @override
  String errorExportFailed(String detail) {
    return 'Exportul a eșuat: $detail';
  }

  @override
  String errorShareFailed(String detail) {
    return 'Partajarea a eșuat: $detail';
  }

  @override
  String errorOpenFailed(String detail) {
    return 'Fișierul nu a putut fi deschis: $detail';
  }

  @override
  String errorConversionFailed(String detail) {
    return 'Conversia a eșuat: $detail';
  }

  @override
  String errorOnFile(String name, String detail) {
    return '$name: $detail';
  }

  @override
  String get errorPickPdf => 'Alegeți un fișier PDF.';

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
      other: '$count de pagini',
      few: '$count pagini',
      one: '$count pagină',
    );
    return '$_temp0';
  }

  @override
  String pageCountOfTotal(int kept, int total) {
    String _temp0 = intl.Intl.pluralLogic(
      kept,
      locale: localeName,
      other: '$kept de pagini',
      few: '$kept pagini',
      one: '$kept pagină',
    );
    return '$_temp0 din $total';
  }

  @override
  String pageOfTotal(int current, int total) {
    return 'Pagina $current din $total';
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
  String get formatImages => 'Imagini';

  @override
  String get formatText => 'Text';

  @override
  String get mergeAddFile => 'Adaugă un fișier';

  @override
  String get mergeAddHint => 'PDF, Word, imagini sau text';

  @override
  String get mergeEmptyTitle => 'Un singur document';

  @override
  String get mergeEmptyBody =>
      'Adăugați PDF-uri, fișiere Word, imagini sau text. Înainte de export le puteți reordona și puteți scoate pagini.';

  @override
  String get mergeNeedOnePage =>
      'Adăugați cel puțin un fișier cu o pagină de inclus.';

  @override
  String get mergeProgress => 'Se îmbină…';

  @override
  String mergeFailed(String detail) {
    return 'Îmbinarea a eșuat: $detail';
  }

  @override
  String mergeRemoved(String name) {
    return '$name a fost scos.';
  }

  @override
  String mergeRemoveTooltip(String name) {
    return 'Scoate $name';
  }

  @override
  String mergeMoveSemantics(String name) {
    return 'Mută $name';
  }

  @override
  String get mergeRotateAll => 'Rotește toate paginile';

  @override
  String mergePreviewAndExport(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de pagini',
      few: '$count pagini',
      one: '$count pagină',
    );
    return 'Previzualizare și export ($_temp0)';
  }

  @override
  String previewTitle(String size) {
    return 'Previzualizare · $size';
  }

  @override
  String previewZoomPage(int number) {
    return 'Pagina $number, mărește';
  }

  @override
  String get previewPageUnreadable => 'Pagină ilizibilă.';

  @override
  String previewExportWhat(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de pagini',
      few: '$count pagini',
      one: '$count pagină',
    );
    return 'PDF · $_temp0';
  }

  @override
  String get compressTitle => 'Micșorare';

  @override
  String compressBody(String size) {
    return 'Dimensiune actuală: $size. Alegeți un nivel — dimensiunea estimată apare înainte de aplicare.';
  }

  @override
  String get compressEstimating => 'Se estimează…';

  @override
  String get compressProgress => 'Se micșorează…';

  @override
  String compressFailed(String detail) {
    return 'Micșorarea a eșuat: $detail';
  }

  @override
  String get protectEmptyTitle => 'Pune o parolă';

  @override
  String get protectEmptyBody =>
      'PDF-ul nu se va mai deschide fără parola pe care o alegeți. Păstrați-o: nu poate fi recuperată.';

  @override
  String get protectSubtitle => 'Va fi criptat cu AES pe 256 de biți';

  @override
  String get protectPassword => 'Parolă';

  @override
  String get protectConfirmPassword => 'Confirmă parola';

  @override
  String get protectShowPasswords => 'Arată parolele';

  @override
  String get protectHidePasswords => 'Ascunde parolele';

  @override
  String get protectMismatch => 'Cele două parole diferă.';

  @override
  String get protectWarning =>
      'Notați-o undeva: fără ea, documentul devine definitiv ilizibil. Nicio recuperare nu este posibilă, nici de către dumneavoastră, nici de către aplicație.';

  @override
  String get protectAlreadyProtected =>
      'Acest fișier este deja protejat — folosiți mai întâi Deblochează PDF-ul.';

  @override
  String get protectProgress => 'Se protejează…';

  @override
  String protectFailed(String detail) {
    return 'Protejarea a eșuat: $detail';
  }

  @override
  String get protectAction => 'Protejează';

  @override
  String get protectResultTitle => 'PDF protejat';

  @override
  String get protectResultDetail =>
      'Criptat cu AES pe 256 de biți. Va fi nevoie de parolă pentru a-l deschide.';

  @override
  String get protectExportWhat => 'PDF protejat cu parolă';

  @override
  String get unlockEmptyTitle => 'Scoate parola';

  @override
  String get unlockEmptyBody =>
      'Aveți nevoie de parola actuală a documentului. După ce este scoasă, PDF-ul se va deschide liber.';

  @override
  String get unlockAcceptsProtectedPdf => 'PDF protejat';

  @override
  String get unlockChooseProtectedPdf => 'Alege un PDF protejat';

  @override
  String get unlockCurrentPassword => 'Parola actuală';

  @override
  String get unlockWrongPassword => 'Parolă greșită.';

  @override
  String get unlockProgress => 'Se deblochează…';

  @override
  String unlockFailed(String detail) {
    return 'Deblocarea a eșuat: $detail';
  }

  @override
  String get unlockAction => 'Deblochează';

  @override
  String get repairEmptyTitle => 'Repară un fișier stricat';

  @override
  String get repairEmptyBody =>
      'Structura internă a unui PDF deteriorat este reconstruită. Ce se poate salva va fi salvat.';

  @override
  String get repairProgress => 'Se repară…';

  @override
  String get repairFailed =>
      'Acest fișier nu poate fi reparat — poate fi prea deteriorat.';

  @override
  String get repairAction => 'Repară';

  @override
  String get pdfToWordEmptyTitle => 'Un Word editabil';

  @override
  String get pdfToWordEmptyBody =>
      'Textul și structura PDF-ului sunt transpuse într-un document .docx pe care îl puteți redeschide și edita.';

  @override
  String get pdfToWordAnalyzing => 'Se analizează documentul…';

  @override
  String get pdfToWordAnalysisPending => 'Analiză în așteptare';

  @override
  String pdfToWordAnalysisFailed(String detail) {
    return 'Analiza a eșuat: $detail';
  }

  @override
  String get pdfLocked =>
      'Acest PDF este protejat cu parolă. Deblocați-l mai întâi.';

  @override
  String get pdfToWordConverting => 'Se convertește în Word…';

  @override
  String get pdfToWordSummaryTitle => 'Conținut detectat';

  @override
  String pdfToWordParagraphCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de paragrafe',
      few: '$count paragrafe',
      one: '$count paragraf',
    );
    return '$_temp0';
  }

  @override
  String pdfToWordHeadingCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de titluri',
      few: '$count titluri',
      one: '$count titlu',
    );
    return '$_temp0';
  }

  @override
  String pdfToWordTableCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de tabele',
      few: '$count tabele',
      one: '$count tabel',
    );
    return '$_temp0';
  }

  @override
  String get pdfToWordNoTables =>
      'Niciun tabel detectat: dacă PDF-ul dumneavoastră conține vreunul, rândurile lui vor fi transformate în paragrafe.';

  @override
  String get pdfToWordCaveat =>
      'Conversia reproduce textul, formatarea și tabelele, dar nu și așezarea exactă în pagină: poziția imaginilor și a coloanelor nu se păstrează, iar imaginile nu ajung în documentul Word.';

  @override
  String get pdfToWordScanWarning =>
      'Acest PDF pare a fi o scanare: nu s-a găsit niciun text. Folosiți mai întâi instrumentul Text căutabil (OCR), apoi reveniți și convertiți PDF-ul obținut.';

  @override
  String get pdfToWordResultTitle => 'Document Word gata';

  @override
  String pdfToWordResultDetail(String name, String size) {
    return '$name — $size';
  }

  @override
  String get pdfToWordExportWhat => 'Document Word';

  @override
  String get pdfToWordConvertAction => 'Convertește în Word';

  @override
  String get actionConvertAgain => 'Convertește din nou';

  @override
  String errorSaveFailed(String detail) {
    return 'Nu s-a putut salva: $detail';
  }

  @override
  String get rectoVersoIntro =>
      'Un alimentator cu o singură față dă două fișiere: paginile impare în ordine, iar cele pare adesea în ordine inversă. Alegeți-le pe amândouă pentru a le recompune.';

  @override
  String get rectoVersoOddSlot => 'Fișierul cu paginile impare (fața)';

  @override
  String get rectoVersoEvenSlot => 'Fișierul cu paginile pare (versoul)';

  @override
  String get rectoVersoReversed => 'Al doilea fișier este în ordine inversă';

  @override
  String get rectoVersoReversedHint =>
      'Este cazul cel mai frecvent, de aceea este bifat din start';

  @override
  String rectoVersoPreview(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de pagini',
      few: '$count pagini',
      one: '$count pagină',
    );
    return 'Previzualizarea intercalării ($_temp0)';
  }

  @override
  String get rectoVersoProgress => 'Se intercalează…';

  @override
  String fileWithPageCount(String name, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de pagini',
      few: '$count pagini',
      one: '$count pagină',
    );
    return '$name · $_temp0';
  }

  @override
  String get actionPreviewAndExport => 'Previzualizare și export';

  @override
  String errorOpenFailedShort(String detail) {
    return 'Nu s-a putut deschide: $detail';
  }

  @override
  String errorGeneric(String detail) {
    return 'A eșuat: $detail';
  }

  @override
  String get actionConvertToPdf => 'Convertește în PDF';

  @override
  String get convertProgress => 'Se convertește…';

  @override
  String get excelEmptyTitle => 'Un registru în PDF';

  @override
  String get excelEmptyBody =>
      'Foile unui fișier .xlsx devin pagini PDF, gata de trimis sau de tipărit.';

  @override
  String get excelChooseWorkbook => 'Alege un registru';

  @override
  String get excelChooseXlsx => 'Alege un registru .xlsx';

  @override
  String get excelLegacyFormat =>
      'Formatul .xls (vechiul format binar Excel) nu este acceptat. Salvați fișierul ca .xlsx și încercați din nou.';

  @override
  String get excelWrongFormat => 'Alegeți un registru Excel .xlsx.';

  @override
  String excelUnreadable(String detail) {
    return 'Registru ilizibil: $detail';
  }

  @override
  String excelSheetsAndRows(int sheets, int rows) {
    String _temp0 = intl.Intl.pluralLogic(
      sheets,
      locale: localeName,
      other: '$sheets de foi',
      few: '$sheets foi',
      one: '$sheets foaie',
    );
    String _temp1 = intl.Intl.pluralLogic(
      rows,
      locale: localeName,
      other: '$rows de rânduri în total',
      few: '$rows rânduri în total',
      one: '$rows rând în total',
    );
    return '$_temp0 · $_temp1';
  }

  @override
  String get excelSheetsDetected => 'Foi detectate';

  @override
  String get excelEmptySheet => 'Foaie goală';

  @override
  String excelSheetDimensions(int rows, int columns) {
    String _temp0 = intl.Intl.pluralLogic(
      rows,
      locale: localeName,
      other: '$rows de rânduri',
      few: '$rows rânduri',
      one: '$rows rând',
    );
    String _temp1 = intl.Intl.pluralLogic(
      columns,
      locale: localeName,
      other: '$columns de coloane',
      few: '$columns coloane',
      one: '$columns coloană',
    );
    return '$_temp0 × $_temp1';
  }

  @override
  String get excelRepeatHeader => 'Repetă rândul de antet pe fiecare pagină';

  @override
  String get excelRepeatHeaderHint =>
      'Primul rând al foii este redesenat în partea de sus a fiecărei pagini a tabelului.';

  @override
  String get excelCaveat =>
      'Ce preia conversia: textul celulelor așa cum este salvat în fișier (inclusiv ultimul rezultat calculat al formulelor), primul rând îngroșat și o grilă.\n\nCe nu preia: culori, fonturi, formate numerice, celule îmbinate, imagini, grafice și formulele însele. Coloanele sunt îngustate ca să încapă în lățimea paginii; pe foile foarte late, textul celulelor prea înguste este tăiat cu „…”.';

  @override
  String get pptxEmptyTitle => 'O prezentare în PDF';

  @override
  String get pptxEmptyBody =>
      'O pagină orizontală 16:9 pentru fiecare diapozitiv, cu titlul și punctele. Textul este preluat; imaginile, formele și fundalurile originale nu.\n\nFormat acceptat: .pptx. Un fișier .ppt mai vechi trebuie salvat mai întâi ca .pptx din PowerPoint.';

  @override
  String get pptxChoosePresentation => 'Alege o prezentare';

  @override
  String get pptxTextOnlyTitle => 'Se convertește doar textul';

  @override
  String get pptxTextOnlyBody =>
      'Textul fiecărui diapozitiv este preluat. Imaginile, formele, fundalurile, culorile și așezările originale nu se păstrează: PDF-ul obținut este o așezare simplă și lizibilă, nu o copie fidelă a prezentării dumneavoastră.';

  @override
  String pptxSlideCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de diapozitive',
      few: '$count diapozitive',
      one: '$count diapozitiv',
    );
    return '$_temp0';
  }

  @override
  String get pptxSlidesDetected => 'Diapozitive detectate';

  @override
  String pptxMoreSlides(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de diapozitive',
      few: '$count diapozitive',
      one: '$count diapozitiv',
    );
    return 'și încă $_temp0…';
  }

  @override
  String get pptxUntitledSlide => 'Fără titlu';

  @override
  String get pptxEmptySlide => 'Fără text (doar imagine sau formă)';

  @override
  String pptxTextLineCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de rânduri de text',
      few: '$count rânduri de text',
      one: '$count rând de text',
    );
    return '$_temp0';
  }

  @override
  String pptxReadFailed(String detail) {
    return 'Nu s-a putut citi: $detail';
  }

  @override
  String get compressLevelLight => 'Ușoară';

  @override
  String get compressLevelMedium => 'Medie';

  @override
  String get compressLevelStrong => 'Puternică';

  @override
  String get pptxQualityStandard => 'Standard (150 dpi)';

  @override
  String get pptxQualityHigh => 'Înaltă (220 dpi)';

  @override
  String get pdfToExcelEmptyTitle => 'Recuperați tabelele';

  @override
  String get pdfToExcelEmptyBody =>
      'Tabelele dintr-un PDF sunt extrase într-un registru Excel. Formatarea nu se păstrează, valorile da.';

  @override
  String pdfToExcelPagesAnalyzed(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de pagini analizate',
      few: '$count pagini analizate',
      one: '$count pagină analizată',
    );
    return '$_temp0';
  }

  @override
  String pdfToExcelAnalysisFailed(String detail) {
    return 'Analiza nu este posibilă. PDF-ul poate fi protejat cu parolă sau deteriorat. ($detail)';
  }

  @override
  String get pdfToExcelNothingToExport =>
      'Nimic de exportat: niciun tabel detectat.';

  @override
  String get pdfToExcelBuilding => 'Se creează registrul…';

  @override
  String get pdfToExcelIncludeParagraphs =>
      'Include și textul din afara tabelelor (un rând pe paragraf)';

  @override
  String get pdfToExcelIncludeParagraphsHint =>
      'Util pentru un document semistructurat: textul ajunge în coloana A, după tabelele paginii.';

  @override
  String get pdfToExcelCaveatTitle => 'Ce nu păstrează conversia';

  @override
  String get pdfToExcelCaveat =>
      'Detectarea se bazează pe poziția textului în pagină: tabelele fără chenar regulat, celulele îmbinate și coloanele foarte neregulate pot fi tăiate greșit. Un PDF scanat (o imagine) nu conține text extractibil și nu va da nimic. Culorile, formulele și imaginile nu sunt preluate niciodată: doar valorile text.';

  @override
  String pdfToExcelTablesFound(int tables, int pages) {
    String _temp0 = intl.Intl.pluralLogic(
      tables,
      locale: localeName,
      other: '$tables de tabele detectate',
      few: '$tables tabele detectate',
      one: '$tables tabel detectat',
    );
    String _temp1 = intl.Intl.pluralLogic(
      pages,
      locale: localeName,
      other: '$pages de pagini',
      few: '$pages pagini',
      one: '$pages pagină',
    );
    return '$_temp0 pe $_temp1';
  }

  @override
  String pdfToExcelPagesConcerned(String pages) {
    return 'Pagini vizate: $pages';
  }

  @override
  String pdfToExcelParagraphsOutside(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de paragrafe în afara tabelelor',
      few: '$count paragrafe în afara tabelelor',
      one: '$count paragraf în afara tabelelor',
    );
    return '$_temp0';
  }

  @override
  String get pdfToExcelScannedWarning =>
      'Din acest PDF nu s-a putut extrage niciun text: aproape sigur este un document scanat (imagini ale paginilor). Un program de calcul tabelar nu poate scoate nimic din el; folosiți mai întâi instrumentul de recunoaștere a textului (OCR).';

  @override
  String get pdfToExcelNoTableWarning =>
      'În acest document nu s-a recunoscut nicio structură de tabel. Textul există, dar nu este așezat în coloane regulate. În loc să obțineți un registru ilizibil, activați mai sus „Include și textul din afara tabelelor” sau folosiți „PDF în Word”, care păstrează mai bine paragrafele.';

  @override
  String get pdfToExcelResultTitle => 'Registru gata';

  @override
  String get pdfToExcelExportWhat => 'Registru Excel';

  @override
  String get pdfToExcelConvertAction => 'Convertește în Excel';

  @override
  String resultNameAndSize(String name, String size) {
    return '$name — $size';
  }

  @override
  String get pdfToPptxEmptyTitle => 'Un diapozitiv pe pagină';

  @override
  String get pdfToPptxEmptyBody =>
      'PDF-ul devine o prezentare PowerPoint identică. Fiecare pagină ajunge ca imagine: așezarea este fidelă, dar textul nu va putea fi editat în PowerPoint.';

  @override
  String pdfToPptxOpenFailed(String detail) {
    return 'Acest PDF nu a putut fi deschis: $detail';
  }

  @override
  String get pdfToPptxConverting => 'Se convertește în PowerPoint…';

  @override
  String pdfToPptxPagesToSlides(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de pagini',
      few: '$count pagini',
      one: '$count pagină',
    );
    String _temp1 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de diapozitive',
      few: '$count diapozitive',
      one: '$count diapozitiv',
    );
    return '$_temp0 > $_temp1';
  }

  @override
  String get pdfToPptxEmptyDocument => 'Document gol';

  @override
  String get qualityLabel => 'Calitate';

  @override
  String get pdfToPptxQualityHint =>
      'O rezoluție mai mare dă diapozitive mai clare, dar un fișier net mai greu.';

  @override
  String pdfToPptxHeavyWarning(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de pagini',
      few: '$count pagini',
      one: '$count pagină',
    );
    return 'Atenție: la calitate înaltă, o prezentare de $_temp0 poate cântări zeci de MB și se poate deschide greu. Alegeți Standard dacă aveți dubii.';
  }

  @override
  String get goodToKnow => 'De știut';

  @override
  String get pdfToPptxCaveat =>
      'Fiecare diapozitiv este o imagine a paginii: așezarea este identică cu cea din PDF, dar textul nu va putea fi editat în PowerPoint.\nPentru text editabil folosiți mai degrabă „PDF în Word”.\nO prezentare are un singur format de diapozitiv: este preluat din prima pagină, iar paginile de alt format sunt centrate în interior.';

  @override
  String get pdfToPptxResultTitle => 'Prezentare gata';

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
      other: '$count de diapozitive',
      few: '$count diapozitive',
      one: '$count diapozitiv',
    );
    return '$name — $_temp0 · $size · $quality';
  }

  @override
  String get notSavedYet =>
      'Fișierul nu este încă pe dispozitivul dumneavoastră: salvați-l sau partajați-l.';

  @override
  String get pdfToPptxChangeQuality => 'Schimbă calitatea';

  @override
  String get pdfToPptxConvertAction => 'Convertește în PowerPoint';

  @override
  String pdfToPptxExportWhat(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de diapozitive',
      few: '$count diapozitive',
      one: '$count diapozitiv',
    );
    return 'Prezentare PowerPoint · $_temp0';
  }

  @override
  String get formatLabel => 'Format';

  @override
  String get actionExport => 'Exportă';

  @override
  String get imageQualityWeb => 'Web (72 dpi)';

  @override
  String get imageQualityStandard => 'Standard (150 dpi)';

  @override
  String get imageQualityHigh => 'Calitate înaltă (300 dpi)';

  @override
  String get pdfToImagesEmptyTitle => 'O imagine pe pagină';

  @override
  String get pdfToImagesEmptyBody =>
      'Alegeți un PDF: fiecare pagină va ieși ca imagine, la rezoluția pe care o reglați apoi.';

  @override
  String pdfToImagesNotAPdf(String name) {
    return '$name: alegeți un fișier PDF.';
  }

  @override
  String errorLoadFailed(String detail) {
    return 'Încărcarea a eșuat: $detail';
  }

  @override
  String get pdfToImagesProgress => 'Se exportă…';

  @override
  String pdfToImagesExportWhat(int count, String format) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de imagini $format',
      few: '$count imagini $format',
      one: '$count imagine $format',
    );
    return '$_temp0';
  }

  @override
  String get pdfaEmptyTitle => 'Arhivare pe termen lung';

  @override
  String get pdfaEmptyBody =>
      'PDF/A este formatul de arhivare cerut de multe instituții. Documentul este convertit fără să-și piardă înfățișarea.';

  @override
  String get pdfaConformanceLevel => 'Nivel de conformitate';

  @override
  String get pdfaA1bDetail =>
      'Nivelul cel mai strict și cel mai larg acceptat. De ales dacă aveți dubii.';

  @override
  String get pdfaA2bDetail =>
      'Bazat pe PDF 1.7: compresie mai eficientă, fișiere ceva mai ușoare.';

  @override
  String get pdfaA3bDetail =>
      'Ca A-2b, dar permite atașamente (cerut adesea pentru facturarea electronică).';

  @override
  String pdfaConvertingTo(String level) {
    return 'Se convertește în $level…';
  }

  @override
  String get pdfaCaveatTitle => 'Ce schimbă conversia';

  @override
  String pdfaCaveat(int dpi) {
    return 'Fiecare pagină este redesenată ca imagine la $dpi dpi: textul devine imagine, iar așezarea se fixează. Tocmai asta face fișierul cu adevărat conform, fără să depindă de fonturile documentului original, dar în schimb textul nu mai poate fi selectat sau căutat, legăturile și formularele dispar, iar fișierul devine mai greu.';
  }

  @override
  String pdfaOpenFailed(String detail) {
    return 'Acest PDF nu a putut fi deschis: $detail';
  }

  @override
  String get imagesToPdfEmptyTitle => 'Imagini într-un singur PDF';

  @override
  String get imagesToPdfEmptyBody =>
      'JPG, PNG, WebP, HEIC — adăugați-vă imaginile și vor fi asamblate în ordinea pe care o alegeți.';

  @override
  String get imagesToPdfChoose => 'Alege imagini';

  @override
  String get imagesToPdfAdd => 'Adaugă imagini';

  @override
  String imagesToPdfRejected(String names) {
    return 'Ignorat (nu este imagine): $names';
  }

  @override
  String get imagesToPdfBuilding => 'Se creează PDF-ul…';

  @override
  String imagesToPdfBuildFailed(String detail) {
    return 'Crearea a eșuat: $detail';
  }

  @override
  String imagesToPdfCreateAction(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de imagini',
      few: '$count imagini',
      one: '$count imagine',
    );
    return 'Creează PDF-ul ($_temp0)';
  }

  @override
  String get actionRotate => 'Rotește';

  @override
  String get actionRemove => 'Scoate';

  @override
  String get htmlTitle => 'HTML / pagină web în PDF';

  @override
  String get htmlIntro =>
      'Transformați o pagină web sau cod HTML într-un PDF A4. Randarea este făcută de browserul integrat în Android, așa că așezarea este cea a unei tipăriri din Chrome.';

  @override
  String get htmlModeUrl => 'Adresă web';

  @override
  String get htmlModeCode => 'Cod HTML';

  @override
  String get htmlUrlLabel => 'Adresa paginii';

  @override
  String get htmlUrlHint => 'https://exemplu.ro/articol';

  @override
  String get htmlCodeLabel => 'Cod HTML';

  @override
  String get htmlCodeHint => '<h1>Titlu</h1>\n<p>Text…</p>';

  @override
  String get htmlUrlBadScheme =>
      'Adresa trebuie să înceapă cu http:// sau https://.';

  @override
  String get htmlUrlIncomplete => 'Introduceți o adresă web completă.';

  @override
  String get htmlCodeEmpty => 'Lipiți cod HTML de convertit.';

  @override
  String get htmlLoadingUrl => 'Se încarcă pagina și se convertește…';

  @override
  String get htmlConverting => 'Se convertește HTML-ul…';

  @override
  String get htmlNetworkNotice =>
      'Este nevoie de conexiune la internet: este singurul instrument al aplicației care trebuie să descarce pagina. Paginile care cer autentificare, o bandă de cookie-uri sau mult JavaScript pot ieși incomplete.';

  @override
  String get htmlOfflineNotice =>
      'HTML-ul și CSS-ul scrise direct în pagină sunt randate fără conexiune. În schimb, imaginile, foile de stil sau fonturile aduse de la o adresă web externă au nevoie de conexiune la internet.';

  @override
  String get watermarkEmptyTitle => 'Pune un filigran';

  @override
  String get watermarkEmptyBody =>
      'Un text la alegerea dumneavoastră se repetă pe fundalul tuturor paginilor — pentru a marca un document drept confidențial sau ciornă.';

  @override
  String get watermarkEmptyNote => 'Export gratuit și fără limite.';

  @override
  String get watermarkTextLabel => 'Textul filigranului';

  @override
  String get watermarkDefaultText => 'CONFIDENȚIAL';

  @override
  String get watermarkNeedText => 'Introduceți un text pentru filigran.';

  @override
  String watermarkOpacity(int percent) {
    return 'Opacitate: $percent%';
  }

  @override
  String watermarkRotation(int degrees) {
    return 'Unghi de rotație: $degrees°';
  }

  @override
  String watermarkFontSize(int points) {
    return 'Dimensiunea textului: $points pt';
  }

  @override
  String get watermarkColor => 'Culoare';

  @override
  String get colorGrey => 'Gri';

  @override
  String get colorRed => 'Roșu';

  @override
  String get colorBlue => 'Albastru';

  @override
  String get colorBlack => 'Negru';

  @override
  String get watermarkProgress => 'Se aplică filigranul…';

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
  String get pageNumbersEmptyTitle => 'Numerotați paginile';

  @override
  String get pageNumbersEmptyBody =>
      'Alegeți un PDF, apoi poziția și forma numerelor care vor fi adăugate pe fiecare pagină.';

  @override
  String get positionLabel => 'Poziție';

  @override
  String get positionBottomCenter => 'Jos centru';

  @override
  String get positionBottomRight => 'Jos dreapta';

  @override
  String get positionTopCenter => 'Sus centru';

  @override
  String get positionTopRight => 'Sus dreapta';

  @override
  String get pageNumbersFormatPlain => 'N';

  @override
  String get pageNumbersFormatOfTotal => 'N / total';

  @override
  String get pageNumbersStart => 'Număr de început';

  @override
  String get pageNumbersProgress => 'Se numerotează…';

  @override
  String get organizeEmptyTitle => 'Reia un PDF în mână';

  @override
  String get organizeEmptyBody =>
      'Deschideți un document ca să-l împărțiți, să extrageți pagini sau să le schimbați ordinea.';

  @override
  String get organizeOpenFile => 'Deschide un fișier';

  @override
  String get organizeNothingToExport => 'Nicio pagină de exportat.';

  @override
  String organizePagesKept(int kept, int total) {
    String _temp0 = intl.Intl.pluralLogic(
      kept,
      locale: localeName,
      other: '$kept de pagini păstrate',
      few: '$kept pagini păstrate',
      one: '$kept pagină păstrată',
    );
    return '$_temp0 din $total';
  }

  @override
  String get organizePageExcluded => 'Scoasă';

  @override
  String organizePageMoved(int from) {
    return 'Mutată de pe poziția $from';
  }

  @override
  String organizePageTitle(int number) {
    return 'Pagina $number';
  }

  @override
  String organizeExcludePage(int number) {
    return 'Scoate pagina $number';
  }

  @override
  String organizeIncludePage(int number) {
    return 'Include pagina $number';
  }

  @override
  String organizeMovePage(int number) {
    return 'Mută pagina $number';
  }

  @override
  String get organizeExtract => 'Extrage';

  @override
  String get organizeSplit => 'Împarte';

  @override
  String get organizePreview => 'Previzualizare';

  @override
  String get organizeExtractTitle => 'Extrage un interval de pagini';

  @override
  String organizeRangeLabel(int start, int end) {
    return 'Paginile $start până la $end';
  }

  @override
  String get organizeSplitTitle => 'Împarte în mai multe fișiere';

  @override
  String organizeFileCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de fișiere',
      few: '$count fișiere',
      one: '$count fișier',
    );
    return '$_temp0';
  }

  @override
  String organizeSplitFailed(String detail) {
    return 'Împărțirea a eșuat: $detail';
  }

  @override
  String get scanNoCamera =>
      'Niciun aparat foto disponibil pe acest dispozitiv.';

  @override
  String scanCameraFailed(String detail) {
    return 'Aparatul foto nu a putut fi pornit: $detail';
  }

  @override
  String get scanCropToolbar => 'Ajustează';

  @override
  String scanCaptureFailed(String detail) {
    return 'Captura a eșuat: $detail';
  }

  @override
  String get scanPermissionBody =>
      'Este nevoie de acces la aparatul foto pentru a scana un document.';

  @override
  String get scanGrantPermission => 'Permite aparatul foto';

  @override
  String get actionRetry => 'Încearcă din nou';

  @override
  String get scanNoPageYet => 'Nicio pagină deocamdată.';

  @override
  String scanFinishAction(int count) {
    return 'Termină · $count';
  }

  @override
  String get signTitle => 'Semnează un PDF';

  @override
  String get signIntro =>
      'Puneți-vă semnătura desenată de mână pe o pagină dintr-un PDF. Este doar un desen adăugat documentului, nu o semnătură electronică certificată.';

  @override
  String get signChooseSubtitle => 'Selectați documentul de semnat';

  @override
  String get signPickPage => 'Alegeți pagina de semnat.';

  @override
  String get signDrawTitle => 'Desenează-mi semnătura';

  @override
  String get signDrawBody =>
      'Desenați cu degetul ca pe hârtie. Aceasta pune un desen pe pagină — nu este o semnătură electronică certificată.';

  @override
  String get signNeedDrawing => 'Desenați o semnătură înainte de a continua.';

  @override
  String get signClear => 'Șterge';

  @override
  String get signValidate => 'Confirmă';

  @override
  String get signPlaceBody =>
      'Trageți semnătura în locul dorit pe pagină, apoi apăsați Termină.';

  @override
  String get signPageUnavailable => 'Pagina nu a putut fi afișată.';

  @override
  String get signProgress => 'Se adaugă semnătura…';

  @override
  String get editTitle => 'Adnotează un document';

  @override
  String get editEmptyBody =>
      'Adăugați text sau evidențiați pasaje direct pe un PDF existent.';

  @override
  String get editAddTextTitle => 'Adaugă text';

  @override
  String get editTextHint => 'Textul dumneavoastră';

  @override
  String editFontSize(int size) {
    return 'Dimensiunea textului: $size';
  }

  @override
  String get editNeedAnnotation =>
      'Adăugați cel puțin o adnotare înainte de a termina.';

  @override
  String get editProgress => 'Se aplică adnotările…';

  @override
  String get editChooseOther => 'Alege alt PDF';

  @override
  String get editUndoTooltip => 'Anulează ultima adnotare';

  @override
  String get editModeText => 'Text';

  @override
  String get editModeHighlight => 'Evidențiază';

  @override
  String get editPageUnavailable => 'Această pagină nu a putut fi afișată.';

  @override
  String get ocrEmptyTitle => 'Fă textul căutabil';

  @override
  String get ocrEmptyBody =>
      'Textul unui PDF scanat este recunoscut și adăugat peste imagine, în mod invizibil. Pagina nu își schimbă înfățișarea.';

  @override
  String get ocrWrongFormat => 'Alegeți un PDF sau o imagine (JPG, PNG…).';

  @override
  String get ocrProgress => 'Se recunoaște…';

  @override
  String ocrFailed(String detail) {
    return 'Recunoașterea a eșuat: $detail';
  }

  @override
  String get ocrRunAction => 'Pornește recunoașterea';

  @override
  String get ocrResultTitle => 'Rezultatul OCR';

  @override
  String ocrResultBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de pagini analizate',
      few: '$count pagini analizate',
      one: '$count pagină analizată',
    );
    return '$_temp0. PDF-ul căutabil este gata și puteți copia și tot textul recunoscut.';
  }

  @override
  String get ocrCopyText => 'Copiază textul';

  @override
  String get ocrTextCopied => 'Text copiat.';

  @override
  String get redactIntro =>
      'Ascundeți definitiv zone dintr-un PDF (nume, adrese, sume). Spre deosebire de un simplu dreptunghi negru pus deasupra, textul ascuns este chiar șters din fișier, nu doar acoperit: nu mai poate fi selectat sau copiat.';

  @override
  String get redactChooseSubtitle => 'Selectați documentul de anonimizat';

  @override
  String get redactCaveat =>
      'De știut: pentru a șterge textul ascuns, fiecare pagină a documentului este transformată din nou în imagine (200 dpi). Rezultatul nu mai este așadar un PDF din care se poate selecta textul, iar fișierul obținut este de obicei mai greu decât originalul.';

  @override
  String get redactEmptyPdf => 'Acest PDF nu conține nicio pagină.';

  @override
  String redactOpenFailed(String detail) {
    return 'Acest PDF nu a putut fi deschis (poate fi protejat cu parolă): $detail';
  }

  @override
  String redactPageRenderFailed(int number, String detail) {
    return 'Pagina $number nu a putut fi afișată: $detail';
  }

  @override
  String get redactUndoTooltip => 'Anulează ultima zonă';

  @override
  String get redactInstructions =>
      'Trageți cu degetul pe pagină pentru a trasa o zonă de ascuns. Textul acoperit va fi chiar șters din fișier, nu doar acoperit.';

  @override
  String get redactPagePrevious => 'Pagina anterioară';

  @override
  String get redactPageNext => 'Pagina următoare';

  @override
  String redactPager(int current, int total) {
    return 'Pagina $current / $total';
  }

  @override
  String get redactNoZone => 'Nicio zonă trasată';

  @override
  String redactZoneCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de zone de ascuns',
      few: '$count zone de ascuns',
      one: '$count zonă de ascuns',
    );
    return '$_temp0';
  }

  @override
  String get redactOtherPdf => 'Alt PDF';

  @override
  String get redactAction => 'Anonimizează';

  @override
  String get redactProgress => 'Se anonimizează…';

  @override
  String get cropEmptyTitle => 'Decupează marginile';

  @override
  String get cropEmptyBody =>
      'Alegeți un PDF, apoi trageți cu degetul pe previzualizare pentru a delimita zona de păstrat.';

  @override
  String get cropTooSmall => 'Zona selectată este prea mică.';

  @override
  String get cropProgress => 'Se decupează…';

  @override
  String cropFailed(String detail) {
    return 'Decuparea a eșuat: $detail';
  }

  @override
  String get cropKeptArea => 'Zona păstrată';

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
  String get cropFullPage => 'Pagina întreagă';

  @override
  String get cropAllPages => 'Aplică pe toate paginile';

  @override
  String get cropAllPagesOn => 'Aceeași zonă este decupată pe fiecare pagină.';

  @override
  String get cropAllPagesOff =>
      'Doar pagina 1 este decupată, celelalte rămân întregi.';

  @override
  String get cropCaveat =>
      'Decuparea micșorează pagina: conținutul din afara zonei nu mai este afișat și nici tipărit.';

  @override
  String get cropAction => 'Decupează';

  @override
  String get compareTitle => 'Compară două PDF-uri';

  @override
  String get compareEmptyTitle => 'Ce s-a schimbat';

  @override
  String get compareEmptyBody =>
      'Alegeți două versiuni ale aceluiași PDF. Pasajele adăugate și cele șterse vor fi puse față în față, pagină cu pagină.';

  @override
  String get compareSlotA => 'Fișierul A';

  @override
  String get compareSlotB => 'Fișierul B';

  @override
  String get compareAction => 'Compară';

  @override
  String get compareProgress => 'Se compară…';

  @override
  String compareFailed(String detail) {
    return 'Comparația a eșuat: $detail';
  }

  @override
  String compareChangedPages(int changed, int total) {
    String _temp0 = intl.Intl.pluralLogic(
      changed,
      locale: localeName,
      other: '$changed de pagini diferă',
      few: '$changed pagini diferă',
      one: '$changed pagină diferă',
    );
    return '$_temp0 din $total';
  }

  @override
  String get compareNoDifference =>
      'Nicio diferență detectată între cele două fișiere.';

  @override
  String comparePageHeading(int number) {
    return 'Pagina $number';
  }

  @override
  String organizeFilesCreated(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de fișiere create',
      few: '$count fișiere create',
      one: '$count fișier creat',
    );
    return '$_temp0';
  }

  @override
  String organizePartTitle(int number) {
    return 'Partea $number';
  }
}
