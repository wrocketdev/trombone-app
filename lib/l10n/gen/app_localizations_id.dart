// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Indonesian (`id`).
class LId extends L {
  LId([String locale = 'id']) : super(locale);

  @override
  String get appTitle => 'Trombone — PDF, Pindai & Word';

  @override
  String get appWordmark => 'Trombone';

  @override
  String get actionSave => 'Simpan';

  @override
  String get actionShare => 'Bagikan';

  @override
  String get actionCompress => 'Perkecil';

  @override
  String get actionDone => 'Selesai';

  @override
  String get actionCancel => 'Batal';

  @override
  String get actionChange => 'Ganti';

  @override
  String get actionContinue => 'Lanjut';

  @override
  String get actionOpening => 'Membuka…';

  @override
  String get actionRemoveFile => 'Hapus berkas ini';

  @override
  String get progressPreparing => 'Menyiapkan…';

  @override
  String progressPercent(int percent) {
    return '$percent%';
  }

  @override
  String get emptyReassurance =>
      'Ekspor gratis, tanpa tanda air dan tanpa batas.';

  @override
  String get emptyAcceptedFormats => 'Format yang diterima';

  @override
  String get exportSavedTitle => 'Tersimpan.';

  @override
  String get exportSavedBody =>
      'Dengan nama dan di folder yang baru saja Anda pilih. Tanpa tanda air, tanpa batas, tidak ada yang perlu dibuka.';

  @override
  String get exportSaveDialogTitle => 'Simpan PDF';

  @override
  String pageTileIncluded(int number) {
    return 'Halaman $number, disertakan. Ketuk untuk mengeluarkan.';
  }

  @override
  String pageTileExcluded(int number) {
    return 'Halaman $number, dikeluarkan. Ketuk untuk menyertakan.';
  }

  @override
  String pageTileRotate(int number) {
    return 'Putar halaman $number';
  }

  @override
  String sectionHeaderSemantics(String title, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count alat',
    );
    return '$title, $_temp0';
  }

  @override
  String toolCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count alat',
    );
    return '$_temp0';
  }

  @override
  String get homePromise =>
      'Buat dokumen Anda, lalu ekspor.\nTanpa paywall di akhir.';

  @override
  String get homeChipNoAccount => 'Tanpa akun';

  @override
  String get homeChipNoWatermark => 'Tanpa tanda air';

  @override
  String get homeChipUnlimited => 'Ekspor tanpa batas';

  @override
  String get homeSearchTooltip => 'Cari alat';

  @override
  String get homeColophon =>
      'Tidak ada yang terkunci di balik pembayaran saat menyimpan. Ekspor gratis, tanpa tanda air, dan tanpa batas.';

  @override
  String get sectionFeatured => 'Pilihan';

  @override
  String get sectionToPdf => 'Ke PDF';

  @override
  String get sectionFromPdf => 'Dari PDF';

  @override
  String get sectionSecurity => 'Keamanan';

  @override
  String get sectionEdit => 'Ubah';

  @override
  String get toolMerge => 'Gabungkan';

  @override
  String get toolMergeKeywords => 'satukan gabung menyatukan kumpulkan sambung';

  @override
  String get toolMergeSubtitle =>
      'PDF, Word, gambar, dan teks dalam satu dokumen';

  @override
  String get toolRectoVerso => 'Bolak-balik';

  @override
  String get toolRectoVersoKeywords =>
      'dupleks selang-seling pindai ganjil genap dua sisi';

  @override
  String get toolRectoVersoSubtitle => 'Dua hasil pindai, kembali berurutan';

  @override
  String get toolImagesToPdf => 'Gambar ke PDF';

  @override
  String get toolImagesToPdfKeywords => 'foto jpg jpeg png album kamera gambar';

  @override
  String get toolImagesToPdfSubtitle =>
      'Foto dan tangkapan layar dalam satu dokumen';

  @override
  String get toolPdfToWord => 'PDF ke Word';

  @override
  String get toolPdfToWordKeywords => 'docx pengolah kata bisa diedit ubah doc';

  @override
  String get toolPdfToWordSubtitle => 'Teks dan tabel, bisa diedit';

  @override
  String get toolOrganize => 'Tata PDF';

  @override
  String get toolOrganizeKeywords =>
      'pisah bagi ambil urutkan ulang urutan halaman hapus';

  @override
  String get toolOrganizeSubtitle => 'Membagi, mengambil, mengurutkan';

  @override
  String get toolExcelToPdf => 'Excel ke PDF';

  @override
  String get toolExcelToPdfKeywords =>
      'lembar kerja xlsx buku kerja spreadsheet';

  @override
  String get toolPptxToPdf => 'PowerPoint ke PDF';

  @override
  String get toolPptxToPdfKeywords => 'pptx slide presentasi';

  @override
  String get toolHtmlToPdf => 'Halaman web ke PDF';

  @override
  String get toolHtmlToPdfKeywords => 'html situs internet url tautan artikel';

  @override
  String get toolScan => 'Pindai dokumen';

  @override
  String get toolScanKeywords => 'kamera foto digitalkan pemindai kertas';

  @override
  String get toolPdfToExcel => 'PDF ke Excel';

  @override
  String get toolPdfToExcelKeywords => 'lembar kerja xlsx tabel ambil data';

  @override
  String get toolPdfToPptx => 'PDF ke PowerPoint';

  @override
  String get toolPdfToPptxKeywords => 'pptx slide presentasi';

  @override
  String get toolPdfToImages => 'PDF ke gambar';

  @override
  String get toolPdfToImagesKeywords =>
      'jpg png foto ekspor tangkapan layar gambar';

  @override
  String get toolOcr => 'Teks bisa dicari (OCR)';

  @override
  String get toolOcrKeywords => 'pengenalan karakter hasil pindai salin pilih';

  @override
  String get toolPdfA => 'Ubah ke PDF/A';

  @override
  String get toolPdfAKeywords => 'arsip standar jangka panjang penyimpanan iso';

  @override
  String get toolProtect => 'Lindungi PDF';

  @override
  String get toolProtectKeywords =>
      'sandi kata sandi gembok enkripsi kunci amankan';

  @override
  String get toolUnlock => 'Buka kunci PDF';

  @override
  String get toolUnlockKeywords => 'hapus sandi buka dekripsi gembok';

  @override
  String get toolRepair => 'Perbaiki PDF';

  @override
  String get toolRepairKeywords => 'rusak tidak terbaca korup pulihkan galat';

  @override
  String get toolRedact => 'Sensor PDF';

  @override
  String get toolRedactKeywords =>
      'sembunyikan hitamkan anonimkan rahasia hapus sensor';

  @override
  String get toolEdit => 'Edit PDF';

  @override
  String get toolEditKeywords => 'teks ubah perbaiki anotasi tulis';

  @override
  String get toolSign => 'Tanda tangan';

  @override
  String get toolSignKeywords => 'tanda tangan paraf kontrak tangan';

  @override
  String get toolWatermark => 'Tanda air';

  @override
  String get toolWatermarkKeywords => 'watermark stempel rahasia draf tanda';

  @override
  String get toolPageNumbers => 'Nomor halaman';

  @override
  String get toolPageNumbersKeywords => 'penomoran folio beri nomor angka';

  @override
  String get toolCrop => 'Pangkas PDF';

  @override
  String get toolCropKeywords => 'potong margin pangkas tepi ukuran';

  @override
  String get toolCompare => 'Bandingkan PDF';

  @override
  String get toolCompareKeywords => 'perbedaan versi diff perubahan bandingkan';

  @override
  String get searchHint => 'Gabungkan, kata sandi, tanda air…';

  @override
  String get searchClear => 'Hapus';

  @override
  String searchNoResultTitle(String query) {
    return 'Tidak ada alat untuk “$query”.';
  }

  @override
  String get searchNoResultBody =>
      'Coba format yang Anda punya — “Word”, “Excel”, “foto” — atau apa yang ingin Anda lakukan: “tanda tangan”, “bagi”, “kata sandi”.';

  @override
  String get actionUndo => 'Urungkan';

  @override
  String get actionApply => 'Terapkan';

  @override
  String get actionChoose => 'Pilih';

  @override
  String get actionChoosePdf => 'Pilih PDF';

  @override
  String get actionChooseFiles => 'Pilih berkas';

  @override
  String get actionConvert => 'Ubah';

  @override
  String get actionFinish => 'Selesaikan';

  @override
  String get actionBack => 'Kembali';

  @override
  String get actionAdd => 'Tambah';

  @override
  String get noFileChosen => 'Belum ada berkas dipilih';

  @override
  String errorExportFailed(String detail) {
    return 'Ekspor gagal: $detail';
  }

  @override
  String errorShareFailed(String detail) {
    return 'Berbagi gagal: $detail';
  }

  @override
  String errorOpenFailed(String detail) {
    return 'Berkas tidak dapat dibuka: $detail';
  }

  @override
  String errorConversionFailed(String detail) {
    return 'Konversi gagal: $detail';
  }

  @override
  String errorOnFile(String name, String detail) {
    return '$name: $detail';
  }

  @override
  String get errorPickPdf => 'Silakan pilih berkas PDF.';

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
      other: '$count halaman',
    );
    return '$_temp0';
  }

  @override
  String pageCountOfTotal(int kept, int total) {
    String _temp0 = intl.Intl.pluralLogic(
      kept,
      locale: localeName,
      other: '$kept halaman',
    );
    return '$_temp0 dari $total';
  }

  @override
  String pageOfTotal(int current, int total) {
    return 'Halaman $current dari $total';
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
  String get formatImages => 'Gambar';

  @override
  String get formatText => 'Teks';

  @override
  String get mergeAddFile => 'Tambah berkas';

  @override
  String get mergeAddHint => 'PDF, Word, gambar, atau teks';

  @override
  String get mergeEmptyTitle => 'Satu dokumen saja';

  @override
  String get mergeEmptyBody =>
      'Tambahkan PDF, berkas Word, gambar, atau teks. Anda bisa mengurutkan ulang dan mengeluarkan halaman sebelum mengekspor.';

  @override
  String get mergeNeedOnePage =>
      'Tambahkan setidaknya satu berkas dengan halaman yang disertakan.';

  @override
  String get mergeProgress => 'Menggabungkan…';

  @override
  String mergeFailed(String detail) {
    return 'Penggabungan gagal: $detail';
  }

  @override
  String mergeRemoved(String name) {
    return '$name dihapus.';
  }

  @override
  String mergeRemoveTooltip(String name) {
    return 'Hapus $name';
  }

  @override
  String mergeMoveSemantics(String name) {
    return 'Pindahkan $name';
  }

  @override
  String get mergeRotateAll => 'Putar semua halaman';

  @override
  String mergePreviewAndExport(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count halaman',
    );
    return 'Pratinjau dan ekspor ($_temp0)';
  }

  @override
  String previewTitle(String size) {
    return 'Pratinjau · $size';
  }

  @override
  String previewZoomPage(int number) {
    return 'Halaman $number, perbesar';
  }

  @override
  String get previewPageUnreadable => 'Halaman tidak terbaca.';

  @override
  String previewExportWhat(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count halaman',
    );
    return 'PDF · $_temp0';
  }

  @override
  String get compressTitle => 'Pengecilan';

  @override
  String compressBody(String size) {
    return 'Ukuran saat ini: $size. Pilih tingkatnya — perkiraan ukuran muncul sebelum diterapkan.';
  }

  @override
  String get compressEstimating => 'Memperkirakan…';

  @override
  String get compressProgress => 'Memperkecil…';

  @override
  String compressFailed(String detail) {
    return 'Pengecilan gagal: $detail';
  }

  @override
  String get protectEmptyTitle => 'Beri kata sandi';

  @override
  String get protectEmptyBody =>
      'PDF tidak akan terbuka lagi tanpa kata sandi yang Anda pilih. Simpan baik-baik: kata sandi itu tidak bisa dipulihkan.';

  @override
  String get protectSubtitle => 'Akan dienkripsi dengan AES 256-bit';

  @override
  String get protectPassword => 'Kata sandi';

  @override
  String get protectConfirmPassword => 'Konfirmasi kata sandi';

  @override
  String get protectShowPasswords => 'Tampilkan kata sandi';

  @override
  String get protectHidePasswords => 'Sembunyikan kata sandi';

  @override
  String get protectMismatch => 'Kedua kata sandi berbeda.';

  @override
  String get protectWarning =>
      'Catat di suatu tempat: tanpa kata sandi itu, dokumen menjadi tidak terbaca selamanya. Tidak ada pemulihan, baik oleh Anda maupun oleh aplikasi.';

  @override
  String get protectAlreadyProtected =>
      'Berkas ini sudah terlindungi — gunakan Buka kunci PDF terlebih dahulu.';

  @override
  String get protectProgress => 'Melindungi…';

  @override
  String protectFailed(String detail) {
    return 'Perlindungan gagal: $detail';
  }

  @override
  String get protectAction => 'Lindungi';

  @override
  String get protectResultTitle => 'PDF terlindungi';

  @override
  String get protectResultDetail =>
      'Dienkripsi dengan AES 256-bit. Kata sandi diperlukan untuk membukanya.';

  @override
  String get protectExportWhat => 'PDF terlindungi kata sandi';

  @override
  String get unlockEmptyTitle => 'Hapus kata sandi';

  @override
  String get unlockEmptyBody =>
      'Anda memerlukan kata sandi dokumen saat ini. Setelah dihapus, PDF akan terbuka bebas.';

  @override
  String get unlockAcceptsProtectedPdf => 'PDF terlindungi';

  @override
  String get unlockChooseProtectedPdf => 'Pilih PDF terlindungi';

  @override
  String get unlockCurrentPassword => 'Kata sandi saat ini';

  @override
  String get unlockWrongPassword => 'Kata sandi salah.';

  @override
  String get unlockProgress => 'Membuka kunci…';

  @override
  String unlockFailed(String detail) {
    return 'Pembukaan kunci gagal: $detail';
  }

  @override
  String get unlockAction => 'Buka kunci';

  @override
  String get repairEmptyTitle => 'Perbaiki berkas rusak';

  @override
  String get repairEmptyBody =>
      'Struktur dalam PDF yang rusak dibangun ulang. Apa yang bisa diselamatkan akan diselamatkan.';

  @override
  String get repairProgress => 'Memperbaiki…';

  @override
  String get repairFailed =>
      'Berkas ini tidak dapat diperbaiki — mungkin terlalu rusak.';

  @override
  String get repairAction => 'Perbaiki';

  @override
  String get pdfToWordEmptyTitle => 'Word yang bisa diedit';

  @override
  String get pdfToWordEmptyBody =>
      'Teks dan struktur PDF dipindahkan ke dokumen .docx yang dapat Anda buka kembali dan edit.';

  @override
  String get pdfToWordAnalyzing => 'Menganalisis dokumen…';

  @override
  String get pdfToWordAnalysisPending => 'Analisis menunggu';

  @override
  String pdfToWordAnalysisFailed(String detail) {
    return 'Analisis gagal: $detail';
  }

  @override
  String get pdfLocked => 'PDF ini terlindungi kata sandi. Buka kuncinya dulu.';

  @override
  String get pdfToWordConverting => 'Mengubah ke Word…';

  @override
  String get pdfToWordSummaryTitle => 'Isi yang terdeteksi';

  @override
  String pdfToWordParagraphCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count paragraf',
    );
    return '$_temp0';
  }

  @override
  String pdfToWordHeadingCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count judul',
    );
    return '$_temp0';
  }

  @override
  String pdfToWordTableCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count tabel',
    );
    return '$_temp0';
  }

  @override
  String get pdfToWordNoTables =>
      'Tidak ada tabel terdeteksi: jika PDF Anda memuatnya, barisnya akan diubah menjadi paragraf.';

  @override
  String get pdfToWordCaveat =>
      'Konversi menyalin teks, format, dan tabel, tetapi bukan tata letak persisnya: posisi gambar dan kolom tidak dipertahankan, dan gambar tidak ikut masuk ke dokumen Word.';

  @override
  String get pdfToWordScanWarning =>
      'PDF ini tampak seperti hasil pindai: tidak ada teks yang ditemukan. Gunakan alat Teks bisa dicari (OCR) terlebih dahulu, lalu kembali dan ubah PDF hasilnya.';

  @override
  String get pdfToWordResultTitle => 'Dokumen Word siap';

  @override
  String pdfToWordResultDetail(String name, String size) {
    return '$name — $size';
  }

  @override
  String get pdfToWordExportWhat => 'Dokumen Word';

  @override
  String get pdfToWordConvertAction => 'Ubah ke Word';

  @override
  String get actionConvertAgain => 'Ubah lagi';

  @override
  String errorSaveFailed(String detail) {
    return 'Tidak dapat menyimpan: $detail';
  }

  @override
  String get rectoVersoIntro =>
      'Pengumpan satu sisi menghasilkan dua berkas: halaman ganjil berurutan, halaman genap sering kali terbalik. Pilih keduanya untuk menyusunnya kembali.';

  @override
  String get rectoVersoOddSlot => 'Berkas halaman ganjil (depan)';

  @override
  String get rectoVersoEvenSlot => 'Berkas halaman genap (belakang)';

  @override
  String get rectoVersoReversed => 'Berkas kedua berurutan terbalik';

  @override
  String get rectoVersoReversedHint =>
      'Ini kasus yang paling umum, dicentang secara bawaan';

  @override
  String rectoVersoPreview(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count halaman',
    );
    return 'Pratinjau penyelangan ($_temp0)';
  }

  @override
  String get rectoVersoProgress => 'Menyelang-nyeling…';

  @override
  String fileWithPageCount(String name, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count halaman',
    );
    return '$name · $_temp0';
  }

  @override
  String get actionPreviewAndExport => 'Pratinjau dan ekspor';

  @override
  String errorOpenFailedShort(String detail) {
    return 'Tidak dapat dibuka: $detail';
  }

  @override
  String errorGeneric(String detail) {
    return 'Gagal: $detail';
  }

  @override
  String get actionConvertToPdf => 'Ubah ke PDF';

  @override
  String get convertProgress => 'Mengubah…';

  @override
  String get excelEmptyTitle => 'Buku kerja jadi PDF';

  @override
  String get excelEmptyBody =>
      'Lembar-lembar berkas .xlsx menjadi halaman PDF, siap dikirim atau dicetak.';

  @override
  String get excelChooseWorkbook => 'Pilih buku kerja';

  @override
  String get excelChooseXlsx => 'Pilih buku kerja .xlsx';

  @override
  String get excelLegacyFormat =>
      'Format .xls (format biner Excel yang lama) tidak didukung. Simpan berkas sebagai .xlsx lalu coba lagi.';

  @override
  String get excelWrongFormat => 'Silakan pilih buku kerja Excel .xlsx.';

  @override
  String excelUnreadable(String detail) {
    return 'Buku kerja tidak terbaca: $detail';
  }

  @override
  String excelSheetsAndRows(int sheets, int rows) {
    String _temp0 = intl.Intl.pluralLogic(
      sheets,
      locale: localeName,
      other: '$sheets lembar',
    );
    String _temp1 = intl.Intl.pluralLogic(
      rows,
      locale: localeName,
      other: '$rows baris seluruhnya',
    );
    return '$_temp0 · $_temp1';
  }

  @override
  String get excelSheetsDetected => 'Lembar yang terdeteksi';

  @override
  String get excelEmptySheet => 'Lembar kosong';

  @override
  String excelSheetDimensions(int rows, int columns) {
    String _temp0 = intl.Intl.pluralLogic(
      rows,
      locale: localeName,
      other: '$rows baris',
    );
    String _temp1 = intl.Intl.pluralLogic(
      columns,
      locale: localeName,
      other: '$columns kolom',
    );
    return '$_temp0 × $_temp1';
  }

  @override
  String get excelRepeatHeader => 'Ulangi baris tajuk di setiap halaman';

  @override
  String get excelRepeatHeaderHint =>
      'Baris pertama lembar digambar ulang di bagian atas setiap halaman tabel.';

  @override
  String get excelCaveat =>
      'Yang ikut dalam konversi: teks sel sebagaimana tersimpan di berkas (termasuk hasil hitung terakhir dari rumus), baris pertama ditebalkan, dan garis kisi.\n\nYang tidak ikut: warna, huruf, format angka, sel gabungan, gambar, grafik, dan rumusnya sendiri. Kolom dipersempit agar muat pada lebar halaman; pada lembar yang sangat lebar, teks sel yang terlalu sempit dipotong dengan “…”.';

  @override
  String get pptxEmptyTitle => 'Presentasi jadi PDF';

  @override
  String get pptxEmptyBody =>
      'Satu halaman lanskap 16:9 per slide, berisi judul dan butir-butirnya. Teks ikut; gambar, bentuk, dan latar aslinya tidak.\n\nFormat yang diterima: .pptx. Berkas .ppt lama harus disimpan ulang sebagai .pptx dari PowerPoint terlebih dahulu.';

  @override
  String get pptxChoosePresentation => 'Pilih presentasi';

  @override
  String get pptxTextOnlyTitle => 'Hanya teks yang diubah';

  @override
  String get pptxTextOnlyBody =>
      'Teks setiap slide ikut. Gambar, bentuk, latar, warna, dan tata letak aslinya tidak dipertahankan: PDF yang dihasilkan adalah tata letak sederhana dan mudah dibaca, bukan salinan setia presentasi Anda.';

  @override
  String pptxSlideCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count slide',
    );
    return '$_temp0';
  }

  @override
  String get pptxSlidesDetected => 'Slide yang terdeteksi';

  @override
  String pptxMoreSlides(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count slide',
    );
    return 'dan $_temp0 lagi…';
  }

  @override
  String get pptxUntitledSlide => 'Tanpa judul';

  @override
  String get pptxEmptySlide => 'Tanpa teks (hanya gambar atau bentuk)';

  @override
  String pptxTextLineCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count baris teks',
    );
    return '$_temp0';
  }

  @override
  String pptxReadFailed(String detail) {
    return 'Tidak dapat dibaca: $detail';
  }

  @override
  String get compressLevelLight => 'Ringan';

  @override
  String get compressLevelMedium => 'Sedang';

  @override
  String get compressLevelStrong => 'Kuat';

  @override
  String get pptxQualityStandard => 'Standar (150 dpi)';

  @override
  String get pptxQualityHigh => 'Tinggi (220 dpi)';

  @override
  String get pdfToExcelEmptyTitle => 'Ambil kembali tabelnya';

  @override
  String get pdfToExcelEmptyBody =>
      'Tabel dalam PDF diambil ke buku kerja Excel. Formatnya tidak dipertahankan, nilainya iya.';

  @override
  String pdfToExcelPagesAnalyzed(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count halaman dianalisis',
    );
    return '$_temp0';
  }

  @override
  String pdfToExcelAnalysisFailed(String detail) {
    return 'Analisis tidak mungkin. PDF mungkin terlindungi kata sandi atau rusak. ($detail)';
  }

  @override
  String get pdfToExcelNothingToExport =>
      'Tidak ada yang diekspor: tidak ada tabel terdeteksi.';

  @override
  String get pdfToExcelBuilding => 'Membuat buku kerja…';

  @override
  String get pdfToExcelIncludeParagraphs =>
      'Sertakan juga teks di luar tabel (satu baris per paragraf)';

  @override
  String get pdfToExcelIncludeParagraphsHint =>
      'Berguna untuk dokumen setengah terstruktur: teks masuk ke kolom A, setelah tabel-tabel halaman itu.';

  @override
  String get pdfToExcelCaveatTitle => 'Yang tidak dipertahankan konversi';

  @override
  String get pdfToExcelCaveat =>
      'Pendeteksian bertumpu pada posisi teks di halaman: tabel tanpa garis tepi yang teratur, sel gabungan, dan kolom yang sangat tidak beraturan bisa terpotong keliru. PDF hasil pindai (berupa gambar) tidak memuat teks yang bisa diambil dan tidak akan menghasilkan apa pun. Warna, rumus, dan gambar tidak pernah ikut: hanya nilai teksnya.';

  @override
  String pdfToExcelTablesFound(int tables, int pages) {
    String _temp0 = intl.Intl.pluralLogic(
      tables,
      locale: localeName,
      other: '$tables tabel terdeteksi',
    );
    String _temp1 = intl.Intl.pluralLogic(
      pages,
      locale: localeName,
      other: '$pages halaman',
    );
    return '$_temp0 pada $_temp1';
  }

  @override
  String pdfToExcelPagesConcerned(String pages) {
    return 'Halaman yang terkait: $pages';
  }

  @override
  String pdfToExcelParagraphsOutside(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count paragraf di luar tabel',
    );
    return '$_temp0';
  }

  @override
  String get pdfToExcelScannedWarning =>
      'Tidak ada teks yang bisa diambil dari PDF ini: hampir pasti ini dokumen hasil pindai (gambar halaman). Lembar kerja tidak bisa mengolahnya; gunakan alat pengenalan teks (OCR) terlebih dahulu.';

  @override
  String get pdfToExcelNoTableWarning =>
      'Tidak ada struktur tabel yang dikenali dalam dokumen ini. Teksnya ada, tetapi tidak tersusun dalam kolom yang teratur. Daripada menghasilkan buku kerja yang tidak terbaca, aktifkan “Sertakan juga teks di luar tabel” di atas, atau gunakan “PDF ke Word” yang lebih baik menjaga paragraf.';

  @override
  String get pdfToExcelResultTitle => 'Buku kerja siap';

  @override
  String get pdfToExcelExportWhat => 'Buku kerja Excel';

  @override
  String get pdfToExcelConvertAction => 'Ubah ke Excel';

  @override
  String resultNameAndSize(String name, String size) {
    return '$name — $size';
  }

  @override
  String get pdfToPptxEmptyTitle => 'Satu slide per halaman';

  @override
  String get pdfToPptxEmptyBody =>
      'PDF menjadi presentasi PowerPoint yang sama persis. Setiap halaman masuk sebagai gambar: tata letaknya setia, tetapi teksnya tidak bisa diedit di PowerPoint.';

  @override
  String pdfToPptxOpenFailed(String detail) {
    return 'PDF ini tidak dapat dibuka: $detail';
  }

  @override
  String get pdfToPptxConverting => 'Mengubah ke PowerPoint…';

  @override
  String pdfToPptxPagesToSlides(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count halaman',
    );
    String _temp1 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count slide',
    );
    return '$_temp0 > $_temp1';
  }

  @override
  String get pdfToPptxEmptyDocument => 'Dokumen kosong';

  @override
  String get qualityLabel => 'Kualitas';

  @override
  String get pdfToPptxQualityHint =>
      'Resolusi lebih tinggi memberi slide yang lebih tajam tetapi berkas yang jauh lebih berat.';

  @override
  String pdfToPptxHeavyWarning(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count halaman',
    );
    return 'Perhatian: pada kualitas tinggi, presentasi berisi $_temp0 bisa berukuran puluhan MB dan lambat dibuka. Pilih Standar bila ragu.';
  }

  @override
  String get goodToKnow => 'Perlu diketahui';

  @override
  String get pdfToPptxCaveat =>
      'Setiap slide adalah gambar halaman: tata letaknya sama dengan PDF, tetapi teksnya tidak bisa diedit di PowerPoint.\nUntuk mendapatkan teks yang bisa diedit, gunakan “PDF ke Word”.\nSebuah presentasi hanya punya satu ukuran slide: diambil dari halaman pertama, dan halaman berukuran lain diletakkan di tengahnya.';

  @override
  String get pdfToPptxResultTitle => 'Presentasi siap';

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
      other: '$count slide',
    );
    return '$name — $_temp0 · $size · $quality';
  }

  @override
  String get notSavedYet =>
      'Berkas belum ada di perangkat Anda: simpan atau bagikan.';

  @override
  String get pdfToPptxChangeQuality => 'Ganti kualitas';

  @override
  String get pdfToPptxConvertAction => 'Ubah ke PowerPoint';

  @override
  String pdfToPptxExportWhat(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count slide',
    );
    return 'Presentasi PowerPoint · $_temp0';
  }

  @override
  String get formatLabel => 'Format';

  @override
  String get actionExport => 'Ekspor';

  @override
  String get imageQualityWeb => 'Web (72 dpi)';

  @override
  String get imageQualityStandard => 'Standar (150 dpi)';

  @override
  String get imageQualityHigh => 'Kualitas tinggi (300 dpi)';

  @override
  String get pdfToImagesEmptyTitle => 'Satu gambar per halaman';

  @override
  String get pdfToImagesEmptyBody =>
      'Pilih PDF: setiap halaman akan keluar sebagai gambar, pada resolusi yang Anda atur setelahnya.';

  @override
  String pdfToImagesNotAPdf(String name) {
    return '$name: silakan pilih berkas PDF.';
  }

  @override
  String errorLoadFailed(String detail) {
    return 'Pemuatan gagal: $detail';
  }

  @override
  String get pdfToImagesProgress => 'Mengekspor…';

  @override
  String pdfToImagesExportWhat(int count, String format) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count gambar $format',
    );
    return '$_temp0';
  }

  @override
  String get pdfaEmptyTitle => 'Arsipkan untuk jangka panjang';

  @override
  String get pdfaEmptyBody =>
      'PDF/A adalah format arsip yang diminta banyak instansi. Dokumen diubah tanpa kehilangan tampilannya.';

  @override
  String get pdfaConformanceLevel => 'Tingkat kesesuaian';

  @override
  String get pdfaA1bDetail =>
      'Tingkat paling ketat dan paling luas diterima. Pilih ini bila ragu.';

  @override
  String get pdfaA2bDetail =>
      'Berbasis PDF 1.7: kompresi lebih efisien, berkas sedikit lebih ringan.';

  @override
  String get pdfaA3bDetail =>
      'Seperti A-2b, tetapi mengizinkan lampiran (sering diminta untuk faktur elektronik).';

  @override
  String pdfaConvertingTo(String level) {
    return 'Mengubah ke $level…';
  }

  @override
  String get pdfaCaveatTitle => 'Yang berubah karena konversi';

  @override
  String pdfaCaveat(int dpi) {
    return 'Setiap halaman digambar ulang sebagai gambar pada $dpi dpi: teks menjadi gambar dan tata letaknya terkunci. Itulah yang membuat berkas benar-benar sesuai standar tanpa bergantung pada huruf dokumen aslinya, tetapi sebagai gantinya teks tidak bisa lagi dipilih atau dicari, tautan dan formulir hilang, dan berkas menjadi lebih berat.';
  }

  @override
  String pdfaOpenFailed(String detail) {
    return 'PDF ini tidak dapat dibuka: $detail';
  }

  @override
  String get imagesToPdfEmptyTitle => 'Gambar dalam satu PDF';

  @override
  String get imagesToPdfEmptyBody =>
      'JPG, PNG, WebP, HEIC — tambahkan gambar Anda dan semuanya akan disusun sesuai urutan yang Anda pilih.';

  @override
  String get imagesToPdfChoose => 'Pilih gambar';

  @override
  String get imagesToPdfAdd => 'Tambah gambar';

  @override
  String imagesToPdfRejected(String names) {
    return 'Dilewati (bukan gambar): $names';
  }

  @override
  String get imagesToPdfBuilding => 'Membuat PDF…';

  @override
  String imagesToPdfBuildFailed(String detail) {
    return 'Pembuatan gagal: $detail';
  }

  @override
  String imagesToPdfCreateAction(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count gambar',
    );
    return 'Buat PDF ($_temp0)';
  }

  @override
  String get actionRotate => 'Putar';

  @override
  String get actionRemove => 'Hapus';

  @override
  String get htmlTitle => 'HTML / halaman web ke PDF';

  @override
  String get htmlIntro =>
      'Ubah halaman web atau kode HTML menjadi PDF A4. Perenderan dilakukan oleh peramban bawaan Android, jadi tata letaknya seperti hasil cetak dari Chrome.';

  @override
  String get htmlModeUrl => 'Alamat web';

  @override
  String get htmlModeCode => 'Kode HTML';

  @override
  String get htmlUrlLabel => 'Alamat halaman';

  @override
  String get htmlUrlHint => 'https://contoh.id/artikel';

  @override
  String get htmlCodeLabel => 'Kode HTML';

  @override
  String get htmlCodeHint => '<h1>Judul</h1>\n<p>Teks…</p>';

  @override
  String get htmlUrlBadScheme => 'Alamat harus diawali http:// atau https://.';

  @override
  String get htmlUrlIncomplete => 'Masukkan alamat web yang lengkap.';

  @override
  String get htmlCodeEmpty => 'Tempelkan kode HTML untuk diubah.';

  @override
  String get htmlLoadingUrl => 'Memuat halaman dan mengubah…';

  @override
  String get htmlConverting => 'Mengubah HTML…';

  @override
  String get htmlNetworkNotice =>
      'Koneksi internet diperlukan: ini satu-satunya alat di aplikasi yang harus mengunduh halaman. Halaman yang menuntut masuk akun, spanduk kuki, atau banyak JavaScript bisa keluar tidak lengkap.';

  @override
  String get htmlOfflineNotice =>
      'HTML dan CSS yang ditulis langsung di halaman dirender tanpa koneksi. Sebaliknya, gambar, lembar gaya, atau huruf yang diambil dari alamat web luar memerlukan koneksi internet.';

  @override
  String get watermarkEmptyTitle => 'Bubuhkan tanda air';

  @override
  String get watermarkEmptyBody =>
      'Teks pilihan Anda diulang sebagai latar di semua halaman — untuk menandai dokumen sebagai rahasia atau sebagai draf.';

  @override
  String get watermarkEmptyNote => 'Ekspor gratis dan tanpa batas.';

  @override
  String get watermarkTextLabel => 'Teks tanda air';

  @override
  String get watermarkDefaultText => 'RAHASIA';

  @override
  String get watermarkNeedText => 'Masukkan teks untuk tanda air.';

  @override
  String watermarkOpacity(int percent) {
    return 'Keburaman: $percent%';
  }

  @override
  String watermarkRotation(int degrees) {
    return 'Sudut putar: $degrees°';
  }

  @override
  String watermarkFontSize(int points) {
    return 'Ukuran teks: $points pt';
  }

  @override
  String get watermarkColor => 'Warna';

  @override
  String get colorGrey => 'Abu-abu';

  @override
  String get colorRed => 'Merah';

  @override
  String get colorBlue => 'Biru';

  @override
  String get colorBlack => 'Hitam';

  @override
  String get watermarkProgress => 'Membubuhkan tanda air…';

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
  String get pageNumbersEmptyTitle => 'Beri nomor halaman';

  @override
  String get pageNumbersEmptyBody =>
      'Pilih PDF, lalu posisi dan bentuk nomor yang akan ditambahkan ke setiap halaman.';

  @override
  String get positionLabel => 'Posisi';

  @override
  String get positionBottomCenter => 'Bawah tengah';

  @override
  String get positionBottomRight => 'Bawah kanan';

  @override
  String get positionTopCenter => 'Atas tengah';

  @override
  String get positionTopRight => 'Atas kanan';

  @override
  String get pageNumbersFormatPlain => 'N';

  @override
  String get pageNumbersFormatOfTotal => 'N / total';

  @override
  String get pageNumbersStart => 'Nomor awal';

  @override
  String get pageNumbersProgress => 'Memberi nomor…';

  @override
  String get organizeEmptyTitle => 'Tata ulang sebuah PDF';

  @override
  String get organizeEmptyBody =>
      'Buka dokumen untuk membaginya, mengambil halaman darinya, atau mengubah urutannya.';

  @override
  String get organizeOpenFile => 'Buka berkas';

  @override
  String get organizeNothingToExport => 'Tidak ada halaman untuk diekspor.';

  @override
  String organizePagesKept(int kept, int total) {
    String _temp0 = intl.Intl.pluralLogic(
      kept,
      locale: localeName,
      other: '$kept halaman dipertahankan',
    );
    return '$_temp0 dari $total';
  }

  @override
  String get organizePageExcluded => 'Dikeluarkan';

  @override
  String organizePageMoved(int from) {
    return 'Dipindahkan dari posisi $from';
  }

  @override
  String organizePageTitle(int number) {
    return 'Halaman $number';
  }

  @override
  String organizeExcludePage(int number) {
    return 'Keluarkan halaman $number';
  }

  @override
  String organizeIncludePage(int number) {
    return 'Sertakan halaman $number';
  }

  @override
  String organizeMovePage(int number) {
    return 'Pindahkan halaman $number';
  }

  @override
  String get organizeExtract => 'Ambil';

  @override
  String get organizeSplit => 'Bagi';

  @override
  String get organizePreview => 'Pratinjau';

  @override
  String get organizeExtractTitle => 'Ambil rentang halaman';

  @override
  String organizeRangeLabel(int start, int end) {
    return 'Halaman $start sampai $end';
  }

  @override
  String get organizeSplitTitle => 'Bagi menjadi beberapa berkas';

  @override
  String organizeFileCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count berkas',
    );
    return '$_temp0';
  }

  @override
  String organizeSplitFailed(String detail) {
    return 'Pembagian gagal: $detail';
  }

  @override
  String get scanNoCamera => 'Tidak ada kamera yang tersedia di perangkat ini.';

  @override
  String scanCameraFailed(String detail) {
    return 'Kamera tidak dapat dijalankan: $detail';
  }

  @override
  String get scanCropToolbar => 'Sesuaikan';

  @override
  String scanCaptureFailed(String detail) {
    return 'Pengambilan gambar gagal: $detail';
  }

  @override
  String get scanPermissionBody =>
      'Akses ke kamera diperlukan untuk memindai dokumen.';

  @override
  String get scanGrantPermission => 'Izinkan kamera';

  @override
  String get actionRetry => 'Coba lagi';

  @override
  String get scanNoPageYet => 'Belum ada halaman.';

  @override
  String scanFinishAction(int count) {
    return 'Selesaikan · $count';
  }

  @override
  String get signTitle => 'Tanda tangani PDF';

  @override
  String get signIntro =>
      'Bubuhkan tanda tangan yang Anda gambar sendiri pada satu halaman PDF. Ini sekadar gambar yang ditambahkan ke dokumen, bukan tanda tangan elektronik tersertifikasi.';

  @override
  String get signChooseSubtitle => 'Pilih dokumen yang akan ditandatangani';

  @override
  String get signPickPage => 'Pilih halaman yang akan ditandatangani.';

  @override
  String get signDrawTitle => 'Gambar tanda tangan saya';

  @override
  String get signDrawBody =>
      'Gambarlah dengan jari seperti di atas kertas. Ini membubuhkan gambar pada halaman — bukan tanda tangan elektronik tersertifikasi.';

  @override
  String get signNeedDrawing => 'Gambarlah tanda tangan sebelum melanjutkan.';

  @override
  String get signClear => 'Hapus';

  @override
  String get signValidate => 'Konfirmasi';

  @override
  String get signPlaceBody =>
      'Seret tanda tangan ke tempat yang Anda inginkan pada halaman, lalu ketuk Selesaikan.';

  @override
  String get signPageUnavailable => 'Halaman tidak dapat ditampilkan.';

  @override
  String get signProgress => 'Menambahkan tanda tangan…';

  @override
  String get editTitle => 'Beri anotasi pada dokumen';

  @override
  String get editEmptyBody =>
      'Tambahkan teks atau soroti bagian tertentu langsung pada PDF yang sudah ada.';

  @override
  String get editAddTextTitle => 'Tambah teks';

  @override
  String get editTextHint => 'Teks Anda';

  @override
  String editFontSize(int size) {
    return 'Ukuran teks: $size';
  }

  @override
  String get editNeedAnnotation =>
      'Tambahkan setidaknya satu anotasi sebelum menyelesaikan.';

  @override
  String get editProgress => 'Menerapkan anotasi…';

  @override
  String get editChooseOther => 'Pilih PDF lain';

  @override
  String get editUndoTooltip => 'Urungkan anotasi terakhir';

  @override
  String get editModeText => 'Teks';

  @override
  String get editModeHighlight => 'Soroti';

  @override
  String get editPageUnavailable => 'Halaman ini tidak dapat ditampilkan.';

  @override
  String get ocrEmptyTitle => 'Jadikan teks bisa dicari';

  @override
  String get ocrEmptyBody =>
      'Teks pada PDF hasil pindai dikenali dan ditambahkan di atas gambar, secara tak terlihat. Tampilan halaman tidak berubah.';

  @override
  String get ocrWrongFormat => 'Pilih PDF atau gambar (JPG, PNG…).';

  @override
  String get ocrProgress => 'Mengenali…';

  @override
  String ocrFailed(String detail) {
    return 'Pengenalan gagal: $detail';
  }

  @override
  String get ocrRunAction => 'Mulai pengenalan';

  @override
  String get ocrResultTitle => 'Hasil OCR';

  @override
  String ocrResultBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count halaman dianalisis',
    );
    return '$_temp0. PDF yang bisa dicari sudah siap, dan Anda juga bisa menyalin seluruh teks yang dikenali.';
  }

  @override
  String get ocrCopyText => 'Salin teks';

  @override
  String get ocrTextCopied => 'Teks disalin.';

  @override
  String get redactIntro =>
      'Sembunyikan bagian PDF secara permanen (nama, alamat, jumlah uang). Berbeda dengan sekadar kotak hitam yang ditumpangkan, teks yang disembunyikan benar-benar dihapus dari berkas, bukan hanya tertutup: teks itu tidak bisa lagi dipilih atau disalin.';

  @override
  String get redactChooseSubtitle => 'Pilih dokumen yang akan disensor';

  @override
  String get redactCaveat =>
      'Perlu diketahui: untuk menghapus teks yang tersembunyi, setiap halaman dokumen diubah kembali menjadi gambar (200 dpi). Karena itu hasilnya bukan lagi PDF yang teksnya bisa dipilih, dan berkas yang diperoleh biasanya lebih berat daripada aslinya.';

  @override
  String get redactEmptyPdf => 'PDF ini tidak memuat satu halaman pun.';

  @override
  String redactOpenFailed(String detail) {
    return 'PDF ini tidak dapat dibuka (mungkin terlindungi kata sandi): $detail';
  }

  @override
  String redactPageRenderFailed(int number, String detail) {
    return 'Halaman $number tidak dapat ditampilkan: $detail';
  }

  @override
  String get redactUndoTooltip => 'Urungkan area terakhir';

  @override
  String get redactInstructions =>
      'Seret jari Anda di halaman untuk menandai area yang akan disembunyikan. Teks yang tertutup benar-benar akan dihapus dari berkas, bukan hanya tertutup.';

  @override
  String get redactPagePrevious => 'Halaman sebelumnya';

  @override
  String get redactPageNext => 'Halaman berikutnya';

  @override
  String redactPager(int current, int total) {
    return 'Halaman $current / $total';
  }

  @override
  String get redactNoZone => 'Belum ada area ditandai';

  @override
  String redactZoneCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count area untuk disembunyikan',
    );
    return '$_temp0';
  }

  @override
  String get redactOtherPdf => 'PDF lain';

  @override
  String get redactAction => 'Sensor';

  @override
  String get redactProgress => 'Menyensor…';

  @override
  String get cropEmptyTitle => 'Pangkas margin';

  @override
  String get cropEmptyBody =>
      'Pilih PDF, lalu seret jari Anda pada pratinjau untuk menandai area yang ingin dipertahankan.';

  @override
  String get cropTooSmall => 'Area yang dipilih terlalu kecil.';

  @override
  String get cropProgress => 'Memangkas…';

  @override
  String cropFailed(String detail) {
    return 'Pemangkasan gagal: $detail';
  }

  @override
  String get cropKeptArea => 'Area yang dipertahankan';

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
  String get cropFullPage => 'Seluruh halaman';

  @override
  String get cropAllPages => 'Terapkan ke semua halaman';

  @override
  String get cropAllPagesOn => 'Area yang sama dipotong pada setiap halaman.';

  @override
  String get cropAllPagesOff =>
      'Hanya halaman 1 yang dipangkas, sisanya tetap utuh.';

  @override
  String get cropCaveat =>
      'Pemangkasan memperkecil ukuran halaman: isi di luar area tidak lagi ditampilkan maupun dicetak.';

  @override
  String get cropAction => 'Pangkas';

  @override
  String get compareTitle => 'Bandingkan dua PDF';

  @override
  String get compareEmptyTitle => 'Apa yang berubah';

  @override
  String get compareEmptyBody =>
      'Pilih dua versi dari PDF yang sama. Bagian yang ditambahkan dan dihapus akan disandingkan, halaman demi halaman.';

  @override
  String get compareSlotA => 'Berkas A';

  @override
  String get compareSlotB => 'Berkas B';

  @override
  String get compareAction => 'Bandingkan';

  @override
  String get compareProgress => 'Membandingkan…';

  @override
  String compareFailed(String detail) {
    return 'Perbandingan gagal: $detail';
  }

  @override
  String compareChangedPages(int changed, int total) {
    String _temp0 = intl.Intl.pluralLogic(
      changed,
      locale: localeName,
      other: '$changed halaman berbeda',
    );
    return '$_temp0 dari $total';
  }

  @override
  String get compareNoDifference =>
      'Tidak ada perbedaan yang terdeteksi antara kedua berkas.';

  @override
  String comparePageHeading(int number) {
    return 'Halaman $number';
  }

  @override
  String organizeFilesCreated(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count berkas dibuat',
    );
    return '$_temp0';
  }

  @override
  String organizePartTitle(int number) {
    return 'Bagian $number';
  }
}
