// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Vietnamese (`vi`).
class LVi extends L {
  LVi([String locale = 'vi']) : super(locale);

  @override
  String get appTitle => 'Trombone - PDF, Scan & Word';

  @override
  String get appWordmark => 'Trombone';

  @override
  String get actionSave => 'Lưu';

  @override
  String get actionShare => 'Chia sẻ';

  @override
  String get actionCompress => 'nén';

  @override
  String get actionDone => 'Hoàn thành';

  @override
  String get actionCancel => 'Hủy bỏ';

  @override
  String get actionChange => 'Thay đổi';

  @override
  String get actionContinue => 'Tiếp tục';

  @override
  String get actionOpening => 'Đang mở…';

  @override
  String get actionRemoveFile => 'Xóa tập tin này';

  @override
  String get progressPreparing => 'Đang chuẩn bị…';

  @override
  String progressPercent(int percent) {
    return '$percent %';
  }

  @override
  String get emptyReassurance =>
      'Xuất miễn phí, không có hình mờ hoặc giới hạn.';

  @override
  String get emptyAcceptedFormats => 'Các định dạng được chấp nhận';

  @override
  String get exportSavedTitle => 'Đã lưu thành công.';

  @override
  String get exportSavedBody =>
      'Tệp đã được lưu theo tên và thư mục bạn đã chọn. Không có hình mờ, không giới hạn, không cần mở khóa.';

  @override
  String get exportSaveDialogTitle => 'Lưu PDF';

  @override
  String pageTileIncluded(int number) {
    return 'Trang $number, đã chọn. Chạm để bỏ chọn.';
  }

  @override
  String pageTileExcluded(int number) {
    return 'Trang $number, đã bỏ. Chạm để chọn lại.';
  }

  @override
  String pageTileRotate(int number) {
    return 'Xoay trang $number';
  }

  @override
  String sectionHeaderSemantics(String title, int count) {
    return 'công cụ $title, $count';
  }

  @override
  String toolCount(int count) {
    return 'công cụ $count';
  }

  @override
  String get homePromise => 'Tạo tài liệu và xuất tệp.\nKhông yêu cầu trả phí.';

  @override
  String get homeChipNoAccount => 'Không có tài khoản';

  @override
  String get homeChipNoWatermark => 'Không có hình mờ';

  @override
  String get homeChipUnlimited => 'Xuất không giới hạn';

  @override
  String get homeSearchTooltip => 'Tìm một công cụ';

  @override
  String get homeColophon =>
      'Không có tính năng nào bị khóa trả phí khi lưu. Xuất tệp hoàn toàn miễn phí, không có hình mờ và không giới hạn.';

  @override
  String get sectionFeatured => 'Nổi bật';

  @override
  String get sectionToPdf => 'Chuyển sang PDF';

  @override
  String get sectionFromPdf => 'Từ PDF';

  @override
  String get sectionSecurity => 'Bảo vệ';

  @override
  String get sectionEdit => 'Biên tập';

  @override
  String get toolMerge => 'Hợp nhất';

  @override
  String get toolMergeKeywords =>
      'lắp ráp kết hợp tham gia lại nhóm tham gia cùng nhau nối';

  @override
  String get toolMergeSubtitle =>
      'PDF, Word, hình ảnh và văn bản trong một tài liệu';

  @override
  String get toolRectoVerso => 'hai mặt';

  @override
  String get toolRectoVersoKeywords => 'quét xen kẽ hai mặt chẵn lẻ';

  @override
  String get toolRectoVersoSubtitle => 'Hai lần quét, sắp xếp lại theo thứ tự';

  @override
  String get toolImagesToPdf => 'Hình ảnh sang PDF';

  @override
  String get toolImagesToPdfKeywords => 'ảnh jpg jpeg png album ảnh thiết bị';

  @override
  String get toolImagesToPdfSubtitle =>
      'Hình ảnh và ảnh chụp trong một tài liệu';

  @override
  String get toolPdfToWord => 'PDF sang Word';

  @override
  String get toolPdfToWordKeywords =>
      'docx chuyển đổi trình xử lý văn bản có thể chỉnh sửa';

  @override
  String get toolPdfToWordSubtitle => 'Văn bản và bảng biểu, có thể chỉnh sửa';

  @override
  String get toolOrganize => 'Sắp xếp một tệp PDF';

  @override
  String get toolOrganizeKeywords =>
      'chia tách trích xuất sắp xếp lại thứ tự trang xóa';

  @override
  String get toolOrganizeSubtitle => 'Chia, trích, sắp xếp lại';

  @override
  String get toolExcelToPdf => 'Excel sang PDF';

  @override
  String get toolExcelToPdfKeywords => 'bảng tính bảng tính xlsx';

  @override
  String get toolPptxToPdf => 'PowerPoint sang PDF';

  @override
  String get toolPptxToPdfKeywords => 'slide thuyết trình pptx';

  @override
  String get toolHtmlToPdf => 'Trang web sang PDF';

  @override
  String get toolHtmlToPdfKeywords => 'bài viết liên kết url trang web html';

  @override
  String get toolScan => 'Quét tài liệu';

  @override
  String get toolScanKeywords => 'máy ảnh ảnh số hóa thiết bị quét giấy';

  @override
  String get toolPdfToExcel => 'PDF sang Excel';

  @override
  String get toolPdfToExcelKeywords => 'dữ liệu trích xuất bảng tính xlsx';

  @override
  String get toolPdfToPptx => 'PDF sang PowerPoint';

  @override
  String get toolPdfToPptxKeywords => 'slide thuyết trình pptx';

  @override
  String get toolPdfToImages => 'PDF sang hình ảnh';

  @override
  String get toolPdfToImagesKeywords => 'anh jpg png xuat tep chup man hinh';

  @override
  String get toolOcr => 'Văn bản có thể tìm kiếm (OCR)';

  @override
  String get toolOcrKeywords => 'chọn bản sao quét nhận dạng ký tự';

  @override
  String get toolPdfA => 'Chuyển đổi sang PDF/A';

  @override
  String get toolPdfAKeywords => 'tiêu chuẩn lưu trữ bảo quản lâu dài';

  @override
  String get toolProtect => 'Bảo vệ PDF';

  @override
  String get toolProtectKeywords => 'ổ khóa mật khẩu mã hóa khóa an toàn';

  @override
  String get toolUnlock => 'Mở khóa PDF';

  @override
  String get toolUnlockKeywords => 'xóa mật khẩu mở giải mã mở khóa ổ khóa';

  @override
  String get toolRepair => 'Sửa chữa PDF';

  @override
  String get toolRepairKeywords =>
      'bị hỏng không thể đọc được lỗi khôi phục bị hỏng';

  @override
  String get toolRedact => 'Biên tập lại một bản PDF';

  @override
  String get toolRedactKeywords => 'ẩn bôi đen ẩn danh xóa bí mật';

  @override
  String get toolEdit => 'Chỉnh sửa PDF';

  @override
  String get toolEditKeywords => 'văn bản sửa đổi chú thích chính xác viết';

  @override
  String get toolSign => 'Dấu hiệu';

  @override
  String get toolSignKeywords => 'ký tay hợp đồng ban đầu';

  @override
  String get toolWatermark => 'Hình mờ';

  @override
  String get toolWatermarkKeywords => 'hình mờ dấu dự thảo tem bí mật';

  @override
  String get toolPageNumbers => 'Số trang';

  @override
  String get toolPageNumbersKeywords => 'số trang folio phân trang';

  @override
  String get toolCrop => 'Cắt một tệp PDF';

  @override
  String get toolCropKeywords => 'cắt lề kích thước cạnh cắt';

  @override
  String get toolCompare => 'So sánh PDF';

  @override
  String get toolCompareKeywords => 'phiên bản khác nhau thay đổi khác biệt';

  @override
  String get searchHint => 'Hợp nhất, mật khẩu, hình mờ…';

  @override
  String get searchClear => 'Xóa';

  @override
  String searchNoResultTitle(String query) {
    return 'Không có công cụ nào dành cho “$query”.';
  }

  @override
  String get searchNoResultBody =>
      'Hãy thử định dạng bạn có trong tay – “Word”, “Excel”, “ảnh” – hoặc bất cứ điều gì bạn muốn làm với nó: “ký tên”, “chia”, “mật khẩu”.';

  @override
  String get actionUndo => 'Hủy bỏ';

  @override
  String get actionApply => 'Áp dụng';

  @override
  String get actionChoose => 'Chọn';

  @override
  String get actionChoosePdf => 'Chọn một bản PDF';

  @override
  String get actionChooseFiles => 'Chọn tập tin';

  @override
  String get actionConvert => 'Chuyển thành';

  @override
  String get actionFinish => 'Hoàn tất';

  @override
  String get actionBack => 'Quay lại';

  @override
  String get actionAdd => 'Thêm vào';

  @override
  String get noFileChosen => 'Không có tập tin nào được chọn';

  @override
  String errorExportFailed(String detail) {
    return 'Xuất không thành công: $detail';
  }

  @override
  String errorShareFailed(String detail) {
    return 'Chia sẻ không thành công: $detail';
  }

  @override
  String errorOpenFailed(String detail) {
    return 'Không thể mở tập tin: $detail';
  }

  @override
  String errorConversionFailed(String detail) {
    return 'Chuyển đổi không thành công: $detail';
  }

  @override
  String errorOnFile(String name, String detail) {
    return '$name: $detail';
  }

  @override
  String get errorPickPdf => 'Vui lòng chọn tệp PDF.';

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
    return '~$size';
  }

  @override
  String pageCount(int count) {
    return '$count trang';
  }

  @override
  String pageCountOfTotal(int kept, int total) {
    return '$kept trang trong tổng số $total';
  }

  @override
  String pageOfTotal(int current, int total) {
    return 'Trang $current trên $total';
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
  String get formatImages => 'Hình ảnh';

  @override
  String get formatText => 'Chữ';

  @override
  String get mergeAddFile => 'Thêm một tập tin';

  @override
  String get mergeAddHint => 'PDF, Word, hình ảnh hoặc văn bản';

  @override
  String get mergeEmptyTitle => 'Một tài liệu duy nhất';

  @override
  String get mergeEmptyBody =>
      'Thêm tệp PDF, tệp Word, hình ảnh hoặc văn bản. Bạn có thể sắp xếp lại chúng và xóa các trang trước khi xuất.';

  @override
  String get mergeNeedOnePage => 'Thêm ít nhất một tệp có trang để đưa vào.';

  @override
  String get mergeProgress => 'Đang tiến hành sáp nhập...';

  @override
  String mergeFailed(String detail) {
    return 'Hợp nhất không thành công: $detail';
  }

  @override
  String mergeRemoved(String name) {
    return '$name đã bị xóa.';
  }

  @override
  String mergeRemoveTooltip(String name) {
    return 'Xóa $name';
  }

  @override
  String mergeMoveSemantics(String name) {
    return 'Di chuyển $name';
  }

  @override
  String get mergeRotateAll => 'Xoay tất cả các trang';

  @override
  String mergePreviewAndExport(int count) {
    return 'Xem trước và xuất ($count trang)';
  }

  @override
  String previewTitle(String size) {
    return 'Tổng quan · $size';
  }

  @override
  String previewZoomPage(int number) {
    return 'Trang $number, phóng to';
  }

  @override
  String get previewPageUnreadable => 'Trang không thể đọc được.';

  @override
  String previewExportWhat(int count) {
    return 'PDF · $count trang';
  }

  @override
  String get compressTitle => 'nén';

  @override
  String compressBody(String size) {
    return 'Kích thước hiện tại: $size. Chọn cấp độ - kích thước ước tính sẽ được hiển thị trước khi áp dụng.';
  }

  @override
  String get compressEstimating => 'Ước lượng…';

  @override
  String get compressProgress => 'Đang nén...';

  @override
  String compressFailed(String detail) {
    return 'Nén không thành công: $detail';
  }

  @override
  String get protectEmptyTitle => 'Đặt dưới mật khẩu';

  @override
  String get protectEmptyBody =>
      'Tệp PDF sẽ không mở được nữa nếu không có mật khẩu bạn chọn. Giữ nó: nó không thể được phục hồi.';

  @override
  String get protectSubtitle => 'Sẽ được mã hóa bằng AES 256-bit';

  @override
  String get protectPassword => 'Mật khẩu';

  @override
  String get protectConfirmPassword => 'Xác nhận mật khẩu';

  @override
  String get protectShowPasswords => 'Hiển thị mật khẩu';

  @override
  String get protectHidePasswords => 'Ẩn mật khẩu';

  @override
  String get protectMismatch => 'Hai mật khẩu này khác nhau.';

  @override
  String get protectWarning =>
      'Hãy viết nó ra đâu đó: không có nó, tài liệu sẽ vĩnh viễn không thể đọc được. Không thể khôi phục được, bởi bạn cũng như bởi ứng dụng.';

  @override
  String get protectAlreadyProtected =>
      'Tệp này đã được bảo vệ - trước tiên hãy sử dụng Mở khóa PDF.';

  @override
  String get protectProgress => 'Đang tiến hành bảo vệ…';

  @override
  String protectFailed(String detail) {
    return 'Bảo vệ không thành công: $detail';
  }

  @override
  String get protectAction => 'Bảo vệ';

  @override
  String get protectResultTitle => 'PDF được bảo vệ';

  @override
  String get protectResultDetail =>
      'Được mã hóa bằng AES 256 bit. Bạn sẽ cần mật khẩu để mở nó.';

  @override
  String get protectExportWhat => 'PDF được bảo vệ bằng mật khẩu';

  @override
  String get unlockEmptyTitle => 'Xóa mật khẩu';

  @override
  String get unlockEmptyBody =>
      'Bạn cần mật khẩu hiện tại cho tài liệu. Sau khi xóa, tệp PDF sẽ mở tự do.';

  @override
  String get unlockAcceptsProtectedPdf => 'PDF được bảo vệ';

  @override
  String get unlockChooseProtectedPdf => 'Chọn một tệp PDF được bảo vệ';

  @override
  String get unlockCurrentPassword => 'Mật khẩu hiện tại';

  @override
  String get unlockWrongPassword => 'Mật khẩu không chính xác.';

  @override
  String get unlockProgress => 'Đang mở khóa…';

  @override
  String unlockFailed(String detail) {
    return 'Không mở khóa được: $detail';
  }

  @override
  String get unlockAction => 'Mở khóa';

  @override
  String get repairEmptyTitle => 'Sửa chữa một tập tin bị hỏng';

  @override
  String get repairEmptyBody =>
      'Cấu trúc bên trong của tệp PDF bị hỏng được tái tạo. Dữ liệu có thể phục hồi sẽ được khôi phục.';

  @override
  String get repairProgress => 'Đang sửa chữa…';

  @override
  String get repairFailed =>
      'Không thể sửa chữa được tập tin này - nó có thể bị hỏng quá mức.';

  @override
  String get repairAction => 'Sửa chữa';

  @override
  String get pdfToWordEmptyTitle => 'Một Word có thể chỉnh sửa';

  @override
  String get pdfToWordEmptyBody =>
      'Văn bản và cấu trúc của tệp PDF được chuyển sang tài liệu .docx để bạn có thể mở lại và chỉnh sửa.';

  @override
  String get pdfToWordAnalyzing => 'Phân tích tài liệu…';

  @override
  String get pdfToWordAnalysisPending => 'Đang chờ phân tích';

  @override
  String pdfToWordAnalysisFailed(String detail) {
    return 'Không thể quét: $detail';
  }

  @override
  String get pdfLocked =>
      'Bản PDF này được bảo vệ bằng mật khẩu. Mở khóa nó trước.';

  @override
  String get pdfToWordConverting => 'Đang chuyển đổi sang Word…';

  @override
  String get pdfToWordSummaryTitle => 'Đã phát hiện thấy nội dung';

  @override
  String pdfToWordParagraphCount(int count) {
    return '$count đoạn văn';
  }

  @override
  String pdfToWordHeadingCount(int count) {
    return '$count danh hiệu';
  }

  @override
  String pdfToWordTableCount(int count) {
    return '$count bảng';
  }

  @override
  String get pdfToWordNoTables =>
      'Không phát hiện thấy bảng nào: nếu tệp PDF của bạn chứa bất kỳ bảng nào, các dòng của nó sẽ được chuyển đổi thành các đoạn văn.';

  @override
  String get pdfToWordCaveat =>
      'Việc chuyển đổi sẽ tái tạo văn bản, định dạng và bảng biểu nhưng không tái tạo bố cục chính xác: vị trí của hình ảnh và cột không được giữ nguyên và hình ảnh không được đưa vào tài liệu Word.';

  @override
  String get pdfToWordScanWarning =>
      'Bản PDF này có vẻ là bản quét: không tìm thấy văn bản nào. Trước tiên, hãy sử dụng công cụ Văn bản có thể tìm kiếm (OCR), sau đó quay lại và chuyển đổi tệp PDF thu được.';

  @override
  String get pdfToWordResultTitle => 'Tài liệu Word đã sẵn sàng';

  @override
  String pdfToWordResultDetail(String name, String size) {
    return '$name — $size';
  }

  @override
  String get pdfToWordExportWhat => 'tài liệu Word';

  @override
  String get pdfToWordConvertAction => 'Chuyển đổi sang Word';

  @override
  String get actionConvertAgain => 'Chuyển đổi lại';

  @override
  String errorSaveFailed(String detail) {
    return 'Không thể lưu: $detail';
  }

  @override
  String get rectoVersoIntro =>
      'Bộ nạp một mặt tạo ra hai tệp: các trang lẻ theo thứ tự, các trang chẵn thường theo thứ tự ngược lại. Chọn cả hai để sắp xếp lại chúng.';

  @override
  String get rectoVersoOddSlot => 'Tệp trang lẻ (Một mặt)';

  @override
  String get rectoVersoEvenSlot => 'Tệp trang chẵn (trở lại)';

  @override
  String get rectoVersoReversed => 'Tệp thứ hai theo thứ tự ngược lại';

  @override
  String get rectoVersoReversedHint =>
      'Đây là trường hợp phổ biến nhất, được kiểm tra theo mặc định';

  @override
  String rectoVersoPreview(int count) {
    return 'Tổng quan về xen kẽ ($count trang)';
  }

  @override
  String get rectoVersoProgress => 'Đang xen kẽ…';

  @override
  String fileWithPageCount(String name, int count) {
    return '$name · $count trang';
  }

  @override
  String get actionPreviewAndExport => 'Xem trước và xuất';

  @override
  String errorOpenFailedShort(String detail) {
    return 'Không thể mở được: $detail';
  }

  @override
  String errorGeneric(String detail) {
    return 'Không thành công: $detail';
  }

  @override
  String get actionConvertToPdf => 'Chuyển đổi sang PDF';

  @override
  String get convertProgress => 'Đang tiến hành chuyển đổi...';

  @override
  String get excelEmptyTitle => 'Một sổ làm việc PDF';

  @override
  String get excelEmptyBody =>
      'Các trang tính trong tệp .xlsx trở thành trang PDF, sẵn sàng gửi hoặc in.';

  @override
  String get excelChooseWorkbook => 'Chọn chất kết dính';

  @override
  String get excelChooseXlsx => 'Chọn sổ làm việc .xlsx';

  @override
  String get excelLegacyFormat =>
      'Định dạng .xls (định dạng nhị phân Excel cũ) không được hỗ trợ. Lưu tệp dưới dạng .xlsx rồi thử lại.';

  @override
  String get excelWrongFormat => 'Vui lòng chọn sổ làm việc Excel .xlsx.';

  @override
  String excelUnreadable(String detail) {
    return 'Thư mục không thể đọc được: $detail';
  }

  @override
  String excelSheetsAndRows(int sheets, int rows) {
    return 'Tổng cộng $sheets tờ · tổng cộng $rows hàng';
  }

  @override
  String get excelSheetsDetected => 'Lá được phát hiện';

  @override
  String get excelEmptySheet => 'Trang tính trống';

  @override
  String excelSheetDimensions(int rows, int columns) {
    return '$rows hàng × $columns cột';
  }

  @override
  String get excelRepeatHeader => 'Lặp lại dòng tiêu đề trên mỗi trang';

  @override
  String get excelRepeatHeaderHint =>
      'Hàng đầu tiên của trang tính được vẽ lại ở đầu mỗi trang bảng.';

  @override
  String get excelCaveat =>
      'Nội dung chuyển đổi bao gồm: văn bản của các ô khi nó được lưu trong tệp (bao gồm kết quả tính toán cuối cùng của các công thức), dòng in đậm đầu tiên và một lưới.\n\nNhững gì không được bao gồm: màu sắc, phông chữ, định dạng số, ô được hợp nhất, hình ảnh, đồ họa và chính công thức. Các cột được giảm bớt để vừa với chiều rộng của trang; trên các trang tính rất rộng, văn bản trong các ô quá hẹp sẽ bị cắt bớt bởi “…”.';

  @override
  String get pptxEmptyTitle => 'Một bài thuyết trình dưới dạng PDF';

  @override
  String get pptxEmptyBody =>
      'Một trang ngang 16:9 trên mỗi trang chiếu, bao gồm tiêu đề và dấu đầu dòng. Văn bản được lặp lại; những hình ảnh, hình dạng và hình nền ban đầu thì không.\n\nĐịnh dạng được chấp nhận: .pptx. Tệp .ppt cũ trước tiên phải được lưu lại dưới dạng .pptx từ PowerPoint.';

  @override
  String get pptxChoosePresentation => 'Chọn một bài thuyết trình';

  @override
  String get pptxTextOnlyTitle => 'Chỉ chuyển đổi văn bản';

  @override
  String get pptxTextOnlyBody =>
      'Văn bản của mỗi slide được lặp lại. Các hình ảnh, hình dạng, hình nền, màu sắc và bố cục ban đầu không được giữ nguyên: tệp PDF thu được là một bố cục đơn giản, dễ đọc chứ không phải là bản sao trung thực của bản trình bày của bạn.';

  @override
  String pptxSlideCount(int count) {
    return '$count trang trình bày';
  }

  @override
  String get pptxSlidesDetected => 'Đã phát hiện thấy các trang trình bày';

  @override
  String pptxMoreSlides(int count) {
    return 'và $count trang trình bày khác…';
  }

  @override
  String get pptxUntitledSlide => 'Không có tiêu đề';

  @override
  String get pptxEmptySlide => 'Không có văn bản (chỉ hình ảnh hoặc hình dạng)';

  @override
  String pptxTextLineCount(int count) {
    return '$count dòng văn bản';
  }

  @override
  String pptxReadFailed(String detail) {
    return 'Không thể đọc: $detail';
  }

  @override
  String get compressLevelLight => 'Ánh sáng';

  @override
  String get compressLevelMedium => 'Trung bình';

  @override
  String get compressLevelStrong => 'sở trường';

  @override
  String get pptxQualityStandard => 'Tiêu chuẩn (150 dpi)';

  @override
  String get pptxQualityHigh => 'Cao (220 dpi)';

  @override
  String get pdfToExcelEmptyTitle => 'Truy xuất bảng';

  @override
  String get pdfToExcelEmptyBody =>
      'Các bảng từ PDF được trích xuất sang sổ làm việc Excel. Định dạng không được giữ nguyên, các giá trị vẫn vậy.';

  @override
  String pdfToExcelPagesAnalyzed(int count) {
    return '$count trang được phân tích';
  }

  @override
  String pdfToExcelAnalysisFailed(String detail) {
    return 'Phân tích không thể. Tệp PDF có thể được bảo vệ bằng mật khẩu hoặc bị hỏng. ($detail)';
  }

  @override
  String get pdfToExcelNothingToExport =>
      'Không có gì để xuất: không phát hiện thấy bảng nào.';

  @override
  String get pdfToExcelBuilding => 'Đang tạo sổ làm việc…';

  @override
  String get pdfToExcelIncludeParagraphs =>
      'Cũng bao gồm văn bản bên ngoài bảng (một dòng trên mỗi đoạn)';

  @override
  String get pdfToExcelIncludeParagraphsHint =>
      'Hữu ích đối với tài liệu bán cấu trúc: văn bản được đặt ở cột A, sau các bảng trên trang.';

  @override
  String get pdfToExcelCaveatTitle => 'Những gì chuyển đổi không bảo tồn';

  @override
  String get pdfToExcelCaveat =>
      'Việc phát hiện dựa trên vị trí của văn bản trên trang: các bảng không có đường viền thông thường, các ô được hợp nhất và các cột rất không đều có thể bị cắt kém. Một bản PDF (hình ảnh) được quét không chứa văn bản có thể trích xuất được và sẽ không mang lại kết quả gì. Màu sắc, công thức và hình ảnh không bao giờ được bao gồm: chỉ có giá trị văn bản.';

  @override
  String pdfToExcelTablesFound(int tables, int pages) {
    return 'Đã phát hiện thấy bảng $tables trên trang $pages';
  }

  @override
  String pdfToExcelPagesConcerned(String pages) {
    return 'Các trang bị ảnh hưởng: $pages';
  }

  @override
  String pdfToExcelParagraphsOutside(int count) {
    return '$count đoạn văn bên ngoài bảng';
  }

  @override
  String get pdfToExcelScannedWarning =>
      'Không thể trích xuất văn bản nào từ tệp PDF này: rất có thể đây là tài liệu được quét (hình ảnh trang). Một bảng tính không thể lấy được gì từ việc này; đầu tiên hãy sử dụng công cụ nhận dạng văn bản (OCR).';

  @override
  String get pdfToExcelNoTableWarning =>
      'Không có cấu trúc bảng nào được công nhận trong tài liệu này. Văn bản vẫn ở đó nhưng nó không được sắp xếp theo các cột thông thường. Thay vì tạo ra một sổ làm việc không thể đọc được, hãy bật “Cũng bao gồm văn bản không phải bảng” ở trên hoặc sử dụng “PDF sang Word” để lưu giữ các đoạn văn tốt hơn.';

  @override
  String get pdfToExcelResultTitle => 'Chất kết dính đã sẵn sàng';

  @override
  String get pdfToExcelExportWhat => 'Sổ làm việc Excel';

  @override
  String get pdfToExcelConvertAction => 'Chuyển đổi sang Excel';

  @override
  String resultNameAndSize(String name, String size) {
    return '$name — $size';
  }

  @override
  String get pdfToPptxEmptyTitle => 'Một slide trên mỗi trang';

  @override
  String get pdfToPptxEmptyBody =>
      'PDF trở thành một bản trình bày PowerPoint giống hệt nhau. Mỗi trang đều có dạng hình ảnh: bố cục trung thực nhưng văn bản sẽ không thể chỉnh sửa được trong PowerPoint.';

  @override
  String pdfToPptxOpenFailed(String detail) {
    return 'Không thể mở tệp PDF này: $detail';
  }

  @override
  String get pdfToPptxConverting => 'Đang chuyển đổi sang PowerPoint…';

  @override
  String pdfToPptxPagesToSlides(int count) {
    return '$count trang > $count trang trình bày';
  }

  @override
  String get pdfToPptxEmptyDocument => 'Tài liệu trống';

  @override
  String get qualityLabel => 'Chất lượng';

  @override
  String get pdfToPptxQualityHint =>
      'Độ phân giải cao hơn mang lại các trang trình bày sắc nét hơn nhưng tệp lớn hơn đáng kể.';

  @override
  String pdfToPptxHeavyWarning(int count) {
    return 'Cảnh báo: ở chất lượng cao, bản trình bày gồm $count trang có thể nặng vài chục MB và mất nhiều thời gian để mở. Chọn Tiêu chuẩn khi nghi ngờ.';
  }

  @override
  String get goodToKnow => 'Cụ thể là';

  @override
  String get pdfToPptxCaveat =>
      'Mỗi slide là một hình ảnh của trang: bố cục giống hệt PDF nhưng văn bản sẽ không thể chỉnh sửa được trong PowerPoint.\nĐể truy xuất văn bản có thể chỉnh sửa, thay vào đó hãy sử dụng “PDF to Word”.\nMột bản trình bày chỉ có một định dạng slide: nó được lấy từ trang đầu tiên và các trang có định dạng khác nhau được căn giữa trong đó.';

  @override
  String get pdfToPptxResultTitle => 'Bản trình bày đã sẵn sàng';

  @override
  String pdfToPptxResultDetail(
    String name,
    int count,
    String size,
    String quality,
  ) {
    return '$name — $count slide · $size · $quality';
  }

  @override
  String get notSavedYet =>
      'Tệp chưa có trên thiết bị của bạn: hãy lưu hoặc chia sẻ tệp.';

  @override
  String get pdfToPptxChangeQuality => 'Thay đổi chất lượng';

  @override
  String get pdfToPptxConvertAction => 'Chuyển đổi sang PowerPoint';

  @override
  String pdfToPptxExportWhat(int count) {
    return 'Bản trình bày PowerPoint · $count slide';
  }

  @override
  String get formatLabel => 'Định dạng';

  @override
  String get actionExport => 'Xuất tệp';

  @override
  String get imageQualityWeb => 'Web (72 dpi)';

  @override
  String get imageQualityStandard => 'Tiêu chuẩn (150 dpi)';

  @override
  String get imageQualityHigh => 'Chất lượng cao (300 dpi)';

  @override
  String get pdfToImagesEmptyTitle => 'Một hình ảnh trên mỗi trang';

  @override
  String get pdfToImagesEmptyBody =>
      'Chọn một tệp PDF: mỗi trang sẽ xuất hiện dưới dạng hình ảnh, với độ nét mà bạn điều chỉnh sau đó.';

  @override
  String pdfToImagesNotAPdf(String name) {
    return '$name: Vui lòng chọn tệp PDF.';
  }

  @override
  String errorLoadFailed(String detail) {
    return 'Không tải được: $detail';
  }

  @override
  String get pdfToImagesProgress => 'Đang xuất tệp…';

  @override
  String pdfToImagesExportWhat(int count, String format) {
    return '$count hình ảnh $format';
  }

  @override
  String get pdfaEmptyTitle => 'Lưu trữ trong một thời gian dài';

  @override
  String get pdfaEmptyBody =>
      'PDF/A là định dạng lưu trữ được nhiều cơ quan quản lý yêu cầu. Tài liệu được chuyển đổi mà không làm mất đi vẻ ngoài của nó.';

  @override
  String get pdfaConformanceLevel => 'Mức độ tuân thủ';

  @override
  String get pdfaA1bDetail =>
      'Mức độ nghiêm ngặt nhất và được chấp nhận rộng rãi nhất. Chọn khi nghi ngờ.';

  @override
  String get pdfaA2bDetail =>
      'Dựa trên PDF 1.7: nén hiệu quả hơn, tệp nhẹ hơn một chút.';

  @override
  String get pdfaA3bDetail =>
      'Giống như A-2b, nhưng cho phép đính kèm (thường được yêu cầu đối với hóa đơn điện tử).';

  @override
  String pdfaConvertingTo(String level) {
    return 'Chuyển đổi sang $level…';
  }

  @override
  String get pdfaCaveatTitle => 'Việc chuyển đổi thay đổi những gì';

  @override
  String pdfaCaveat(int dpi) {
    return 'Mỗi trang được vẽ lại dưới dạng hình ảnh ở $dpi dpi: văn bản trở thành hình ảnh, bố cục bị cố định. Đây chính là điều khiến file thực sự tuân thủ mà không phụ thuộc vào phông chữ của tài liệu gốc nhưng bù lại văn bản không còn có thể lựa chọn hoặc tìm kiếm được nữa, các liên kết và biểu mẫu biến mất và file trở nên nặng hơn.';
  }

  @override
  String pdfaOpenFailed(String detail) {
    return 'Không thể mở tệp PDF này: $detail';
  }

  @override
  String get imagesToPdfEmptyTitle => 'Hình ảnh, PDF';

  @override
  String get imagesToPdfEmptyBody =>
      'JPG, PNG, WebP, HEIC - thêm hình ảnh của bạn và chúng sẽ được tập hợp theo thứ tự bạn chọn.';

  @override
  String get imagesToPdfChoose => 'Chọn hình ảnh';

  @override
  String get imagesToPdfAdd => 'Thêm hình ảnh';

  @override
  String imagesToPdfRejected(String names) {
    return 'Đã bỏ qua (không phải hình ảnh): $names';
  }

  @override
  String get imagesToPdfBuilding => 'Đang tạo tệp PDF...';

  @override
  String imagesToPdfBuildFailed(String detail) {
    return 'Tạo không thành công: $detail';
  }

  @override
  String imagesToPdfCreateAction(int count) {
    return 'Tạo tệp PDF ($count hình ảnh)';
  }

  @override
  String get actionRotate => 'Quay';

  @override
  String get actionRemove => 'Rút';

  @override
  String get htmlTitle => 'HTML / trang web sang PDF';

  @override
  String get htmlIntro =>
      'Chuyển đổi một trang web hoặc mã HTML thành A4 PDF. Việc hiển thị được thực hiện bởi trình duyệt được tích hợp vào Android, do đó bố cục giống như bố cục in từ Chrome.';

  @override
  String get htmlModeUrl => 'Địa chỉ trang web';

  @override
  String get htmlModeCode => 'mã HTML';

  @override
  String get htmlUrlLabel => 'Địa chỉ trang';

  @override
  String get htmlUrlHint => 'https://example.fr/article';

  @override
  String get htmlCodeLabel => 'mã HTML';

  @override
  String get htmlCodeHint => '<h1>Tiêu đề</h1>\n<p>Văn bản…</p>';

  @override
  String get htmlUrlBadScheme =>
      'Địa chỉ phải bắt đầu bằng http:// hoặc https://.';

  @override
  String get htmlUrlIncomplete => 'Nhập địa chỉ web đầy đủ.';

  @override
  String get htmlCodeEmpty => 'Dán mã HTML để chuyển đổi.';

  @override
  String get htmlLoadingUrl => 'Đang tải trang và chuyển đổi…';

  @override
  String get htmlConverting => 'Đang tiến hành chuyển đổi HTML...';

  @override
  String get htmlNetworkNotice =>
      'Cần có kết nối internet: ​​đây là công cụ duy nhất trong ứng dụng phải tải xuống trang. Các trang yêu cầu đăng nhập tài khoản, biểu ngữ cookie hoặc nhiều JavaScript có thể không hoàn chỉnh.';

  @override
  String get htmlOfflineNotice =>
      'HTML và CSS được viết trực tiếp vào trang sẽ được hiển thị ngoại tuyến. Mặt khác, hình ảnh, biểu định kiểu hoặc phông chữ được gọi bằng địa chỉ web bên ngoài yêu cầu kết nối internet.';

  @override
  String get watermarkEmptyTitle => 'Thêm hình mờ';

  @override
  String get watermarkEmptyBody =>
      'Văn bản bạn chọn được lặp lại ở chế độ nền trên tất cả các trang — để đánh dấu tài liệu là bí mật hoặc bản nháp.';

  @override
  String get watermarkEmptyNote => 'Xuất miễn phí không giới hạn số lượng.';

  @override
  String get watermarkTextLabel => 'Văn bản hình mờ';

  @override
  String get watermarkDefaultText => 'BẢO MẬT';

  @override
  String get watermarkNeedText => 'Nhập văn bản cho hình mờ.';

  @override
  String watermarkOpacity(int percent) {
    return 'Độ mờ: $percent %';
  }

  @override
  String watermarkRotation(int degrees) {
    return 'Góc quay: $degrees°';
  }

  @override
  String watermarkFontSize(int points) {
    return 'Cỡ chữ: $points pt';
  }

  @override
  String get watermarkColor => 'Màu sắc';

  @override
  String get colorGrey => 'Xám';

  @override
  String get colorRed => 'Màu đỏ';

  @override
  String get colorBlue => 'Màu xanh da trời';

  @override
  String get colorBlack => 'Đen';

  @override
  String get watermarkProgress => 'Đang tiến hành áp dụng hình mờ…';

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
    return '$points điểm';
  }

  @override
  String get pageNumbersEmptyTitle => 'Đánh số trang';

  @override
  String get pageNumbersEmptyBody =>
      'Chọn một tệp PDF, sau đó chọn vị trí và định dạng của các số sẽ được thêm vào trên mỗi trang.';

  @override
  String get positionLabel => 'Chức vụ';

  @override
  String get positionBottomCenter => 'trung tâm dưới cùng';

  @override
  String get positionBottomRight => 'Dưới cùng bên phải';

  @override
  String get positionTopCenter => 'trung tâm hàng đầu';

  @override
  String get positionTopRight => 'Trên cùng bên phải';

  @override
  String get pageNumbersFormatPlain => 'N';

  @override
  String get pageNumbersFormatOfTotal => 'N/tổng ​​cộng';

  @override
  String get pageNumbersStart => 'Số bắt đầu';

  @override
  String get pageNumbersProgress => 'Đang đánh số…';

  @override
  String get organizeEmptyTitle => 'Tiếp tục một bản PDF trong tay';

  @override
  String get organizeEmptyBody =>
      'Mở tài liệu để chia nhỏ, trích xuất trang hoặc thay đổi thứ tự.';

  @override
  String get organizeOpenFile => 'Mở một tập tin';

  @override
  String get organizeNothingToExport => 'Không có trang nào để xuất.';

  @override
  String organizePagesKept(int kept, int total) {
    return '$kept trang được giữ lại trong tổng số $total';
  }

  @override
  String get organizePageExcluded => 'Bị loại bỏ';

  @override
  String organizePageMoved(int from) {
    return 'Đã chuyển từ vị trí $from';
  }

  @override
  String organizePageTitle(int number) {
    return 'Trang $number';
  }

  @override
  String organizeExcludePage(int number) {
    return 'Loại bỏ trang $number';
  }

  @override
  String organizeIncludePage(int number) {
    return 'Bao gồm trang $number';
  }

  @override
  String organizeMovePage(int number) {
    return 'Di chuyển trang $number';
  }

  @override
  String get organizeExtract => 'Trích xuất';

  @override
  String get organizeSplit => 'Chia';

  @override
  String get organizePreview => 'Xem trước';

  @override
  String get organizeExtractTitle => 'Trích xuất một phạm vi trang';

  @override
  String organizeRangeLabel(int start, int end) {
    return 'Trang $start tới $end';
  }

  @override
  String get organizeSplitTitle => 'Chia thành nhiều tập tin';

  @override
  String organizeFileCount(int count) {
    return '$count tệp';
  }

  @override
  String organizeSplitFailed(String detail) {
    return 'Lỗi phân chia: $detail';
  }

  @override
  String get scanNoCamera => 'Không có máy ảnh có sẵn trên thiết bị này.';

  @override
  String scanCameraFailed(String detail) {
    return 'Không thể khởi tạo camera: $detail';
  }

  @override
  String get scanCropToolbar => 'Điều chỉnh';

  @override
  String scanCaptureFailed(String detail) {
    return 'Chụp không thành công: $detail';
  }

  @override
  String get scanPermissionBody =>
      'Cần có quyền truy cập vào máy ảnh để quét tài liệu.';

  @override
  String get scanGrantPermission => 'Cho phép máy ảnh';

  @override
  String get actionRetry => 'Thử lại';

  @override
  String get scanNoPageYet => 'Không có trang nào vào lúc này';

  @override
  String scanFinishAction(int count) {
    return 'Kết thúc · $count';
  }

  @override
  String get signTitle => 'Ký một bản PDF';

  @override
  String get signIntro =>
      'Thêm chữ ký vẽ tay của bạn vào một trang PDF. Đó là một bản vẽ đơn giản được thêm vào tài liệu chứ không phải chữ ký điện tử được chứng nhận.';

  @override
  String get signChooseSubtitle => 'Chọn văn bản cần ký';

  @override
  String get signPickPage => 'Chọn trang để ký.';

  @override
  String get signDrawTitle => 'Vẽ chữ ký của tôi';

  @override
  String get signDrawBody =>
      'Vẽ bằng ngón tay của bạn như trên giấy. Điều này sẽ đưa một thiết kế lên trang - nó không phải là chữ ký điện tử được chứng nhận.';

  @override
  String get signNeedDrawing => 'Vẽ chữ ký trước khi tiếp tục.';

  @override
  String get signClear => 'Xóa';

  @override
  String get signValidate => 'Xác thực';

  @override
  String get signPlaceBody =>
      'Kéo chữ ký đến vị trí mong muốn trên trang, sau đó chạm vào Hoàn tất.';

  @override
  String get signPageUnavailable => 'Không thể hiển thị trang.';

  @override
  String get signProgress => 'Đang thêm chữ ký…';

  @override
  String get editTitle => 'Chú thích một tài liệu';

  @override
  String get editEmptyBody =>
      'Thêm văn bản hoặc đánh dấu các đoạn trực tiếp vào tệp PDF hiện có.';

  @override
  String get editAddTextTitle => 'Thêm văn bản';

  @override
  String get editTextHint => 'Văn bản của bạn';

  @override
  String editFontSize(int size) {
    return 'Kích thước văn bản: $size';
  }

  @override
  String get editNeedAnnotation =>
      'Thêm ít nhất một chú thích trước khi hoàn tất.';

  @override
  String get editProgress => 'Ứng dụng chú thích…';

  @override
  String get editChooseOther => 'Chọn một bản PDF khác';

  @override
  String get editUndoTooltip => 'Hoàn tác chú thích cuối cùng';

  @override
  String get editModeText => 'Chữ';

  @override
  String get editModeHighlight => 'Điểm nổi bật';

  @override
  String get editPageUnavailable => 'Không thể hiển thị trang này.';

  @override
  String get ocrEmptyTitle => 'Làm cho văn bản có thể tìm kiếm được';

  @override
  String get ocrEmptyBody =>
      'Văn bản của bản PDF được quét sẽ được nhận dạng và thêm vào hình ảnh một cách vô hình. Trang này không thay đổi diện mạo.';

  @override
  String get ocrWrongFormat =>
      'Chọn một tệp PDF hoặc hình ảnh (JPG, PNG, v.v.).';

  @override
  String get ocrProgress => 'Đang tiến hành công nhận…';

  @override
  String ocrFailed(String detail) {
    return 'Không nhận dạng được: $detail';
  }

  @override
  String get ocrRunAction => 'Bắt đầu công nhận';

  @override
  String get ocrResultTitle => 'kết quả OCR';

  @override
  String ocrResultBody(int count) {
    return '$count trang được phân tích. Bản PDF có thể tìm kiếm đã sẵn sàng và bạn cũng có thể sao chép tất cả văn bản được nhận dạng.';
  }

  @override
  String get ocrCopyText => 'Sao chép văn bản';

  @override
  String get ocrTextCopied => 'Đã sao chép văn bản.';

  @override
  String get redactIntro =>
      'Ẩn vĩnh viễn các khu vực của tệp PDF (tên, địa chỉ, số tiền). Không giống như một hình chữ nhật màu đen đơn giản được đặt ở trên cùng, văn bản ẩn thực sự bị xóa khỏi tệp chứ không chỉ bị che: nó không thể được chọn hoặc sao chép nữa.';

  @override
  String get redactChooseSubtitle => 'Chọn tài liệu để biên tập lại';

  @override
  String get redactCaveat =>
      'Xin lưu ý: để xóa văn bản ẩn, mỗi trang của tài liệu sẽ được chuyển thành hình ảnh (200 ppi). Do đó, kết quả không còn là một tệp PDF mà từ đó văn bản có thể được chọn và tệp kết quả thường nặng hơn tệp gốc.';

  @override
  String get redactEmptyPdf => 'Bản PDF này không chứa bất kỳ trang nào.';

  @override
  String redactOpenFailed(String detail) {
    return 'Không thể mở tệp PDF này (có thể nó được bảo vệ bằng mật khẩu): $detail';
  }

  @override
  String redactPageRenderFailed(int number, String detail) {
    return 'Không thể hiển thị trang $number: $detail';
  }

  @override
  String get redactUndoTooltip => 'Hoàn tác vùng cuối cùng';

  @override
  String get redactInstructions =>
      'Kéo ngón tay của bạn trên trang để vẽ vùng cần ẩn. Văn bản bị che thực sự sẽ bị xóa khỏi tệp chứ không chỉ bị che.';

  @override
  String get redactPagePrevious => 'Trang trước';

  @override
  String get redactPageNext => 'Trang tiếp theo';

  @override
  String redactPager(int current, int total) {
    return 'Trang $current / $total';
  }

  @override
  String get redactNoZone => 'Không có diện tích được vẽ';

  @override
  String redactZoneCount(int count) {
    return '$count khu vực cần ẩn';
  }

  @override
  String get redactOtherPdf => 'PDF khác';

  @override
  String get redactAction => 'Biên tập lại';

  @override
  String get redactProgress => 'Đang trong quá trình chỉnh sửa…';

  @override
  String get cropEmptyTitle => 'Cắt lề';

  @override
  String get cropEmptyBody =>
      'Chọn một tệp PDF, sau đó kéo ngón tay của bạn qua bản xem trước để phác thảo khu vực bạn muốn giữ lại.';

  @override
  String get cropTooSmall => 'Vùng được chọn quá nhỏ.';

  @override
  String get cropProgress => 'Đang cắt tỉa…';

  @override
  String cropFailed(String detail) {
    return 'Cắt tỉa không thành công: $detail';
  }

  @override
  String get cropKeptArea => 'Khu bảo tồn';

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
  String get cropFullPage => 'Toàn trang';

  @override
  String get cropAllPages => 'Áp dụng cho tất cả các trang';

  @override
  String get cropAllPagesOn => 'Khu vực tương tự được cắt ra trên mỗi trang.';

  @override
  String get cropAllPagesOff =>
      'Chỉ có trang 1 bị cắt, các trang còn lại giữ nguyên.';

  @override
  String get cropCaveat =>
      'Việc cắt xén làm giảm kích thước của trang: nội dung bên ngoài khu vực không còn được hiển thị hoặc in.';

  @override
  String get cropAction => 'Mùa vụ';

  @override
  String get compareTitle => 'So sánh hai tệp PDF';

  @override
  String get compareEmptyTitle => 'Điều gì đã thay đổi';

  @override
  String get compareEmptyBody =>
      'Chọn hai phiên bản của cùng một tệp PDF. Các đoạn được thêm và bị xóa sẽ được đặt cạnh nhau, theo từng trang.';

  @override
  String get compareSlotA => 'Tập tin A';

  @override
  String get compareSlotB => 'Tệp B';

  @override
  String get compareAction => 'So sánh';

  @override
  String get compareProgress => 'Đang tiến hành so sánh…';

  @override
  String compareFailed(String detail) {
    return 'So sánh không thành công: $detail';
  }

  @override
  String compareChangedPages(int changed, int total) {
    return '$changed trang khác nhau trên $total';
  }

  @override
  String get compareNoDifference =>
      'Không có sự khác biệt được phát hiện giữa hai tập tin.';

  @override
  String comparePageHeading(int number) {
    return 'Trang $number';
  }

  @override
  String organizeFilesCreated(int count) {
    return 'Đã tạo $count tệp';
  }

  @override
  String organizePartTitle(int number) {
    return 'Phần $number';
  }
}
