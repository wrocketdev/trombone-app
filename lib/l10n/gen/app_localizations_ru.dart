// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class LRu extends L {
  LRu([String locale = 'ru']) : super(locale);

  @override
  String get appTitle => 'Trombone — PDF, сканер и Word';

  @override
  String get appWordmark => 'Trombone';

  @override
  String get actionSave => 'Сохранить';

  @override
  String get actionShare => 'Поделиться';

  @override
  String get actionCompress => 'Сжать';

  @override
  String get actionDone => 'Готово';

  @override
  String get actionCancel => 'Отмена';

  @override
  String get actionChange => 'Заменить';

  @override
  String get actionContinue => 'Далее';

  @override
  String get actionOpening => 'Открывается…';

  @override
  String get actionRemoveFile => 'Убрать этот файл';

  @override
  String get progressPreparing => 'Подготовка…';

  @override
  String progressPercent(int percent) {
    return '$percent%';
  }

  @override
  String get emptyReassurance =>
      'Экспорт бесплатный, без водяного знака и без ограничений.';

  @override
  String get emptyAcceptedFormats => 'Поддерживаемые форматы';

  @override
  String get exportSavedTitle => 'Сохранено.';

  @override
  String get exportSavedBody =>
      'Под тем именем и в той папке, которые вы только что выбрали. Без водяного знака, без ограничений, разблокировать нечего.';

  @override
  String get exportSaveDialogTitle => 'Сохранить PDF';

  @override
  String pageTileIncluded(int number) {
    return 'Страница $number, включена. Нажмите, чтобы исключить.';
  }

  @override
  String pageTileExcluded(int number) {
    return 'Страница $number, исключена. Нажмите, чтобы включить.';
  }

  @override
  String pageTileRotate(int number) {
    return 'Повернуть страницу $number';
  }

  @override
  String sectionHeaderSemantics(String title, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count инструмента',
      many: '$count инструментов',
      few: '$count инструмента',
      one: '$count инструмент',
    );
    return '$title, $_temp0';
  }

  @override
  String toolCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count инструмента',
      many: '$count инструментов',
      few: '$count инструмента',
      one: '$count инструмент',
    );
    return '$_temp0';
  }

  @override
  String get homePromise =>
      'Создайте документ и сохраните его.\nНикаких платных ограничений в конце.';

  @override
  String get homeChipNoAccount => 'Без аккаунта';

  @override
  String get homeChipNoWatermark => 'Без водяного знака';

  @override
  String get homeChipUnlimited => 'Экспорт без ограничений';

  @override
  String get homeSearchTooltip => 'Найти инструмент';

  @override
  String get homeColophon =>
      'При сохранении ничего не блокируется за плату. Экспорт бесплатный, без водяного знака и без ограничений.';

  @override
  String get sectionFeatured => 'Главное';

  @override
  String get sectionToPdf => 'В PDF';

  @override
  String get sectionFromPdf => 'Из PDF';

  @override
  String get sectionSecurity => 'Защита';

  @override
  String get sectionEdit => 'Правка';

  @override
  String get toolMerge => 'Объединить';

  @override
  String get toolMergeKeywords => 'соединить склеить собрать слить добавить';

  @override
  String get toolMergeSubtitle =>
      'PDF, Word, изображения и текст в одном документе';

  @override
  String get toolRectoVerso => 'Двусторонняя печать';

  @override
  String get toolRectoVersoKeywords =>
      'дуплекс чередовать скан чётные нечётные две стороны';

  @override
  String get toolRectoVersoSubtitle => 'Два скана, снова по порядку';

  @override
  String get toolImagesToPdf => 'Изображения в PDF';

  @override
  String get toolImagesToPdfKeywords =>
      'фото jpg jpeg png снимки альбом камера картинка';

  @override
  String get toolImagesToPdfSubtitle =>
      'Фото и снимки экрана в одном документе';

  @override
  String get toolPdfToWord => 'PDF в Word';

  @override
  String get toolPdfToWordKeywords =>
      'docx текстовый редактор редактируемый конвертировать doc';

  @override
  String get toolPdfToWordSubtitle => 'Текст и таблицы, с возможностью правки';

  @override
  String get toolOrganize => 'Упорядочить PDF';

  @override
  String get toolOrganizeKeywords =>
      'разделить извлечь переставить порядок страницы удалить';

  @override
  String get toolOrganizeSubtitle => 'Разделить, извлечь, переставить';

  @override
  String get toolExcelToPdf => 'Excel в PDF';

  @override
  String get toolExcelToPdfKeywords => 'таблица xlsx книга лист расчёты';

  @override
  String get toolPptxToPdf => 'PowerPoint в PDF';

  @override
  String get toolPptxToPdfKeywords => 'pptx слайд презентация slides';

  @override
  String get toolHtmlToPdf => 'Веб-страница в PDF';

  @override
  String get toolHtmlToPdfKeywords => 'html сайт интернет url ссылка статья';

  @override
  String get toolScan => 'Сканировать документ';

  @override
  String get toolScanKeywords => 'камера фото оцифровать сканер бумага';

  @override
  String get toolPdfToExcel => 'PDF в Excel';

  @override
  String get toolPdfToExcelKeywords => 'таблица xlsx извлечь данные';

  @override
  String get toolPdfToPptx => 'PDF в PowerPoint';

  @override
  String get toolPdfToPptxKeywords => 'pptx слайд презентация slides';

  @override
  String get toolPdfToImages => 'PDF в изображения';

  @override
  String get toolPdfToImagesKeywords =>
      'jpg png фото выгрузить снимок картинка';

  @override
  String get toolOcr => 'Поиск по тексту (OCR)';

  @override
  String get toolOcrKeywords =>
      'распознавание символы скан копировать выделить ocr оцр';

  @override
  String get toolPdfA => 'Преобразовать в PDF/A';

  @override
  String get toolPdfAKeywords => 'архив стандарт долгое хранение iso';

  @override
  String get toolProtect => 'Защитить PDF';

  @override
  String get toolProtectKeywords =>
      'пароль замок зашифровать заблокировать защита';

  @override
  String get toolUnlock => 'Снять защиту с PDF';

  @override
  String get toolUnlockKeywords =>
      'убрать пароль открыть расшифровать разблокировать замок';

  @override
  String get toolRepair => 'Восстановить PDF';

  @override
  String get toolRepairKeywords =>
      'повреждён нечитаемый битый восстановить ошибка';

  @override
  String get toolRedact => 'Затемнить в PDF';

  @override
  String get toolRedactKeywords =>
      'скрыть закрасить обезличить конфиденциально удалить цензура';

  @override
  String get toolEdit => 'Редактировать PDF';

  @override
  String get toolEditKeywords => 'текст изменить исправить пометка писать';

  @override
  String get toolSign => 'Подписать';

  @override
  String get toolSignKeywords => 'подпись росчерк договор рука';

  @override
  String get toolWatermark => 'Водяной знак';

  @override
  String get toolWatermarkKeywords =>
      'watermark штамп конфиденциально черновик метка';

  @override
  String get toolPageNumbers => 'Номера страниц';

  @override
  String get toolPageNumbersKeywords =>
      'нумерация колонцифра пронумеровать цифры номера';

  @override
  String get toolCrop => 'Обрезать PDF';

  @override
  String get toolCropKeywords => 'обрезать поля кадрировать края размер';

  @override
  String get toolCompare => 'Сравнить PDF';

  @override
  String get toolCompareKeywords => 'разница версии diff изменения сравнить';

  @override
  String get searchHint => 'Объединить, пароль, водяной знак…';

  @override
  String get searchClear => 'Очистить';

  @override
  String searchNoResultTitle(String query) {
    return 'Нет инструмента для «$query».';
  }

  @override
  String get searchNoResultBody =>
      'Попробуйте назвать формат, который у вас под рукой, — «Word», «Excel», «фото» — или то, что вы хотите сделать: «подписать», «разделить», «пароль».';

  @override
  String get actionUndo => 'Отменить действие';

  @override
  String get actionApply => 'Применить';

  @override
  String get actionChoose => 'Выбрать';

  @override
  String get actionChoosePdf => 'Выбрать PDF';

  @override
  String get actionChooseFiles => 'Выбрать файлы';

  @override
  String get actionConvert => 'Преобразовать';

  @override
  String get actionFinish => 'Завершить';

  @override
  String get actionBack => 'Назад';

  @override
  String get actionAdd => 'Добавить';

  @override
  String get noFileChosen => 'Файл не выбран';

  @override
  String errorExportFailed(String detail) {
    return 'Не удалось выгрузить: $detail';
  }

  @override
  String errorShareFailed(String detail) {
    return 'Не удалось поделиться: $detail';
  }

  @override
  String errorOpenFailed(String detail) {
    return 'Не удалось открыть файл: $detail';
  }

  @override
  String errorConversionFailed(String detail) {
    return 'Не удалось преобразовать: $detail';
  }

  @override
  String errorOnFile(String name, String detail) {
    return '$name: $detail';
  }

  @override
  String get errorPickPdf => 'Выберите файл PDF.';

  @override
  String sizeBytes(String value) {
    return '$value Б';
  }

  @override
  String sizeKb(String value) {
    return '$value КБ';
  }

  @override
  String sizeMb(String value) {
    return '$value МБ';
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
      other: '$count страницы',
      many: '$count страниц',
      few: '$count страницы',
      one: '$count страница',
    );
    return '$_temp0';
  }

  @override
  String pageCountOfTotal(int kept, int total) {
    String _temp0 = intl.Intl.pluralLogic(
      kept,
      locale: localeName,
      other: '$kept страницы',
      many: '$kept страниц',
      few: '$kept страницы',
      one: '$kept страница',
    );
    return '$_temp0 из $total';
  }

  @override
  String pageOfTotal(int current, int total) {
    return 'Страница $current из $total';
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
  String get formatImages => 'Изображения';

  @override
  String get formatText => 'Текст';

  @override
  String get mergeAddFile => 'Добавить файл';

  @override
  String get mergeAddHint => 'PDF, Word, изображения или текст';

  @override
  String get mergeEmptyTitle => 'Один документ';

  @override
  String get mergeEmptyBody =>
      'Добавьте файлы PDF, Word, изображения или текст. Перед выгрузкой их можно переставить и исключить лишние страницы.';

  @override
  String get mergeNeedOnePage =>
      'Добавьте хотя бы один файл с включённой страницей.';

  @override
  String get mergeProgress => 'Объединение…';

  @override
  String mergeFailed(String detail) {
    return 'Не удалось объединить: $detail';
  }

  @override
  String mergeRemoved(String name) {
    return '$name убран.';
  }

  @override
  String mergeRemoveTooltip(String name) {
    return 'Убрать $name';
  }

  @override
  String mergeMoveSemantics(String name) {
    return 'Переместить $name';
  }

  @override
  String get mergeRotateAll => 'Повернуть все страницы';

  @override
  String mergePreviewAndExport(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count страницы',
      many: '$count страниц',
      few: '$count страницы',
      one: '$count страница',
    );
    return 'Просмотр и экспорт ($_temp0)';
  }

  @override
  String previewTitle(String size) {
    return 'Просмотр · $size';
  }

  @override
  String previewZoomPage(int number) {
    return 'Страница $number, увеличить';
  }

  @override
  String get previewPageUnreadable => 'Страница не читается.';

  @override
  String previewExportWhat(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count страницы',
      many: '$count страниц',
      few: '$count страницы',
      one: '$count страница',
    );
    return 'PDF · $_temp0';
  }

  @override
  String get compressTitle => 'Сжатие';

  @override
  String compressBody(String size) {
    return 'Текущий размер: $size. Выберите уровень — предполагаемый размер показывается до применения.';
  }

  @override
  String get compressEstimating => 'Оценка…';

  @override
  String get compressProgress => 'Сжатие…';

  @override
  String compressFailed(String detail) {
    return 'Не удалось сжать: $detail';
  }

  @override
  String get protectEmptyTitle => 'Поставить пароль';

  @override
  String get protectEmptyBody =>
      'PDF больше не откроется без выбранного вами пароля. Сохраните его: восстановить пароль невозможно.';

  @override
  String get protectSubtitle => 'Будет зашифрован по AES 256 бит';

  @override
  String get protectPassword => 'Пароль';

  @override
  String get protectConfirmPassword => 'Подтвердите пароль';

  @override
  String get protectShowPasswords => 'Показать пароли';

  @override
  String get protectHidePasswords => 'Скрыть пароли';

  @override
  String get protectMismatch => 'Пароли не совпадают.';

  @override
  String get protectWarning =>
      'Запишите его где-нибудь: без пароля документ навсегда станет нечитаемым. Восстановление невозможно ни вами, ни приложением.';

  @override
  String get protectAlreadyProtected =>
      'Этот файл уже защищён — сначала воспользуйтесь инструментом «Снять защиту с PDF».';

  @override
  String get protectProgress => 'Установка защиты…';

  @override
  String protectFailed(String detail) {
    return 'Не удалось защитить: $detail';
  }

  @override
  String get protectAction => 'Защитить';

  @override
  String get protectResultTitle => 'PDF защищён';

  @override
  String get protectResultDetail =>
      'Зашифрован по AES 256 бит. Для открытия понадобится пароль.';

  @override
  String get protectExportWhat => 'PDF, защищённый паролем';

  @override
  String get unlockEmptyTitle => 'Убрать пароль';

  @override
  String get unlockEmptyBody =>
      'Понадобится текущий пароль документа. После снятия PDF будет открываться свободно.';

  @override
  String get unlockAcceptsProtectedPdf => 'Защищённый PDF';

  @override
  String get unlockChooseProtectedPdf => 'Выбрать защищённый PDF';

  @override
  String get unlockCurrentPassword => 'Текущий пароль';

  @override
  String get unlockWrongPassword => 'Неверный пароль.';

  @override
  String get unlockProgress => 'Снятие защиты…';

  @override
  String unlockFailed(String detail) {
    return 'Не удалось снять защиту: $detail';
  }

  @override
  String get unlockAction => 'Снять защиту';

  @override
  String get repairEmptyTitle => 'Восстановить повреждённый файл';

  @override
  String get repairEmptyBody =>
      'Внутренняя структура повреждённого PDF собирается заново. Всё, что можно спасти, будет спасено.';

  @override
  String get repairProgress => 'Восстановление…';

  @override
  String get repairFailed =>
      'Этот файл восстановить не удаётся — возможно, он слишком повреждён.';

  @override
  String get repairAction => 'Восстановить';

  @override
  String get pdfToWordEmptyTitle => 'Редактируемый Word';

  @override
  String get pdfToWordEmptyBody =>
      'Текст и структура PDF переносятся в документ .docx, который можно открыть и отредактировать.';

  @override
  String get pdfToWordAnalyzing => 'Анализ документа…';

  @override
  String get pdfToWordAnalysisPending => 'Анализ ожидается';

  @override
  String pdfToWordAnalysisFailed(String detail) {
    return 'Анализ не удался: $detail';
  }

  @override
  String get pdfLocked => 'Этот PDF защищён паролем. Сначала снимите защиту.';

  @override
  String get pdfToWordConverting => 'Преобразование в Word…';

  @override
  String get pdfToWordSummaryTitle => 'Найденное содержимое';

  @override
  String pdfToWordParagraphCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count абзаца',
      many: '$count абзацев',
      few: '$count абзаца',
      one: '$count абзац',
    );
    return '$_temp0';
  }

  @override
  String pdfToWordHeadingCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count заголовка',
      many: '$count заголовков',
      few: '$count заголовка',
      one: '$count заголовок',
    );
    return '$_temp0';
  }

  @override
  String pdfToWordTableCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count таблицы',
      many: '$count таблиц',
      few: '$count таблицы',
      one: '$count таблица',
    );
    return '$_temp0';
  }

  @override
  String get pdfToWordNoTables =>
      'Таблиц не найдено: если в вашем PDF они есть, их строки станут абзацами.';

  @override
  String get pdfToWordCaveat =>
      'Преобразование переносит текст, оформление и таблицы, но не точную вёрстку: положение изображений и колонок не сохраняется, а сами изображения в документ Word не попадают.';

  @override
  String get pdfToWordScanWarning =>
      'Похоже, это скан: текста не найдено. Сначала воспользуйтесь инструментом «Поиск по тексту (OCR)», затем вернитесь и преобразуйте полученный PDF.';

  @override
  String get pdfToWordResultTitle => 'Документ Word готов';

  @override
  String pdfToWordResultDetail(String name, String size) {
    return '$name — $size';
  }

  @override
  String get pdfToWordExportWhat => 'Документ Word';

  @override
  String get pdfToWordConvertAction => 'Преобразовать в Word';

  @override
  String get actionConvertAgain => 'Преобразовать заново';

  @override
  String errorSaveFailed(String detail) {
    return 'Не удалось сохранить: $detail';
  }

  @override
  String get rectoVersoIntro =>
      'Односторонний податчик даёт два файла: нечётные страницы по порядку, чётные часто в обратном. Выберите оба, чтобы собрать документ заново.';

  @override
  String get rectoVersoOddSlot =>
      'Файл с нечётными страницами (лицевая сторона)';

  @override
  String get rectoVersoEvenSlot => 'Файл с чётными страницами (оборот)';

  @override
  String get rectoVersoReversed => 'Второй файл идёт в обратном порядке';

  @override
  String get rectoVersoReversedHint =>
      'Так бывает чаще всего, поэтому отмечено по умолчанию';

  @override
  String rectoVersoPreview(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count страницы',
      many: '$count страниц',
      few: '$count страницы',
      one: '$count страница',
    );
    return 'Просмотр чередования ($_temp0)';
  }

  @override
  String get rectoVersoProgress => 'Чередование…';

  @override
  String fileWithPageCount(String name, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count страницы',
      many: '$count страниц',
      few: '$count страницы',
      one: '$count страница',
    );
    return '$name · $_temp0';
  }

  @override
  String get actionPreviewAndExport => 'Просмотр и экспорт';

  @override
  String errorOpenFailedShort(String detail) {
    return 'Не удалось открыть: $detail';
  }

  @override
  String errorGeneric(String detail) {
    return 'Не удалось: $detail';
  }

  @override
  String get actionConvertToPdf => 'Преобразовать в PDF';

  @override
  String get convertProgress => 'Преобразование…';

  @override
  String get excelEmptyTitle => 'Книга в виде PDF';

  @override
  String get excelEmptyBody =>
      'Листы файла .xlsx становятся страницами PDF, готовыми к отправке или печати.';

  @override
  String get excelChooseWorkbook => 'Выбрать книгу';

  @override
  String get excelChooseXlsx => 'Выбрать книгу .xlsx';

  @override
  String get excelLegacyFormat =>
      'Формат .xls (старый двоичный формат Excel) не поддерживается. Сохраните файл как .xlsx и попробуйте снова.';

  @override
  String get excelWrongFormat => 'Выберите книгу Excel в формате .xlsx.';

  @override
  String excelUnreadable(String detail) {
    return 'Книга не читается: $detail';
  }

  @override
  String excelSheetsAndRows(int sheets, int rows) {
    String _temp0 = intl.Intl.pluralLogic(
      sheets,
      locale: localeName,
      other: '$sheets листа',
      many: '$sheets листов',
      few: '$sheets листа',
      one: '$sheets лист',
    );
    String _temp1 = intl.Intl.pluralLogic(
      rows,
      locale: localeName,
      other: '$rows строки всего',
      many: '$rows строк всего',
      few: '$rows строки всего',
      one: '$rows строка всего',
    );
    return '$_temp0 · $_temp1';
  }

  @override
  String get excelSheetsDetected => 'Найденные листы';

  @override
  String get excelEmptySheet => 'Пустой лист';

  @override
  String excelSheetDimensions(int rows, int columns) {
    String _temp0 = intl.Intl.pluralLogic(
      rows,
      locale: localeName,
      other: '$rows строки',
      many: '$rows строк',
      few: '$rows строки',
      one: '$rows строка',
    );
    String _temp1 = intl.Intl.pluralLogic(
      columns,
      locale: localeName,
      other: '$columns столбца',
      many: '$columns столбцов',
      few: '$columns столбца',
      one: '$columns столбец',
    );
    return '$_temp0 × $_temp1';
  }

  @override
  String get excelRepeatHeader =>
      'Повторять строку заголовка на каждой странице';

  @override
  String get excelRepeatHeaderHint =>
      'Первая строка листа заново отрисовывается вверху каждой страницы таблицы.';

  @override
  String get excelCaveat =>
      'Что переносится: текст ячеек в том виде, в каком он записан в файле (включая последний вычисленный результат формул), первая строка полужирным и сетка.\n\nЧто не переносится: цвета, шрифты, числовые форматы, объединённые ячейки, изображения, диаграммы и сами формулы. Столбцы сужаются, чтобы уместиться по ширине страницы; на очень широких листах текст слишком узких ячеек обрезается знаком «…».';

  @override
  String get pptxEmptyTitle => 'Презентация в виде PDF';

  @override
  String get pptxEmptyBody =>
      'Одна альбомная страница 16:9 на слайд, с заголовком и пунктами. Текст переносится; исходные изображения, фигуры и фоны — нет.\n\nПоддерживаемый формат: .pptx. Старый файл .ppt нужно сначала пересохранить как .pptx в PowerPoint.';

  @override
  String get pptxChoosePresentation => 'Выбрать презентацию';

  @override
  String get pptxTextOnlyTitle => 'Переносится только текст';

  @override
  String get pptxTextOnlyBody =>
      'Текст каждого слайда переносится. Исходные изображения, фигуры, фоны, цвета и макеты не сохраняются: полученный PDF — это простая читаемая вёрстка, а не точная копия вашей презентации.';

  @override
  String pptxSlideCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count слайда',
      many: '$count слайдов',
      few: '$count слайда',
      one: '$count слайд',
    );
    return '$_temp0';
  }

  @override
  String get pptxSlidesDetected => 'Найденные слайды';

  @override
  String pptxMoreSlides(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count слайда',
      many: '$count слайдов',
      few: '$count слайда',
      one: '$count слайд',
    );
    return 'и ещё $_temp0…';
  }

  @override
  String get pptxUntitledSlide => 'Без заголовка';

  @override
  String get pptxEmptySlide => 'Без текста (только изображение или фигура)';

  @override
  String pptxTextLineCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count строки текста',
      many: '$count строк текста',
      few: '$count строки текста',
      one: '$count строка текста',
    );
    return '$_temp0';
  }

  @override
  String pptxReadFailed(String detail) {
    return 'Не удалось прочитать: $detail';
  }

  @override
  String get compressLevelLight => 'Слабое';

  @override
  String get compressLevelMedium => 'Среднее';

  @override
  String get compressLevelStrong => 'Сильное';

  @override
  String get pptxQualityStandard => 'Обычное (150 dpi)';

  @override
  String get pptxQualityHigh => 'Высокое (220 dpi)';

  @override
  String get pdfToExcelEmptyTitle => 'Вернуть таблицы';

  @override
  String get pdfToExcelEmptyBody =>
      'Таблицы из PDF извлекаются в книгу Excel. Оформление не сохраняется, значения сохраняются.';

  @override
  String pdfToExcelPagesAnalyzed(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'проанализировано $count страницы',
      many: 'проанализировано $count страниц',
      few: 'проанализированы $count страницы',
      one: 'проанализирована $count страница',
    );
    return '$_temp0';
  }

  @override
  String pdfToExcelAnalysisFailed(String detail) {
    return 'Анализ невозможен. PDF может быть защищён паролем или повреждён. ($detail)';
  }

  @override
  String get pdfToExcelNothingToExport =>
      'Выгружать нечего: таблиц не найдено.';

  @override
  String get pdfToExcelBuilding => 'Создание книги…';

  @override
  String get pdfToExcelIncludeParagraphs =>
      'Включить и текст вне таблиц (по строке на абзац)';

  @override
  String get pdfToExcelIncludeParagraphsHint =>
      'Полезно для полуструктурированного документа: текст попадает в столбец A, после таблиц страницы.';

  @override
  String get pdfToExcelCaveatTitle => 'Что преобразование не сохраняет';

  @override
  String get pdfToExcelCaveat =>
      'Распознавание опирается на положение текста на странице: таблицы без ровных границ, объединённые ячейки и очень неровные столбцы могут быть разбиты неверно. Отсканированный PDF (изображение) не содержит извлекаемого текста и ничего не даст. Цвета, формулы и изображения не переносятся никогда: только текстовые значения.';

  @override
  String pdfToExcelTablesFound(int tables, int pages) {
    String _temp0 = intl.Intl.pluralLogic(
      tables,
      locale: localeName,
      other: 'найдено $tables таблицы',
      many: 'найдено $tables таблиц',
      few: 'найдены $tables таблицы',
      one: 'найдена $tables таблица',
    );
    String _temp1 = intl.Intl.pluralLogic(
      pages,
      locale: localeName,
      other: '$pages страницах',
      many: '$pages страницах',
      few: '$pages страницах',
      one: '$pages странице',
    );
    return '$_temp0 на $_temp1';
  }

  @override
  String pdfToExcelPagesConcerned(String pages) {
    return 'Затронутые страницы: $pages';
  }

  @override
  String pdfToExcelParagraphsOutside(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count абзаца вне таблиц',
      many: '$count абзацев вне таблиц',
      few: '$count абзаца вне таблиц',
      one: '$count абзац вне таблиц',
    );
    return '$_temp0';
  }

  @override
  String get pdfToExcelScannedWarning =>
      'Из этого PDF не удалось извлечь текст: почти наверняка это отсканированный документ (изображения страниц). Таблица из него ничего не получит; сначала воспользуйтесь инструментом распознавания текста (OCR).';

  @override
  String get pdfToExcelNoTableWarning =>
      'В этом документе не распознано ни одной табличной структуры. Текст есть, но он не расположен ровными столбцами. Вместо того чтобы получить нечитаемую книгу, включите выше «Включить и текст вне таблиц» или воспользуйтесь инструментом «PDF в Word», который лучше сохраняет абзацы.';

  @override
  String get pdfToExcelResultTitle => 'Книга готова';

  @override
  String get pdfToExcelExportWhat => 'Книга Excel';

  @override
  String get pdfToExcelConvertAction => 'Преобразовать в Excel';

  @override
  String resultNameAndSize(String name, String size) {
    return '$name — $size';
  }

  @override
  String get pdfToPptxEmptyTitle => 'По слайду на страницу';

  @override
  String get pdfToPptxEmptyBody =>
      'PDF становится точно такой же презентацией PowerPoint. Каждая страница попадает туда как изображение: вёрстка сохраняется, но текст в PowerPoint редактировать нельзя.';

  @override
  String pdfToPptxOpenFailed(String detail) {
    return 'Не удалось открыть этот PDF: $detail';
  }

  @override
  String get pdfToPptxConverting => 'Преобразование в PowerPoint…';

  @override
  String pdfToPptxPagesToSlides(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count страницы',
      many: '$count страниц',
      few: '$count страницы',
      one: '$count страница',
    );
    String _temp1 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count слайда',
      many: '$count слайдов',
      few: '$count слайда',
      one: '$count слайд',
    );
    return '$_temp0 > $_temp1';
  }

  @override
  String get pdfToPptxEmptyDocument => 'Пустой документ';

  @override
  String get qualityLabel => 'Качество';

  @override
  String get pdfToPptxQualityHint =>
      'Более высокое разрешение даёт более чёткие слайды, но заметно более тяжёлый файл.';

  @override
  String pdfToPptxHeavyWarning(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count страницы',
      many: '$count страниц',
      few: '$count страницы',
      one: '$count страницу',
    );
    return 'Внимание: при высоком качестве презентация на $_temp0 может весить несколько десятков МБ и долго открываться. Если сомневаетесь, выберите «Обычное».';
  }

  @override
  String get goodToKnow => 'Полезно знать';

  @override
  String get pdfToPptxCaveat =>
      'Каждый слайд — это изображение страницы: вёрстка совпадает с PDF, но текст в PowerPoint редактировать нельзя.\nЧтобы получить редактируемый текст, воспользуйтесь инструментом «PDF в Word».\nУ презентации только один размер слайда: он берётся с первой страницы, а страницы другого размера располагаются по центру внутри него.';

  @override
  String get pdfToPptxResultTitle => 'Презентация готова';

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
      other: '$count слайда',
      many: '$count слайдов',
      few: '$count слайда',
      one: '$count слайд',
    );
    return '$name — $_temp0 · $size · $quality';
  }

  @override
  String get notSavedYet =>
      'Файла ещё нет на вашем устройстве: сохраните его или поделитесь им.';

  @override
  String get pdfToPptxChangeQuality => 'Изменить качество';

  @override
  String get pdfToPptxConvertAction => 'Преобразовать в PowerPoint';

  @override
  String pdfToPptxExportWhat(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count слайда',
      many: '$count слайдов',
      few: '$count слайда',
      one: '$count слайд',
    );
    return 'Презентация PowerPoint · $_temp0';
  }

  @override
  String get formatLabel => 'Формат';

  @override
  String get actionExport => 'Выгрузить';

  @override
  String get imageQualityWeb => 'Веб (72 dpi)';

  @override
  String get imageQualityStandard => 'Обычное (150 dpi)';

  @override
  String get imageQualityHigh => 'Высокое качество (300 dpi)';

  @override
  String get pdfToImagesEmptyTitle => 'По изображению на страницу';

  @override
  String get pdfToImagesEmptyBody =>
      'Выберите PDF: каждая страница выйдет изображением, в том разрешении, которое вы зададите потом.';

  @override
  String pdfToImagesNotAPdf(String name) {
    return '$name: выберите файл PDF.';
  }

  @override
  String errorLoadFailed(String detail) {
    return 'Не удалось загрузить: $detail';
  }

  @override
  String get pdfToImagesProgress => 'Выгрузка…';

  @override
  String pdfToImagesExportWhat(int count, String format) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count изображения $format',
      many: '$count изображений $format',
      few: '$count изображения $format',
      one: '$count изображение $format',
    );
    return '$_temp0';
  }

  @override
  String get pdfaEmptyTitle => 'Архивировать надолго';

  @override
  String get pdfaEmptyBody =>
      'PDF/A — формат архивного хранения, которого требуют многие ведомства. Документ преобразуется без потери внешнего вида.';

  @override
  String get pdfaConformanceLevel => 'Уровень соответствия';

  @override
  String get pdfaA1bDetail =>
      'Самый строгий и наиболее повсеместно принимаемый уровень. Выбирайте его, если сомневаетесь.';

  @override
  String get pdfaA2bDetail =>
      'На основе PDF 1.7: более эффективное сжатие, файлы чуть легче.';

  @override
  String get pdfaA3bDetail =>
      'Как A-2b, но допускает вложения (часто требуется для электронных счетов).';

  @override
  String pdfaConvertingTo(String level) {
    return 'Преобразование в $level…';
  }

  @override
  String get pdfaCaveatTitle => 'Что меняет преобразование';

  @override
  String pdfaCaveat(int dpi) {
    return 'Каждая страница заново отрисовывается изображением с разрешением $dpi dpi: текст становится изображением, вёрстка фиксируется. Именно это делает файл действительно соответствующим стандарту, не завися от шрифтов исходного документа, но взамен текст больше нельзя выделить или найти, ссылки и формы исчезают, а файл становится тяжелее.';
  }

  @override
  String pdfaOpenFailed(String detail) {
    return 'Не удалось открыть этот PDF: $detail';
  }

  @override
  String get imagesToPdfEmptyTitle => 'Изображения в одном PDF';

  @override
  String get imagesToPdfEmptyBody =>
      'JPG, PNG, WebP, HEIC — добавьте свои изображения, и они будут собраны в выбранном вами порядке.';

  @override
  String get imagesToPdfChoose => 'Выбрать изображения';

  @override
  String get imagesToPdfAdd => 'Добавить изображения';

  @override
  String imagesToPdfRejected(String names) {
    return 'Пропущено (не изображение): $names';
  }

  @override
  String get imagesToPdfBuilding => 'Создание PDF…';

  @override
  String imagesToPdfBuildFailed(String detail) {
    return 'Не удалось создать: $detail';
  }

  @override
  String imagesToPdfCreateAction(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count изображения',
      many: '$count изображений',
      few: '$count изображения',
      one: '$count изображение',
    );
    return 'Создать PDF ($_temp0)';
  }

  @override
  String get actionRotate => 'Повернуть';

  @override
  String get actionRemove => 'Убрать';

  @override
  String get htmlTitle => 'HTML / веб-страница в PDF';

  @override
  String get htmlIntro =>
      'Превратите веб-страницу или код HTML в PDF формата A4. Отрисовкой занимается встроенный в Android браузер, поэтому вёрстка получается такой же, как при печати из Chrome.';

  @override
  String get htmlModeUrl => 'Веб-адрес';

  @override
  String get htmlModeCode => 'Код HTML';

  @override
  String get htmlUrlLabel => 'Адрес страницы';

  @override
  String get htmlUrlHint => 'https://primer.ru/statya';

  @override
  String get htmlCodeLabel => 'Код HTML';

  @override
  String get htmlCodeHint => '<h1>Заголовок</h1>\n<p>Текст…</p>';

  @override
  String get htmlUrlBadScheme =>
      'Адрес должен начинаться с http:// или https://.';

  @override
  String get htmlUrlIncomplete => 'Введите полный веб-адрес.';

  @override
  String get htmlCodeEmpty => 'Вставьте код HTML для преобразования.';

  @override
  String get htmlLoadingUrl => 'Загрузка страницы и преобразование…';

  @override
  String get htmlConverting => 'Преобразование HTML…';

  @override
  String get htmlNetworkNotice =>
      'Нужен доступ в интернет: это единственный инструмент приложения, которому приходится загружать страницу. Страницы, требующие входа в аккаунт, баннера о файлах cookie или большого объёма JavaScript, могут выйти неполными.';

  @override
  String get htmlOfflineNotice =>
      'HTML и CSS, записанные прямо в странице, отрисовываются без сети. А вот изображения, таблицы стилей и шрифты, запрашиваемые по внешнему веб-адресу, требуют доступа в интернет.';

  @override
  String get watermarkEmptyTitle => 'Поставить водяной знак';

  @override
  String get watermarkEmptyBody =>
      'Выбранный вами текст повторяется фоном на всех страницах — чтобы пометить документ как конфиденциальный или как черновик.';

  @override
  String get watermarkEmptyNote => 'Экспорт бесплатный и без ограничений.';

  @override
  String get watermarkTextLabel => 'Текст водяного знака';

  @override
  String get watermarkDefaultText => 'КОНФИДЕНЦИАЛЬНО';

  @override
  String get watermarkNeedText => 'Введите текст водяного знака.';

  @override
  String watermarkOpacity(int percent) {
    return 'Непрозрачность: $percent%';
  }

  @override
  String watermarkRotation(int degrees) {
    return 'Угол поворота: $degrees°';
  }

  @override
  String watermarkFontSize(int points) {
    return 'Размер текста: $points пт';
  }

  @override
  String get watermarkColor => 'Цвет';

  @override
  String get colorGrey => 'Серый';

  @override
  String get colorRed => 'Красный';

  @override
  String get colorBlue => 'Синий';

  @override
  String get colorBlack => 'Чёрный';

  @override
  String get watermarkProgress => 'Нанесение водяного знака…';

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
    return '$points пт';
  }

  @override
  String get pageNumbersEmptyTitle => 'Пронумеровать страницы';

  @override
  String get pageNumbersEmptyBody =>
      'Выберите PDF, затем положение и вид номеров, которые появятся на каждой странице.';

  @override
  String get positionLabel => 'Положение';

  @override
  String get positionBottomCenter => 'Внизу по центру';

  @override
  String get positionBottomRight => 'Внизу справа';

  @override
  String get positionTopCenter => 'Вверху по центру';

  @override
  String get positionTopRight => 'Вверху справа';

  @override
  String get pageNumbersFormatPlain => 'N';

  @override
  String get pageNumbersFormatOfTotal => 'N / всего';

  @override
  String get pageNumbersStart => 'Начальный номер';

  @override
  String get pageNumbersProgress => 'Нумерация…';

  @override
  String get organizeEmptyTitle => 'Взять PDF в свои руки';

  @override
  String get organizeEmptyBody =>
      'Откройте документ, чтобы разделить его, извлечь страницы или изменить их порядок.';

  @override
  String get organizeOpenFile => 'Открыть файл';

  @override
  String get organizeNothingToExport => 'Нет страниц для выгрузки.';

  @override
  String organizePagesKept(int kept, int total) {
    String _temp0 = intl.Intl.pluralLogic(
      kept,
      locale: localeName,
      other: 'сохранено $kept страницы',
      many: 'сохранено $kept страниц',
      few: 'сохранены $kept страницы',
      one: 'сохранена $kept страница',
    );
    return '$_temp0 из $total';
  }

  @override
  String get organizePageExcluded => 'Исключена';

  @override
  String organizePageMoved(int from) {
    return 'Перемещена с позиции $from';
  }

  @override
  String organizePageTitle(int number) {
    return 'Страница $number';
  }

  @override
  String organizeExcludePage(int number) {
    return 'Исключить страницу $number';
  }

  @override
  String organizeIncludePage(int number) {
    return 'Включить страницу $number';
  }

  @override
  String organizeMovePage(int number) {
    return 'Переместить страницу $number';
  }

  @override
  String get organizeExtract => 'Извлечь';

  @override
  String get organizeSplit => 'Разделить';

  @override
  String get organizePreview => 'Просмотр';

  @override
  String get organizeExtractTitle => 'Извлечь диапазон страниц';

  @override
  String organizeRangeLabel(int start, int end) {
    return 'Страницы с $start по $end';
  }

  @override
  String get organizeSplitTitle => 'Разделить на несколько файлов';

  @override
  String organizeFileCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count файла',
      many: '$count файлов',
      few: '$count файла',
      one: '$count файл',
    );
    return '$_temp0';
  }

  @override
  String organizeSplitFailed(String detail) {
    return 'Не удалось разделить: $detail';
  }

  @override
  String get scanNoCamera => 'На этом устройстве нет доступной камеры.';

  @override
  String scanCameraFailed(String detail) {
    return 'Не удалось запустить камеру: $detail';
  }

  @override
  String get scanCropToolbar => 'Подправить';

  @override
  String scanCaptureFailed(String detail) {
    return 'Не удалось сделать снимок: $detail';
  }

  @override
  String get scanPermissionBody =>
      'Для сканирования документа нужен доступ к камере.';

  @override
  String get scanGrantPermission => 'Разрешить камеру';

  @override
  String get actionRetry => 'Повторить';

  @override
  String get scanNoPageYet => 'Пока ни одной страницы.';

  @override
  String scanFinishAction(int count) {
    return 'Завершить · $count';
  }

  @override
  String get signTitle => 'Подписать PDF';

  @override
  String get signIntro =>
      'Поставьте нарисованную от руки подпись на страницу PDF. Это просто рисунок, добавленный к документу, а не квалифицированная электронная подпись.';

  @override
  String get signChooseSubtitle => 'Выберите документ для подписи';

  @override
  String get signPickPage => 'Выберите страницу для подписи.';

  @override
  String get signDrawTitle => 'Нарисовать мою подпись';

  @override
  String get signDrawBody =>
      'Рисуйте пальцем, как на бумаге. Это наносит рисунок на страницу — это не квалифицированная электронная подпись.';

  @override
  String get signNeedDrawing => 'Нарисуйте подпись, прежде чем продолжить.';

  @override
  String get signClear => 'Стереть';

  @override
  String get signValidate => 'Подтвердить';

  @override
  String get signPlaceBody =>
      'Перетащите подпись в нужное место на странице, затем нажмите «Завершить».';

  @override
  String get signPageUnavailable => 'Не удалось показать страницу.';

  @override
  String get signProgress => 'Добавление подписи…';

  @override
  String get editTitle => 'Сделать пометки в документе';

  @override
  String get editEmptyBody =>
      'Добавляйте текст или выделяйте фрагменты прямо в готовом PDF.';

  @override
  String get editAddTextTitle => 'Добавить текст';

  @override
  String get editTextHint => 'Ваш текст';

  @override
  String editFontSize(int size) {
    return 'Размер текста: $size';
  }

  @override
  String get editNeedAnnotation =>
      'Добавьте хотя бы одну пометку, прежде чем завершить.';

  @override
  String get editProgress => 'Применение пометок…';

  @override
  String get editChooseOther => 'Выбрать другой PDF';

  @override
  String get editUndoTooltip => 'Отменить последнюю пометку';

  @override
  String get editModeText => 'Текст';

  @override
  String get editModeHighlight => 'Выделить';

  @override
  String get editPageUnavailable => 'Не удалось показать эту страницу.';

  @override
  String get ocrEmptyTitle => 'Сделать текст доступным для поиска';

  @override
  String get ocrEmptyBody =>
      'Текст отсканированного PDF распознаётся и незаметно накладывается поверх изображения. Внешний вид страницы не меняется.';

  @override
  String get ocrWrongFormat => 'Выберите PDF или изображение (JPG, PNG…).';

  @override
  String get ocrProgress => 'Распознавание…';

  @override
  String ocrFailed(String detail) {
    return 'Не удалось распознать: $detail';
  }

  @override
  String get ocrRunAction => 'Запустить распознавание';

  @override
  String get ocrResultTitle => 'Результат OCR';

  @override
  String ocrResultBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Проанализировано $count страницы',
      many: 'Проанализировано $count страниц',
      few: 'Проанализированы $count страницы',
      one: 'Проанализирована $count страница',
    );
    return '$_temp0. PDF с поиском готов, и весь распознанный текст можно скопировать.';
  }

  @override
  String get ocrCopyText => 'Скопировать текст';

  @override
  String get ocrTextCopied => 'Текст скопирован.';

  @override
  String get redactIntro =>
      'Навсегда скройте участки PDF (имена, адреса, суммы). В отличие от простого чёрного прямоугольника сверху, скрытый текст действительно удаляется из файла, а не просто закрывается: его больше нельзя выделить или скопировать.';

  @override
  String get redactChooseSubtitle => 'Выберите документ для затемнения';

  @override
  String get redactCaveat =>
      'Полезно знать: чтобы удалить скрытый текст, каждая страница документа снова превращается в изображение (200 dpi). Поэтому результат — уже не PDF, в котором можно выделить текст, а полученный файл обычно тяжелее исходного.';

  @override
  String get redactEmptyPdf => 'В этом PDF нет ни одной страницы.';

  @override
  String redactOpenFailed(String detail) {
    return 'Не удалось открыть этот PDF (возможно, он защищён паролем): $detail';
  }

  @override
  String redactPageRenderFailed(int number, String detail) {
    return 'Не удалось показать страницу $number: $detail';
  }

  @override
  String get redactUndoTooltip => 'Отменить последнюю область';

  @override
  String get redactInstructions =>
      'Проведите пальцем по странице, чтобы очертить область для скрытия. Закрытый текст будет действительно удалён из файла, а не просто закрыт.';

  @override
  String get redactPagePrevious => 'Предыдущая страница';

  @override
  String get redactPageNext => 'Следующая страница';

  @override
  String redactPager(int current, int total) {
    return 'Страница $current / $total';
  }

  @override
  String get redactNoZone => 'Ни одной области не очерчено';

  @override
  String redactZoneCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count области для скрытия',
      many: '$count областей для скрытия',
      few: '$count области для скрытия',
      one: '$count область для скрытия',
    );
    return '$_temp0';
  }

  @override
  String get redactOtherPdf => 'Другой PDF';

  @override
  String get redactAction => 'Затемнить';

  @override
  String get redactProgress => 'Затемнение…';

  @override
  String get cropEmptyTitle => 'Обрезать поля';

  @override
  String get cropEmptyBody =>
      'Выберите PDF, затем проведите пальцем по образцу, чтобы очертить область, которую нужно сохранить.';

  @override
  String get cropTooSmall => 'Выбранная область слишком мала.';

  @override
  String get cropProgress => 'Обрезка…';

  @override
  String cropFailed(String detail) {
    return 'Не удалось обрезать: $detail';
  }

  @override
  String get cropKeptArea => 'Сохраняемая область';

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
  String get cropFullPage => 'Вся страница';

  @override
  String get cropAllPages => 'Применить ко всем страницам';

  @override
  String get cropAllPagesOn =>
      'Одна и та же область вырезается на каждой странице.';

  @override
  String get cropAllPagesOff =>
      'Обрезается только страница 1, остальные остаются целыми.';

  @override
  String get cropCaveat =>
      'Обрезка уменьшает размер страницы: содержимое за пределами области больше не показывается и не печатается.';

  @override
  String get cropAction => 'Обрезать';

  @override
  String get compareTitle => 'Сравнить два PDF';

  @override
  String get compareEmptyTitle => 'Что изменилось';

  @override
  String get compareEmptyBody =>
      'Выберите две версии одного и того же PDF. Добавленные и удалённые фрагменты будут показаны рядом, страница за страницей.';

  @override
  String get compareSlotA => 'Файл A';

  @override
  String get compareSlotB => 'Файл B';

  @override
  String get compareAction => 'Сравнить';

  @override
  String get compareProgress => 'Сравнение…';

  @override
  String compareFailed(String detail) {
    return 'Не удалось сравнить: $detail';
  }

  @override
  String compareChangedPages(int changed, int total) {
    String _temp0 = intl.Intl.pluralLogic(
      changed,
      locale: localeName,
      other: '$changed страницы отличаются',
      many: '$changed страниц отличаются',
      few: '$changed страницы отличаются',
      one: '$changed страница отличается',
    );
    return '$_temp0 из $total';
  }

  @override
  String get compareNoDifference =>
      'Различий между двумя файлами не обнаружено.';

  @override
  String comparePageHeading(int number) {
    return 'Страница $number';
  }

  @override
  String organizeFilesCreated(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Создано $count файла',
      many: 'Создано $count файлов',
      few: 'Созданы $count файла',
      one: 'Создан $count файл',
    );
    return '$_temp0';
  }

  @override
  String organizePartTitle(int number) {
    return 'Часть $number';
  }
}
