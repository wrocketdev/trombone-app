// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class LEn extends L {
  LEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Trombone — PDF, Scan & Word';

  @override
  String get appWordmark => 'Trombone';

  @override
  String get actionSave => 'Save';

  @override
  String get actionShare => 'Share';

  @override
  String get actionCompress => 'Compress';

  @override
  String get actionDone => 'Done';

  @override
  String get actionCancel => 'Cancel';

  @override
  String get actionChange => 'Change';

  @override
  String get actionContinue => 'Continue';

  @override
  String get actionOpening => 'Opening…';

  @override
  String get actionRemoveFile => 'Remove this file';

  @override
  String get progressPreparing => 'Preparing…';

  @override
  String progressPercent(int percent) {
    return '$percent%';
  }

  @override
  String get emptyReassurance => 'Free export, no watermark, no limit.';

  @override
  String get emptyAcceptedFormats => 'Accepted formats';

  @override
  String get exportSavedTitle => 'It’s saved.';

  @override
  String get exportSavedBody =>
      'Under the name and in the folder you just chose. No watermark, no limit, nothing to unlock.';

  @override
  String get exportSaveDialogTitle => 'Save PDF';

  @override
  String pageTileIncluded(int number) {
    return 'Page $number, included. Tap to leave it out.';
  }

  @override
  String pageTileExcluded(int number) {
    return 'Page $number, left out. Tap to include it.';
  }

  @override
  String pageTileRotate(int number) {
    return 'Rotate page $number';
  }

  @override
  String sectionHeaderSemantics(String title, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count tools',
      one: '$count tool',
    );
    return '$title, $_temp0';
  }

  @override
  String toolCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count tools',
      one: '$count tool',
    );
    return '$_temp0';
  }

  @override
  String get homePromise =>
      'Make your document, export it.\nNo wall at the end.';

  @override
  String get homeChipNoAccount => 'No account';

  @override
  String get homeChipNoWatermark => 'No watermark';

  @override
  String get homeChipUnlimited => 'Unlimited export';

  @override
  String get homeSearchTooltip => 'Search for a tool';

  @override
  String get homeColophon =>
      'Nothing unlocks for a fee when you go to save. Exporting is free, without a watermark, and without a cap on how many.';

  @override
  String get sectionFeatured => 'Featured';

  @override
  String get sectionToPdf => 'Into PDF';

  @override
  String get sectionFromPdf => 'Out of PDF';

  @override
  String get sectionSecurity => 'Security';

  @override
  String get sectionEdit => 'Edit';

  @override
  String get toolMerge => 'Merge';

  @override
  String get toolMergeKeywords =>
      'combine join assemble put together concatenate append';

  @override
  String get toolMergeSubtitle => 'PDFs, Word, images and text in one document';

  @override
  String get toolRectoVerso => 'Double-sided';

  @override
  String get toolRectoVersoKeywords =>
      'duplex interleave scan odd even both sides';

  @override
  String get toolRectoVersoSubtitle => 'Two scans, back in order';

  @override
  String get toolImagesToPdf => 'Images to PDF';

  @override
  String get toolImagesToPdfKeywords =>
      'photo jpg jpeg png photos album camera picture';

  @override
  String get toolImagesToPdfSubtitle =>
      'Photos and screenshots in one document';

  @override
  String get toolPdfToWord => 'PDF to Word';

  @override
  String get toolPdfToWordKeywords =>
      'docx word processor editable convert doc';

  @override
  String get toolPdfToWordSubtitle => 'Text and tables, editable';

  @override
  String get toolOrganize => 'Organise a PDF';

  @override
  String get toolOrganizeKeywords =>
      'split separate extract reorder order pages delete rearrange';

  @override
  String get toolOrganizeSubtitle => 'Split, extract, reorder';

  @override
  String get toolExcelToPdf => 'Excel to PDF';

  @override
  String get toolExcelToPdfKeywords =>
      'spreadsheet xlsx workbook sheet worksheet';

  @override
  String get toolPptxToPdf => 'PowerPoint to PDF';

  @override
  String get toolPptxToPdfKeywords => 'pptx slide presentation slides deck';

  @override
  String get toolHtmlToPdf => 'Web page to PDF';

  @override
  String get toolHtmlToPdfKeywords =>
      'html website internet url link article save page';

  @override
  String get toolScan => 'Scan a document';

  @override
  String get toolScanKeywords => 'camera photo digitise scan capture paper';

  @override
  String get toolPdfToExcel => 'PDF to Excel';

  @override
  String get toolPdfToExcelKeywords => 'spreadsheet xlsx table extract data';

  @override
  String get toolPdfToPptx => 'PDF to PowerPoint';

  @override
  String get toolPdfToPptxKeywords => 'pptx slide presentation slides deck';

  @override
  String get toolPdfToImages => 'PDF to Images';

  @override
  String get toolPdfToImagesKeywords =>
      'jpg png photo export screenshot picture';

  @override
  String get toolOcr => 'Searchable text (OCR)';

  @override
  String get toolOcrKeywords =>
      'recognition characters scanned copy select searchable';

  @override
  String get toolPdfA => 'Convert to PDF/A';

  @override
  String get toolPdfAKeywords => 'archive standard long term preservation iso';

  @override
  String get toolProtect => 'Protect PDF';

  @override
  String get toolProtectKeywords => 'password lock encrypt secure padlock';

  @override
  String get toolUnlock => 'Unlock PDF';

  @override
  String get toolUnlockKeywords =>
      'remove password open decrypt unprotect padlock';

  @override
  String get toolRepair => 'Repair PDF';

  @override
  String get toolRepairKeywords =>
      'corrupt unreadable damaged recover broken error';

  @override
  String get toolRedact => 'Redact a PDF';

  @override
  String get toolRedactKeywords =>
      'hide black out anonymise confidential erase censor';

  @override
  String get toolEdit => 'Edit PDF';

  @override
  String get toolEditKeywords => 'text modify correct annotate write add';

  @override
  String get toolSign => 'Sign';

  @override
  String get toolSignKeywords => 'signature initials contract handwritten';

  @override
  String get toolWatermark => 'Watermark';

  @override
  String get toolWatermarkKeywords =>
      'watermark stamp confidential draft mark overlay';

  @override
  String get toolPageNumbers => 'Page numbers';

  @override
  String get toolPageNumbersKeywords =>
      'pagination folio numbering numbers paginate';

  @override
  String get toolCrop => 'Crop a PDF';

  @override
  String get toolCropKeywords => 'trim margins crop edges size cut';

  @override
  String get toolCompare => 'Compare PDFs';

  @override
  String get toolCompareKeywords => 'difference versions diff changes compare';

  @override
  String get searchHint => 'Merge, password, watermark…';

  @override
  String get searchClear => 'Clear';

  @override
  String searchNoResultTitle(String query) {
    return 'No tool for “$query”.';
  }

  @override
  String get searchNoResultBody =>
      'Try the format you have to hand — “Word”, “Excel”, “photo” — or what you want to do with it: “sign”, “split”, “password”.';

  @override
  String get actionUndo => 'Undo';

  @override
  String get actionApply => 'Apply';

  @override
  String get actionChoose => 'Choose';

  @override
  String get actionChoosePdf => 'Choose a PDF';

  @override
  String get actionChooseFiles => 'Choose files';

  @override
  String get actionConvert => 'Convert';

  @override
  String get actionFinish => 'Finish';

  @override
  String get actionBack => 'Back';

  @override
  String get actionAdd => 'Add';

  @override
  String get noFileChosen => 'No file chosen';

  @override
  String errorExportFailed(String detail) {
    return 'Export failed: $detail';
  }

  @override
  String errorShareFailed(String detail) {
    return 'Sharing failed: $detail';
  }

  @override
  String errorOpenFailed(String detail) {
    return 'Could not open the file: $detail';
  }

  @override
  String errorConversionFailed(String detail) {
    return 'Conversion failed: $detail';
  }

  @override
  String errorOnFile(String name, String detail) {
    return '$name: $detail';
  }

  @override
  String get errorPickPdf => 'Please choose a PDF file.';

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
      other: '$count pages',
      one: '$count page',
    );
    return '$_temp0';
  }

  @override
  String pageCountOfTotal(int kept, int total) {
    String _temp0 = intl.Intl.pluralLogic(
      kept,
      locale: localeName,
      other: '$kept pages',
      one: '$kept page',
    );
    return '$_temp0 of $total';
  }

  @override
  String pageOfTotal(int current, int total) {
    return 'Page $current of $total';
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
  String get formatImages => 'Images';

  @override
  String get formatText => 'Text';

  @override
  String get mergeAddFile => 'Add a file';

  @override
  String get mergeAddHint => 'PDF, Word, images or text';

  @override
  String get mergeEmptyTitle => 'One single document';

  @override
  String get mergeEmptyBody =>
      'Add PDFs, Word files, images or text. You can reorder them and leave pages out before exporting.';

  @override
  String get mergeNeedOnePage =>
      'Add at least one file with a page to include.';

  @override
  String get mergeProgress => 'Merging…';

  @override
  String mergeFailed(String detail) {
    return 'Merge failed: $detail';
  }

  @override
  String mergeRemoved(String name) {
    return '$name removed.';
  }

  @override
  String mergeRemoveTooltip(String name) {
    return 'Remove $name';
  }

  @override
  String mergeMoveSemantics(String name) {
    return 'Move $name';
  }

  @override
  String get mergeRotateAll => 'Rotate every page';

  @override
  String mergePreviewAndExport(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count pages',
      one: '$count page',
    );
    return 'Preview and export ($_temp0)';
  }

  @override
  String previewTitle(String size) {
    return 'Preview · $size';
  }

  @override
  String previewZoomPage(int number) {
    return 'Page $number, enlarge';
  }

  @override
  String get previewPageUnreadable => 'Page unreadable.';

  @override
  String previewExportWhat(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count pages',
      one: '$count page',
    );
    return 'PDF · $_temp0';
  }

  @override
  String get compressTitle => 'Compression';

  @override
  String compressBody(String size) {
    return 'Current size: $size. Choose a level — the estimated size shows before you apply.';
  }

  @override
  String get compressEstimating => 'Estimating…';

  @override
  String get compressProgress => 'Compressing…';

  @override
  String compressFailed(String detail) {
    return 'Compression failed: $detail';
  }

  @override
  String get protectEmptyTitle => 'Put it behind a password';

  @override
  String get protectEmptyBody =>
      'The PDF will no longer open without the password you choose. Keep it: it cannot be recovered.';

  @override
  String get protectSubtitle => 'Will be encrypted with AES 256-bit';

  @override
  String get protectPassword => 'Password';

  @override
  String get protectConfirmPassword => 'Confirm password';

  @override
  String get protectShowPasswords => 'Show passwords';

  @override
  String get protectHidePasswords => 'Hide passwords';

  @override
  String get protectMismatch => 'The two passwords differ.';

  @override
  String get protectWarning =>
      'Write it down somewhere: without it the document becomes permanently unreadable. No recovery is possible, neither by you nor by the app.';

  @override
  String get protectAlreadyProtected =>
      'This file is already protected — use Unlock PDF first.';

  @override
  String get protectProgress => 'Protecting…';

  @override
  String protectFailed(String detail) {
    return 'Protection failed: $detail';
  }

  @override
  String get protectAction => 'Protect';

  @override
  String get protectResultTitle => 'PDF protected';

  @override
  String get protectResultDetail =>
      'Encrypted with AES 256-bit. The password will be needed to open it.';

  @override
  String get protectExportWhat => 'Password-protected PDF';

  @override
  String get unlockEmptyTitle => 'Remove the password';

  @override
  String get unlockEmptyBody =>
      'You need the document’s current password. Once removed, the PDF will open freely.';

  @override
  String get unlockAcceptsProtectedPdf => 'Protected PDF';

  @override
  String get unlockChooseProtectedPdf => 'Choose a protected PDF';

  @override
  String get unlockCurrentPassword => 'Current password';

  @override
  String get unlockWrongPassword => 'Wrong password.';

  @override
  String get unlockProgress => 'Unlocking…';

  @override
  String unlockFailed(String detail) {
    return 'Unlocking failed: $detail';
  }

  @override
  String get unlockAction => 'Unlock';

  @override
  String get repairEmptyTitle => 'Repair a damaged file';

  @override
  String get repairEmptyBody =>
      'The internal structure of a damaged PDF is rebuilt. Whatever can be recovered will be.';

  @override
  String get repairProgress => 'Repairing…';

  @override
  String get repairFailed =>
      'This file cannot be repaired — it may be too badly damaged.';

  @override
  String get repairAction => 'Repair';

  @override
  String get pdfToWordEmptyTitle => 'An editable Word file';

  @override
  String get pdfToWordEmptyBody =>
      'The text and structure of the PDF are carried over into a .docx document you can reopen and correct.';

  @override
  String get pdfToWordAnalyzing => 'Analysing the document…';

  @override
  String get pdfToWordAnalysisPending => 'Analysis pending';

  @override
  String pdfToWordAnalysisFailed(String detail) {
    return 'Analysis failed: $detail';
  }

  @override
  String get pdfLocked => 'This PDF is password-protected. Unlock it first.';

  @override
  String get pdfToWordConverting => 'Converting to Word…';

  @override
  String get pdfToWordSummaryTitle => 'Content found';

  @override
  String pdfToWordParagraphCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count paragraphs',
      one: '$count paragraph',
    );
    return '$_temp0';
  }

  @override
  String pdfToWordHeadingCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count headings',
      one: '$count heading',
    );
    return '$_temp0';
  }

  @override
  String pdfToWordTableCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count tables',
      one: '$count table',
    );
    return '$_temp0';
  }

  @override
  String get pdfToWordNoTables =>
      'No table found: if your PDF contains any, their rows will be converted into paragraphs.';

  @override
  String get pdfToWordCaveat =>
      'The conversion reproduces the text, the formatting and the tables, but not the exact layout: the position of images and columns is not preserved, and images are not carried into the Word document.';

  @override
  String get pdfToWordScanWarning =>
      'This PDF looks like a scan: no text was found. Use the Searchable text (OCR) tool first, then come back and convert the resulting PDF.';

  @override
  String get pdfToWordResultTitle => 'Word document ready';

  @override
  String pdfToWordResultDetail(String name, String size) {
    return '$name — $size';
  }

  @override
  String get pdfToWordExportWhat => 'Word document';

  @override
  String get pdfToWordConvertAction => 'Convert to Word';

  @override
  String get actionConvertAgain => 'Convert again';

  @override
  String errorSaveFailed(String detail) {
    return 'Could not save: $detail';
  }

  @override
  String get rectoVersoIntro =>
      'A single-sided feeder gives you two files: the odd pages in order, the even pages often in reverse. Choose both to put them back together.';

  @override
  String get rectoVersoOddSlot => 'File with the odd pages (front)';

  @override
  String get rectoVersoEvenSlot => 'File with the even pages (back)';

  @override
  String get rectoVersoReversed => 'The second file is in reverse order';

  @override
  String get rectoVersoReversedHint =>
      'This is the usual case, ticked by default';

  @override
  String rectoVersoPreview(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count pages',
      one: '$count page',
    );
    return 'Interleaving preview ($_temp0)';
  }

  @override
  String get rectoVersoProgress => 'Interleaving…';

  @override
  String fileWithPageCount(String name, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count pages',
      one: '$count page',
    );
    return '$name · $_temp0';
  }

  @override
  String get actionPreviewAndExport => 'Preview and export';

  @override
  String errorOpenFailedShort(String detail) {
    return 'Could not open: $detail';
  }

  @override
  String errorGeneric(String detail) {
    return 'Failed: $detail';
  }

  @override
  String get actionConvertToPdf => 'Convert to PDF';

  @override
  String get convertProgress => 'Converting…';

  @override
  String get excelEmptyTitle => 'A workbook as a PDF';

  @override
  String get excelEmptyBody =>
      'The sheets of an .xlsx file become PDF pages, ready to send or print.';

  @override
  String get excelChooseWorkbook => 'Choose a workbook';

  @override
  String get excelChooseXlsx => 'Choose an .xlsx workbook';

  @override
  String get excelLegacyFormat =>
      'The .xls format (the old binary Excel format) is not supported. Save the file as .xlsx and try again.';

  @override
  String get excelWrongFormat => 'Please choose an .xlsx Excel workbook.';

  @override
  String excelUnreadable(String detail) {
    return 'Workbook unreadable: $detail';
  }

  @override
  String excelSheetsAndRows(int sheets, int rows) {
    String _temp0 = intl.Intl.pluralLogic(
      sheets,
      locale: localeName,
      other: '$sheets sheets',
      one: '$sheets sheet',
    );
    String _temp1 = intl.Intl.pluralLogic(
      rows,
      locale: localeName,
      other: '$rows rows in total',
      one: '$rows row in total',
    );
    return '$_temp0 · $_temp1';
  }

  @override
  String get excelSheetsDetected => 'Sheets found';

  @override
  String get excelEmptySheet => 'Empty sheet';

  @override
  String excelSheetDimensions(int rows, int columns) {
    String _temp0 = intl.Intl.pluralLogic(
      rows,
      locale: localeName,
      other: '$rows rows',
      one: '$rows row',
    );
    String _temp1 = intl.Intl.pluralLogic(
      columns,
      locale: localeName,
      other: '$columns columns',
      one: '$columns column',
    );
    return '$_temp0 × $_temp1';
  }

  @override
  String get excelRepeatHeader => 'Repeat the header row on every page';

  @override
  String get excelRepeatHeaderHint =>
      'The first row of the sheet is redrawn at the top of every page of the table.';

  @override
  String get excelCaveat =>
      'What the conversion carries over: the cell text as stored in the file (including the last calculated result of formulas), the first row in bold, and a grid.\n\nWhat it does not: colours, fonts, number formats, merged cells, images, charts and the formulas themselves. Columns are shrunk to fit the page width; on very wide sheets, text in cells that are too narrow is truncated with “…”.';

  @override
  String get pptxEmptyTitle => 'A presentation as a PDF';

  @override
  String get pptxEmptyBody =>
      'One 16:9 landscape page per slide, carrying over the title and the bullets. The text is carried over; the original images, shapes and backgrounds are not.\n\nAccepted format: .pptx. An older .ppt file must first be re-saved as .pptx from PowerPoint.';

  @override
  String get pptxChoosePresentation => 'Choose a presentation';

  @override
  String get pptxTextOnlyTitle => 'Text conversion only';

  @override
  String get pptxTextOnlyBody =>
      'The text of each slide is carried over. The original images, shapes, backgrounds, colours and layouts are not preserved: the resulting PDF is a simple, readable layout, not a faithful copy of your presentation.';

  @override
  String pptxSlideCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count slides',
      one: '$count slide',
    );
    return '$_temp0';
  }

  @override
  String get pptxSlidesDetected => 'Slides found';

  @override
  String pptxMoreSlides(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count more slides',
      one: '$count more slide',
    );
    return 'and $_temp0…';
  }

  @override
  String get pptxUntitledSlide => 'Untitled';

  @override
  String get pptxEmptySlide => 'No text (image or shape only)';

  @override
  String pptxTextLineCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count lines of text',
      one: '$count line of text',
    );
    return '$_temp0';
  }

  @override
  String pptxReadFailed(String detail) {
    return 'Could not read: $detail';
  }

  @override
  String get compressLevelLight => 'Light';

  @override
  String get compressLevelMedium => 'Medium';

  @override
  String get compressLevelStrong => 'Strong';

  @override
  String get pptxQualityStandard => 'Standard (150 dpi)';

  @override
  String get pptxQualityHigh => 'High (220 dpi)';

  @override
  String get pdfToExcelEmptyTitle => 'Get the tables back';

  @override
  String get pdfToExcelEmptyBody =>
      'Tables in a PDF are extracted into an Excel workbook. Formatting is not preserved; the values are.';

  @override
  String pdfToExcelPagesAnalyzed(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count pages analysed',
      one: '$count page analysed',
    );
    return '$_temp0';
  }

  @override
  String pdfToExcelAnalysisFailed(String detail) {
    return 'Analysis failed. The PDF may be password-protected or damaged. ($detail)';
  }

  @override
  String get pdfToExcelNothingToExport => 'Nothing to export: no table found.';

  @override
  String get pdfToExcelBuilding => 'Building the workbook…';

  @override
  String get pdfToExcelIncludeParagraphs =>
      'Also include text outside tables (one row per paragraph)';

  @override
  String get pdfToExcelIncludeParagraphsHint =>
      'Useful for a semi-structured document: the text goes into column A, after the tables on the page.';

  @override
  String get pdfToExcelCaveatTitle => 'What the conversion does not preserve';

  @override
  String get pdfToExcelCaveat =>
      'Detection relies on where the text sits on the page: tables without regular borders, merged cells and very irregular columns may be split badly. A scanned PDF (an image) contains no extractable text and will yield nothing. Colours, formulas and images are never carried over: only the text values are.';

  @override
  String pdfToExcelTablesFound(int tables, int pages) {
    String _temp0 = intl.Intl.pluralLogic(
      tables,
      locale: localeName,
      other: '$tables tables found',
      one: '$tables table found',
    );
    String _temp1 = intl.Intl.pluralLogic(
      pages,
      locale: localeName,
      other: '$pages pages',
      one: '$pages page',
    );
    return '$_temp0 across $_temp1';
  }

  @override
  String pdfToExcelPagesConcerned(String pages) {
    return 'Pages involved: $pages';
  }

  @override
  String pdfToExcelParagraphsOutside(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count paragraphs outside tables',
      one: '$count paragraph outside tables',
    );
    return '$_temp0';
  }

  @override
  String get pdfToExcelScannedWarning =>
      'No text could be extracted from this PDF: it is almost certainly a scanned document (images of pages). A spreadsheet can make nothing of it; use the text recognition (OCR) tool first.';

  @override
  String get pdfToExcelNoTableWarning =>
      'No table structure was recognised in this document. The text is there, but it is not laid out in regular columns. Rather than produce an unreadable workbook, turn on “Also include text outside tables” above, or use “PDF to Word”, which preserves paragraphs better.';

  @override
  String get pdfToExcelResultTitle => 'Workbook ready';

  @override
  String get pdfToExcelExportWhat => 'Excel workbook';

  @override
  String get pdfToExcelConvertAction => 'Convert to Excel';

  @override
  String resultNameAndSize(String name, String size) {
    return '$name — $size';
  }

  @override
  String get pdfToPptxEmptyTitle => 'One slide per page';

  @override
  String get pdfToPptxEmptyBody =>
      'The PDF becomes a PowerPoint presentation, identical. Each page arrives as an image: the layout is faithful, but the text will not be editable in PowerPoint.';

  @override
  String pdfToPptxOpenFailed(String detail) {
    return 'Could not open this PDF: $detail';
  }

  @override
  String get pdfToPptxConverting => 'Converting to PowerPoint…';

  @override
  String pdfToPptxPagesToSlides(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count pages',
      one: '$count page',
    );
    String _temp1 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count slides',
      one: '$count slide',
    );
    return '$_temp0 > $_temp1';
  }

  @override
  String get pdfToPptxEmptyDocument => 'Empty document';

  @override
  String get qualityLabel => 'Quality';

  @override
  String get pdfToPptxQualityHint =>
      'A higher resolution gives sharper slides but a markedly heavier file.';

  @override
  String pdfToPptxHeavyWarning(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count pages',
      one: '$count page',
    );
    return 'Careful: at high quality, a presentation of $_temp0 can weigh several tens of MB and be slow to open. Choose Standard if in doubt.';
  }

  @override
  String get goodToKnow => 'Good to know';

  @override
  String get pdfToPptxCaveat =>
      'Each slide is an image of the page: the layout is identical to the PDF, but the text will not be editable in PowerPoint.\nTo get editable text back, use “PDF to Word” instead.\nA presentation has only one slide size: it is taken from the first page, and pages of a different size are centred inside it.';

  @override
  String get pdfToPptxResultTitle => 'Presentation ready';

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
      other: '$count slides',
      one: '$count slide',
    );
    return '$name — $_temp0 · $size · $quality';
  }

  @override
  String get notSavedYet =>
      'The file is not on your device yet: save it or share it.';

  @override
  String get pdfToPptxChangeQuality => 'Change the quality';

  @override
  String get pdfToPptxConvertAction => 'Convert to PowerPoint';

  @override
  String pdfToPptxExportWhat(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count slides',
      one: '$count slide',
    );
    return 'PowerPoint presentation · $_temp0';
  }

  @override
  String get formatLabel => 'Format';

  @override
  String get actionExport => 'Export';

  @override
  String get imageQualityWeb => 'Web (72 dpi)';

  @override
  String get imageQualityStandard => 'Standard (150 dpi)';

  @override
  String get imageQualityHigh => 'High quality (300 dpi)';

  @override
  String get pdfToImagesEmptyTitle => 'One image per page';

  @override
  String get pdfToImagesEmptyBody =>
      'Choose a PDF: every page comes out as an image, at the resolution you set next.';

  @override
  String pdfToImagesNotAPdf(String name) {
    return '$name: please choose a PDF file.';
  }

  @override
  String errorLoadFailed(String detail) {
    return 'Loading failed: $detail';
  }

  @override
  String get pdfToImagesProgress => 'Exporting…';

  @override
  String pdfToImagesExportWhat(int count, String format) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count $format images',
      one: '$count $format image',
    );
    return '$_temp0';
  }

  @override
  String get pdfaEmptyTitle => 'Archive for the long haul';

  @override
  String get pdfaEmptyBody =>
      'PDF/A is the archiving format required by many public bodies. The document is converted without losing its appearance.';

  @override
  String get pdfaConformanceLevel => 'Conformance level';

  @override
  String get pdfaA1bDetail =>
      'The strictest and most universally accepted level. Choose this if in doubt.';

  @override
  String get pdfaA2bDetail =>
      'Based on PDF 1.7: more efficient compression, slightly lighter files.';

  @override
  String get pdfaA3bDetail =>
      'Like A-2b, but allows attachments (often required for electronic invoicing).';

  @override
  String pdfaConvertingTo(String level) {
    return 'Converting to $level…';
  }

  @override
  String get pdfaCaveatTitle => 'What the conversion changes';

  @override
  String pdfaCaveat(int dpi) {
    return 'Every page is redrawn as an image at $dpi dpi: the text becomes an image and the layout is frozen. That is what makes the file genuinely conformant without depending on the fonts of the original document, but in exchange the text is no longer selectable or searchable, links and forms disappear, and the file gets heavier.';
  }

  @override
  String pdfaOpenFailed(String detail) {
    return 'Could not open this PDF: $detail';
  }

  @override
  String get imagesToPdfEmptyTitle => 'Images into one PDF';

  @override
  String get imagesToPdfEmptyBody =>
      'JPG, PNG, WebP, HEIC — add your images and they will be assembled in the order you choose.';

  @override
  String get imagesToPdfChoose => 'Choose images';

  @override
  String get imagesToPdfAdd => 'Add images';

  @override
  String imagesToPdfRejected(String names) {
    return 'Skipped (not an image): $names';
  }

  @override
  String get imagesToPdfBuilding => 'Building the PDF…';

  @override
  String imagesToPdfBuildFailed(String detail) {
    return 'Could not build it: $detail';
  }

  @override
  String imagesToPdfCreateAction(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count images',
      one: '$count image',
    );
    return 'Create the PDF ($_temp0)';
  }

  @override
  String get actionRotate => 'Rotate';

  @override
  String get actionRemove => 'Remove';

  @override
  String get htmlTitle => 'HTML / web page to PDF';

  @override
  String get htmlIntro =>
      'Turn a web page or HTML code into an A4 PDF. Rendering is done by the browser built into Android, so the layout is the one you would get printing from Chrome.';

  @override
  String get htmlModeUrl => 'Web address';

  @override
  String get htmlModeCode => 'HTML code';

  @override
  String get htmlUrlLabel => 'Page address';

  @override
  String get htmlUrlHint => 'https://example.com/article';

  @override
  String get htmlCodeLabel => 'HTML code';

  @override
  String get htmlCodeHint => '<h1>Heading</h1>\n<p>Text…</p>';

  @override
  String get htmlUrlBadScheme =>
      'The address must start with http:// or https://.';

  @override
  String get htmlUrlIncomplete => 'Enter a complete web address.';

  @override
  String get htmlCodeEmpty => 'Paste some HTML code to convert.';

  @override
  String get htmlLoadingUrl => 'Loading the page and converting…';

  @override
  String get htmlConverting => 'Converting the HTML…';

  @override
  String get htmlNetworkNotice =>
      'An internet connection is required: this is the only tool in the app that has to download the page. Pages that require signing in to an account, a cookie banner, or a lot of JavaScript may come out incomplete.';

  @override
  String get htmlOfflineNotice =>
      'HTML and CSS written directly in the page are rendered offline. Images, stylesheets or fonts fetched from an external web address, however, need an internet connection.';

  @override
  String get watermarkEmptyTitle => 'Apply a watermark';

  @override
  String get watermarkEmptyBody =>
      'Text of your choosing is repeated in the background of every page — to mark a document as confidential or as a draft.';

  @override
  String get watermarkEmptyNote => 'Free export, no cap on how many.';

  @override
  String get watermarkTextLabel => 'Watermark text';

  @override
  String get watermarkDefaultText => 'CONFIDENTIAL';

  @override
  String get watermarkNeedText => 'Enter some text for the watermark.';

  @override
  String watermarkOpacity(int percent) {
    return 'Opacity: $percent%';
  }

  @override
  String watermarkRotation(int degrees) {
    return 'Rotation angle: $degrees°';
  }

  @override
  String watermarkFontSize(int points) {
    return 'Text size: $points pt';
  }

  @override
  String get watermarkColor => 'Colour';

  @override
  String get colorGrey => 'Grey';

  @override
  String get colorRed => 'Red';

  @override
  String get colorBlue => 'Blue';

  @override
  String get colorBlack => 'Black';

  @override
  String get watermarkProgress => 'Applying the watermark…';

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
  String get pageNumbersEmptyTitle => 'Number the pages';

  @override
  String get pageNumbersEmptyBody =>
      'Choose a PDF, then the position and the format of the numbers that will be added to every page.';

  @override
  String get positionLabel => 'Position';

  @override
  String get positionBottomCenter => 'Bottom centre';

  @override
  String get positionBottomRight => 'Bottom right';

  @override
  String get positionTopCenter => 'Top centre';

  @override
  String get positionTopRight => 'Top right';

  @override
  String get pageNumbersFormatPlain => 'N';

  @override
  String get pageNumbersFormatOfTotal => 'N / total';

  @override
  String get pageNumbersStart => 'Starting number';

  @override
  String get pageNumbersProgress => 'Numbering…';

  @override
  String get organizeEmptyTitle => 'Take a PDF back in hand';

  @override
  String get organizeEmptyBody =>
      'Open a document to split it, pull pages out of it, or change their order.';

  @override
  String get organizeOpenFile => 'Open a file';

  @override
  String get organizeNothingToExport => 'No page to export.';

  @override
  String organizePagesKept(int kept, int total) {
    String _temp0 = intl.Intl.pluralLogic(
      kept,
      locale: localeName,
      other: '$kept pages kept',
      one: '$kept page kept',
    );
    return '$_temp0 of $total';
  }

  @override
  String get organizePageExcluded => 'Left out';

  @override
  String organizePageMoved(int from) {
    return 'Moved from position $from';
  }

  @override
  String organizePageTitle(int number) {
    return 'Page $number';
  }

  @override
  String organizeExcludePage(int number) {
    return 'Leave page $number out';
  }

  @override
  String organizeIncludePage(int number) {
    return 'Include page $number';
  }

  @override
  String organizeMovePage(int number) {
    return 'Move page $number';
  }

  @override
  String get organizeExtract => 'Extract';

  @override
  String get organizeSplit => 'Split';

  @override
  String get organizePreview => 'Preview';

  @override
  String get organizeExtractTitle => 'Extract a range of pages';

  @override
  String organizeRangeLabel(int start, int end) {
    return 'Pages $start to $end';
  }

  @override
  String get organizeSplitTitle => 'Split into several files';

  @override
  String organizeFileCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count files',
      one: '$count file',
    );
    return '$_temp0';
  }

  @override
  String organizeSplitFailed(String detail) {
    return 'Split failed: $detail';
  }

  @override
  String get scanNoCamera => 'No camera available on this device.';

  @override
  String scanCameraFailed(String detail) {
    return 'Could not start the camera: $detail';
  }

  @override
  String get scanCropToolbar => 'Adjust';

  @override
  String scanCaptureFailed(String detail) {
    return 'Capture failed: $detail';
  }

  @override
  String get scanPermissionBody =>
      'Access to the camera is required to scan a document.';

  @override
  String get scanGrantPermission => 'Allow camera access';

  @override
  String get actionRetry => 'Try again';

  @override
  String get scanNoPageYet => 'No page yet.';

  @override
  String scanFinishAction(int count) {
    return 'Finish · $count';
  }

  @override
  String get signTitle => 'Sign a PDF';

  @override
  String get signIntro =>
      'Put your hand-drawn signature on a page of a PDF. It is simply a drawing added to the document, not a certified electronic signature.';

  @override
  String get signChooseSubtitle => 'Select the document to sign';

  @override
  String get signPickPage => 'Choose the page to sign.';

  @override
  String get signDrawTitle => 'Draw my signature';

  @override
  String get signDrawBody =>
      'Draw with your finger as you would on paper. This puts a drawing on the page — it is not a certified electronic signature.';

  @override
  String get signNeedDrawing => 'Draw a signature before continuing.';

  @override
  String get signClear => 'Clear';

  @override
  String get signValidate => 'Confirm';

  @override
  String get signPlaceBody =>
      'Drag the signature where you want it on the page, then tap Finish.';

  @override
  String get signPageUnavailable => 'Could not display the page.';

  @override
  String get signProgress => 'Adding the signature…';

  @override
  String get editTitle => 'Annotate a document';

  @override
  String get editEmptyBody =>
      'Add text or highlight passages directly on an existing PDF.';

  @override
  String get editAddTextTitle => 'Add text';

  @override
  String get editTextHint => 'Your text';

  @override
  String editFontSize(int size) {
    return 'Text size: $size';
  }

  @override
  String get editNeedAnnotation =>
      'Add at least one annotation before finishing.';

  @override
  String get editProgress => 'Applying the annotations…';

  @override
  String get editChooseOther => 'Choose another PDF';

  @override
  String get editUndoTooltip => 'Undo the last annotation';

  @override
  String get editModeText => 'Text';

  @override
  String get editModeHighlight => 'Highlight';

  @override
  String get editPageUnavailable => 'Could not display this page.';

  @override
  String get ocrEmptyTitle => 'Make the text searchable';

  @override
  String get ocrEmptyBody =>
      'The text of a scanned PDF is recognised and added on top of the image, invisibly. The page does not change in appearance.';

  @override
  String get ocrWrongFormat => 'Choose a PDF or an image (JPG, PNG…).';

  @override
  String get ocrProgress => 'Recognising…';

  @override
  String ocrFailed(String detail) {
    return 'Recognition failed: $detail';
  }

  @override
  String get ocrRunAction => 'Start recognition';

  @override
  String get ocrResultTitle => 'OCR result';

  @override
  String ocrResultBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count pages analysed',
      one: '$count page analysed',
    );
    return '$_temp0. The searchable PDF is ready, and you can also copy all the recognised text.';
  }

  @override
  String get ocrCopyText => 'Copy the text';

  @override
  String get ocrTextCopied => 'Text copied.';

  @override
  String get redactIntro =>
      'Permanently hide areas of a PDF (names, addresses, amounts). Unlike a plain black rectangle laid on top, the hidden text is genuinely removed from the file, not merely covered: it can no longer be selected or copied.';

  @override
  String get redactChooseSubtitle => 'Select the document to redact';

  @override
  String get redactCaveat =>
      'Good to know: to remove the hidden text, every page of the document is turned back into an image (200 dpi). The result is therefore no longer a PDF whose text can be selected, and the resulting file is usually heavier than the original.';

  @override
  String get redactEmptyPdf => 'This PDF contains no page.';

  @override
  String redactOpenFailed(String detail) {
    return 'Could not open this PDF (it may be password-protected): $detail';
  }

  @override
  String redactPageRenderFailed(int number, String detail) {
    return 'Could not display page $number: $detail';
  }

  @override
  String get redactUndoTooltip => 'Undo the last area';

  @override
  String get redactInstructions =>
      'Drag your finger across the page to draw an area to hide. The text covered will be genuinely removed from the file, not merely covered.';

  @override
  String get redactPagePrevious => 'Previous page';

  @override
  String get redactPageNext => 'Next page';

  @override
  String redactPager(int current, int total) {
    return 'Page $current / $total';
  }

  @override
  String get redactNoZone => 'No area drawn';

  @override
  String redactZoneCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count areas to hide',
      one: '$count area to hide',
    );
    return '$_temp0';
  }

  @override
  String get redactOtherPdf => 'Another PDF';

  @override
  String get redactAction => 'Redact';

  @override
  String get redactProgress => 'Redacting…';

  @override
  String get cropEmptyTitle => 'Trim the margins';

  @override
  String get cropEmptyBody =>
      'Choose a PDF, then drag your finger over the preview to mark out the area to keep.';

  @override
  String get cropTooSmall => 'The selected area is too small.';

  @override
  String get cropProgress => 'Cropping…';

  @override
  String cropFailed(String detail) {
    return 'Cropping failed: $detail';
  }

  @override
  String get cropKeptArea => 'Area kept';

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
  String get cropFullPage => 'Whole page';

  @override
  String get cropAllPages => 'Apply to every page';

  @override
  String get cropAllPagesOn => 'The same area is cut out on every page.';

  @override
  String get cropAllPagesOff =>
      'Only page 1 is cropped; the others are kept whole.';

  @override
  String get cropCaveat =>
      'Cropping reduces the size of the page: content outside the area is no longer displayed or printed.';

  @override
  String get cropAction => 'Crop';

  @override
  String get compareTitle => 'Compare two PDFs';

  @override
  String get compareEmptyTitle => 'What has changed';

  @override
  String get compareEmptyBody =>
      'Choose two versions of the same PDF. Added and removed passages will be set side by side, page by page.';

  @override
  String get compareSlotA => 'File A';

  @override
  String get compareSlotB => 'File B';

  @override
  String get compareAction => 'Compare';

  @override
  String get compareProgress => 'Comparing…';

  @override
  String compareFailed(String detail) {
    return 'Comparison failed: $detail';
  }

  @override
  String compareChangedPages(int changed, int total) {
    String _temp0 = intl.Intl.pluralLogic(
      changed,
      locale: localeName,
      other: '$changed pages differ',
      one: '$changed page differs',
    );
    return '$_temp0 out of $total';
  }

  @override
  String get compareNoDifference =>
      'No difference found between the two files.';

  @override
  String comparePageHeading(int number) {
    return 'Page $number';
  }

  @override
  String organizeFilesCreated(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count files created',
      one: '$count file created',
    );
    return '$_temp0';
  }

  @override
  String organizePartTitle(int number) {
    return 'Part $number';
  }
}
