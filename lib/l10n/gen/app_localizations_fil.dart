// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Filipino Pilipino (`fil`).
class LFil extends L {
  LFil([String locale = 'fil']) : super(locale);

  @override
  String get appTitle => 'Paper clip — PDF, Scan at Word';

  @override
  String get appWordmark => 'Trombone';

  @override
  String get actionSave => 'I-save';

  @override
  String get actionShare => 'Ibahagi';

  @override
  String get actionCompress => 'I-compress';

  @override
  String get actionDone => 'Tapos na';

  @override
  String get actionCancel => 'Kanselahin';

  @override
  String get actionChange => 'Para magbago';

  @override
  String get actionContinue => 'Magpatuloy';

  @override
  String get actionOpening => 'Binubuksan…';

  @override
  String get actionRemoveFile => 'Alisin ang file na ito';

  @override
  String get progressPreparing => 'Paghahanda…';

  @override
  String progressPercent(int percent) {
    return '$percent %';
  }

  @override
  String get emptyReassurance =>
      'Libreng pag-export, walang watermark o limitasyon.';

  @override
  String get emptyAcceptedFormats => 'Mga tinatanggap na format';

  @override
  String get exportSavedTitle => 'Ito ay naitala.';

  @override
  String get exportSavedBody =>
      'Sa ilalim ng pangalan at sa folder na kakapili mo lang. Walang watermark, walang limitasyon, walang i-unlock.';

  @override
  String get exportSaveDialogTitle => 'I-save ang PDF';

  @override
  String pageTileIncluded(int number) {
    return 'Pahina $number, kasama. Pindutin upang itabi ito.';
  }

  @override
  String pageTileExcluded(int number) {
    return 'Pahina $number, itinapon. Pindutin upang isama ito.';
  }

  @override
  String pageTileRotate(int number) {
    return 'I-rotate ang page $number';
  }

  @override
  String sectionHeaderSemantics(String title, int count) {
    return '$title, $count tool';
  }

  @override
  String toolCount(int count) {
    return '$count na mga tool';
  }

  @override
  String get homePromise =>
      'Gawin ang iyong dokumento, i-export ito.\nWalang pader sa dulo.';

  @override
  String get homeChipNoAccount => 'Nang walang account';

  @override
  String get homeChipNoWatermark => 'Walang watermark';

  @override
  String get homeChipUnlimited => 'Walang limitasyong pag-export';

  @override
  String get homeSearchTooltip => 'Maghanap ng tool';

  @override
  String get homeColophon =>
      'Walang na-unlock laban sa pagbabayad kapag nagrerehistro. Ang pag-export ay libre, walang watermark at walang limitasyon sa bilang.';

  @override
  String get sectionFeatured => 'Itinatampok';

  @override
  String get sectionToPdf => 'Sa PDF';

  @override
  String get sectionFromPdf => 'Mula sa PDF';

  @override
  String get sectionSecurity => 'Seguridad';

  @override
  String get sectionEdit => 'I-edit';

  @override
  String get toolMerge => 'Pagsamahin';

  @override
  String get toolMergeKeywords =>
      'assemble combine join regroup join together concatenate';

  @override
  String get toolMergeSubtitle =>
      'PDF, Word, mga imahe at teksto sa isang dokumento';

  @override
  String get toolRectoVerso => 'Dalawang panig';

  @override
  String get toolRectoVersoKeywords =>
      'double sided intersperse scan kahit na kakaiba';

  @override
  String get toolRectoVersoSubtitle => 'Dalawang scan, ibalik sa ayos';

  @override
  String get toolImagesToPdf => 'Mga larawan sa PDF';

  @override
  String get toolImagesToPdfKeywords =>
      'larawan jpg jpeg png larawan album device';

  @override
  String get toolImagesToPdfSubtitle =>
      'Mga larawan at pagkuha sa isang dokumento';

  @override
  String get toolPdfToWord => 'PDF sa Word';

  @override
  String get toolPdfToWordKeywords => 'docx editable word processor convert';

  @override
  String get toolPdfToWordSubtitle => 'Teksto at mga talahanayan, nae-edit';

  @override
  String get toolOrganize => 'Ayusin ang isang PDF';

  @override
  String get toolOrganizeKeywords =>
      'hatiin ang hiwalay na extract muling ayusin ang mga pahina ng pagkakasunud-sunod tanggalin';

  @override
  String get toolOrganizeSubtitle => 'Hatiin, kunin, muling ayusin';

  @override
  String get toolExcelToPdf => 'Excel sa PDF';

  @override
  String get toolExcelToPdfKeywords =>
      'xlsx spreadsheet workbook sheet ng pagkalkula';

  @override
  String get toolPptxToPdf => 'PowerPoint sa PDF';

  @override
  String get toolPptxToPdfKeywords => 'pptx slide presentation slides';

  @override
  String get toolHtmlToPdf => 'Web page sa PDF';

  @override
  String get toolHtmlToPdfKeywords => 'html website url link na artikulo';

  @override
  String get toolScan => 'I-scan ang isang dokumento';

  @override
  String get toolScanKeywords => 'camera photo digitize scan device paper';

  @override
  String get toolPdfToExcel => 'PDF sa Excel';

  @override
  String get toolPdfToExcelKeywords => 'xlsx spreadsheet table extract data';

  @override
  String get toolPdfToPptx => 'PDF sa PowerPoint';

  @override
  String get toolPdfToPptxKeywords => 'pptx slide presentation slides';

  @override
  String get toolPdfToImages => 'PDF sa Mga Larawan';

  @override
  String get toolPdfToImagesKeywords => 'jpg png photo export capture';

  @override
  String get toolOcr => 'Naghahanap ng teksto (OCR)';

  @override
  String get toolOcrKeywords => 'character recognition scan copy piliin';

  @override
  String get toolPdfA => 'I-convert sa PDF/A';

  @override
  String get toolPdfAKeywords =>
      'pag-archive ng karaniwang pangmatagalang konserbasyon';

  @override
  String get toolProtect => 'Protektahan ang PDF';

  @override
  String get toolProtectKeywords => 'password padlock encrypt lock secure';

  @override
  String get toolUnlock => 'I-unlock ang PDF';

  @override
  String get toolUnlockKeywords =>
      'tanggalin ang password open decrypt unlock padlock';

  @override
  String get toolRepair => 'Ayusin ang PDF';

  @override
  String get toolRepairKeywords => 'corrupted unreadable damaged recover error';

  @override
  String get toolRedact => 'I-react ang isang PDF';

  @override
  String get toolRedactKeywords =>
      'itago blacken anonymize confidential delete';

  @override
  String get toolEdit => 'I-edit ang PDF';

  @override
  String get toolEditKeywords => 'text modify tamang annotate write';

  @override
  String get toolSign => 'Lagda';

  @override
  String get toolSignKeywords => 'lagda paunang kontrata kamay';

  @override
  String get toolWatermark => 'Watermark';

  @override
  String get toolWatermarkKeywords =>
      'watermark kumpidensyal na stamp draft mark';

  @override
  String get toolPageNumbers => 'Mga numero ng pahina';

  @override
  String get toolPageNumbersKeywords =>
      'mga numero ng numero ng pagination folio';

  @override
  String get toolCrop => 'I-crop ang isang PDF';

  @override
  String get toolCropKeywords =>
      'gupitin ang mga gilid ng laki ng mga gilid ng pananim';

  @override
  String get toolCompare => 'Ihambing ang PDF';

  @override
  String get toolCompareKeywords => 'pagkakaiba ng mga bersyon diff pagbabago';

  @override
  String get searchHint => 'Pagsamahin, password, watermark...';

  @override
  String get searchClear => 'Para burahin';

  @override
  String searchNoResultTitle(String query) {
    return 'Walang mga tool para sa \"$query\".';
  }

  @override
  String get searchNoResultBody =>
      'Subukan ang format na nasa kamay mo – “Word”, “Excel”, “photo” – o anumang gusto mong gawin dito: “sign”, “divide”, “password”.';

  @override
  String get actionUndo => 'Kanselahin';

  @override
  String get actionApply => 'Mag-apply';

  @override
  String get actionChoose => 'Pumili';

  @override
  String get actionChoosePdf => 'Pumili ng PDF';

  @override
  String get actionChooseFiles => 'Pumili ng mga file';

  @override
  String get actionConvert => 'Magbalik-loob';

  @override
  String get actionFinish => 'Upang tapusin';

  @override
  String get actionBack => 'Bumalik';

  @override
  String get actionAdd => 'Idagdag';

  @override
  String get noFileChosen => 'Walang napiling file';

  @override
  String errorExportFailed(String detail) {
    return 'Nabigo ang pag-export: $detail';
  }

  @override
  String errorShareFailed(String detail) {
    return 'Nabigo ang pagbabahagi: $detail';
  }

  @override
  String errorOpenFailed(String detail) {
    return 'Hindi mabuksan ang file: $detail';
  }

  @override
  String errorConversionFailed(String detail) {
    return 'Nabigo ang conversion: $detail';
  }

  @override
  String errorOnFile(String name, String detail) {
    return '$name: $detail';
  }

  @override
  String get errorPickPdf => 'Mangyaring pumili ng PDF file.';

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
    return '$count na mga pahina';
  }

  @override
  String pageCountOfTotal(int kept, int total) {
    return '$kept page out of $total';
  }

  @override
  String pageOfTotal(int current, int total) {
    return 'Pahina $current sa $total';
  }

  @override
  String get formatPdf => 'PDF';

  @override
  String get formatWord => 'salita';

  @override
  String get formatExcel => 'Excel';

  @override
  String get formatPowerPoint => 'Power point';

  @override
  String get formatImages => 'Mga larawan';

  @override
  String get formatText => 'Text';

  @override
  String get mergeAddFile => 'Magdagdag ng file';

  @override
  String get mergeAddHint => 'PDF, Word, mga larawan o teksto';

  @override
  String get mergeEmptyTitle => 'Isang dokumento';

  @override
  String get mergeEmptyBody =>
      'Magdagdag ng mga PDF, Word file, larawan o text. Maaari mong muling ayusin ang mga ito at alisin ang mga pahina bago i-export.';

  @override
  String get mergeNeedOnePage =>
      'Magdagdag ng kahit isang file na may isasamang pahina.';

  @override
  String get mergeProgress => 'Kasalukuyang isinasagawa ang pagsasanib...';

  @override
  String mergeFailed(String detail) {
    return 'Nabigo ang pagsasama: $detail';
  }

  @override
  String mergeRemoved(String name) {
    return 'Inalis ang $name.';
  }

  @override
  String mergeRemoveTooltip(String name) {
    return 'Alisin ang $name';
  }

  @override
  String mergeMoveSemantics(String name) {
    return 'Ilipat ang $name';
  }

  @override
  String get mergeRotateAll => 'I-rotate ang lahat ng page';

  @override
  String mergePreviewAndExport(int count) {
    return 'I-preview at i-export ($count mga pahina)';
  }

  @override
  String previewTitle(String size) {
    return 'Pangkalahatang-ideya · $size';
  }

  @override
  String previewZoomPage(int number) {
    return 'Pahina $number, palakihin';
  }

  @override
  String get previewPageUnreadable => 'Hindi mabasa na pahina.';

  @override
  String previewExportWhat(int count) {
    return 'PDF · $count na mga pahina';
  }

  @override
  String get compressTitle => 'Compression';

  @override
  String compressBody(String size) {
    return 'Kasalukuyang laki: $size. Pumili ng isang antas — ang tinantyang laki ay ipinapakita bago mag-apply.';
  }

  @override
  String get compressEstimating => 'Tantyahin…';

  @override
  String get compressProgress => 'Kasalukuyang isinasagawa ang compression...';

  @override
  String compressFailed(String detail) {
    return 'Nabigo ang compression: $detail';
  }

  @override
  String get protectEmptyTitle => 'Ilagay sa ilalim ng password';

  @override
  String get protectEmptyBody =>
      'Hindi na magbubukas ang PDF nang walang password na iyong pinili. Panatilihin ito: hindi ito mababawi.';

  @override
  String get protectSubtitle => 'Ie-encrypt sa 256-bit AES';

  @override
  String get protectPassword => 'Password';

  @override
  String get protectConfirmPassword => 'Kumpirmahin ang password';

  @override
  String get protectShowPasswords => 'Ipakita ang mga password';

  @override
  String get protectHidePasswords => 'Itago ang mga password';

  @override
  String get protectMismatch => 'Magkaiba ang dalawang password.';

  @override
  String get protectWarning =>
      'Isulat ito sa isang lugar: kung wala ito, ang dokumento ay magiging permanenteng hindi mabasa. Walang posibleng pagbawi, ni sa iyo o sa pamamagitan ng application.';

  @override
  String get protectAlreadyProtected =>
      'Protektado na ang file na ito — gamitin muna ang Unlock PDF.';

  @override
  String get protectProgress => 'Kasalukuyang isinasagawa ang proteksyon…';

  @override
  String protectFailed(String detail) {
    return 'Nabigo ang proteksyon: $detail';
  }

  @override
  String get protectAction => 'Protektahan';

  @override
  String get protectResultTitle => 'Protektadong PDF';

  @override
  String get protectResultDetail =>
      'Naka-encrypt sa AES 256 bits. Kakailanganin mo ang password para mabuksan ito.';

  @override
  String get protectExportWhat => 'PDF na protektado ng password';

  @override
  String get unlockEmptyTitle => 'Alisin ang password';

  @override
  String get unlockEmptyBody =>
      'Kailangan mo ang kasalukuyang password para sa dokumento. Kapag naalis na, malayang magbubukas ang PDF.';

  @override
  String get unlockAcceptsProtectedPdf => 'Protektadong PDF';

  @override
  String get unlockChooseProtectedPdf => 'Pumili ng protektadong PDF';

  @override
  String get unlockCurrentPassword => 'Kasalukuyang password';

  @override
  String get unlockWrongPassword => 'Maling password.';

  @override
  String get unlockProgress => 'Kasalukuyang ina-unlock…';

  @override
  String unlockFailed(String detail) {
    return 'Nabigong i-unlock: $detail';
  }

  @override
  String get unlockAction => 'I-unlock';

  @override
  String get repairEmptyTitle => 'Ayusin ang isang nasirang file';

  @override
  String get repairEmptyBody =>
      'Ang panloob na istraktura ng isang nasirang PDF ay muling itinayo. Kung ano ang maililigtas ay magiging maililigtas.';

  @override
  String get repairProgress => 'Kasalukuyang isinasagawa ang pag-aayos…';

  @override
  String get repairFailed =>
      'Ang file na ito ay hindi maaaring ayusin - ito ay maaaring masyadong nasira.';

  @override
  String get repairAction => 'Ayusin';

  @override
  String get pdfToWordEmptyTitle => 'Isang nae-edit na Salita';

  @override
  String get pdfToWordEmptyBody =>
      'Ang teksto at istraktura ng PDF ay inilipat sa isang .docx na dokumento na maaari mong muling buksan at itama.';

  @override
  String get pdfToWordAnalyzing => 'Pagsusuri ng dokumento…';

  @override
  String get pdfToWordAnalysisPending => 'Nakabinbin ang pagsusuri';

  @override
  String pdfToWordAnalysisFailed(String detail) {
    return 'Hindi ma-scan: $detail';
  }

  @override
  String get pdfLocked =>
      'Pinoprotektahan ng password ang PDF na ito. I-unlock muna ito.';

  @override
  String get pdfToWordConverting => 'Kino-convert sa Word...';

  @override
  String get pdfToWordSummaryTitle => 'Natukoy ang nilalaman';

  @override
  String pdfToWordParagraphCount(int count) {
    return '$count mga talata';
  }

  @override
  String pdfToWordHeadingCount(int count) {
    return '$count mga pamagat';
  }

  @override
  String pdfToWordTableCount(int count) {
    return '$count mga talahanayan';
  }

  @override
  String get pdfToWordNoTables =>
      'Walang nakitang mga talahanayan: kung naglalaman ang iyong PDF ng anuman, ang mga linya nito ay mako-convert sa mga talata.';

  @override
  String get pdfToWordCaveat =>
      'Kinukuha ng conversion ang teksto, pag-format, at mga talahanayan, ngunit hindi ang eksaktong layout: ang posisyon ng mga imahe at column ay hindi pinapanatili, at ang mga larawan ay hindi kasama sa dokumento ng Word.';

  @override
  String get pdfToWordScanWarning =>
      'Mukhang isang scan ang PDF na ito: walang nakitang text. Gamitin muna ang Searchable Text (OCR) tool, pagkatapos ay bumalik at i-convert ang resultang PDF.';

  @override
  String get pdfToWordResultTitle => 'Handa na ang dokumento ng salita';

  @override
  String pdfToWordResultDetail(String name, String size) {
    return '$name — $size';
  }

  @override
  String get pdfToWordExportWhat => 'Word na dokumento';

  @override
  String get pdfToWordConvertAction => 'I-convert sa Word';

  @override
  String get actionConvertAgain => 'Mag-convert muli';

  @override
  String errorSaveFailed(String detail) {
    return 'Hindi makapagrehistro: $detail';
  }

  @override
  String get rectoVersoIntro =>
      'Ang isang single-sided feeder ay gumagawa ng dalawang file: kakaibang mga pahina sa pagkakasunud-sunod, kahit na mga pahina ay madalas sa reverse order. Piliin ang dalawa para i-recompose ang mga ito.';

  @override
  String get rectoVersoOddSlot => 'Odd Pages File (Single sided)';

  @override
  String get rectoVersoEvenSlot => 'Even pages file (likod)';

  @override
  String get rectoVersoReversed => 'Ang pangalawang file ay nasa reverse order';

  @override
  String get rectoVersoReversedHint =>
      'Ito ang pinakakaraniwang kaso, na nasuri bilang default';

  @override
  String rectoVersoPreview(int count) {
    return 'Pangkalahatang-ideya ng interleaving ($count na mga pahina)';
  }

  @override
  String get rectoVersoProgress => 'Isinasagawa ang interleading...';

  @override
  String fileWithPageCount(String name, int count) {
    return '$name · $count na mga pahina';
  }

  @override
  String get actionPreviewAndExport => 'I-preview at i-export';

  @override
  String errorOpenFailedShort(String detail) {
    return 'Hindi mabuksan: $detail';
  }

  @override
  String errorGeneric(String detail) {
    return 'Nabigo: $detail';
  }

  @override
  String get actionConvertToPdf => 'I-convert sa PDF';

  @override
  String get convertProgress => 'Kasalukuyang ginagawa ang conversion...';

  @override
  String get excelEmptyTitle => 'Isang PDF workbook';

  @override
  String get excelEmptyBody =>
      'Ang mga sheet sa isang .xlsx file ay nagiging mga PDF page, handa nang ipadala o i-print.';

  @override
  String get excelChooseWorkbook => 'Pumili ng binder';

  @override
  String get excelChooseXlsx => 'Pumili ng .xlsx workbook';

  @override
  String get excelLegacyFormat =>
      'Ang .xls na format (lumang Excel binary format) ay hindi suportado. I-save ang file bilang .xlsx pagkatapos ay subukang muli.';

  @override
  String get excelWrongFormat => 'Mangyaring pumili ng Excel .xlsx workbook.';

  @override
  String excelUnreadable(String detail) {
    return 'Hindi nababasa na folder: $detail';
  }

  @override
  String excelSheetsAndRows(int sheets, int rows) {
    return '$sheets sheets · $rows row sa kabuuan';
  }

  @override
  String get excelSheetsDetected => 'Natukoy ang mga dahon';

  @override
  String get excelEmptySheet => 'Walang laman na sheet';

  @override
  String excelSheetDimensions(int rows, int columns) {
    return '$rows row × $columns columns';
  }

  @override
  String get excelRepeatHeader => 'Ulitin ang linya ng header sa bawat pahina';

  @override
  String get excelRepeatHeaderHint =>
      'Ang unang hilera ng sheet ay muling iginuhit sa tuktok ng bawat pahina ng talahanayan.';

  @override
  String get excelCaveat =>
      'Ano ang kailangan ng conversion: ang text ng mga cell habang ito ay naka-save sa file (kabilang ang huling kinakalkula na resulta ng mga formula), ang unang bold na linya at isang grid.\n\nAno ang hindi kasama: mga kulay, mga font, mga format ng numero, pinagsamang mga cell, mga larawan, mga graphics at ang mga formula mismo. Ang mga column ay binabawasan upang magkasya sa lapad ng pahina; sa napakalapad na mga sheet, ang teksto sa mga cell na masyadong makitid ay pinuputol ng \"...\".';

  @override
  String get pptxEmptyTitle => 'Isang presentasyon sa PDF';

  @override
  String get pptxEmptyBody =>
      'Isang 16:9 na landscape page bawat slide, kasama ang pamagat at mga bala. Ang teksto ay paulit-ulit; ang mga orihinal na larawan, hugis at background ay hindi.\n\nTinanggap na format: .pptx. Ang isang lumang .ppt file ay dapat munang i-save bilang .pptx mula sa PowerPoint.';

  @override
  String get pptxChoosePresentation => 'Pumili ng isang pagtatanghal';

  @override
  String get pptxTextOnlyTitle => 'Conversion ng text lang';

  @override
  String get pptxTextOnlyBody =>
      'Ang teksto ng bawat slide ay paulit-ulit. Ang mga orihinal na larawan, hugis, background, kulay at layout ay hindi pinapanatili: ang resultang PDF ay isang simple, nababasang layout, hindi isang tapat na kopya ng iyong presentasyon.';

  @override
  String pptxSlideCount(int count) {
    return '$count mga slide';
  }

  @override
  String get pptxSlidesDetected => 'May nakitang mga slide';

  @override
  String pptxMoreSlides(int count) {
    return 'at $count iba pang mga slide...';
  }

  @override
  String get pptxUntitledSlide => 'Walang pamagat';

  @override
  String get pptxEmptySlide => 'Walang teksto (larawan o hugis lamang)';

  @override
  String pptxTextLineCount(int count) {
    return '$count mga linya ng teksto';
  }

  @override
  String pptxReadFailed(String detail) {
    return 'Hindi mabasa: $detail';
  }

  @override
  String get compressLevelLight => 'Liwanag';

  @override
  String get compressLevelMedium => 'Katamtaman';

  @override
  String get compressLevelStrong => 'Forte';

  @override
  String get pptxQualityStandard => 'Karaniwan (150 dpi)';

  @override
  String get pptxQualityHigh => 'Mataas (220 dpi)';

  @override
  String get pdfToExcelEmptyTitle => 'Kunin ang mga talahanayan';

  @override
  String get pdfToExcelEmptyBody =>
      'Ang mga talahanayan mula sa isang PDF ay kinukuha sa isang Excel workbook. Ang pag-format ay hindi napanatili, ang mga halaga ay.';

  @override
  String pdfToExcelPagesAnalyzed(int count) {
    return '$count na mga pahina ang nasuri';
  }

  @override
  String pdfToExcelAnalysisFailed(String detail) {
    return 'Imposible ang pagsusuri. Ang PDF ay maaaring protektado ng password o nasira. ($detail)';
  }

  @override
  String get pdfToExcelNothingToExport =>
      'Walang i-export: walang nakitang talahanayan.';

  @override
  String get pdfToExcelBuilding => 'Ginagawa ang workbook...';

  @override
  String get pdfToExcelIncludeParagraphs =>
      'Isama rin ang teksto sa labas ng mga talahanayan (isang linya bawat talata)';

  @override
  String get pdfToExcelIncludeParagraphsHint =>
      'Kapaki-pakinabang para sa isang semi-structured na dokumento: ang teksto ay inilalagay sa column A, pagkatapos ng mga talahanayan sa pahina.';

  @override
  String get pdfToExcelCaveatTitle =>
      'Ano ang hindi pinapanatili ng conversion';

  @override
  String get pdfToExcelCaveat =>
      'Ang pagtuklas ay batay sa posisyon ng teksto sa pahina: ang mga talahanayan na walang regular na hangganan, pinagsamang mga cell at napaka-irregular na mga haligi ay maaaring hindi maganda ang pagputol. Ang isang na-scan na PDF (larawan) ay walang nae-extract na text at wala itong ibibigay. Ang mga kulay, formula at larawan ay hindi kailanman kasama: ang mga halaga ng teksto lamang ang.';

  @override
  String pdfToExcelTablesFound(int tables, int pages) {
    return '$tables na mga talahanayan ang nakita sa $pages na mga pahina';
  }

  @override
  String pdfToExcelPagesConcerned(String pages) {
    return 'Mga apektadong pahina: $pages';
  }

  @override
  String pdfToExcelParagraphsOutside(int count) {
    return '$count mga talata sa labas ng mga talahanayan';
  }

  @override
  String get pdfToExcelScannedWarning =>
      'Walang text na maaaring makuha mula sa PDF na ito: ito ay malamang na isang na-scan na dokumento (mga larawan ng pahina). Walang makukuha ang isang spreadsheet dito; gamitin muna ang text recognition (OCR) tool.';

  @override
  String get pdfToExcelNoTableWarning =>
      'Walang istraktura ng talahanayan ang nakilala sa dokumentong ito. Ang teksto ay naroroon, ngunit hindi ito nakaayos sa mga regular na hanay. Sa halip na gumawa ng hindi nababasang workbook, i-enable ang \"Isama rin ang text na hindi talahanayan\" sa itaas, o gamitin ang \"PDF to Word\" na mas pinapanatili ang mga talata.';

  @override
  String get pdfToExcelResultTitle => 'Handa na ang binder';

  @override
  String get pdfToExcelExportWhat => 'Excel workbook';

  @override
  String get pdfToExcelConvertAction => 'I-convert sa Excel';

  @override
  String resultNameAndSize(String name, String size) {
    return '$name — $size';
  }

  @override
  String get pdfToPptxEmptyTitle => 'Isang slide bawat pahina';

  @override
  String get pdfToPptxEmptyBody =>
      'Ang PDF ay nagiging magkaparehong PowerPoint presentation. Dumarating ang bawat pahina sa anyo ng isang imahe: ang layout ay tapat, ngunit ang teksto ay hindi mae-edit sa PowerPoint.';

  @override
  String pdfToPptxOpenFailed(String detail) {
    return 'Hindi mabuksan ang PDF na ito: $detail';
  }

  @override
  String get pdfToPptxConverting => 'Kino-convert sa PowerPoint…';

  @override
  String pdfToPptxPagesToSlides(int count) {
    return '$count na mga pahina > $count na mga slide';
  }

  @override
  String get pdfToPptxEmptyDocument => 'Walang laman na dokumento';

  @override
  String get qualityLabel => 'Kalidad';

  @override
  String get pdfToPptxQualityHint =>
      'Ang isang mas mataas na resolution ay nagreresulta sa mas matalas na mga slide ngunit isang makabuluhang mas malaking file.';

  @override
  String pdfToPptxHeavyWarning(int count) {
    return 'Babala: sa mataas na kalidad, ang isang presentasyon ng $count na mga pahina ay maaaring tumimbang ng ilang sampu-sampung MB at magtagal upang mabuksan. Piliin ang Standard kapag may pagdududa.';
  }

  @override
  String get goodToKnow => 'Namely';

  @override
  String get pdfToPptxCaveat =>
      'Ang bawat slide ay isang imahe ng pahina: ang layout ay kapareho ng PDF, ngunit ang teksto ay hindi mae-edit sa PowerPoint.\nPara kunin ang nae-edit na text, gamitin na lang ang “PDF to Word”.\nAng isang presentasyon ay mayroon lamang isang slide format: ito ay kinuha mula sa unang pahina, at mga pahina ng iba\'t ibang mga format ay nakasentro sa loob nito.';

  @override
  String get pdfToPptxResultTitle => 'Handa na ang pagtatanghal';

  @override
  String pdfToPptxResultDetail(
    String name,
    int count,
    String size,
    String quality,
  ) {
    return '$name — $count slides · $size · $quality';
  }

  @override
  String get notSavedYet =>
      'Ang file ay wala pa sa iyong device: i-save ito o ibahagi ito.';

  @override
  String get pdfToPptxChangeQuality => 'Baguhin ang kalidad';

  @override
  String get pdfToPptxConvertAction => 'I-convert sa PowerPoint';

  @override
  String pdfToPptxExportWhat(int count) {
    return 'PowerPoint presentation · $count na mga slide';
  }

  @override
  String get formatLabel => 'Format';

  @override
  String get actionExport => 'I-export';

  @override
  String get imageQualityWeb => 'Web (72 dpi)';

  @override
  String get imageQualityStandard => 'Karaniwan (150 dpi)';

  @override
  String get imageQualityHigh => 'Mataas na kalidad (300 dpi)';

  @override
  String get pdfToImagesEmptyTitle => 'Isang larawan bawat pahina';

  @override
  String get pdfToImagesEmptyBody =>
      'Pumili ng isang PDF: lalabas ang bawat pahina bilang isang imahe, sa kahulugan na iyong isinasaayos.';

  @override
  String pdfToImagesNotAPdf(String name) {
    return '$name: Mangyaring pumili ng PDF file.';
  }

  @override
  String errorLoadFailed(String detail) {
    return 'Nabigong mag-load: $detail';
  }

  @override
  String get pdfToImagesProgress =>
      'Kasalukuyang isinasagawa ang pag-export...';

  @override
  String pdfToImagesExportWhat(int count, String format) {
    return '$count mga larawan $format';
  }

  @override
  String get pdfaEmptyTitle => 'I-archive nang mahabang panahon';

  @override
  String get pdfaEmptyBody =>
      'Ang PDF/A ay ang format ng pag-archive na kinakailangan ng maraming administrasyon. Ang dokumento ay na-convert nang hindi nawawala ang hitsura nito.';

  @override
  String get pdfaConformanceLevel => 'Antas ng pagsunod';

  @override
  String get pdfaA1bDetail =>
      'Ang pinakamahigpit at pinaka-tinatanggap na antas. Pumili kapag may pagdududa.';

  @override
  String get pdfaA2bDetail =>
      'Batay sa PDF 1.7: mas mahusay na compression, bahagyang mas magaan na mga file.';

  @override
  String get pdfaA3bDetail =>
      'Tulad ng A-2b, ngunit pinapayagan ang mga attachment (kadalasang hinihiling para sa electronic invoicing).';

  @override
  String pdfaConvertingTo(String level) {
    return 'Conversion sa $level…';
  }

  @override
  String get pdfaCaveatTitle => 'Ano ang pagbabago ng conversion';

  @override
  String pdfaCaveat(int dpi) {
    return 'Ang bawat pahina ay muling iginuhit bilang isang imahe sa $dpi dpi: ang teksto ay nagiging isang imahe, ang layout ay nagyelo. Ito ang dahilan kung bakit ang file ay tunay na sumusunod nang hindi umaasa sa mga font ng orihinal na dokumento, ngunit bilang kapalit ang teksto ay hindi na mapipili o mahahanap, ang mga link at mga form ay nawawala, at ang file ay nagiging mas mabigat.';
  }

  @override
  String pdfaOpenFailed(String detail) {
    return 'Hindi mabuksan ang PDF na ito: $detail';
  }

  @override
  String get imagesToPdfEmptyTitle => 'Mga larawan, isang PDF';

  @override
  String get imagesToPdfEmptyBody =>
      'JPG, PNG, WebP, HEIC — idagdag ang iyong mga larawan at ang mga ito ay bubuuin sa pagkakasunud-sunod na iyong pinili.';

  @override
  String get imagesToPdfChoose => 'Pumili ng mga larawan';

  @override
  String get imagesToPdfAdd => 'Magdagdag ng mga larawan';

  @override
  String imagesToPdfRejected(String names) {
    return 'Nilaktawan (hindi isang larawan): $names';
  }

  @override
  String get imagesToPdfBuilding => 'Ginagawa ang PDF...';

  @override
  String imagesToPdfBuildFailed(String detail) {
    return 'Nabigo ang paggawa: $detail';
  }

  @override
  String imagesToPdfCreateAction(int count) {
    return 'Lumikha ng PDF ($count na mga larawan)';
  }

  @override
  String get actionRotate => 'Iikot';

  @override
  String get actionRemove => 'Mag-withdraw';

  @override
  String get htmlTitle => 'HTML / web page sa PDF';

  @override
  String get htmlIntro =>
      'I-transform ang isang web page o HTML code sa A4 PDF. Ang pag-render ay isinasagawa ng browser na isinama sa Android, samakatuwid ang layout ay ang pag-print mula sa Chrome.';

  @override
  String get htmlModeUrl => 'Address ng website';

  @override
  String get htmlModeCode => 'HTML code';

  @override
  String get htmlUrlLabel => 'Address ng page';

  @override
  String get htmlUrlHint => 'https://example.fr/article';

  @override
  String get htmlCodeLabel => 'HTML code';

  @override
  String get htmlCodeHint => '<h1>Pamagat</h1>\n<p>Text...</p>';

  @override
  String get htmlUrlBadScheme =>
      'Ang address ay dapat magsimula sa http:// o https://.';

  @override
  String get htmlUrlIncomplete => 'Maglagay ng buong web address.';

  @override
  String get htmlCodeEmpty => 'I-paste ang HTML code para ma-convert.';

  @override
  String get htmlLoadingUrl => 'Nilo-load ang page at nagko-convert...';

  @override
  String get htmlConverting =>
      'Kasalukuyang ginagawa ang conversion ng HTML...';

  @override
  String get htmlNetworkNotice =>
      'Ang isang koneksyon sa internet ay kinakailangan: ito ay ang tanging tool sa application na dapat i-download ang pahina. Maaaring lumabas na hindi kumpleto ang mga page na nangangailangan ng pag-log in sa account, cookie banner, o maraming JavaScript.';

  @override
  String get htmlOfflineNotice =>
      'Ang HTML at CSS na direktang nakasulat sa pahina ay nai-render offline. Sa kabilang banda, ang mga imahe, style sheet o font na tinatawag ng isang panlabas na web address ay nangangailangan ng koneksyon sa internet.';

  @override
  String get watermarkEmptyTitle => 'Magdagdag ng watermark';

  @override
  String get watermarkEmptyBody =>
      'Ang teksto na iyong pinili ay inuulit sa background sa lahat ng mga pahina — upang markahan ang isang dokumento bilang kumpidensyal o draft.';

  @override
  String get watermarkEmptyNote =>
      'Libreng pag-export na walang limitasyon sa bilang.';

  @override
  String get watermarkTextLabel => 'Teksto ng watermark';

  @override
  String get watermarkDefaultText => 'KUMPIDENSYAL';

  @override
  String get watermarkNeedText => 'Maglagay ng text para sa watermark.';

  @override
  String watermarkOpacity(int percent) {
    return 'Opacity: $percent %';
  }

  @override
  String watermarkRotation(int degrees) {
    return 'Anggulo ng pag-ikot: $degrees°';
  }

  @override
  String watermarkFontSize(int points) {
    return 'Laki ng teksto: $points pt';
  }

  @override
  String get watermarkColor => 'Kulay';

  @override
  String get colorGrey => 'Gray';

  @override
  String get colorRed => 'Pula';

  @override
  String get colorBlue => 'Asul';

  @override
  String get colorBlack => 'Itim';

  @override
  String get watermarkProgress =>
      'Kasalukuyang isinasagawa ang application ng watermark...';

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
  String get pageNumbersEmptyTitle => 'Lagyan ng numero ang mga pahina';

  @override
  String get pageNumbersEmptyBody =>
      'Pumili ng PDF, pagkatapos ay ang posisyon at format ng mga numero na idaragdag sa bawat pahina.';

  @override
  String get positionLabel => 'Posisyon';

  @override
  String get positionBottomCenter => 'gitnang ibaba';

  @override
  String get positionBottomRight => 'kanang ibaba';

  @override
  String get positionTopCenter => 'Nangungunang gitna';

  @override
  String get positionTopRight => 'kanang itaas';

  @override
  String get pageNumbersFormatPlain => 'N';

  @override
  String get pageNumbersFormatOfTotal => 'N / kabuuan';

  @override
  String get pageNumbersStart => 'Panimulang numero';

  @override
  String get pageNumbersProgress => 'Kasalukuyang binibilang...';

  @override
  String get organizeEmptyTitle => 'Ipagpatuloy ang isang PDF sa kamay';

  @override
  String get organizeEmptyBody =>
      'Magbukas ng dokumento para hatiin ito, kunin ang mga pahina, o baguhin ang pagkakasunud-sunod.';

  @override
  String get organizeOpenFile => 'Magbukas ng file';

  @override
  String get organizeNothingToExport => 'Walang mga page na ie-export.';

  @override
  String organizePagesKept(int kept, int total) {
    return '$kept na pahina ang napanatili sa $total';
  }

  @override
  String get organizePageExcluded => 'Itinapon';

  @override
  String organizePageMoved(int from) {
    return 'Inilipat mula sa posisyon $from';
  }

  @override
  String organizePageTitle(int number) {
    return 'Pahina $number';
  }

  @override
  String organizeExcludePage(int number) {
    return 'Itapon ang pahina $number';
  }

  @override
  String organizeIncludePage(int number) {
    return 'Isama ang pahina $number';
  }

  @override
  String organizeMovePage(int number) {
    return 'Ilipat ang pahina $number';
  }

  @override
  String get organizeExtract => 'I-extract';

  @override
  String get organizeSplit => 'hatiin';

  @override
  String get organizePreview => 'Silipin';

  @override
  String get organizeExtractTitle => 'Mag-extract ng hanay ng page';

  @override
  String organizeRangeLabel(int start, int end) {
    return 'Mga pahina $start hanggang $end';
  }

  @override
  String get organizeSplitTitle => 'Hatiin sa maraming file';

  @override
  String organizeFileCount(int count) {
    return '$count na mga file';
  }

  @override
  String organizeSplitFailed(String detail) {
    return 'Pagkabigo ng dibisyon: $detail';
  }

  @override
  String get scanNoCamera => 'Walang available na camera sa device na ito.';

  @override
  String scanCameraFailed(String detail) {
    return 'Hindi masimulan ang camera: $detail';
  }

  @override
  String get scanCropToolbar => 'Ayusin';

  @override
  String scanCaptureFailed(String detail) {
    return 'Nabigo ang pagkuha: $detail';
  }

  @override
  String get scanPermissionBody =>
      'Ang pag-access sa camera ay kinakailangan upang mag-scan ng isang dokumento.';

  @override
  String get scanGrantPermission => 'Payagan ang camera';

  @override
  String get actionRetry => 'Subukan muli';

  @override
  String get scanNoPageYet => 'Walang mga pahina sa ngayon.';

  @override
  String scanFinishAction(int count) {
    return 'Tapusin · $count';
  }

  @override
  String get signTitle => 'Pumirma ng PDF';

  @override
  String get signIntro =>
      'Idagdag ang iyong hand-drawn signature sa isang page ng isang PDF. Ito ay isang simpleng pagguhit na idinagdag sa dokumento, hindi isang sertipikadong electronic signature.';

  @override
  String get signChooseSubtitle => 'Piliin ang dokumentong pipirmahan';

  @override
  String get signPickPage => 'Piliin ang pahinang pipirmahan.';

  @override
  String get signDrawTitle => 'Iguhit ang aking lagda';

  @override
  String get signDrawBody =>
      'Gumuhit gamit ang iyong daliri tulad ng sa papel. Naglalagay ito ng disenyo sa page — hindi ito isang sertipikadong electronic signature.';

  @override
  String get signNeedDrawing => 'Gumuhit ng lagda bago magpatuloy.';

  @override
  String get signClear => 'Para burahin';

  @override
  String get signValidate => 'Upang patunayan';

  @override
  String get signPlaceBody =>
      'I-drag ang lagda sa gustong lokasyon sa page, pagkatapos ay tapikin ang Tapos.';

  @override
  String get signPageUnavailable => 'Hindi maipakita ang pahina.';

  @override
  String get signProgress => 'Idinaragdag ang lagda...';

  @override
  String get editTitle => 'Mag-annotate ng isang dokumento';

  @override
  String get editEmptyBody =>
      'Magdagdag ng teksto o i-highlight ang mga sipi nang direkta sa isang umiiral nang PDF.';

  @override
  String get editAddTextTitle => 'Magdagdag ng teksto';

  @override
  String get editTextHint => 'Iyong text';

  @override
  String editFontSize(int size) {
    return 'Laki ng text: $size';
  }

  @override
  String get editNeedAnnotation =>
      'Magdagdag ng kahit isang anotasyon bago matapos.';

  @override
  String get editProgress => 'Paglalapat ng mga anotasyon...';

  @override
  String get editChooseOther => 'Pumili ng isa pang PDF';

  @override
  String get editUndoTooltip => 'I-undo ang huling anotasyon';

  @override
  String get editModeText => 'Text';

  @override
  String get editModeHighlight => 'I-highlight';

  @override
  String get editPageUnavailable => 'Hindi maipakita ang pahinang ito.';

  @override
  String get ocrEmptyTitle => 'Gawing nahahanap ang teksto';

  @override
  String get ocrEmptyBody =>
      'Ang teksto ng isang na-scan na PDF ay kinikilala at idinagdag sa ibabaw ng larawan, nang hindi nakikita. Ang pahina ay hindi nagbabago ng hitsura.';

  @override
  String get ocrWrongFormat => 'Pumili ng PDF o isang imahe (JPG, PNG, atbp.).';

  @override
  String get ocrProgress => 'Kasalukuyang ginagawa ang pagkilala…';

  @override
  String ocrFailed(String detail) {
    return 'Nabigong makilala: $detail';
  }

  @override
  String get ocrRunAction => 'Simulan ang pagkilala';

  @override
  String get ocrResultTitle => 'Resulta ng OCR';

  @override
  String ocrResultBody(int count) {
    return '$count na mga pahina ang nasuri. Ang mahahanap na PDF ay handa na, at maaari mo ring kopyahin ang lahat ng kinikilalang teksto.';
  }

  @override
  String get ocrCopyText => 'Kopyahin ang text';

  @override
  String get ocrTextCopied => 'Kinopya ang text.';

  @override
  String get redactIntro =>
      'Permanenteng itago ang mga bahagi ng isang PDF (mga pangalan, address, halaga). Hindi tulad ng isang simpleng itim na parihaba na inilagay sa itaas, ang nakatagong teksto ay talagang tinatanggal mula sa file, hindi lamang sakop: hindi na ito mapipili o makopya.';

  @override
  String get redactChooseSubtitle => 'Piliin ang dokumentong ire-redact';

  @override
  String get redactCaveat =>
      'Pakitandaan: upang alisin ang nakatagong teksto, ang bawat pahina ng dokumento ay kino-convert sa isang imahe (200 ppi). Ang resulta ay hindi na isang PDF kung saan maaaring piliin ang teksto, at ang resultang file ay karaniwang mas mabigat kaysa sa orihinal.';

  @override
  String get redactEmptyPdf =>
      'Ang PDF na ito ay hindi naglalaman ng anumang mga pahina.';

  @override
  String redactOpenFailed(String detail) {
    return 'Hindi mabuksan ang PDF na ito (maaaring protektado ito ng password): $detail';
  }

  @override
  String redactPageRenderFailed(int number, String detail) {
    return 'Hindi maipakita ang pahina ng $number: $detail';
  }

  @override
  String get redactUndoTooltip => 'I-undo ang huling zone';

  @override
  String get redactInstructions =>
      'I-drag ang iyong daliri sa buong page para gumuhit ng lugar na itatago. Aalisin talaga sa file ang sakop na text, hindi lang sakop.';

  @override
  String get redactPagePrevious => 'Nakaraang pahina';

  @override
  String get redactPageNext => 'Susunod na pahina';

  @override
  String redactPager(int current, int total) {
    return 'Pahina $current / $total';
  }

  @override
  String get redactNoZone => 'Walang plotted area';

  @override
  String redactZoneCount(int count) {
    return '$count mga lugar na itatago';
  }

  @override
  String get redactOtherPdf => 'Iba pang PDF';

  @override
  String get redactAction => 'I-redact';

  @override
  String get redactProgress => 'Kasalukuyang isinasagawa ang redaction...';

  @override
  String get cropEmptyTitle => 'I-crop ang mga margin';

  @override
  String get cropEmptyBody =>
      'Pumili ng PDF, pagkatapos ay i-drag ang iyong daliri sa buong preview upang balangkasin ang lugar na gusto mong panatilihin.';

  @override
  String get cropTooSmall => 'Masyadong maliit ang napiling lugar.';

  @override
  String get cropProgress => 'Kasalukuyang ginagawa ang pag-trim…';

  @override
  String cropFailed(String detail) {
    return 'Nabigo ang pag-trim: $detail';
  }

  @override
  String get cropKeptArea => 'Conserved na lugar';

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
  String get cropFullPage => 'Buong pahina';

  @override
  String get cropAllPages => 'Mag-apply sa lahat ng page';

  @override
  String get cropAllPagesOn => 'Ang parehong lugar ay pinutol sa bawat pahina.';

  @override
  String get cropAllPagesOff =>
      'Ang pahina 1 lamang ang na-crop, ang iba ay pinananatiling buo.';

  @override
  String get cropCaveat =>
      'Ang pag-crop ay binabawasan ang laki ng pahina: ang nilalaman sa labas ng lugar ay hindi na ipinapakita o naka-print.';

  @override
  String get cropAction => 'I-crop';

  @override
  String get compareTitle => 'Paghambingin ang dalawang PDF';

  @override
  String get compareEmptyTitle => 'Ano ang nagbago';

  @override
  String get compareEmptyBody =>
      'Pumili ng dalawang bersyon ng parehong PDF. Ang mga idinagdag at tinanggal na mga sipi ay ilalagay sa tabi ng bawat isa, bawat pahina.';

  @override
  String get compareSlotA => 'File A';

  @override
  String get compareSlotB => 'File B';

  @override
  String get compareAction => 'Ikumpara';

  @override
  String get compareProgress => 'Kasalukuyang pinaghahambing…';

  @override
  String compareFailed(String detail) {
    return 'Nabigo ang paghahambing: $detail';
  }

  @override
  String compareChangedPages(int changed, int total) {
    return '$changed na mga page ay naiiba sa $total';
  }

  @override
  String get compareNoDifference =>
      'Walang nakitang pagkakaiba sa pagitan ng dalawang file.';

  @override
  String comparePageHeading(int number) {
    return 'Pahina $number';
  }

  @override
  String organizeFilesCreated(int count) {
    return '$count na mga file ang ginawa';
  }

  @override
  String organizePartTitle(int number) {
    return 'Bahagi $number';
  }
}
