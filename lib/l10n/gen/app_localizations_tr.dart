// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Turkish (`tr`).
class LTr extends L {
  LTr([String locale = 'tr']) : super(locale);

  @override
  String get appTitle => 'Trombone — PDF, Tarama ve Word';

  @override
  String get appWordmark => 'Trombone';

  @override
  String get actionSave => 'Kaydet';

  @override
  String get actionShare => 'Paylaş';

  @override
  String get actionCompress => 'Küçült';

  @override
  String get actionDone => 'Bitti';

  @override
  String get actionCancel => 'Vazgeç';

  @override
  String get actionChange => 'Değiştir';

  @override
  String get actionContinue => 'Devam';

  @override
  String get actionOpening => 'Açılıyor…';

  @override
  String get actionRemoveFile => 'Bu dosyayı çıkar';

  @override
  String get progressPreparing => 'Hazırlanıyor…';

  @override
  String progressPercent(int percent) {
    return '%$percent';
  }

  @override
  String get emptyReassurance =>
      'Dışa aktarma ücretsiz, filigransız ve sınırsız.';

  @override
  String get emptyAcceptedFormats => 'Kabul edilen biçimler';

  @override
  String get exportSavedTitle => 'Kaydedildi.';

  @override
  String get exportSavedBody =>
      'Az önce seçtiğiniz adla ve klasörde. Filigransız, sınırsız, açılacak hiçbir şey yok.';

  @override
  String get exportSaveDialogTitle => 'PDF’i kaydet';

  @override
  String pageTileIncluded(int number) {
    return 'Sayfa $number, dahil. Çıkarmak için dokunun.';
  }

  @override
  String pageTileExcluded(int number) {
    return 'Sayfa $number, çıkarıldı. Dahil etmek için dokunun.';
  }

  @override
  String pageTileRotate(int number) {
    return '$number. sayfayı döndür';
  }

  @override
  String sectionHeaderSemantics(String title, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count araç',
      one: '$count araç',
    );
    return '$title, $_temp0';
  }

  @override
  String toolCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count araç',
      one: '$count araç',
    );
    return '$_temp0';
  }

  @override
  String get homePromise =>
      'Belgenizi hazırlayın, dışa aktarın.\nSonunda duvar yok.';

  @override
  String get homeChipNoAccount => 'Hesapsız';

  @override
  String get homeChipNoWatermark => 'Filigransız';

  @override
  String get homeChipUnlimited => 'Sınırsız dışa aktarma';

  @override
  String get homeSearchTooltip => 'Araç ara';

  @override
  String get homeColophon =>
      'Kaydetme anında para karşılığı hiçbir şey açılmıyor. Dışa aktarma ücretsiz, filigransız ve sayı sınırı olmadan.';

  @override
  String get sectionFeatured => 'Öne çıkanlar';

  @override
  String get sectionToPdf => 'PDF’e';

  @override
  String get sectionFromPdf => 'PDF’ten';

  @override
  String get sectionSecurity => 'Güvenlik';

  @override
  String get sectionEdit => 'Düzenle';

  @override
  String get toolMerge => 'Birleştir';

  @override
  String get toolMergeKeywords => 'birlestir topla ekle birlestirme katistir';

  @override
  String get toolMergeSubtitle => 'PDF, Word, görsel ve metin tek belgede';

  @override
  String get toolRectoVerso => 'Çift taraflı';

  @override
  String get toolRectoVersoKeywords =>
      'dupleks harmanla tarama tek cift iki yuz';

  @override
  String get toolRectoVersoSubtitle => 'İki tarama, yeniden sırasında';

  @override
  String get toolImagesToPdf => 'Görseller PDF’e';

  @override
  String get toolImagesToPdfKeywords =>
      'fotograf jpg jpeg png albüm kamera gorsel resim';

  @override
  String get toolImagesToPdfSubtitle =>
      'Fotoğraflar ve ekran görüntüleri tek belgede';

  @override
  String get toolPdfToWord => 'PDF’ten Word’e';

  @override
  String get toolPdfToWordKeywords =>
      'docx kelime islemci duzenlenebilir donustur doc';

  @override
  String get toolPdfToWordSubtitle => 'Metin ve tablolar, düzenlenebilir';

  @override
  String get toolOrganize => 'Sayfaları düzenle';

  @override
  String get toolOrganizeKeywords =>
      'bol ayir cikar yeniden sirala sira sayfa sil duzenle';

  @override
  String get toolOrganizeSubtitle => 'Bölme, çıkarma, sıralama';

  @override
  String get toolExcelToPdf => 'Excel’den PDF’e';

  @override
  String get toolExcelToPdfKeywords =>
      'hesap tablosu xlsx calisma kitabi sayfa';

  @override
  String get toolPptxToPdf => 'PowerPoint’ten PDF’e';

  @override
  String get toolPptxToPdfKeywords => 'pptx slayt sunum slides';

  @override
  String get toolHtmlToPdf => 'Web sayfası PDF’e';

  @override
  String get toolHtmlToPdfKeywords => 'html site internet url baglanti makale';

  @override
  String get toolScan => 'Belge tara';

  @override
  String get toolScanKeywords => 'kamera fotograf sayisallastir tarayici kagit';

  @override
  String get toolPdfToExcel => 'PDF’ten Excel’e';

  @override
  String get toolPdfToExcelKeywords => 'hesap tablosu xlsx tablo cikar veri';

  @override
  String get toolPdfToPptx => 'PDF’ten PowerPoint’e';

  @override
  String get toolPdfToPptxKeywords => 'pptx slayt sunum slides';

  @override
  String get toolPdfToImages => 'PDF’ten görsellere';

  @override
  String get toolPdfToImagesKeywords =>
      'jpg png fotograf disa aktar ekran goruntusu';

  @override
  String get toolOcr => 'Aranabilir metin (OCR)';

  @override
  String get toolOcrKeywords => 'tanima karakter taranmis kopyala sec';

  @override
  String get toolPdfA => 'PDF/A’ya dönüştür';

  @override
  String get toolPdfAKeywords => 'arsiv standart uzun vadeli saklama iso';

  @override
  String get toolProtect => 'PDF’i koru';

  @override
  String get toolProtectKeywords => 'parola sifre kilit sifrele guvenlik';

  @override
  String get toolUnlock => 'PDF kilidini aç';

  @override
  String get toolUnlockKeywords => 'parola kaldir ac sifre coz kilit';

  @override
  String get toolRepair => 'PDF’i onar';

  @override
  String get toolRepairKeywords => 'bozuk okunamaz hasarli kurtar hata';

  @override
  String get toolRedact => 'PDF’i karart';

  @override
  String get toolRedactKeywords => 'gizle karart anonimlestir gizli sil sansur';

  @override
  String get toolEdit => 'PDF’i düzenle';

  @override
  String get toolEditKeywords => 'metin degistir duzelt not ekle yaz';

  @override
  String get toolSign => 'İmzala';

  @override
  String get toolSignKeywords => 'imza paraf sozlesme el';

  @override
  String get toolWatermark => 'Filigran';

  @override
  String get toolWatermarkKeywords => 'watermark damga gizli taslak isaret';

  @override
  String get toolPageNumbers => 'Sayfa numaraları';

  @override
  String get toolPageNumbersKeywords =>
      'sayfalama folyo numaralandir rakam numara';

  @override
  String get toolCrop => 'PDF’i kırp';

  @override
  String get toolCropKeywords => 'kes kenar bosluklari kirp kenarlar boyut';

  @override
  String get toolCompare => 'PDF’leri karşılaştır';

  @override
  String get toolCompareKeywords => 'fark surum diff degisiklik karsilastir';

  @override
  String get searchHint => 'Birleştir, parola, filigran…';

  @override
  String get searchClear => 'Temizle';

  @override
  String searchNoResultTitle(String query) {
    return '“$query” için araç yok.';
  }

  @override
  String get searchNoResultBody =>
      'Elinizdeki biçimi deneyin — “Word”, “Excel”, “fotoğraf” — ya da onunla ne yapmak istediğinizi: “imzala”, “böl”, “parola”.';

  @override
  String get actionUndo => 'Geri al';

  @override
  String get actionApply => 'Uygula';

  @override
  String get actionChoose => 'Seç';

  @override
  String get actionChoosePdf => 'Bir PDF seç';

  @override
  String get actionChooseFiles => 'Dosya seç';

  @override
  String get actionConvert => 'Dönüştür';

  @override
  String get actionFinish => 'Tamamla';

  @override
  String get actionBack => 'Geri';

  @override
  String get actionAdd => 'Ekle';

  @override
  String get noFileChosen => 'Dosya seçilmedi';

  @override
  String errorExportFailed(String detail) {
    return 'Dışa aktarma başarısız: $detail';
  }

  @override
  String errorShareFailed(String detail) {
    return 'Paylaşma başarısız: $detail';
  }

  @override
  String errorOpenFailed(String detail) {
    return 'Dosya açılamadı: $detail';
  }

  @override
  String errorConversionFailed(String detail) {
    return 'Dönüştürme başarısız: $detail';
  }

  @override
  String errorOnFile(String name, String detail) {
    return '$name: $detail';
  }

  @override
  String get errorPickPdf => 'Lütfen bir PDF dosyası seçin.';

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
      other: '$count sayfa',
      one: '$count sayfa',
    );
    return '$_temp0';
  }

  @override
  String pageCountOfTotal(int kept, int total) {
    String _temp0 = intl.Intl.pluralLogic(
      kept,
      locale: localeName,
      other: '$kept sayfa',
      one: '$kept sayfa',
    );
    return '$total sayfadan $_temp0';
  }

  @override
  String pageOfTotal(int current, int total) {
    return 'Sayfa $current / $total';
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
  String get formatImages => 'Görseller';

  @override
  String get formatText => 'Metin';

  @override
  String get mergeAddFile => 'Dosya ekle';

  @override
  String get mergeAddHint => 'PDF, Word, görsel veya metin';

  @override
  String get mergeEmptyTitle => 'Tek bir belge';

  @override
  String get mergeEmptyBody =>
      'PDF, Word dosyası, görsel veya metin ekleyin. Dışa aktarmadan önce sıralarını değiştirebilir, sayfa çıkarabilirsiniz.';

  @override
  String get mergeNeedOnePage =>
      'Dahil edilecek en az bir sayfası olan bir dosya ekleyin.';

  @override
  String get mergeProgress => 'Birleştiriliyor…';

  @override
  String mergeFailed(String detail) {
    return 'Birleştirme başarısız: $detail';
  }

  @override
  String mergeRemoved(String name) {
    return '$name çıkarıldı.';
  }

  @override
  String mergeRemoveTooltip(String name) {
    return '$name dosyasını çıkar';
  }

  @override
  String mergeMoveSemantics(String name) {
    return '$name dosyasını taşı';
  }

  @override
  String get mergeRotateAll => 'Bütün sayfaları döndür';

  @override
  String mergePreviewAndExport(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count sayfa',
      one: '$count sayfa',
    );
    return 'Önizle ve dışa aktar ($_temp0)';
  }

  @override
  String previewTitle(String size) {
    return 'Önizleme · $size';
  }

  @override
  String previewZoomPage(int number) {
    return 'Sayfa $number, büyüt';
  }

  @override
  String get previewPageUnreadable => 'Sayfa okunamıyor.';

  @override
  String previewExportWhat(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count sayfa',
      one: '$count sayfa',
    );
    return 'PDF · $_temp0';
  }

  @override
  String get compressTitle => 'Küçültme';

  @override
  String compressBody(String size) {
    return 'Şu anki boyut: $size. Bir düzey seçin — tahmini boyut uygulamadan önce görünür.';
  }

  @override
  String get compressEstimating => 'Tahmin ediliyor…';

  @override
  String get compressProgress => 'Küçültülüyor…';

  @override
  String compressFailed(String detail) {
    return 'Küçültme başarısız: $detail';
  }

  @override
  String get protectEmptyTitle => 'Parolayla koru';

  @override
  String get protectEmptyBody =>
      'PDF, seçtiğiniz parola olmadan bir daha açılmayacak. Parolayı saklayın: kurtarılması mümkün değil.';

  @override
  String get protectSubtitle => 'AES 256 bit ile şifrelenecek';

  @override
  String get protectPassword => 'Parola';

  @override
  String get protectConfirmPassword => 'Parolayı doğrula';

  @override
  String get protectShowPasswords => 'Parolaları göster';

  @override
  String get protectHidePasswords => 'Parolaları gizle';

  @override
  String get protectMismatch => 'İki parola birbirinden farklı.';

  @override
  String get protectWarning =>
      'Bir yere not edin: parola olmadan belge kalıcı olarak okunamaz hale gelir. Ne sizin ne de uygulamanın kurtarma imkânı vardır.';

  @override
  String get protectAlreadyProtected =>
      'Bu dosya zaten korumalı — önce PDF kilidini aç aracını kullanın.';

  @override
  String get protectProgress => 'Korunuyor…';

  @override
  String protectFailed(String detail) {
    return 'Koruma başarısız: $detail';
  }

  @override
  String get protectAction => 'Koru';

  @override
  String get protectResultTitle => 'PDF korundu';

  @override
  String get protectResultDetail =>
      'AES 256 bit ile şifrelendi. Açmak için parola gerekecek.';

  @override
  String get protectExportWhat => 'Parolayla korunan PDF';

  @override
  String get unlockEmptyTitle => 'Parolayı kaldır';

  @override
  String get unlockEmptyBody =>
      'Belgenin şu anki parolası gerekir. Kaldırıldığında PDF serbestçe açılır.';

  @override
  String get unlockAcceptsProtectedPdf => 'Korumalı PDF';

  @override
  String get unlockChooseProtectedPdf => 'Korumalı bir PDF seç';

  @override
  String get unlockCurrentPassword => 'Şu anki parola';

  @override
  String get unlockWrongPassword => 'Parola yanlış.';

  @override
  String get unlockProgress => 'Kilit açılıyor…';

  @override
  String unlockFailed(String detail) {
    return 'Kilit açma başarısız: $detail';
  }

  @override
  String get unlockAction => 'Kilidi aç';

  @override
  String get repairEmptyTitle => 'Bozuk bir dosyayı onar';

  @override
  String get repairEmptyBody =>
      'Hasarlı bir PDF’in iç yapısı yeniden kurulur. Kurtarılabilecek olan kurtarılır.';

  @override
  String get repairProgress => 'Onarılıyor…';

  @override
  String get repairFailed => 'Bu dosya onarılamıyor — fazla hasarlı olabilir.';

  @override
  String get repairAction => 'Onar';

  @override
  String get pdfToWordEmptyTitle => 'Düzenlenebilir bir Word';

  @override
  String get pdfToWordEmptyBody =>
      'PDF’in metni ve yapısı, yeniden açıp düzeltebileceğiniz bir .docx belgesine aktarılır.';

  @override
  String get pdfToWordAnalyzing => 'Belge inceleniyor…';

  @override
  String get pdfToWordAnalysisPending => 'İnceleme bekliyor';

  @override
  String pdfToWordAnalysisFailed(String detail) {
    return 'İnceleme başarısız: $detail';
  }

  @override
  String get pdfLocked => 'Bu PDF parolayla korunuyor. Önce kilidini açın.';

  @override
  String get pdfToWordConverting => 'Word’e dönüştürülüyor…';

  @override
  String get pdfToWordSummaryTitle => 'Bulunan içerik';

  @override
  String pdfToWordParagraphCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count paragraf',
      one: '$count paragraf',
    );
    return '$_temp0';
  }

  @override
  String pdfToWordHeadingCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count başlık',
      one: '$count başlık',
    );
    return '$_temp0';
  }

  @override
  String pdfToWordTableCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count tablo',
      one: '$count tablo',
    );
    return '$_temp0';
  }

  @override
  String get pdfToWordNoTables =>
      'Hiç tablo bulunmadı: PDF’inizde varsa, satırları paragrafa dönüştürülecek.';

  @override
  String get pdfToWordCaveat =>
      'Dönüştürme metni, biçimlendirmeyi ve tabloları aktarır, ancak sayfa düzenini birebir aktarmaz: görsellerin ve sütunların konumu korunmaz, görseller Word belgesine taşınmaz.';

  @override
  String get pdfToWordScanWarning =>
      'Bu PDF bir tarama gibi görünüyor: hiç metin bulunamadı. Önce Aranabilir metin (OCR) aracını kullanın, sonra elde ettiğiniz PDF’i dönüştürün.';

  @override
  String get pdfToWordResultTitle => 'Word belgesi hazır';

  @override
  String pdfToWordResultDetail(String name, String size) {
    return '$name — $size';
  }

  @override
  String get pdfToWordExportWhat => 'Word belgesi';

  @override
  String get pdfToWordConvertAction => 'Word’e dönüştür';

  @override
  String get actionConvertAgain => 'Yeniden dönüştür';

  @override
  String errorSaveFailed(String detail) {
    return 'Kaydedilemedi: $detail';
  }

  @override
  String get rectoVersoIntro =>
      'Tek yüzlü besleyici iki dosya verir: tek sayfalar sırasıyla, çift sayfalar çoğu zaman ters sırayla. İkisini de seçerek yeniden birleştirin.';

  @override
  String get rectoVersoOddSlot => 'Tek sayfaların dosyası (ön yüz)';

  @override
  String get rectoVersoEvenSlot => 'Çift sayfaların dosyası (arka yüz)';

  @override
  String get rectoVersoReversed => 'İkinci dosya ters sırada';

  @override
  String get rectoVersoReversedHint =>
      'En sık karşılaşılan durum budur, varsayılan olarak işaretli';

  @override
  String rectoVersoPreview(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count sayfa',
      one: '$count sayfa',
    );
    return 'Harmanlama önizlemesi ($_temp0)';
  }

  @override
  String get rectoVersoProgress => 'Harmanlanıyor…';

  @override
  String fileWithPageCount(String name, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count sayfa',
      one: '$count sayfa',
    );
    return '$name · $_temp0';
  }

  @override
  String get actionPreviewAndExport => 'Önizle ve dışa aktar';

  @override
  String errorOpenFailedShort(String detail) {
    return 'Açılamadı: $detail';
  }

  @override
  String errorGeneric(String detail) {
    return 'Başarısız: $detail';
  }

  @override
  String get actionConvertToPdf => 'PDF’e dönüştür';

  @override
  String get convertProgress => 'Dönüştürülüyor…';

  @override
  String get excelEmptyTitle => 'Çalışma kitabı PDF olarak';

  @override
  String get excelEmptyBody =>
      '.xlsx dosyasının sayfaları PDF sayfalarına dönüşür, göndermeye ya da yazdırmaya hazır.';

  @override
  String get excelChooseWorkbook => 'Çalışma kitabı seç';

  @override
  String get excelChooseXlsx => '.xlsx çalışma kitabı seç';

  @override
  String get excelLegacyFormat =>
      '.xls biçimi (Excel’in eski ikili biçimi) desteklenmiyor. Dosyayı .xlsx olarak kaydedip yeniden deneyin.';

  @override
  String get excelWrongFormat => 'Lütfen .xlsx bir Excel çalışma kitabı seçin.';

  @override
  String excelUnreadable(String detail) {
    return 'Çalışma kitabı okunamıyor: $detail';
  }

  @override
  String excelSheetsAndRows(int sheets, int rows) {
    String _temp0 = intl.Intl.pluralLogic(
      sheets,
      locale: localeName,
      other: '$sheets sayfa',
      one: '$sheets sayfa',
    );
    String _temp1 = intl.Intl.pluralLogic(
      rows,
      locale: localeName,
      other: '$rows satır',
      one: '$rows satır',
    );
    return '$_temp0 · toplam $_temp1';
  }

  @override
  String get excelSheetsDetected => 'Bulunan sayfalar';

  @override
  String get excelEmptySheet => 'Boş sayfa';

  @override
  String excelSheetDimensions(int rows, int columns) {
    String _temp0 = intl.Intl.pluralLogic(
      rows,
      locale: localeName,
      other: '$rows satır',
      one: '$rows satır',
    );
    String _temp1 = intl.Intl.pluralLogic(
      columns,
      locale: localeName,
      other: '$columns sütun',
      one: '$columns sütun',
    );
    return '$_temp0 × $_temp1';
  }

  @override
  String get excelRepeatHeader => 'Başlık satırını her sayfada yinele';

  @override
  String get excelRepeatHeaderHint =>
      'Sayfanın ilk satırı, tablonun her sayfasının üstüne yeniden çizilir.';

  @override
  String get excelCaveat =>
      'Dönüştürmenin aktardıkları: hücre metni dosyada kayıtlı haliyle (formüllerin son hesaplanmış sonucu dahil), ilk satır kalın ve bir kılavuz çizgisi.\n\nAktarmadıkları: renkler, yazı tipleri, sayı biçimleri, birleştirilmiş hücreler, görseller, grafikler ve formüllerin kendisi. Sütunlar sayfa genişliğine sığsın diye daraltılır; çok geniş sayfalarda fazla dar hücrelerin metni “…” ile kesilir.';

  @override
  String get pptxEmptyTitle => 'Sunum PDF olarak';

  @override
  String get pptxEmptyBody =>
      'Her slayt için 16:9 yatay bir sayfa; başlık ve maddeler aktarılır. Metin aktarılır; özgün görseller, şekiller ve arka planlar aktarılmaz.\n\nKabul edilen biçim: .pptx. Eski bir .ppt dosyası önce PowerPoint’te .pptx olarak kaydedilmelidir.';

  @override
  String get pptxChoosePresentation => 'Sunum seç';

  @override
  String get pptxTextOnlyTitle => 'Yalnızca metin dönüştürülür';

  @override
  String get pptxTextOnlyBody =>
      'Her slaydın metni aktarılır. Özgün görseller, şekiller, arka planlar, renkler ve sayfa düzenleri korunmaz: elde edilen PDF yalın ve okunaklı bir düzendir, sunumunuzun birebir kopyası değil.';

  @override
  String pptxSlideCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count slayt',
      one: '$count slayt',
    );
    return '$_temp0';
  }

  @override
  String get pptxSlidesDetected => 'Bulunan slaytlar';

  @override
  String pptxMoreSlides(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count slayt',
      one: '$count slayt',
    );
    return 've $_temp0 daha…';
  }

  @override
  String get pptxUntitledSlide => 'Başlıksız';

  @override
  String get pptxEmptySlide => 'Metin yok (yalnızca görsel veya şekil)';

  @override
  String pptxTextLineCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count metin satırı',
      one: '$count metin satırı',
    );
    return '$_temp0';
  }

  @override
  String pptxReadFailed(String detail) {
    return 'Okunamadı: $detail';
  }

  @override
  String get compressLevelLight => 'Hafif';

  @override
  String get compressLevelMedium => 'Orta';

  @override
  String get compressLevelStrong => 'Güçlü';

  @override
  String get pptxQualityStandard => 'Standart (150 dpi)';

  @override
  String get pptxQualityHigh => 'Yüksek (220 dpi)';

  @override
  String get pdfToExcelEmptyTitle => 'Tabloları geri al';

  @override
  String get pdfToExcelEmptyBody =>
      'Bir PDF’teki tablolar Excel çalışma kitabına çıkarılır. Biçimlendirme korunmaz, değerler korunur.';

  @override
  String pdfToExcelPagesAnalyzed(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count sayfa incelendi',
      one: '$count sayfa incelendi',
    );
    return '$_temp0';
  }

  @override
  String pdfToExcelAnalysisFailed(String detail) {
    return 'İnceleme yapılamadı. PDF parolayla korunuyor veya hasarlı olabilir. ($detail)';
  }

  @override
  String get pdfToExcelNothingToExport =>
      'Dışa aktarılacak bir şey yok: hiç tablo bulunmadı.';

  @override
  String get pdfToExcelBuilding => 'Çalışma kitabı oluşturuluyor…';

  @override
  String get pdfToExcelIncludeParagraphs =>
      'Tablo dışındaki metni de dahil et (paragraf başına bir satır)';

  @override
  String get pdfToExcelIncludeParagraphsHint =>
      'Yarı yapılandırılmış bir belgede işe yarar: metin, sayfanın tablolarından sonra A sütununa yerleşir.';

  @override
  String get pdfToExcelCaveatTitle => 'Dönüştürmenin korumadıkları';

  @override
  String get pdfToExcelCaveat =>
      'Algılama, metnin sayfadaki konumuna dayanır: düzenli kenarlığı olmayan tablolar, birleştirilmiş hücreler ve çok düzensiz sütunlar yanlış bölünebilir. Taranmış bir PDF (görüntü) çıkarılabilir metin içermez ve hiçbir şey vermez. Renkler, formüller ve görseller hiçbir zaman aktarılmaz: yalnızca metin değerleri aktarılır.';

  @override
  String pdfToExcelTablesFound(int tables, int pages) {
    String _temp0 = intl.Intl.pluralLogic(
      pages,
      locale: localeName,
      other: '$pages sayfada',
      one: '$pages sayfada',
    );
    String _temp1 = intl.Intl.pluralLogic(
      tables,
      locale: localeName,
      other: '$tables tablo bulundu',
      one: '$tables tablo bulundu',
    );
    return '$_temp0 $_temp1';
  }

  @override
  String pdfToExcelPagesConcerned(String pages) {
    return 'İlgili sayfalar: $pages';
  }

  @override
  String pdfToExcelParagraphsOutside(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'tablo dışında $count paragraf',
      one: 'tablo dışında $count paragraf',
    );
    return '$_temp0';
  }

  @override
  String get pdfToExcelScannedWarning =>
      'Bu PDF’ten hiç metin çıkarılamadı: neredeyse kesinlikle taranmış bir belge (sayfa görüntüleri). Bir hesap tablosu bundan bir şey elde edemez; önce metin tanıma (OCR) aracını kullanın.';

  @override
  String get pdfToExcelNoTableWarning =>
      'Bu belgede hiçbir tablo yapısı tanınmadı. Metin orada, ama düzenli sütunlar halinde dizilmemiş. Okunamayan bir çalışma kitabı üretmek yerine yukarıdaki “Tablo dışındaki metni de dahil et” seçeneğini açın ya da paragrafları daha iyi koruyan “PDF’ten Word’e” aracını kullanın.';

  @override
  String get pdfToExcelResultTitle => 'Çalışma kitabı hazır';

  @override
  String get pdfToExcelExportWhat => 'Excel çalışma kitabı';

  @override
  String get pdfToExcelConvertAction => 'Excel’e dönüştür';

  @override
  String resultNameAndSize(String name, String size) {
    return '$name — $size';
  }

  @override
  String get pdfToPptxEmptyTitle => 'Sayfa başına bir slayt';

  @override
  String get pdfToPptxEmptyBody =>
      'PDF, birebir aynı bir PowerPoint sunumuna dönüşür. Her sayfa görüntü olarak gelir: sayfa düzeni sadıktır, ama metin PowerPoint’te düzenlenemez.';

  @override
  String pdfToPptxOpenFailed(String detail) {
    return 'Bu PDF açılamadı: $detail';
  }

  @override
  String get pdfToPptxConverting => 'PowerPoint’e dönüştürülüyor…';

  @override
  String pdfToPptxPagesToSlides(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count sayfa',
      one: '$count sayfa',
    );
    String _temp1 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count slayt',
      one: '$count slayt',
    );
    return '$_temp0 > $_temp1';
  }

  @override
  String get pdfToPptxEmptyDocument => 'Boş belge';

  @override
  String get qualityLabel => 'Kalite';

  @override
  String get pdfToPptxQualityHint =>
      'Daha yüksek çözünürlük daha keskin slaytlar verir ama belirgin biçimde daha ağır bir dosya oluşturur.';

  @override
  String pdfToPptxHeavyWarning(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count sayfalık',
      one: '$count sayfalık',
    );
    return 'Dikkat: yüksek kalitede, $_temp0 bir sunum onlarca MB tutabilir ve açılması uzun sürebilir. Kararsızsanız Standart’ı seçin.';
  }

  @override
  String get goodToKnow => 'Bilmekte fayda var';

  @override
  String get pdfToPptxCaveat =>
      'Her slayt sayfanın bir görüntüsüdür: düzen PDF ile aynıdır, ama metin PowerPoint’te düzenlenemez.\nDüzenlenebilir metin için “PDF’ten Word’e” aracını kullanın.\nBir sunumun tek bir slayt boyutu vardır: ilk sayfadan alınır ve farklı boyuttaki sayfalar içinde ortalanır.';

  @override
  String get pdfToPptxResultTitle => 'Sunum hazır';

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
      other: '$count slayt',
      one: '$count slayt',
    );
    return '$name — $_temp0 · $size · $quality';
  }

  @override
  String get notSavedYet =>
      'Dosya henüz cihazınızda değil: kaydedin ya da paylaşın.';

  @override
  String get pdfToPptxChangeQuality => 'Kaliteyi değiştir';

  @override
  String get pdfToPptxConvertAction => 'PowerPoint’e dönüştür';

  @override
  String pdfToPptxExportWhat(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count slayt',
      one: '$count slayt',
    );
    return 'PowerPoint sunumu · $_temp0';
  }

  @override
  String get formatLabel => 'Biçim';

  @override
  String get actionExport => 'Dışa aktar';

  @override
  String get imageQualityWeb => 'Web (72 dpi)';

  @override
  String get imageQualityStandard => 'Standart (150 dpi)';

  @override
  String get imageQualityHigh => 'Yüksek kalite (300 dpi)';

  @override
  String get pdfToImagesEmptyTitle => 'Sayfa başına bir görsel';

  @override
  String get pdfToImagesEmptyBody =>
      'Bir PDF seçin: her sayfa, ardından ayarlayacağınız çözünürlükte görsel olarak çıkacak.';

  @override
  String pdfToImagesNotAPdf(String name) {
    return '$name: lütfen bir PDF dosyası seçin.';
  }

  @override
  String errorLoadFailed(String detail) {
    return 'Yükleme başarısız: $detail';
  }

  @override
  String get pdfToImagesProgress => 'Dışa aktarılıyor…';

  @override
  String pdfToImagesExportWhat(int count, String format) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count $format görsel',
      one: '$count $format görsel',
    );
    return '$_temp0';
  }

  @override
  String get pdfaEmptyTitle => 'Uzun süre arşivle';

  @override
  String get pdfaEmptyBody =>
      'PDF/A, birçok kurumun istediği arşiv biçimidir. Belge görünümünü yitirmeden dönüştürülür.';

  @override
  String get pdfaConformanceLevel => 'Uygunluk düzeyi';

  @override
  String get pdfaA1bDetail =>
      'En katı ve en yaygın kabul gören düzey. Kararsızsanız bunu seçin.';

  @override
  String get pdfaA2bDetail =>
      'PDF 1.7 temelli: daha etkin sıkıştırma, biraz daha hafif dosyalar.';

  @override
  String get pdfaA3bDetail =>
      'A-2b gibi, ancak ek dosyalara izin verir (e-faturada sıkça istenir).';

  @override
  String pdfaConvertingTo(String level) {
    return '$level biçimine dönüştürülüyor…';
  }

  @override
  String get pdfaCaveatTitle => 'Dönüştürmenin değiştirdikleri';

  @override
  String pdfaCaveat(int dpi) {
    return 'Her sayfa $dpi dpi çözünürlükte görüntü olarak yeniden çizilir: metin görüntüye dönüşür, sayfa düzeni sabitlenir. Dosyayı özgün belgenin yazı tiplerine bağlı kalmadan gerçekten uyumlu kılan budur; karşılığında metin artık seçilemez ve aranamaz, bağlantılar ile formlar kaybolur, dosya ağırlaşır.';
  }

  @override
  String pdfaOpenFailed(String detail) {
    return 'Bu PDF açılamadı: $detail';
  }

  @override
  String get imagesToPdfEmptyTitle => 'Görseller tek PDF’te';

  @override
  String get imagesToPdfEmptyBody =>
      'JPG, PNG, WebP, HEIC — görsellerinizi ekleyin, seçtiğiniz sırayla birleştirilecekler.';

  @override
  String get imagesToPdfChoose => 'Görsel seç';

  @override
  String get imagesToPdfAdd => 'Görsel ekle';

  @override
  String imagesToPdfRejected(String names) {
    return 'Atlandı (görsel değil): $names';
  }

  @override
  String get imagesToPdfBuilding => 'PDF oluşturuluyor…';

  @override
  String imagesToPdfBuildFailed(String detail) {
    return 'Oluşturma başarısız: $detail';
  }

  @override
  String imagesToPdfCreateAction(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count görsel',
      one: '$count görsel',
    );
    return 'PDF oluştur ($_temp0)';
  }

  @override
  String get actionRotate => 'Döndür';

  @override
  String get actionRemove => 'Çıkar';

  @override
  String get htmlTitle => 'HTML / web sayfası PDF’e';

  @override
  String get htmlIntro =>
      'Bir web sayfasını ya da HTML kodunu A4 PDF’e dönüştürün. İşleme Android’in yerleşik tarayıcısı yapar, dolayısıyla düzen Chrome’dan yazdırılmış gibi olur.';

  @override
  String get htmlModeUrl => 'Web adresi';

  @override
  String get htmlModeCode => 'HTML kodu';

  @override
  String get htmlUrlLabel => 'Sayfanın adresi';

  @override
  String get htmlUrlHint => 'https://ornek.com.tr/makale';

  @override
  String get htmlCodeLabel => 'HTML kodu';

  @override
  String get htmlCodeHint => '<h1>Başlık</h1>\n<p>Metin…</p>';

  @override
  String get htmlUrlBadScheme => 'Adres http:// ya da https:// ile başlamalı.';

  @override
  String get htmlUrlIncomplete => 'Tam bir web adresi girin.';

  @override
  String get htmlCodeEmpty => 'Dönüştürülecek HTML kodunu yapıştırın.';

  @override
  String get htmlLoadingUrl => 'Sayfa yükleniyor ve dönüştürülüyor…';

  @override
  String get htmlConverting => 'HTML dönüştürülüyor…';

  @override
  String get htmlNetworkNotice =>
      'İnternet bağlantısı gerekir: uygulamada sayfayı indirmesi gereken tek araç budur. Hesaba giriş, çerez bildirimi ya da bol JavaScript isteyen sayfalar eksik çıkabilir.';

  @override
  String get htmlOfflineNotice =>
      'Doğrudan sayfada yazılmış HTML ve CSS çevrimdışı işlenir. Buna karşılık dış bir web adresinden çağrılan görseller, stil sayfaları ya da yazı tipleri internet bağlantısı gerektirir.';

  @override
  String get watermarkEmptyTitle => 'Filigran koy';

  @override
  String get watermarkEmptyBody =>
      'Seçtiğiniz bir metin tüm sayfalarda arka planda yinelenir — belgeyi gizli ya da taslak olarak işaretlemek için.';

  @override
  String get watermarkEmptyNote =>
      'Dışa aktarma ücretsiz ve sayı sınırı olmadan.';

  @override
  String get watermarkTextLabel => 'Filigran metni';

  @override
  String get watermarkDefaultText => 'GİZLİ';

  @override
  String get watermarkNeedText => 'Filigran için bir metin girin.';

  @override
  String watermarkOpacity(int percent) {
    return 'Saydamlık: %$percent';
  }

  @override
  String watermarkRotation(int degrees) {
    return 'Dönme açısı: $degrees°';
  }

  @override
  String watermarkFontSize(int points) {
    return 'Metin boyutu: $points pt';
  }

  @override
  String get watermarkColor => 'Renk';

  @override
  String get colorGrey => 'Gri';

  @override
  String get colorRed => 'Kırmızı';

  @override
  String get colorBlue => 'Mavi';

  @override
  String get colorBlack => 'Siyah';

  @override
  String get watermarkProgress => 'Filigran uygulanıyor…';

  @override
  String percentValue(int percent) {
    return '%$percent';
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
  String get pageNumbersEmptyTitle => 'Sayfaları numaralandır';

  @override
  String get pageNumbersEmptyBody =>
      'Bir PDF seçin, ardından her sayfaya eklenecek numaraların konumunu ve biçimini belirleyin.';

  @override
  String get positionLabel => 'Konum';

  @override
  String get positionBottomCenter => 'Alt orta';

  @override
  String get positionBottomRight => 'Alt sağ';

  @override
  String get positionTopCenter => 'Üst orta';

  @override
  String get positionTopRight => 'Üst sağ';

  @override
  String get pageNumbersFormatPlain => 'N';

  @override
  String get pageNumbersFormatOfTotal => 'N / toplam';

  @override
  String get pageNumbersStart => 'Başlangıç numarası';

  @override
  String get pageNumbersProgress => 'Numaralandırılıyor…';

  @override
  String get organizeEmptyTitle => 'Bir PDF’i yeniden ele al';

  @override
  String get organizeEmptyBody =>
      'Bir belgeyi bölmek, içinden sayfa çıkarmak ya da sırasını değiştirmek için açın.';

  @override
  String get organizeOpenFile => 'Dosya aç';

  @override
  String get organizeNothingToExport => 'Dışa aktarılacak sayfa yok.';

  @override
  String organizePagesKept(int kept, int total) {
    String _temp0 = intl.Intl.pluralLogic(
      kept,
      locale: localeName,
      other: '$kept sayfa korundu',
      one: '$kept sayfa korundu',
    );
    return '$total sayfadan $_temp0';
  }

  @override
  String get organizePageExcluded => 'Çıkarıldı';

  @override
  String organizePageMoved(int from) {
    return '$from. konumdan taşındı';
  }

  @override
  String organizePageTitle(int number) {
    return 'Sayfa $number';
  }

  @override
  String organizeExcludePage(int number) {
    return '$number. sayfayı çıkar';
  }

  @override
  String organizeIncludePage(int number) {
    return '$number. sayfayı dahil et';
  }

  @override
  String organizeMovePage(int number) {
    return '$number. sayfayı taşı';
  }

  @override
  String get organizeExtract => 'Çıkar';

  @override
  String get organizeSplit => 'Böl';

  @override
  String get organizePreview => 'Önizleme';

  @override
  String get organizeExtractTitle => 'Bir sayfa aralığı çıkar';

  @override
  String organizeRangeLabel(int start, int end) {
    return '$start–$end. sayfalar';
  }

  @override
  String get organizeSplitTitle => 'Birkaç dosyaya böl';

  @override
  String organizeFileCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count dosya',
      one: '$count dosya',
    );
    return '$_temp0';
  }

  @override
  String organizeSplitFailed(String detail) {
    return 'Bölme başarısız: $detail';
  }

  @override
  String get scanNoCamera => 'Bu cihazda kullanılabilir kamera yok.';

  @override
  String scanCameraFailed(String detail) {
    return 'Kamera başlatılamadı: $detail';
  }

  @override
  String get scanCropToolbar => 'Ayarla';

  @override
  String scanCaptureFailed(String detail) {
    return 'Çekim başarısız: $detail';
  }

  @override
  String get scanPermissionBody => 'Belge taramak için kamera erişimi gerekir.';

  @override
  String get scanGrantPermission => 'Kameraya izin ver';

  @override
  String get actionRetry => 'Yeniden dene';

  @override
  String get scanNoPageYet => 'Henüz sayfa yok.';

  @override
  String scanFinishAction(int count) {
    return 'Tamamla · $count';
  }

  @override
  String get signTitle => 'PDF imzala';

  @override
  String get signIntro =>
      'Elle çizdiğiniz imzanızı bir PDF sayfasına koyun. Bu, belgeye eklenmiş yalın bir çizimdir; onaylı elektronik imza değildir.';

  @override
  String get signChooseSubtitle => 'İmzalanacak belgeyi seçin';

  @override
  String get signPickPage => 'İmzalanacak sayfayı seçin.';

  @override
  String get signDrawTitle => 'İmzamı çiz';

  @override
  String get signDrawBody =>
      'Kâğıt üzerindeymiş gibi parmağınızla çizin. Bu, sayfaya bir çizim koyar — onaylı elektronik imza değildir.';

  @override
  String get signNeedDrawing => 'Devam etmeden önce bir imza çizin.';

  @override
  String get signClear => 'Temizle';

  @override
  String get signValidate => 'Onayla';

  @override
  String get signPlaceBody =>
      'İmzayı sayfada istediğiniz yere sürükleyin, sonra Tamamla’ya dokunun.';

  @override
  String get signPageUnavailable => 'Sayfa gösterilemedi.';

  @override
  String get signProgress => 'İmza ekleniyor…';

  @override
  String get editTitle => 'Belgeye not ekle';

  @override
  String get editEmptyBody =>
      'Var olan bir PDF’in üzerine doğrudan metin ekleyin ya da bölümleri vurgulayın.';

  @override
  String get editAddTextTitle => 'Metin ekle';

  @override
  String get editTextHint => 'Metniniz';

  @override
  String editFontSize(int size) {
    return 'Metin boyutu: $size';
  }

  @override
  String get editNeedAnnotation => 'Tamamlamadan önce en az bir not ekleyin.';

  @override
  String get editProgress => 'Notlar uygulanıyor…';

  @override
  String get editChooseOther => 'Başka bir PDF seç';

  @override
  String get editUndoTooltip => 'Son notu geri al';

  @override
  String get editModeText => 'Metin';

  @override
  String get editModeHighlight => 'Vurgula';

  @override
  String get editPageUnavailable => 'Bu sayfa gösterilemedi.';

  @override
  String get ocrEmptyTitle => 'Metni aranabilir yap';

  @override
  String get ocrEmptyBody =>
      'Taranmış bir PDF’in metni tanınır ve görüntünün üzerine görünmez biçimde eklenir. Sayfanın görünümü değişmez.';

  @override
  String get ocrWrongFormat => 'Bir PDF ya da görsel seçin (JPG, PNG…).';

  @override
  String get ocrProgress => 'Tanınıyor…';

  @override
  String ocrFailed(String detail) {
    return 'Tanıma başarısız: $detail';
  }

  @override
  String get ocrRunAction => 'Tanımayı başlat';

  @override
  String get ocrResultTitle => 'OCR sonucu';

  @override
  String ocrResultBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count sayfa incelendi',
      one: '$count sayfa incelendi',
    );
    return '$_temp0. Aranabilir PDF hazır; tanınan metnin tamamını da kopyalayabilirsiniz.';
  }

  @override
  String get ocrCopyText => 'Metni kopyala';

  @override
  String get ocrTextCopied => 'Metin kopyalandı.';

  @override
  String get redactIntro =>
      'Bir PDF’in bölümlerini kalıcı olarak gizleyin (adlar, adresler, tutarlar). Üste konan siyah bir dikdörtgenden farklı olarak, gizlenen metin dosyadan gerçekten silinir, yalnızca örtülmez: artık seçilemez ve kopyalanamaz.';

  @override
  String get redactChooseSubtitle => 'Karartılacak belgeyi seçin';

  @override
  String get redactCaveat =>
      'Bilmekte fayda var: gizlenen metni silmek için belgenin her sayfası yeniden görüntüye dönüştürülür (200 dpi). Bu yüzden sonuç, metni seçilebilen bir PDF olmaktan çıkar ve elde edilen dosya genelde özgününden daha ağır olur.';

  @override
  String get redactEmptyPdf => 'Bu PDF hiç sayfa içermiyor.';

  @override
  String redactOpenFailed(String detail) {
    return 'Bu PDF açılamadı (parolayla korunuyor olabilir): $detail';
  }

  @override
  String redactPageRenderFailed(int number, String detail) {
    return '$number. sayfa gösterilemedi: $detail';
  }

  @override
  String get redactUndoTooltip => 'Son alanı geri al';

  @override
  String get redactInstructions =>
      'Gizlenecek bir alan çizmek için parmağınızı sayfa üzerinde sürükleyin. Örtülen metin dosyadan gerçekten silinecek, yalnızca örtülmeyecek.';

  @override
  String get redactPagePrevious => 'Önceki sayfa';

  @override
  String get redactPageNext => 'Sonraki sayfa';

  @override
  String redactPager(int current, int total) {
    return 'Sayfa $current / $total';
  }

  @override
  String get redactNoZone => 'Hiç alan çizilmedi';

  @override
  String redactZoneCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'gizlenecek $count alan',
      one: 'gizlenecek $count alan',
    );
    return '$_temp0';
  }

  @override
  String get redactOtherPdf => 'Başka PDF';

  @override
  String get redactAction => 'Karart';

  @override
  String get redactProgress => 'Karartılıyor…';

  @override
  String get cropEmptyTitle => 'Kenar boşluklarını kırp';

  @override
  String get cropEmptyBody =>
      'Bir PDF seçin, ardından korunacak alanı belirlemek için parmağınızı önizleme üzerinde sürükleyin.';

  @override
  String get cropTooSmall => 'Seçilen alan fazla küçük.';

  @override
  String get cropProgress => 'Kırpılıyor…';

  @override
  String cropFailed(String detail) {
    return 'Kırpma başarısız: $detail';
  }

  @override
  String get cropKeptArea => 'Korunan alan';

  @override
  String cropDimensions(
    int width,
    int height,
    int widthPercent,
    int heightPercent,
  ) {
    return '$width × $height mm (%$widthPercent × %$heightPercent)';
  }

  @override
  String get cropFullPage => 'Tüm sayfa';

  @override
  String get cropAllPages => 'Bütün sayfalara uygula';

  @override
  String get cropAllPagesOn => 'Her sayfada aynı alan kesilir.';

  @override
  String get cropAllPagesOff =>
      'Yalnızca 1. sayfa kırpılır, diğerleri bütün kalır.';

  @override
  String get cropCaveat =>
      'Kırpma sayfanın boyutunu küçültür: alanın dışında kalan içerik artık gösterilmez ve yazdırılmaz.';

  @override
  String get cropAction => 'Kırp';

  @override
  String get compareTitle => 'İki PDF’i karşılaştır';

  @override
  String get compareEmptyTitle => 'Ne değişti';

  @override
  String get compareEmptyBody =>
      'Aynı PDF’in iki sürümünü seçin. Eklenen ve çıkarılan bölümler sayfa sayfa karşılıklı gösterilecek.';

  @override
  String get compareSlotA => 'Dosya A';

  @override
  String get compareSlotB => 'Dosya B';

  @override
  String get compareAction => 'Karşılaştır';

  @override
  String get compareProgress => 'Karşılaştırılıyor…';

  @override
  String compareFailed(String detail) {
    return 'Karşılaştırma başarısız: $detail';
  }

  @override
  String compareChangedPages(int changed, int total) {
    String _temp0 = intl.Intl.pluralLogic(
      changed,
      locale: localeName,
      other: '$changed sayfa farklı',
      one: '$changed sayfa farklı',
    );
    return '$total sayfadan $_temp0';
  }

  @override
  String get compareNoDifference =>
      'İki dosya arasında hiçbir fark bulunamadı.';

  @override
  String comparePageHeading(int number) {
    return 'Sayfa $number';
  }

  @override
  String organizeFilesCreated(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count dosya oluşturuldu',
      one: '$count dosya oluşturuldu',
    );
    return '$_temp0';
  }

  @override
  String organizePartTitle(int number) {
    return '$number. bölüm';
  }
}
