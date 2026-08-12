// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Ukrainian (`uk`).
class LUk extends L {
  LUk([String locale = 'uk']) : super(locale);

  @override
  String get appTitle => 'Скріпка — PDF, Scan & Word';

  @override
  String get appWordmark => 'Тромбон';

  @override
  String get actionSave => 'зберегти';

  @override
  String get actionShare => 'Поділіться';

  @override
  String get actionCompress => 'Компрес';

  @override
  String get actionDone => 'Готово';

  @override
  String get actionCancel => 'Скасувати';

  @override
  String get actionChange => 'Щоб змінитися';

  @override
  String get actionContinue => 'Продовжити';

  @override
  String get actionOpening => 'Відкриття…';

  @override
  String get actionRemoveFile => 'Видаліть цей файл';

  @override
  String get progressPreparing => 'Підготовка…';

  @override
  String progressPercent(int percent) {
    return '$percent %';
  }

  @override
  String get emptyReassurance =>
      'Безкоштовний експорт, без водяних знаків і обмежень.';

  @override
  String get emptyAcceptedFormats => 'Прийнятні формати';

  @override
  String get exportSavedTitle => 'Це записано.';

  @override
  String get exportSavedBody =>
      'Під назвою та в папці, яку ви щойно вибрали. Без водяного знака, без обмежень, нічого для розблокування.';

  @override
  String get exportSaveDialogTitle => 'Зберегти PDF';

  @override
  String pageTileIncluded(int number) {
    return 'Сторінка $number, включена. Торкніться, щоб відсунути його вбік.';
  }

  @override
  String pageTileExcluded(int number) {
    return 'Сторінка $number, вилучено. Торкніться, щоб включити його.';
  }

  @override
  String pageTileRotate(int number) {
    return 'Повернути сторінку $number';
  }

  @override
  String sectionHeaderSemantics(String title, int count) {
    return '$title, $count інструментів';
  }

  @override
  String toolCount(int count) {
    return '$count інструментів';
  }

  @override
  String get homePromise =>
      'Створіть свій документ, експортуйте його.\nБез стіни в кінці.';

  @override
  String get homeChipNoAccount => 'Без рахунку';

  @override
  String get homeChipNoWatermark => 'Без водяного знака';

  @override
  String get homeChipUnlimited => 'Необмежений експорт';

  @override
  String get homeSearchTooltip => 'Знайдіть інструмент';

  @override
  String get homeColophon =>
      'За оплату при реєстрації нічого не розблоковується. Експорт безкоштовний, без водяних знаків і без обмеження кількості.';

  @override
  String get sectionFeatured => 'Рекомендовані';

  @override
  String get sectionToPdf => 'До PDF';

  @override
  String get sectionFromPdf => 'З PDF';

  @override
  String get sectionSecurity => 'Безпека';

  @override
  String get sectionEdit => 'Редагувати';

  @override
  String get toolMerge => 'Об’єднати';

  @override
  String get toolMergeKeywords =>
      'зібрати об\'єднати об\'єднати перегрупувати об\'єднати об\'єднати';

  @override
  String get toolMergeSubtitle =>
      'PDF, Word, зображення та текст в одному документі';

  @override
  String get toolRectoVerso => 'Двостороння';

  @override
  String get toolRectoVersoKeywords =>
      'двостороннє вкраплення сканування парне непарне';

  @override
  String get toolRectoVersoSubtitle => 'Два скани, повернути порядок';

  @override
  String get toolImagesToPdf => 'Зображення в PDF';

  @override
  String get toolImagesToPdfKeywords => 'фото jpg jpeg png фотоальбом пристрій';

  @override
  String get toolImagesToPdfSubtitle =>
      'Фотографії та знімки в одному документі';

  @override
  String get toolPdfToWord => 'PDF в Word';

  @override
  String get toolPdfToWordKeywords =>
      'Перетворення редагованого текстового процесора docx';

  @override
  String get toolPdfToWordSubtitle => 'Текст і таблиці, редаговані';

  @override
  String get toolOrganize => 'Упорядкуйте PDF';

  @override
  String get toolOrganizeKeywords =>
      'розділити окремі витягти, змінити порядок, сторінки порядку, видалити';

  @override
  String get toolOrganizeSubtitle => 'Розділіть, витягніть, змініть порядок';

  @override
  String get toolExcelToPdf => 'Excel в PDF';

  @override
  String get toolExcelToPdfKeywords =>
      'аркуш розрахунків робочої книги електронної таблиці xlsx';

  @override
  String get toolPptxToPdf => 'PowerPoint в PDF';

  @override
  String get toolPptxToPdfKeywords => 'pptx слайд презентація слайди';

  @override
  String get toolHtmlToPdf => 'Веб-сторінка в PDF';

  @override
  String get toolHtmlToPdfKeywords =>
      'html URL-адреса веб-сайту, посилання на статтю';

  @override
  String get toolScan => 'Відскануйте документ';

  @override
  String get toolScanKeywords =>
      'камера фото оцифрувати сканувати пристрій папір';

  @override
  String get toolPdfToExcel => 'PDF в Excel';

  @override
  String get toolPdfToExcelKeywords =>
      'Таблиця електронних таблиць xlsx витягує дані';

  @override
  String get toolPdfToPptx => 'PDF в PowerPoint';

  @override
  String get toolPdfToPptxKeywords => 'pptx слайд презентація слайди';

  @override
  String get toolPdfToImages => 'PDF в зображення';

  @override
  String get toolPdfToImagesKeywords => 'Експорт фотографій jpg png';

  @override
  String get toolOcr => 'Пошуковий текст (OCR)';

  @override
  String get toolOcrKeywords => 'розпізнавання символів сканування копія вибір';

  @override
  String get toolPdfA => 'Перетворити в PDF/A';

  @override
  String get toolPdfAKeywords => 'архівне стандартне довгострокове збереження';

  @override
  String get toolProtect => 'Захист PDF';

  @override
  String get toolProtectKeywords => 'пароль замок шифрування замок безпечний';

  @override
  String get toolUnlock => 'Розблокувати PDF';

  @override
  String get toolUnlockKeywords =>
      'видалити пароль відкрити розшифрувати розблокувати замок';

  @override
  String get toolRepair => 'Відремонтувати PDF';

  @override
  String get toolRepairKeywords =>
      'пошкоджений нечитабельний пошкоджений помилка відновлення';

  @override
  String get toolRedact => 'Редагувати PDF-файл';

  @override
  String get toolRedactKeywords =>
      'приховати чорнити анонімізувати конфіденційно видалити';

  @override
  String get toolEdit => 'Редагувати PDF';

  @override
  String get toolEditKeywords => 'змінити текст правильно анотувати написати';

  @override
  String get toolSign => 'Знак';

  @override
  String get toolSignKeywords => 'підпис початковий контракт рука';

  @override
  String get toolWatermark => 'Водяний знак';

  @override
  String get toolWatermarkKeywords =>
      'водяний знак конфіденційна марка чорновий знак';

  @override
  String get toolPageNumbers => 'Номери сторінок';

  @override
  String get toolPageNumbersKeywords => 'пагінація фоліо номер номери';

  @override
  String get toolCrop => 'Обрізати PDF';

  @override
  String get toolCropKeywords => 'розмір країв обрізання';

  @override
  String get toolCompare => 'Порівняти PDF';

  @override
  String get toolCompareKeywords => 'різниця версії різниця зміни';

  @override
  String get searchHint => 'Об’єднати, пароль, водяний знак…';

  @override
  String get searchClear => 'Щоб стерти';

  @override
  String searchNoResultTitle(String query) {
    return 'Немає інструментів для “$query”.';
  }

  @override
  String get searchNoResultBody =>
      'Спробуйте формат, який є у вас під рукою – «Word», «Excel», «фото» – або що завгодно з ним зробити: «підписати», «розділити», «пароль».';

  @override
  String get actionUndo => 'Скасувати';

  @override
  String get actionApply => 'Застосувати';

  @override
  String get actionChoose => 'Виберіть';

  @override
  String get actionChoosePdf => 'Виберіть PDF';

  @override
  String get actionChooseFiles => 'Виберіть файли';

  @override
  String get actionConvert => 'конвертувати';

  @override
  String get actionFinish => 'До кінця';

  @override
  String get actionBack => 'Назад';

  @override
  String get actionAdd => 'додати';

  @override
  String get noFileChosen => 'Файл не вибрано';

  @override
  String errorExportFailed(String detail) {
    return 'Помилка експорту: $detail';
  }

  @override
  String errorShareFailed(String detail) {
    return 'Помилка спільного доступу: $detail';
  }

  @override
  String errorOpenFailed(String detail) {
    return 'Неможливо відкрити файл: $detail';
  }

  @override
  String errorConversionFailed(String detail) {
    return 'Помилка перетворення: $detail';
  }

  @override
  String errorOnFile(String name, String detail) {
    return '$name: $detail';
  }

  @override
  String get errorPickPdf => 'Виберіть файл PDF.';

  @override
  String sizeBytes(String value) {
    return '$value o';
  }

  @override
  String sizeKb(String value) {
    return '$value КБ';
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
    return '$count сторінок';
  }

  @override
  String pageCountOfTotal(int kept, int total) {
    return '$kept сторінок із $total';
  }

  @override
  String pageOfTotal(int current, int total) {
    return 'Сторінка $current на $total';
  }

  @override
  String get formatPdf => 'PDF';

  @override
  String get formatWord => 'Слово';

  @override
  String get formatExcel => 'Excel';

  @override
  String get formatPowerPoint => 'Power point';

  @override
  String get formatImages => 'Картинки';

  @override
  String get formatText => 'текст';

  @override
  String get mergeAddFile => 'Додайте файл';

  @override
  String get mergeAddHint => 'PDF, Word, зображення або текст';

  @override
  String get mergeEmptyTitle => 'Єдиний документ';

  @override
  String get mergeEmptyBody =>
      'Додайте PDF-файли, файли Word, зображення або текст. Ви можете змінити їх порядок і видалити сторінки перед експортом.';

  @override
  String get mergeNeedOnePage =>
      'Додайте принаймні один файл зі сторінкою для включення.';

  @override
  String get mergeProgress => 'Триває злиття...';

  @override
  String mergeFailed(String detail) {
    return 'Не вдалося злити: $detail';
  }

  @override
  String mergeRemoved(String name) {
    return '$name видалено.';
  }

  @override
  String mergeRemoveTooltip(String name) {
    return 'Видаліть $name';
  }

  @override
  String mergeMoveSemantics(String name) {
    return 'Перемістити $name';
  }

  @override
  String get mergeRotateAll => 'Повернути всі сторінки';

  @override
  String mergePreviewAndExport(int count) {
    return 'Попередній перегляд і експорт ($count сторінок)';
  }

  @override
  String previewTitle(String size) {
    return 'Огляд · $size';
  }

  @override
  String previewZoomPage(int number) {
    return 'Сторінка $number, збільшити';
  }

  @override
  String get previewPageUnreadable => 'Нерозбірлива сторінка.';

  @override
  String previewExportWhat(int count) {
    return 'PDF · $count сторінок';
  }

  @override
  String get compressTitle => 'Компресія';

  @override
  String compressBody(String size) {
    return 'Поточний розмір: $size. Виберіть рівень — перед застосуванням відображається приблизний розмір.';
  }

  @override
  String get compressEstimating => 'Оцінити…';

  @override
  String get compressProgress => 'Виконується стиснення...';

  @override
  String compressFailed(String detail) {
    return 'Помилка стиснення: $detail';
  }

  @override
  String get protectEmptyTitle => 'Під паролем';

  @override
  String get protectEmptyBody =>
      'PDF-файл більше не відкриватиметься без вибраного вами пароля. Зберігайте: відновленню не підлягає.';

  @override
  String get protectSubtitle => 'Буде зашифровано в 256-бітному AES';

  @override
  String get protectPassword => 'Пароль';

  @override
  String get protectConfirmPassword => 'Підтвердьте пароль';

  @override
  String get protectShowPasswords => 'Показати паролі';

  @override
  String get protectHidePasswords => 'Приховати паролі';

  @override
  String get protectMismatch => 'Два паролі відрізняються.';

  @override
  String get protectWarning =>
      'Запишіть це куди-небудь: без цього документ назавжди стане нерозбірливим. Відновлення неможливе ні вами, ні програмою.';

  @override
  String get protectAlreadyProtected =>
      'Цей файл уже захищено — спершу скористайтеся Unlock PDF.';

  @override
  String get protectProgress => 'Триває захист…';

  @override
  String protectFailed(String detail) {
    return 'Помилка захисту: $detail';
  }

  @override
  String get protectAction => 'Захищати';

  @override
  String get protectResultTitle => 'Захищений PDF';

  @override
  String get protectResultDetail =>
      'Зашифровано в AES 256 біт. Вам знадобиться пароль, щоб відкрити його.';

  @override
  String get protectExportWhat => 'Захищений паролем PDF';

  @override
  String get unlockEmptyTitle => 'Видалити пароль';

  @override
  String get unlockEmptyBody =>
      'Вам потрібен поточний пароль для документа. Після видалення PDF-файл відкриватиметься вільно.';

  @override
  String get unlockAcceptsProtectedPdf => 'Захищений PDF';

  @override
  String get unlockChooseProtectedPdf => 'Виберіть захищений PDF-файл';

  @override
  String get unlockCurrentPassword => 'Поточний пароль';

  @override
  String get unlockWrongPassword => 'Невірний пароль.';

  @override
  String get unlockProgress => 'Триває розблокування…';

  @override
  String unlockFailed(String detail) {
    return 'Не вдалося розблокувати: $detail';
  }

  @override
  String get unlockAction => 'Розблокувати';

  @override
  String get repairEmptyTitle => 'Відновити пошкоджений файл';

  @override
  String get repairEmptyBody =>
      'Внутрішня структура пошкодженого PDF відновлюється. Те, що можна врятувати, буде врятованим.';

  @override
  String get repairProgress => 'Триває ремонт…';

  @override
  String get repairFailed =>
      'Цей файл не можна відновити — можливо, він занадто пошкоджений.';

  @override
  String get repairAction => 'Виправити';

  @override
  String get pdfToWordEmptyTitle => 'Редагований Word';

  @override
  String get pdfToWordEmptyBody =>
      'Текст і структура PDF-файлу транспонуються в документ .docx, який можна повторно відкрити та виправити.';

  @override
  String get pdfToWordAnalyzing => 'Аналіз документа…';

  @override
  String get pdfToWordAnalysisPending => 'Очікується аналіз';

  @override
  String pdfToWordAnalysisFailed(String detail) {
    return 'Неможливо сканувати: $detail';
  }

  @override
  String get pdfLocked =>
      'Цей PDF-файл захищено паролем. Спочатку розблокуйте його.';

  @override
  String get pdfToWordConverting => 'Перетворення на Word…';

  @override
  String get pdfToWordSummaryTitle => 'Вміст виявлено';

  @override
  String pdfToWordParagraphCount(int count) {
    return '$count абзаців';
  }

  @override
  String pdfToWordHeadingCount(int count) {
    return '$count назв';
  }

  @override
  String pdfToWordTableCount(int count) {
    return '$count таблиць';
  }

  @override
  String get pdfToWordNoTables =>
      'Таблиці не виявлено: якщо ваш PDF-файл містить такі, його рядки буде перетворено на абзаци.';

  @override
  String get pdfToWordCaveat =>
      'Перетворення відтворює текст, форматування та таблиці, але не точний макет: положення зображень і стовпців не зберігається, а зображення не включаються в документ Word.';

  @override
  String get pdfToWordScanWarning =>
      'Здається, цей PDF-файл сканований: тексту не знайдено. Спочатку скористайтеся інструментом «Текст з можливістю пошуку» (OCR), а потім поверніться та конвертуйте отриманий PDF-файл.';

  @override
  String get pdfToWordResultTitle => 'Документ Word готовий';

  @override
  String pdfToWordResultDetail(String name, String size) {
    return '$name — $size';
  }

  @override
  String get pdfToWordExportWhat => 'Документ Word';

  @override
  String get pdfToWordConvertAction => 'Перетворити в Word';

  @override
  String get actionConvertAgain => 'Перетворіть знову';

  @override
  String errorSaveFailed(String detail) {
    return 'Не вдалося зареєструвати: $detail';
  }

  @override
  String get rectoVersoIntro =>
      'Односторонній пристрій подачі створює два файли: непарні сторінки в порядку, парні сторінки часто у зворотному порядку. Виберіть обидва, щоб перекомпонувати їх.';

  @override
  String get rectoVersoOddSlot => 'Файл непарних сторінок (односторонній)';

  @override
  String get rectoVersoEvenSlot => 'Файл парних сторінок (назад)';

  @override
  String get rectoVersoReversed => 'Другий файл у зворотному порядку';

  @override
  String get rectoVersoReversedHint =>
      'Це найпоширеніший випадок, позначений за замовчуванням';

  @override
  String rectoVersoPreview(int count) {
    return 'Огляд чергування ($count сторінок)';
  }

  @override
  String get rectoVersoProgress => 'Триває чергування…';

  @override
  String fileWithPageCount(String name, int count) {
    return '$name · $count сторінок';
  }

  @override
  String get actionPreviewAndExport => 'Попередній перегляд і експорт';

  @override
  String errorOpenFailedShort(String detail) {
    return 'Не вдається відкрити: $detail';
  }

  @override
  String errorGeneric(String detail) {
    return 'Помилка: $detail';
  }

  @override
  String get actionConvertToPdf => 'Перетворити в PDF';

  @override
  String get convertProgress => 'Триває перетворення...';

  @override
  String get excelEmptyTitle => 'PDF робочий зошит';

  @override
  String get excelEmptyBody =>
      'Аркуші у файлі .xlsx перетворюються на сторінки PDF, готові до надсилання чи друку.';

  @override
  String get excelChooseWorkbook => 'Виберіть підшивку';

  @override
  String get excelChooseXlsx => 'Виберіть книгу .xlsx';

  @override
  String get excelLegacyFormat =>
      'Формат .xls (старий двійковий формат Excel) не підтримується. Збережіть файл як .xlsx і повторіть спробу.';

  @override
  String get excelWrongFormat => 'Будь ласка, виберіть книгу Excel .xlsx.';

  @override
  String excelUnreadable(String detail) {
    return 'Нечитабельна папка: $detail';
  }

  @override
  String excelSheetsAndRows(int sheets, int rows) {
    return '$sheets аркушів · $rows рядків загалом';
  }

  @override
  String get excelSheetsDetected => 'Виявлено листя';

  @override
  String get excelEmptySheet => 'Порожній аркуш';

  @override
  String excelSheetDimensions(int rows, int columns) {
    return '$rows рядків × $columns стовпців';
  }

  @override
  String get excelRepeatHeader =>
      'Повторіть рядок заголовка на кожній сторінці';

  @override
  String get excelRepeatHeaderHint =>
      'У верхній частині кожної сторінки таблиці перемальовується перший рядок аркуша.';

  @override
  String get excelCaveat =>
      'Що потрібно для перетворення: текст комірок, збережений у файлі (включаючи останній обчислений результат формул), перший жирний рядок і сітку.\n\nЩо не включено: кольори, шрифти, формати чисел, об’єднані комірки, зображення, графіка та самі формули. Стовпці зменшені відповідно до ширини сторінки; на дуже широких аркушах текст у занадто вузьких клітинках скорочується на «…».';

  @override
  String get pptxEmptyTitle => 'Презентація в форматі PDF';

  @override
  String get pptxEmptyBody =>
      'Одна альбомна сторінка 16:9 на слайд, включаючи заголовок і маркери. Текст повторюється; вихідні зображення, форми та фони не є такими.\n\nПрийнятий формат: .pptx. Старий файл .ppt потрібно спочатку повторно зберегти як .pptx із PowerPoint.';

  @override
  String get pptxChoosePresentation => 'Виберіть презентацію';

  @override
  String get pptxTextOnlyTitle => 'Перетворення лише тексту';

  @override
  String get pptxTextOnlyBody =>
      'Текст кожного слайда повторюється. Оригінальні зображення, форми, фони, кольори та макети не зберігаються: отриманий PDF-файл є простим, зрозумілим для читання макетом, а не точною копією вашої презентації.';

  @override
  String pptxSlideCount(int count) {
    return '$count слайдів';
  }

  @override
  String get pptxSlidesDetected => 'Виявлено слайди';

  @override
  String pptxMoreSlides(int count) {
    return 'і $count інших слайдів…';
  }

  @override
  String get pptxUntitledSlide => 'Без назви';

  @override
  String get pptxEmptySlide => 'Без тексту (лише зображення або фігура)';

  @override
  String pptxTextLineCount(int count) {
    return '$count рядків тексту';
  }

  @override
  String pptxReadFailed(String detail) {
    return 'Неможливо прочитати: $detail';
  }

  @override
  String get compressLevelLight => 'світло';

  @override
  String get compressLevelMedium => 'Середній';

  @override
  String get compressLevelStrong => 'Форте';

  @override
  String get pptxQualityStandard => 'Стандарт (150 dpi)';

  @override
  String get pptxQualityHigh => 'Високий (220 dpi)';

  @override
  String get pdfToExcelEmptyTitle => 'Отримати таблиці';

  @override
  String get pdfToExcelEmptyBody =>
      'Таблиці з PDF-файлу витягуються до книги Excel. Форматування не зберігається, значення є.';

  @override
  String pdfToExcelPagesAnalyzed(int count) {
    return 'Проаналізовано $count сторінок';
  }

  @override
  String pdfToExcelAnalysisFailed(String detail) {
    return 'Аналіз неможливий. PDF-файл може бути захищений паролем або пошкоджений. ($detail)';
  }

  @override
  String get pdfToExcelNothingToExport =>
      'Немає нічого для експорту: таблицю не виявлено.';

  @override
  String get pdfToExcelBuilding => 'Створення робочої книги…';

  @override
  String get pdfToExcelIncludeParagraphs =>
      'Також включити текст поза таблицями (один рядок на абзац)';

  @override
  String get pdfToExcelIncludeParagraphsHint =>
      'Корисно для напівструктурованого документа: текст розміщується в колонці A після таблиць на сторінці.';

  @override
  String get pdfToExcelCaveatTitle => 'Що не зберігає перетворення';

  @override
  String get pdfToExcelCaveat =>
      'Виявлення базується на положенні тексту на сторінці: таблиці без звичайних рамок, об’єднані комірки та дуже неправильні стовпці можуть бути погано вирізані. Відсканований файл PDF (зображення) не містить тексту, який можна витягти, і нічого не дасть. Кольори, формули та зображення ніколи не включаються: є лише текстові значення.';

  @override
  String pdfToExcelTablesFound(int tables, int pages) {
    return '$tables таблиці, виявлені на $pages сторінках';
  }

  @override
  String pdfToExcelPagesConcerned(String pages) {
    return 'Постраждалі сторінки: $pages';
  }

  @override
  String pdfToExcelParagraphsOutside(int count) {
    return '$count абзаців поза таблицями';
  }

  @override
  String get pdfToExcelScannedWarning =>
      'З цього PDF-файлу не вдалося отримати текст: швидше за все, це відсканований документ (зображення сторінок). Електронна таблиця не може нічого отримати з цього; спочатку скористайтеся інструментом розпізнавання тексту (OCR).';

  @override
  String get pdfToExcelNoTableWarning =>
      'У цьому документі не було розпізнано структуру таблиці. Текст є, але він не розміщений у звичайних колонках. Замість того, щоб створювати нечитабельну книгу, увімкніть «Також включити нетабличний текст» вище або скористайтеся «PDF у Word», який краще зберігає абзаци.';

  @override
  String get pdfToExcelResultTitle => 'Підшивка готова';

  @override
  String get pdfToExcelExportWhat => 'Робоча книга Excel';

  @override
  String get pdfToExcelConvertAction => 'Перетворити в Excel';

  @override
  String resultNameAndSize(String name, String size) {
    return '$name — $size';
  }

  @override
  String get pdfToPptxEmptyTitle => 'Один слайд на сторінку';

  @override
  String get pdfToPptxEmptyBody =>
      'PDF стає ідентичною презентацією PowerPoint. Кожна сторінка надходить у вигляді зображення: макет точний, але текст не можна редагувати в PowerPoint.';

  @override
  String pdfToPptxOpenFailed(String detail) {
    return 'Не вдається відкрити цей PDF: $detail';
  }

  @override
  String get pdfToPptxConverting => 'Перетворення на PowerPoint…';

  @override
  String pdfToPptxPagesToSlides(int count) {
    return '$count сторінок > $count слайдів';
  }

  @override
  String get pdfToPptxEmptyDocument => 'Порожній документ';

  @override
  String get qualityLabel => 'якість';

  @override
  String get pdfToPptxQualityHint =>
      'Вища роздільна здатність забезпечує чіткіші слайди, але значно більший файл.';

  @override
  String pdfToPptxHeavyWarning(int count) {
    return 'Попередження: у високій якості презентація з $count сторінок може важити кілька десятків Мб і довго відкриватися. Якщо сумніваєтеся, виберіть «Стандарт».';
  }

  @override
  String get goodToKnow => 'А саме';

  @override
  String get pdfToPptxCaveat =>
      'Кожен слайд є зображенням сторінки: макет ідентичний PDF-файлу, але текст не можна редагувати в PowerPoint.\nЩоб отримати редагований текст, замість цього використовуйте «PDF to Word».\nПрезентація має лише один формат слайда: він береться з першої сторінки, а сторінки різних форматів розміщуються по центру.';

  @override
  String get pdfToPptxResultTitle => 'Презентація готова';

  @override
  String pdfToPptxResultDetail(
    String name,
    int count,
    String size,
    String quality,
  ) {
    return '$name — $count слайдів · $size · $quality';
  }

  @override
  String get notSavedYet =>
      'Файл ще не на вашому пристрої: збережіть його або поділіться ним.';

  @override
  String get pdfToPptxChangeQuality => 'Змінити якість';

  @override
  String get pdfToPptxConvertAction => 'Конвертувати в PowerPoint';

  @override
  String pdfToPptxExportWhat(int count) {
    return 'Презентація PowerPoint · $count слайдів';
  }

  @override
  String get formatLabel => 'Формат';

  @override
  String get actionExport => 'Експорт';

  @override
  String get imageQualityWeb => 'Інтернет (72 dpi)';

  @override
  String get imageQualityStandard => 'Стандарт (150 dpi)';

  @override
  String get imageQualityHigh => 'Висока якість (300 dpi)';

  @override
  String get pdfToImagesEmptyTitle => 'Одне зображення на сторінку';

  @override
  String get pdfToImagesEmptyBody =>
      'Виберіть PDF: кожна сторінка відображатиметься як зображення з визначенням, яке ви потім налаштуєте.';

  @override
  String pdfToImagesNotAPdf(String name) {
    return '$name: виберіть файл PDF.';
  }

  @override
  String errorLoadFailed(String detail) {
    return 'Не вдалося завантажити: $detail';
  }

  @override
  String get pdfToImagesProgress => 'Виконується експорт…';

  @override
  String pdfToImagesExportWhat(int count, String format) {
    return '$count зображень $format';
  }

  @override
  String get pdfaEmptyTitle => 'Архів надовго';

  @override
  String get pdfaEmptyBody =>
      'PDF/A — це формат архівування, який вимагається багатьма адміністраціями. Документ конвертується без втрати зовнішнього вигляду.';

  @override
  String get pdfaConformanceLevel => 'Рівень відповідності';

  @override
  String get pdfaA1bDetail =>
      'Найсуворіший і загальновизнаний рівень. Виберіть, якщо сумніваєтеся.';

  @override
  String get pdfaA2bDetail =>
      'На основі PDF 1.7: більш ефективне стиснення, трохи легші файли.';

  @override
  String get pdfaA3bDetail =>
      'Як A-2b, але дозволяє вкладення (часто запитується для електронних рахунків).';

  @override
  String pdfaConvertingTo(String level) {
    return 'Перетворення на $level…';
  }

  @override
  String get pdfaCaveatTitle => 'Що змінює перетворення';

  @override
  String pdfaCaveat(int dpi) {
    return 'Кожна сторінка перемальовується як зображення з роздільною здатністю $dpi dpi: текст стає зображенням, макет зависає. Це те, що робить файл справді сумісним незалежно від шрифтів вихідного документа, але натомість текст більше не доступний для вибору чи пошуку, посилання та форми зникають, а файл стає важчим.';
  }

  @override
  String pdfaOpenFailed(String detail) {
    return 'Неможливо відкрити цей PDF: $detail';
  }

  @override
  String get imagesToPdfEmptyTitle => 'Зображення, PDF';

  @override
  String get imagesToPdfEmptyBody =>
      'JPG, PNG, WebP, HEIC — додайте свої зображення, і вони будуть зібрані у вибраному вами порядку.';

  @override
  String get imagesToPdfChoose => 'Виберіть зображення';

  @override
  String get imagesToPdfAdd => 'Додайте зображення';

  @override
  String imagesToPdfRejected(String names) {
    return 'Пропущено (не зображення): $names';
  }

  @override
  String get imagesToPdfBuilding => 'Створення PDF...';

  @override
  String imagesToPdfBuildFailed(String detail) {
    return 'Помилка створення: $detail';
  }

  @override
  String imagesToPdfCreateAction(int count) {
    return 'Створіть PDF ($count зображень)';
  }

  @override
  String get actionRotate => 'Обертати';

  @override
  String get actionRemove => 'Вилучити';

  @override
  String get htmlTitle => 'HTML/веб-сторінка в PDF';

  @override
  String get htmlIntro =>
      'Перетворіть веб-сторінку або HTML-код у формат A4 PDF. Візуалізація виконується браузером, інтегрованим в Android, тому макет схожий на друк із Chrome.';

  @override
  String get htmlModeUrl => 'Адреса сайту';

  @override
  String get htmlModeCode => 'HTML код';

  @override
  String get htmlUrlLabel => 'Адреса сторінки';

  @override
  String get htmlUrlHint => 'https://example.fr/article';

  @override
  String get htmlCodeLabel => 'HTML код';

  @override
  String get htmlCodeHint => '<h1>Назва</h1>\n<p>Текст…</p>';

  @override
  String get htmlUrlBadScheme =>
      'Адреса має починатися з http:// або https://.';

  @override
  String get htmlUrlIncomplete => 'Введіть повну веб-адресу.';

  @override
  String get htmlCodeEmpty => 'Вставте HTML-код для конвертації.';

  @override
  String get htmlLoadingUrl => 'Завантаження сторінки та конвертація…';

  @override
  String get htmlConverting => 'Триває перетворення HTML...';

  @override
  String get htmlNetworkNotice =>
      'Необхідне підключення до Інтернету: це єдиний інструмент у додатку, який повинен завантажити сторінку. Сторінки, які вимагають входу в обліковий запис, банер із файлами cookie або багато JavaScript, можуть видаватися незавершеними.';

  @override
  String get htmlOfflineNotice =>
      'HTML і CSS, написані безпосередньо на сторінці, відображаються в автономному режимі. З іншого боку, зображення, таблиці стилів або шрифти, викликані зовнішньою веб-адресою, потребують підключення до Інтернету.';

  @override
  String get watermarkEmptyTitle => 'Додайте водяний знак';

  @override
  String get watermarkEmptyBody =>
      'Вибраний вами текст повторюється у фоновому режимі на всіх сторінках — щоб позначити документ як конфіденційний або чернетковий.';

  @override
  String get watermarkEmptyNote =>
      'Безкоштовний експорт без обмеження кількості.';

  @override
  String get watermarkTextLabel => 'Текст водяного знака';

  @override
  String get watermarkDefaultText => 'КОНФІДЕНЦІЙНО';

  @override
  String get watermarkNeedText => 'Введіть текст для водяного знака.';

  @override
  String watermarkOpacity(int percent) {
    return 'Непрозорість: $percent %';
  }

  @override
  String watermarkRotation(int degrees) {
    return 'Кут повороту: $degrees°';
  }

  @override
  String watermarkFontSize(int points) {
    return 'Розмір тексту: $points пт';
  }

  @override
  String get watermarkColor => 'колір';

  @override
  String get colorGrey => 'Сірий';

  @override
  String get colorRed => 'Червоний';

  @override
  String get colorBlue => 'Синій';

  @override
  String get colorBlack => 'чорний';

  @override
  String get watermarkProgress => 'Виконується застосування водяного знака…';

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
    return '$points пт';
  }

  @override
  String get pageNumbersEmptyTitle => 'Пронумеруйте сторінки';

  @override
  String get pageNumbersEmptyBody =>
      'Виберіть PDF-файл, а потім позицію та формат чисел, які додаватимуться на кожну сторінку.';

  @override
  String get positionLabel => 'Позиція';

  @override
  String get positionBottomCenter => 'Нижній центр';

  @override
  String get positionBottomRight => 'Праворуч внизу';

  @override
  String get positionTopCenter => 'Верхній центр';

  @override
  String get positionTopRight => 'Вгорі справа';

  @override
  String get pageNumbersFormatPlain => 'Н';

  @override
  String get pageNumbersFormatOfTotal => 'N / всього';

  @override
  String get pageNumbersStart => 'Стартовий номер';

  @override
  String get pageNumbersProgress => 'Триває нумерація…';

  @override
  String get organizeEmptyTitle => 'Резюме PDF в руках';

  @override
  String get organizeEmptyBody =>
      'Відкрийте документ, щоб розділити його, витягнути сторінки або змінити порядок.';

  @override
  String get organizeOpenFile => 'Відкрийте файл';

  @override
  String get organizeNothingToExport => 'Немає сторінок для експорту.';

  @override
  String organizePagesKept(int kept, int total) {
    return 'Збережено сторінок: $kept із $total';
  }

  @override
  String get organizePageExcluded => 'Відкинуто';

  @override
  String organizePageMoved(int from) {
    return 'Переміщено з позиції $from';
  }

  @override
  String organizePageTitle(int number) {
    return 'Сторінка $number';
  }

  @override
  String organizeExcludePage(int number) {
    return 'Видалити сторінку $number';
  }

  @override
  String organizeIncludePage(int number) {
    return 'Включити сторінку $number';
  }

  @override
  String organizeMovePage(int number) {
    return 'Перемістити сторінку $number';
  }

  @override
  String get organizeExtract => 'Екстракт';

  @override
  String get organizeSplit => 'Розділити';

  @override
  String get organizePreview => 'Попередній перегляд';

  @override
  String get organizeExtractTitle => 'Витягніть діапазон сторінок';

  @override
  String organizeRangeLabel(int start, int end) {
    return 'Сторінки $start до $end';
  }

  @override
  String get organizeSplitTitle => 'Розділити на кілька файлів';

  @override
  String organizeFileCount(int count) {
    return '$count файлів';
  }

  @override
  String organizeSplitFailed(String detail) {
    return 'Помилка ділення: $detail';
  }

  @override
  String get scanNoCamera => 'На цьому пристрої немає камери.';

  @override
  String scanCameraFailed(String detail) {
    return 'Не вдається ініціалізувати камеру: $detail';
  }

  @override
  String get scanCropToolbar => 'Налаштувати';

  @override
  String scanCaptureFailed(String detail) {
    return 'Помилка захоплення: $detail';
  }

  @override
  String get scanPermissionBody =>
      'Для сканування документа потрібен доступ до камери.';

  @override
  String get scanGrantPermission => 'Дозволити камеру';

  @override
  String get actionRetry => 'Спробуйте знову';

  @override
  String get scanNoPageYet => 'На даний момент немає сторінок.';

  @override
  String scanFinishAction(int count) {
    return 'Оздоблення · $count';
  }

  @override
  String get signTitle => 'Підпишіть PDF';

  @override
  String get signIntro =>
      'Додайте намальований від руки підпис на сторінку PDF-файлу. Це простий малюнок, який додається до документа, а не сертифікований електронний підпис.';

  @override
  String get signChooseSubtitle => 'Виберіть документ для підпису';

  @override
  String get signPickPage => 'Виберіть сторінку для підпису.';

  @override
  String get signDrawTitle => 'Намалюй мій підпис';

  @override
  String get signDrawBody =>
      'Малюйте пальцем, як на папері. Це розміщує дизайн на сторінці — це не сертифікований електронний підпис.';

  @override
  String get signNeedDrawing => 'Перш ніж продовжити, намалюйте підпис.';

  @override
  String get signClear => 'Щоб стерти';

  @override
  String get signValidate => 'Для підтвердження';

  @override
  String get signPlaceBody =>
      'Перетягніть підпис у потрібне місце на сторінці, а потім натисніть «Готово».';

  @override
  String get signPageUnavailable => 'Неможливо відобразити сторінку.';

  @override
  String get signProgress => 'Додавання підпису…';

  @override
  String get editTitle => 'Примітки до документа';

  @override
  String get editEmptyBody =>
      'Додайте текст або виділіть уривки безпосередньо до наявного PDF-файлу.';

  @override
  String get editAddTextTitle => 'Додайте текст';

  @override
  String get editTextHint => 'Ваш текст';

  @override
  String editFontSize(int size) {
    return 'Розмір тексту: $size';
  }

  @override
  String get editNeedAnnotation =>
      'Додайте принаймні одну анотацію перед завершенням.';

  @override
  String get editProgress => 'Застосування анотацій…';

  @override
  String get editChooseOther => 'Виберіть інший PDF';

  @override
  String get editUndoTooltip => 'Скасувати останню анотацію';

  @override
  String get editModeText => 'текст';

  @override
  String get editModeHighlight => 'Виділіть';

  @override
  String get editPageUnavailable => 'Неможливо відобразити цю сторінку.';

  @override
  String get ocrEmptyTitle => 'Зробіть текст доступним для пошуку';

  @override
  String get ocrEmptyBody =>
      'Текст відсканованого PDF-файлу розпізнається та непомітно додається поверх зображення. Зовнішній вигляд сторінки не змінюється.';

  @override
  String get ocrWrongFormat => 'Виберіть PDF або зображення (JPG, PNG тощо).';

  @override
  String get ocrProgress => 'Виконується розпізнавання…';

  @override
  String ocrFailed(String detail) {
    return 'Не вдалося розпізнати: $detail';
  }

  @override
  String get ocrRunAction => 'Почати розпізнавання';

  @override
  String get ocrResultTitle => 'Результат OCR';

  @override
  String ocrResultBody(int count) {
    return 'Проаналізовано $count сторінок. PDF-файл із можливістю пошуку готовий, і ви також можете скопіювати весь розпізнаний текст.';
  }

  @override
  String get ocrCopyText => 'Скопіюйте текст';

  @override
  String get ocrTextCopied => 'Текст скопійовано.';

  @override
  String get redactIntro =>
      'Назавжди приховати частини PDF-файлу (імена, адреси, суми). На відміну від простого чорного прямокутника, розміщеного зверху, прихований текст фактично видаляється з файлу, а не просто покривається: його більше не можна вибрати чи скопіювати.';

  @override
  String get redactChooseSubtitle => 'Виберіть документ для редагування';

  @override
  String get redactCaveat =>
      'Зверніть увагу: для видалення прихованого тексту кожна сторінка документа перетворюється на зображення (200 ppi). Таким чином, результат більше не є PDF-файлом, з якого можна вибрати текст, і отриманий файл, як правило, важчий за оригінал.';

  @override
  String get redactEmptyPdf => 'Цей PDF-файл не містить сторінок.';

  @override
  String redactOpenFailed(String detail) {
    return 'Не вдається відкрити цей PDF (він може бути захищений паролем): $detail';
  }

  @override
  String redactPageRenderFailed(int number, String detail) {
    return 'Сторінку $number не можна відобразити: $detail';
  }

  @override
  String get redactUndoTooltip => 'Скасувати останню зону';

  @override
  String get redactInstructions =>
      'Проведіть пальцем по сторінці, щоб намалювати область, яку потрібно приховати. Закритий текст буде видалено з файлу, а не лише закритий.';

  @override
  String get redactPagePrevious => 'Попередня сторінка';

  @override
  String get redactPageNext => 'Наступна сторінка';

  @override
  String redactPager(int current, int total) {
    return 'Сторінка $current / $total';
  }

  @override
  String get redactNoZone => 'Немає нанесеної ділянки';

  @override
  String redactZoneCount(int count) {
    return '$count областей, які потрібно приховати';
  }

  @override
  String get redactOtherPdf => 'Інший PDF';

  @override
  String get redactAction => 'Відредагувати';

  @override
  String get redactProgress => 'Виконується редакція…';

  @override
  String get cropEmptyTitle => 'Обріжте поля';

  @override
  String get cropEmptyBody =>
      'Виберіть PDF-файл, потім проведіть пальцем по попередньому перегляду, щоб окреслити область, яку потрібно зберегти.';

  @override
  String get cropTooSmall => 'Вибрана область замала.';

  @override
  String get cropProgress => 'Виконується обрізка…';

  @override
  String cropFailed(String detail) {
    return 'Не вдалося обрізати: $detail';
  }

  @override
  String get cropKeptArea => 'Заповідна територія';

  @override
  String cropDimensions(
    int width,
    int height,
    int widthPercent,
    int heightPercent,
  ) {
    return '$width × $height мм ($widthPercent % × $heightPercent %)';
  }

  @override
  String get cropFullPage => 'Повна сторінка';

  @override
  String get cropAllPages => 'Застосувати до всіх сторінок';

  @override
  String get cropAllPagesOn =>
      'На кожній сторінці вирізається однакова ділянка.';

  @override
  String get cropAllPagesOff =>
      'Обрізається лише перша сторінка, інші залишаються цілими.';

  @override
  String get cropCaveat =>
      'Обрізання зменшує розмір сторінки: вміст за межами області більше не відображається та не друкується.';

  @override
  String get cropAction => 'кадрування';

  @override
  String get compareTitle => 'Порівняйте два PDF-файли';

  @override
  String get compareEmptyTitle => 'Що змінилося';

  @override
  String get compareEmptyBody =>
      'Виберіть дві версії одного PDF-файлу. Додані та видалені уривки будуть розміщені поруч один з одним сторінка за сторінкою.';

  @override
  String get compareSlotA => 'Файл А';

  @override
  String get compareSlotB => 'Файл Б';

  @override
  String get compareAction => 'Порівняйте';

  @override
  String get compareProgress => 'Триває порівняння…';

  @override
  String compareFailed(String detail) {
    return 'Не вдалося порівняти: $detail';
  }

  @override
  String compareChangedPages(int changed, int total) {
    return '$changed сторінки відрізняються на $total';
  }

  @override
  String get compareNoDifference =>
      'Між двома файлами не виявлено відмінностей.';

  @override
  String comparePageHeading(int number) {
    return 'Сторінка $number';
  }

  @override
  String organizeFilesCreated(int count) {
    return 'Створено файлів: $count';
  }

  @override
  String organizePartTitle(int number) {
    return 'Частина $number';
  }
}
