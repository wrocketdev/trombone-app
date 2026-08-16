// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class LJa extends L {
  LJa([String locale = 'ja']) : super(locale);

  @override
  String get appTitle => 'Trombone — PDF・スキャン・Word';

  @override
  String get appWordmark => 'Trombone';

  @override
  String get actionSave => '保存';

  @override
  String get actionShare => '共有';

  @override
  String get actionCompress => '圧縮';

  @override
  String get actionDone => '完了';

  @override
  String get actionCancel => 'キャンセル';

  @override
  String get actionChange => '変更';

  @override
  String get actionContinue => '次へ';

  @override
  String get actionOpening => '開いています…';

  @override
  String get actionRemoveFile => 'このファイルを外す';

  @override
  String get progressPreparing => '準備中…';

  @override
  String progressPercent(int percent) {
    return '$percent%';
  }

  @override
  String get emptyReassurance => '書き出しは無料、透かしなし、回数制限なし。';

  @override
  String get emptyAcceptedFormats => '対応する形式';

  @override
  String get exportSavedTitle => '保存しました。';

  @override
  String get exportSavedBody =>
      'いま選んだ名前とフォルダーに保存しました。透かしなし、制限なし、解除するものは何もありません。';

  @override
  String get exportSaveDialogTitle => 'PDF を保存';

  @override
  String pageTileIncluded(int number) {
    return '$number ページ目、対象に含まれています。タップで除外します。';
  }

  @override
  String pageTileExcluded(int number) {
    return '$number ページ目、除外されています。タップで含めます。';
  }

  @override
  String pageTileRotate(int number) {
    return '$number ページ目を回転';
  }

  @override
  String sectionHeaderSemantics(String title, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'ツール $count 個',
    );
    return '$title、$_temp0';
  }

  @override
  String toolCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'ツール $count 個',
    );
    return '$_temp0';
  }

  @override
  String get homePromise => '書類をつくって、書き出すだけ。\n課金の壁はありません。';

  @override
  String get homeChipNoAccount => 'アカウント不要';

  @override
  String get homeChipNoWatermark => '透かしなし';

  @override
  String get homeChipUnlimited => '書き出し無制限';

  @override
  String get homeSearchTooltip => 'ツールを探す';

  @override
  String get homeColophon => '保存時に有料でロック解除されるものはありません。書き出しは無料、透かしなし、回数制限なし。';

  @override
  String get sectionFeatured => 'おすすめ';

  @override
  String get sectionToPdf => 'PDF にする';

  @override
  String get sectionFromPdf => 'PDF から';

  @override
  String get sectionSecurity => 'セキュリティ';

  @override
  String get sectionEdit => '編集';

  @override
  String get toolMerge => '結合';

  @override
  String get toolMergeKeywords => 'まとめる 合体 連結 つなげる merge 統合';

  @override
  String get toolMergeSubtitle => 'PDF・Word・画像・テキストを 1 つの書類に';

  @override
  String get toolRectoVerso => '両面';

  @override
  String get toolRectoVersoKeywords => '両面 交互 スキャン 奇数 偶数 表裏 duplex';

  @override
  String get toolRectoVersoSubtitle => '2 つのスキャンを元の順番に';

  @override
  String get toolImagesToPdf => '画像を PDF に';

  @override
  String get toolImagesToPdfKeywords => '写真 jpg jpeg png アルバム カメラ 画像';

  @override
  String get toolImagesToPdfSubtitle => '写真やスクリーンショットを 1 つの書類に';

  @override
  String get toolPdfToWord => 'PDF を Word に';

  @override
  String get toolPdfToWordKeywords => 'docx ワープロ 編集できる 変換 doc';

  @override
  String get toolPdfToWordSubtitle => '文章も表も編集できる形に';

  @override
  String get toolOrganize => 'PDF を整理';

  @override
  String get toolOrganizeKeywords => '分割 抜き出す 並べ替え 順番 ページ 削除';

  @override
  String get toolOrganizeSubtitle => '分割・抽出・並べ替え';

  @override
  String get toolExcelToPdf => 'Excel を PDF に';

  @override
  String get toolExcelToPdfKeywords => '表計算 xlsx ブック シート スプレッドシート';

  @override
  String get toolPptxToPdf => 'PowerPoint を PDF に';

  @override
  String get toolPptxToPdfKeywords => 'pptx スライド プレゼン';

  @override
  String get toolHtmlToPdf => 'ウェブページを PDF に';

  @override
  String get toolHtmlToPdfKeywords => 'html サイト インターネット url リンク 記事';

  @override
  String get toolScan => '書類をスキャン';

  @override
  String get toolScanKeywords => 'カメラ 写真 デジタル化 スキャナー 紙';

  @override
  String get toolPdfToExcel => 'PDF を Excel に';

  @override
  String get toolPdfToExcelKeywords => '表計算 xlsx 表 抽出 データ';

  @override
  String get toolPdfToPptx => 'PDF を PowerPoint に';

  @override
  String get toolPdfToPptxKeywords => 'pptx スライド プレゼン';

  @override
  String get toolPdfToImages => 'PDF を画像に';

  @override
  String get toolPdfToImagesKeywords => 'jpg png 写真 書き出し スクリーンショット 画像';

  @override
  String get toolOcr => '検索できる文字に（OCR）';

  @override
  String get toolOcrKeywords => '文字認識 スキャン コピー 選択 ocr';

  @override
  String get toolPdfA => 'PDF/A に変換';

  @override
  String get toolPdfAKeywords => 'アーカイブ 規格 長期保存 iso';

  @override
  String get toolProtect => 'PDF を保護';

  @override
  String get toolProtectKeywords => 'パスワード 鍵 暗号化 ロック 保護';

  @override
  String get toolUnlock => 'PDF のロック解除';

  @override
  String get toolUnlockKeywords => 'パスワード 解除 開く 復号 ロック';

  @override
  String get toolRepair => 'PDF を修復';

  @override
  String get toolRepairKeywords => '壊れた 読めない 破損 復旧 エラー';

  @override
  String get toolRedact => 'PDF を墨消し';

  @override
  String get toolRedactKeywords => '隠す 黒塗り 匿名化 秘密 削除 墨消し';

  @override
  String get toolEdit => 'PDF を編集';

  @override
  String get toolEditKeywords => '文字 書き込み 修正 注釈 記入';

  @override
  String get toolSign => '署名';

  @override
  String get toolSignKeywords => '署名 サイン 契約 手書き';

  @override
  String get toolWatermark => '透かし';

  @override
  String get toolWatermarkKeywords => 'watermark スタンプ 秘密 下書き 透かし';

  @override
  String get toolPageNumbers => 'ページ番号';

  @override
  String get toolPageNumbersKeywords => 'ノンブル 通し番号 番号付け 数字';

  @override
  String get toolCrop => 'PDF をトリミング';

  @override
  String get toolCropKeywords => '切り取る 余白 トリミング 端 サイズ';

  @override
  String get toolCompare => 'PDF を比較';

  @override
  String get toolCompareKeywords => '差分 バージョン diff 変更点 比較';

  @override
  String get searchHint => '結合、パスワード、透かし…';

  @override
  String get searchClear => '消去';

  @override
  String searchNoResultTitle(String query) {
    return '「$query」に合うツールがありません。';
  }

  @override
  String get searchNoResultBody =>
      '手元にある形式で探してみてください（「Word」「Excel」「写真」）。あるいは何をしたいかで探せます（「署名」「分割」「パスワード」）。';

  @override
  String get actionUndo => '元に戻す';

  @override
  String get actionApply => '適用';

  @override
  String get actionChoose => '選ぶ';

  @override
  String get actionChoosePdf => 'PDF を選ぶ';

  @override
  String get actionChooseFiles => 'ファイルを選ぶ';

  @override
  String get actionConvert => '変換';

  @override
  String get actionFinish => '終了';

  @override
  String get actionBack => '戻る';

  @override
  String get actionAdd => '追加';

  @override
  String get noFileChosen => 'ファイルが選ばれていません';

  @override
  String errorExportFailed(String detail) {
    return '書き出しに失敗しました：$detail';
  }

  @override
  String errorShareFailed(String detail) {
    return '共有に失敗しました：$detail';
  }

  @override
  String errorOpenFailed(String detail) {
    return 'ファイルを開けませんでした：$detail';
  }

  @override
  String errorConversionFailed(String detail) {
    return '変換に失敗しました：$detail';
  }

  @override
  String errorOnFile(String name, String detail) {
    return '$name：$detail';
  }

  @override
  String get errorPickPdf => 'PDF ファイルを選んでください。';

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
    return '約 $size';
  }

  @override
  String pageCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ページ',
    );
    return '$_temp0';
  }

  @override
  String pageCountOfTotal(int kept, int total) {
    String _temp0 = intl.Intl.pluralLogic(
      kept,
      locale: localeName,
      other: '$kept ページ',
    );
    return '$total ページ中 $_temp0';
  }

  @override
  String pageOfTotal(int current, int total) {
    return '$total ページ中 $current ページ目';
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
  String get formatImages => '画像';

  @override
  String get formatText => 'テキスト';

  @override
  String get mergeAddFile => 'ファイルを追加';

  @override
  String get mergeAddHint => 'PDF・Word・画像・テキスト';

  @override
  String get mergeEmptyTitle => '1 つの書類にまとめる';

  @override
  String get mergeEmptyBody =>
      'PDF、Word ファイル、画像、テキストを追加してください。書き出す前に並べ替えたり、ページを外したりできます。';

  @override
  String get mergeNeedOnePage => '含めるページのあるファイルを 1 つ以上追加してください。';

  @override
  String get mergeProgress => '結合しています…';

  @override
  String mergeFailed(String detail) {
    return '結合に失敗しました：$detail';
  }

  @override
  String mergeRemoved(String name) {
    return '$name を外しました。';
  }

  @override
  String mergeRemoveTooltip(String name) {
    return '$name を外す';
  }

  @override
  String mergeMoveSemantics(String name) {
    return '$name を移動';
  }

  @override
  String get mergeRotateAll => 'すべてのページを回転';

  @override
  String mergePreviewAndExport(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ページ',
    );
    return 'プレビューと書き出し（$_temp0）';
  }

  @override
  String previewTitle(String size) {
    return 'プレビュー · $size';
  }

  @override
  String previewZoomPage(int number) {
    return '$number ページ目を拡大';
  }

  @override
  String get previewPageUnreadable => 'このページは読み込めません。';

  @override
  String previewExportWhat(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ページ',
    );
    return 'PDF · $_temp0';
  }

  @override
  String get compressTitle => '圧縮';

  @override
  String compressBody(String size) {
    return '現在のサイズ：$size。レベルを選んでください。適用する前に推定サイズが表示されます。';
  }

  @override
  String get compressEstimating => '推定中…';

  @override
  String get compressProgress => '圧縮しています…';

  @override
  String compressFailed(String detail) {
    return '圧縮に失敗しました：$detail';
  }

  @override
  String get protectEmptyTitle => 'パスワードをかける';

  @override
  String get protectEmptyBody =>
      '選んだパスワードがないと、この PDF は開けなくなります。パスワードは控えておいてください。復元はできません。';

  @override
  String get protectSubtitle => 'AES 256 ビットで暗号化されます';

  @override
  String get protectPassword => 'パスワード';

  @override
  String get protectConfirmPassword => 'パスワードの確認';

  @override
  String get protectShowPasswords => 'パスワードを表示';

  @override
  String get protectHidePasswords => 'パスワードを隠す';

  @override
  String get protectMismatch => '2 つのパスワードが一致しません。';

  @override
  String get protectWarning =>
      'どこかに書き留めてください。パスワードがないと、この書類は二度と読めなくなります。あなたにもアプリにも復元はできません。';

  @override
  String get protectAlreadyProtected =>
      'このファイルはすでに保護されています。先に「PDF のロック解除」をお使いください。';

  @override
  String get protectProgress => '保護しています…';

  @override
  String protectFailed(String detail) {
    return '保護に失敗しました：$detail';
  }

  @override
  String get protectAction => '保護する';

  @override
  String get protectResultTitle => 'PDF を保護しました';

  @override
  String get protectResultDetail => 'AES 256 ビットで暗号化しました。開くにはパスワードが必要です。';

  @override
  String get protectExportWhat => 'パスワードで保護した PDF';

  @override
  String get unlockEmptyTitle => 'パスワードを外す';

  @override
  String get unlockEmptyBody => 'この書類の現在のパスワードが必要です。外したあとは、PDF が自由に開けるようになります。';

  @override
  String get unlockAcceptsProtectedPdf => '保護された PDF';

  @override
  String get unlockChooseProtectedPdf => '保護された PDF を選ぶ';

  @override
  String get unlockCurrentPassword => '現在のパスワード';

  @override
  String get unlockWrongPassword => 'パスワードが違います。';

  @override
  String get unlockProgress => 'ロックを解除しています…';

  @override
  String unlockFailed(String detail) {
    return 'ロック解除に失敗しました：$detail';
  }

  @override
  String get unlockAction => 'ロック解除';

  @override
  String get repairEmptyTitle => '壊れたファイルを修復する';

  @override
  String get repairEmptyBody => '破損した PDF の内部構造を組み直します。救えるものは救います。';

  @override
  String get repairProgress => '修復しています…';

  @override
  String get repairFailed => 'このファイルは修復できません。損傷が大きすぎるおそれがあります。';

  @override
  String get repairAction => '修復する';

  @override
  String get pdfToWordEmptyTitle => '編集できる Word に';

  @override
  String get pdfToWordEmptyBody => 'PDF の文章と構造を .docx 書類に移します。あとから開き直して直せます。';

  @override
  String get pdfToWordAnalyzing => '書類を解析しています…';

  @override
  String get pdfToWordAnalysisPending => '解析待ち';

  @override
  String pdfToWordAnalysisFailed(String detail) {
    return '解析に失敗しました：$detail';
  }

  @override
  String get pdfLocked => 'この PDF はパスワードで保護されています。先にロックを解除してください。';

  @override
  String get pdfToWordConverting => 'Word に変換しています…';

  @override
  String get pdfToWordSummaryTitle => '見つかった内容';

  @override
  String pdfToWordParagraphCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '段落 $count 個',
    );
    return '$_temp0';
  }

  @override
  String pdfToWordHeadingCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '見出し $count 個',
    );
    return '$_temp0';
  }

  @override
  String pdfToWordTableCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '表 $count 個',
    );
    return '$_temp0';
  }

  @override
  String get pdfToWordNoTables => '表は見つかりませんでした。PDF に表がある場合、その行は段落に変換されます。';

  @override
  String get pdfToWordCaveat =>
      '変換では文章・書式・表は再現されますが、レイアウトそのものは再現されません。画像や段組みの位置は保たれず、画像は Word 書類には引き継がれません。';

  @override
  String get pdfToWordScanWarning =>
      'この PDF はスキャンのようです。文字が見つかりませんでした。先に「検索できる文字に（OCR）」をお使いいただき、できあがった PDF を変換してください。';

  @override
  String get pdfToWordResultTitle => 'Word 書類ができました';

  @override
  String pdfToWordResultDetail(String name, String size) {
    return '$name — $size';
  }

  @override
  String get pdfToWordExportWhat => 'Word 書類';

  @override
  String get pdfToWordConvertAction => 'Word に変換';

  @override
  String get actionConvertAgain => 'もう一度変換';

  @override
  String errorSaveFailed(String detail) {
    return '保存できませんでした：$detail';
  }

  @override
  String get rectoVersoIntro =>
      '片面スキャナーでは 2 つのファイルができます。奇数ページは順どおり、偶数ページは逆順になっていることが多いものです。両方を選んで元の並びに戻します。';

  @override
  String get rectoVersoOddSlot => '奇数ページのファイル（表）';

  @override
  String get rectoVersoEvenSlot => '偶数ページのファイル（裏）';

  @override
  String get rectoVersoReversed => '2 つ目のファイルは逆順';

  @override
  String get rectoVersoReversedHint => 'これが最もよくある形なので、はじめからオンにしてあります';

  @override
  String rectoVersoPreview(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ページ',
    );
    return '差し込み結果のプレビュー（$_temp0）';
  }

  @override
  String get rectoVersoProgress => '差し込んでいます…';

  @override
  String fileWithPageCount(String name, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ページ',
    );
    return '$name · $_temp0';
  }

  @override
  String get actionPreviewAndExport => 'プレビューと書き出し';

  @override
  String errorOpenFailedShort(String detail) {
    return '開けませんでした：$detail';
  }

  @override
  String errorGeneric(String detail) {
    return '失敗しました：$detail';
  }

  @override
  String get actionConvertToPdf => 'PDF に変換';

  @override
  String get convertProgress => '変換しています…';

  @override
  String get excelEmptyTitle => 'ブックを PDF に';

  @override
  String get excelEmptyBody =>
      '.xlsx ファイルの各シートが PDF のページになります。そのまま送ったり印刷したりできます。';

  @override
  String get excelChooseWorkbook => 'ブックを選ぶ';

  @override
  String get excelChooseXlsx => '.xlsx ブックを選ぶ';

  @override
  String get excelLegacyFormat =>
      '.xls 形式（Excel の古いバイナリ形式）には対応していません。.xlsx で保存し直してからもう一度お試しください。';

  @override
  String get excelWrongFormat => '.xlsx の Excel ブックを選んでください。';

  @override
  String excelUnreadable(String detail) {
    return 'ブックを読み込めません：$detail';
  }

  @override
  String excelSheetsAndRows(int sheets, int rows) {
    String _temp0 = intl.Intl.pluralLogic(
      sheets,
      locale: localeName,
      other: 'シート $sheets 枚',
    );
    String _temp1 = intl.Intl.pluralLogic(
      rows,
      locale: localeName,
      other: '合計 $rows 行',
    );
    return '$_temp0 · $_temp1';
  }

  @override
  String get excelSheetsDetected => '見つかったシート';

  @override
  String get excelEmptySheet => '空のシート';

  @override
  String excelSheetDimensions(int rows, int columns) {
    String _temp0 = intl.Intl.pluralLogic(
      rows,
      locale: localeName,
      other: '$rows 行',
    );
    String _temp1 = intl.Intl.pluralLogic(
      columns,
      locale: localeName,
      other: '$columns 列',
    );
    return '$_temp0 × $_temp1';
  }

  @override
  String get excelRepeatHeader => '見出し行を各ページで繰り返す';

  @override
  String get excelRepeatHeaderHint => 'シートの 1 行目を、表の各ページの上部に描き直します。';

  @override
  String get excelCaveat =>
      '変換で引き継がれるもの：ファイルに保存されているとおりのセルの文字（数式の最後の計算結果を含みます）、太字の 1 行目、罫線。\n\n引き継がれないもの：色、フォント、数値の書式、結合セル、画像、グラフ、数式そのもの。列はページ幅に収まるよう縮められます。とても横に広いシートでは、狭すぎるセルの文字が「…」で切り詰められます。';

  @override
  String get pptxEmptyTitle => 'プレゼンを PDF に';

  @override
  String get pptxEmptyBody =>
      'スライド 1 枚につき 16:9 の横向きページを 1 枚つくり、タイトルと箇条書きを載せます。文字は引き継がれますが、もとの画像・図形・背景は引き継がれません。\n\n対応形式：.pptx。古い .ppt ファイルは、先に PowerPoint で .pptx として保存し直してください。';

  @override
  String get pptxChoosePresentation => 'プレゼンを選ぶ';

  @override
  String get pptxTextOnlyTitle => '文字だけを変換します';

  @override
  String get pptxTextOnlyBody =>
      '各スライドの文字は引き継がれます。もとの画像・図形・背景・色・レイアウトは保たれません。できあがる PDF は、読みやすい簡素なレイアウトであって、プレゼンの忠実な複製ではありません。';

  @override
  String pptxSlideCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'スライド $count 枚',
    );
    return '$_temp0';
  }

  @override
  String get pptxSlidesDetected => '見つかったスライド';

  @override
  String pptxMoreSlides(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 枚',
    );
    return 'ほか $_temp0…';
  }

  @override
  String get pptxUntitledSlide => 'タイトルなし';

  @override
  String get pptxEmptySlide => '文字なし（画像または図形のみ）';

  @override
  String pptxTextLineCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '本文 $count 行',
    );
    return '$_temp0';
  }

  @override
  String pptxReadFailed(String detail) {
    return '読み込めませんでした：$detail';
  }

  @override
  String get compressLevelLight => '弱';

  @override
  String get compressLevelMedium => '中';

  @override
  String get compressLevelStrong => '強';

  @override
  String get pptxQualityStandard => '標準（150 dpi）';

  @override
  String get pptxQualityHigh => '高（220 dpi）';

  @override
  String get pdfToExcelEmptyTitle => '表を取り出す';

  @override
  String get pdfToExcelEmptyBody =>
      'PDF の中の表を Excel ブックに書き出します。書式は保たれませんが、値は保たれます。';

  @override
  String pdfToExcelPagesAnalyzed(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ページを解析',
    );
    return '$_temp0';
  }

  @override
  String pdfToExcelAnalysisFailed(String detail) {
    return '解析できませんでした。PDF がパスワードで保護されているか、破損しているおそれがあります。（$detail）';
  }

  @override
  String get pdfToExcelNothingToExport => '書き出すものがありません：表が見つかりませんでした。';

  @override
  String get pdfToExcelBuilding => 'ブックを作成しています…';

  @override
  String get pdfToExcelIncludeParagraphs => '表以外の文字も含める（段落ごとに 1 行）';

  @override
  String get pdfToExcelIncludeParagraphsHint =>
      '半構造化の書類に向いています。文字は、そのページの表のあとに A 列へ入ります。';

  @override
  String get pdfToExcelCaveatTitle => '変換で保たれないもの';

  @override
  String get pdfToExcelCaveat =>
      '検出はページ上の文字の位置にもとづいています。罫線が整っていない表、結合セル、間隔がばらばらな列は、区切りを誤ることがあります。スキャンした PDF（画像）には取り出せる文字がないため、何も得られません。色・数式・画像は決して引き継がれず、引き継がれるのは文字の値だけです。';

  @override
  String pdfToExcelTablesFound(int tables, int pages) {
    String _temp0 = intl.Intl.pluralLogic(
      pages,
      locale: localeName,
      other: '$pages ページ',
    );
    String _temp1 = intl.Intl.pluralLogic(
      tables,
      locale: localeName,
      other: '表 $tables 個',
    );
    return '$_temp0中に$_temp1を検出';
  }

  @override
  String pdfToExcelPagesConcerned(String pages) {
    return '該当するページ：$pages';
  }

  @override
  String pdfToExcelParagraphsOutside(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '表以外の段落 $count 個',
    );
    return '$_temp0';
  }

  @override
  String get pdfToExcelScannedWarning =>
      'この PDF からは文字を取り出せませんでした。ほぼ確実にスキャンした書類（ページの画像）です。表計算では扱えませんので、先に文字認識（OCR）のツールをお使いください。';

  @override
  String get pdfToExcelNoTableWarning =>
      'この書類からは表の構造を認識できませんでした。文字はありますが、整った列に並んでいません。読みにくいブックをつくるより、上の「表以外の文字も含める」をオンにするか、段落をよりよく保つ「PDF を Word に」をお使いください。';

  @override
  String get pdfToExcelResultTitle => 'ブックができました';

  @override
  String get pdfToExcelExportWhat => 'Excel ブック';

  @override
  String get pdfToExcelConvertAction => 'Excel に変換';

  @override
  String resultNameAndSize(String name, String size) {
    return '$name — $size';
  }

  @override
  String get pdfToPptxEmptyTitle => '1 ページを 1 スライドに';

  @override
  String get pdfToPptxEmptyBody =>
      'PDF がそのままの見た目の PowerPoint プレゼンになります。各ページは画像として入るため、レイアウトは忠実ですが、文字は PowerPoint で編集できません。';

  @override
  String pdfToPptxOpenFailed(String detail) {
    return 'この PDF を開けませんでした：$detail';
  }

  @override
  String get pdfToPptxConverting => 'PowerPoint に変換しています…';

  @override
  String pdfToPptxPagesToSlides(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ページ',
    );
    String _temp1 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'スライド $count 枚',
    );
    return '$_temp0 > $_temp1';
  }

  @override
  String get pdfToPptxEmptyDocument => '空の書類';

  @override
  String get qualityLabel => '画質';

  @override
  String get pdfToPptxQualityHint => '解像度を上げるとスライドは鮮明になりますが、ファイルはかなり重くなります。';

  @override
  String pdfToPptxHeavyWarning(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ページ',
    );
    return 'ご注意：高画質では、$_temp0のプレゼンが数十 MB になり、開くのに時間がかかることがあります。迷ったら「標準」をお選びください。';
  }

  @override
  String get goodToKnow => '知っておくこと';

  @override
  String get pdfToPptxCaveat =>
      '各スライドはページの画像です。レイアウトは PDF と同じですが、文字は PowerPoint で編集できません。\n編集できる文字がほしい場合は「PDF を Word に」をお使いください。\nプレゼンのスライドサイズは 1 種類だけです。1 ページ目から取られ、サイズの違うページはその中央に配置されます。';

  @override
  String get pdfToPptxResultTitle => 'プレゼンができました';

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
      other: 'スライド $count 枚',
    );
    return '$name — $_temp0 · $size · $quality';
  }

  @override
  String get notSavedYet => 'このファイルはまだ端末に保存されていません。保存するか共有してください。';

  @override
  String get pdfToPptxChangeQuality => '画質を変える';

  @override
  String get pdfToPptxConvertAction => 'PowerPoint に変換';

  @override
  String pdfToPptxExportWhat(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'スライド $count 枚',
    );
    return 'PowerPoint プレゼン · $_temp0';
  }

  @override
  String get formatLabel => '形式';

  @override
  String get actionExport => '書き出す';

  @override
  String get imageQualityWeb => 'ウェブ（72 dpi）';

  @override
  String get imageQualityStandard => '標準（150 dpi）';

  @override
  String get imageQualityHigh => '高画質（300 dpi）';

  @override
  String get pdfToImagesEmptyTitle => '1 ページを 1 枚の画像に';

  @override
  String get pdfToImagesEmptyBody =>
      'PDF を選んでください。各ページが画像として出てきます。解像度はこのあと決められます。';

  @override
  String pdfToImagesNotAPdf(String name) {
    return '$name：PDF ファイルを選んでください。';
  }

  @override
  String errorLoadFailed(String detail) {
    return '読み込みに失敗しました：$detail';
  }

  @override
  String get pdfToImagesProgress => '書き出しています…';

  @override
  String pdfToImagesExportWhat(int count, String format) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$format 画像 $count 枚',
    );
    return '$_temp0';
  }

  @override
  String get pdfaEmptyTitle => '長期保存のために';

  @override
  String get pdfaEmptyBody => 'PDF/A は多くの官公庁が求める長期保存の形式です。見た目を変えずに変換します。';

  @override
  String get pdfaConformanceLevel => '準拠レベル';

  @override
  String get pdfaA1bDetail => '最も厳格で、最も広く受け入れられているレベル。迷ったらこれを選んでください。';

  @override
  String get pdfaA2bDetail => 'PDF 1.7 にもとづくため圧縮効率がよく、ファイルがやや軽くなります。';

  @override
  String get pdfaA3bDetail => 'A-2b と同じですが、添付ファイルを認めます（電子請求でよく求められます）。';

  @override
  String pdfaConvertingTo(String level) {
    return '$level に変換しています…';
  }

  @override
  String get pdfaCaveatTitle => '変換で変わること';

  @override
  String pdfaCaveat(int dpi) {
    return '各ページを $dpi dpi の画像として描き直します。文字は画像になり、レイアウトは固定されます。もとの書類のフォントに左右されず本当に規格に適合させられるのはこのためですが、引き換えに文字は選択も検索もできなくなり、リンクやフォームは消え、ファイルは重くなります。';
  }

  @override
  String pdfaOpenFailed(String detail) {
    return 'この PDF を開けませんでした：$detail';
  }

  @override
  String get imagesToPdfEmptyTitle => '画像を 1 つの PDF に';

  @override
  String get imagesToPdfEmptyBody =>
      'JPG・PNG・WebP・HEIC — 画像を追加すると、選んだ順番でまとめられます。';

  @override
  String get imagesToPdfChoose => '画像を選ぶ';

  @override
  String get imagesToPdfAdd => '画像を追加';

  @override
  String imagesToPdfRejected(String names) {
    return '画像ではないためスキップしました：$names';
  }

  @override
  String get imagesToPdfBuilding => 'PDF を作成しています…';

  @override
  String imagesToPdfBuildFailed(String detail) {
    return '作成に失敗しました：$detail';
  }

  @override
  String imagesToPdfCreateAction(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '画像 $count 枚',
    );
    return 'PDF を作成（$_temp0）';
  }

  @override
  String get actionRotate => '回転';

  @override
  String get actionRemove => '外す';

  @override
  String get htmlTitle => 'HTML・ウェブページを PDF に';

  @override
  String get htmlIntro =>
      'ウェブページや HTML のコードを A4 の PDF にします。描画は Android 内蔵のブラウザーが行うため、Chrome から印刷したときと同じレイアウトになります。';

  @override
  String get htmlModeUrl => 'ウェブアドレス';

  @override
  String get htmlModeCode => 'HTML コード';

  @override
  String get htmlUrlLabel => 'ページのアドレス';

  @override
  String get htmlUrlHint => 'https://example.jp/article';

  @override
  String get htmlCodeLabel => 'HTML コード';

  @override
  String get htmlCodeHint => '<h1>見出し</h1>\n<p>本文…</p>';

  @override
  String get htmlUrlBadScheme => 'アドレスは http:// または https:// で始まる必要があります。';

  @override
  String get htmlUrlIncomplete => '完全なウェブアドレスを入力してください。';

  @override
  String get htmlCodeEmpty => '変換する HTML コードを貼り付けてください。';

  @override
  String get htmlLoadingUrl => 'ページを読み込んで変換しています…';

  @override
  String get htmlConverting => 'HTML を変換しています…';

  @override
  String get htmlNetworkNotice =>
      'インターネット接続が必要です。ページを読み込む必要があるのは、このアプリでこのツールだけです。ログインが必要なページ、Cookie の同意バナー、JavaScript の多いページは、不完全に出力されることがあります。';

  @override
  String get htmlOfflineNotice =>
      'ページに直接書かれた HTML と CSS はオフラインで描画されます。一方、外部のウェブアドレスから読み込む画像・スタイルシート・フォントには、インターネット接続が必要です。';

  @override
  String get watermarkEmptyTitle => '透かしを入れる';

  @override
  String get watermarkEmptyBody =>
      'お好きな文字を、すべてのページの背景に繰り返して入れます。書類を「社外秘」や「下書き」と示すためのものです。';

  @override
  String get watermarkEmptyNote => '書き出しは無料で、回数制限もありません。';

  @override
  String get watermarkTextLabel => '透かしの文字';

  @override
  String get watermarkDefaultText => '社外秘';

  @override
  String get watermarkNeedText => '透かしに入れる文字を入力してください。';

  @override
  String watermarkOpacity(int percent) {
    return '不透明度：$percent%';
  }

  @override
  String watermarkRotation(int degrees) {
    return '回転角度：$degrees°';
  }

  @override
  String watermarkFontSize(int points) {
    return '文字の大きさ：$points pt';
  }

  @override
  String get watermarkColor => '色';

  @override
  String get colorGrey => 'グレー';

  @override
  String get colorRed => '赤';

  @override
  String get colorBlue => '青';

  @override
  String get colorBlack => '黒';

  @override
  String get watermarkProgress => '透かしを入れています…';

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
  String get pageNumbersEmptyTitle => 'ページに番号をつける';

  @override
  String get pageNumbersEmptyBody => 'PDF を選び、各ページに入れる番号の位置と形式を決めてください。';

  @override
  String get positionLabel => '位置';

  @override
  String get positionBottomCenter => '下・中央';

  @override
  String get positionBottomRight => '下・右';

  @override
  String get positionTopCenter => '上・中央';

  @override
  String get positionTopRight => '上・右';

  @override
  String get pageNumbersFormatPlain => 'N';

  @override
  String get pageNumbersFormatOfTotal => 'N / 総数';

  @override
  String get pageNumbersStart => '開始番号';

  @override
  String get pageNumbersProgress => '番号をつけています…';

  @override
  String get organizeEmptyTitle => 'PDF を組み直す';

  @override
  String get organizeEmptyBody => '書類を開いて、分割したり、ページを抜き出したり、順番を入れ替えたりできます。';

  @override
  String get organizeOpenFile => 'ファイルを開く';

  @override
  String get organizeNothingToExport => '書き出すページがありません。';

  @override
  String organizePagesKept(int kept, int total) {
    String _temp0 = intl.Intl.pluralLogic(
      kept,
      locale: localeName,
      other: '$kept ページ',
    );
    return '$total ページ中 $_temp0を残しました';
  }

  @override
  String get organizePageExcluded => '除外';

  @override
  String organizePageMoved(int from) {
    return '$from 番目から移動';
  }

  @override
  String organizePageTitle(int number) {
    return '$number ページ目';
  }

  @override
  String organizeExcludePage(int number) {
    return '$number ページ目を除外';
  }

  @override
  String organizeIncludePage(int number) {
    return '$number ページ目を含める';
  }

  @override
  String organizeMovePage(int number) {
    return '$number ページ目を移動';
  }

  @override
  String get organizeExtract => '抜き出す';

  @override
  String get organizeSplit => '分割';

  @override
  String get organizePreview => 'プレビュー';

  @override
  String get organizeExtractTitle => 'ページの範囲を抜き出す';

  @override
  String organizeRangeLabel(int start, int end) {
    return '$start 〜 $end ページ';
  }

  @override
  String get organizeSplitTitle => '複数のファイルに分割';

  @override
  String organizeFileCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ファイル',
    );
    return '$_temp0';
  }

  @override
  String organizeSplitFailed(String detail) {
    return '分割に失敗しました：$detail';
  }

  @override
  String get scanNoCamera => 'この端末で使えるカメラがありません。';

  @override
  String scanCameraFailed(String detail) {
    return 'カメラを起動できませんでした：$detail';
  }

  @override
  String get scanCropToolbar => '調整';

  @override
  String scanCaptureFailed(String detail) {
    return '撮影に失敗しました：$detail';
  }

  @override
  String get scanPermissionBody => '書類をスキャンするには、カメラへのアクセスが必要です。';

  @override
  String get scanGrantPermission => 'カメラを許可';

  @override
  String get actionRetry => 'もう一度';

  @override
  String get scanNoPageYet => 'まだページがありません。';

  @override
  String scanFinishAction(int count) {
    return '終了 · $count';
  }

  @override
  String get signTitle => 'PDF に署名';

  @override
  String get signIntro =>
      '手で描いた署名を PDF のページに置きます。書類に絵を加えるだけのもので、認証された電子署名ではありません。';

  @override
  String get signChooseSubtitle => '署名する書類を選んでください';

  @override
  String get signPickPage => '署名するページを選んでください。';

  @override
  String get signDrawTitle => '署名を描く';

  @override
  String get signDrawBody => '紙に書くように指で描いてください。ページに絵を置くだけで、認証された電子署名ではありません。';

  @override
  String get signNeedDrawing => '先に署名を描いてください。';

  @override
  String get signClear => '消去';

  @override
  String get signValidate => '確定';

  @override
  String get signPlaceBody => '署名をページの好きな位置までドラッグし、「終了」を押してください。';

  @override
  String get signPageUnavailable => 'このページを表示できませんでした。';

  @override
  String get signProgress => '署名を追加しています…';

  @override
  String get editTitle => '書類に書き込む';

  @override
  String get editEmptyBody => 'できあがった PDF に、そのまま文字を足したり、部分を目立たせたりできます。';

  @override
  String get editAddTextTitle => '文字を追加';

  @override
  String get editTextHint => '入力する文字';

  @override
  String editFontSize(int size) {
    return '文字の大きさ：$size';
  }

  @override
  String get editNeedAnnotation => '終了する前に、書き込みを 1 つ以上追加してください。';

  @override
  String get editProgress => '書き込みを反映しています…';

  @override
  String get editChooseOther => '別の PDF を選ぶ';

  @override
  String get editUndoTooltip => '最後の書き込みを元に戻す';

  @override
  String get editModeText => '文字';

  @override
  String get editModeHighlight => 'マーカー';

  @override
  String get editPageUnavailable => 'このページを表示できませんでした。';

  @override
  String get ocrEmptyTitle => '文字を検索できるようにする';

  @override
  String get ocrEmptyBody =>
      'スキャンした PDF の文字を認識し、画像の上に見えない形で重ねます。ページの見た目は変わりません。';

  @override
  String get ocrWrongFormat => 'PDF か画像（JPG、PNG…）を選んでください。';

  @override
  String get ocrProgress => '認識しています…';

  @override
  String ocrFailed(String detail) {
    return '認識に失敗しました：$detail';
  }

  @override
  String get ocrRunAction => '認識を始める';

  @override
  String get ocrResultTitle => 'OCR の結果';

  @override
  String ocrResultBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ページを解析しました',
    );
    return '$_temp0。検索できる PDF ができました。認識した文字をすべてコピーすることもできます。';
  }

  @override
  String get ocrCopyText => '文字をコピー';

  @override
  String get ocrTextCopied => '文字をコピーしました。';

  @override
  String get redactIntro =>
      'PDF の一部（氏名・住所・金額など）を完全に隠します。上から黒い四角を重ねるのとは違い、隠した文字はファイルから実際に削除されます。覆い隠すだけではないので、選択もコピーもできなくなります。';

  @override
  String get redactChooseSubtitle => '墨消しする書類を選んでください';

  @override
  String get redactCaveat =>
      '知っておくこと：隠した文字を削除するため、書類の各ページを画像に変換し直します（200 dpi）。そのため結果は、文字を選択できる PDF ではなくなり、できあがるファイルはたいてい元より重くなります。';

  @override
  String get redactEmptyPdf => 'この PDF にはページがありません。';

  @override
  String redactOpenFailed(String detail) {
    return 'この PDF を開けませんでした（パスワードで保護されているおそれがあります）：$detail';
  }

  @override
  String redactPageRenderFailed(int number, String detail) {
    return '$number ページ目を表示できませんでした：$detail';
  }

  @override
  String get redactUndoTooltip => '最後の範囲を元に戻す';

  @override
  String get redactInstructions =>
      'ページの上で指をなぞって、隠す範囲を囲んでください。覆った文字はファイルから実際に削除されます。覆い隠すだけではありません。';

  @override
  String get redactPagePrevious => '前のページ';

  @override
  String get redactPageNext => '次のページ';

  @override
  String redactPager(int current, int total) {
    return '$total ページ中 $current ページ目';
  }

  @override
  String get redactNoZone => 'まだ範囲が引かれていません';

  @override
  String redactZoneCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '隠す範囲 $count 個',
    );
    return '$_temp0';
  }

  @override
  String get redactOtherPdf => '別の PDF';

  @override
  String get redactAction => '墨消し';

  @override
  String get redactProgress => '墨消ししています…';

  @override
  String get cropEmptyTitle => '余白を切り取る';

  @override
  String get cropEmptyBody => 'PDF を選び、プレビューの上で指をなぞって、残す範囲を決めてください。';

  @override
  String get cropTooSmall => '選んだ範囲が小さすぎます。';

  @override
  String get cropProgress => '切り取っています…';

  @override
  String cropFailed(String detail) {
    return '切り取りに失敗しました：$detail';
  }

  @override
  String get cropKeptArea => '残す範囲';

  @override
  String cropDimensions(
    int width,
    int height,
    int widthPercent,
    int heightPercent,
  ) {
    return '$width × $height mm（$widthPercent% × $heightPercent%）';
  }

  @override
  String get cropFullPage => 'ページ全体';

  @override
  String get cropAllPages => 'すべてのページに適用';

  @override
  String get cropAllPagesOn => '同じ範囲を各ページで切り取ります。';

  @override
  String get cropAllPagesOff => '1 ページ目だけを切り取り、ほかはそのまま残します。';

  @override
  String get cropCaveat => '切り取るとページの大きさが小さくなります。範囲の外にある内容は、表示も印刷もされなくなります。';

  @override
  String get cropAction => '切り取る';

  @override
  String get compareTitle => '2 つの PDF を比べる';

  @override
  String get compareEmptyTitle => '変わったところ';

  @override
  String get compareEmptyBody =>
      '同じ PDF の 2 つの版を選んでください。加わった部分と消えた部分を、ページごとに並べて示します。';

  @override
  String get compareSlotA => 'ファイル A';

  @override
  String get compareSlotB => 'ファイル B';

  @override
  String get compareAction => '比べる';

  @override
  String get compareProgress => '比べています…';

  @override
  String compareFailed(String detail) {
    return '比較に失敗しました：$detail';
  }

  @override
  String compareChangedPages(int changed, int total) {
    String _temp0 = intl.Intl.pluralLogic(
      changed,
      locale: localeName,
      other: '$changed ページ',
    );
    return '$total ページ中 $_temp0に違いがあります';
  }

  @override
  String get compareNoDifference => '2 つのファイルに違いは見つかりませんでした。';

  @override
  String comparePageHeading(int number) {
    return '$number ページ目';
  }

  @override
  String organizeFilesCreated(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ファイルを作成しました',
    );
    return '$_temp0';
  }

  @override
  String organizePartTitle(int number) {
    return 'パート $number';
  }
}
