// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class LEs extends L {
  LEs([String locale = 'es']) : super(locale);

  @override
  String get appTitle => 'Trombone — PDF, Escáner y Word';

  @override
  String get appWordmark => 'Trombone';

  @override
  String get actionSave => 'Guardar';

  @override
  String get actionShare => 'Compartir';

  @override
  String get actionCompress => 'Comprimir';

  @override
  String get actionDone => 'Listo';

  @override
  String get actionCancel => 'Cancelar';

  @override
  String get actionChange => 'Cambiar';

  @override
  String get actionContinue => 'Continuar';

  @override
  String get actionOpening => 'Abriendo…';

  @override
  String get actionRemoveFile => 'Quitar este archivo';

  @override
  String get progressPreparing => 'Preparando…';

  @override
  String progressPercent(int percent) {
    return '$percent %';
  }

  @override
  String get emptyReassurance =>
      'Exportación gratuita, sin marca de agua ni límite.';

  @override
  String get emptyAcceptedFormats => 'Formatos aceptados';

  @override
  String get exportSavedTitle => 'Guardado.';

  @override
  String get exportSavedBody =>
      'Con el nombre y en la carpeta que acabas de elegir. Sin marca de agua, sin límite, nada que desbloquear.';

  @override
  String get exportSaveDialogTitle => 'Guardar el PDF';

  @override
  String pageTileIncluded(int number) {
    return 'Página $number, incluida. Toca para descartarla.';
  }

  @override
  String pageTileExcluded(int number) {
    return 'Página $number, descartada. Toca para incluirla.';
  }

  @override
  String pageTileRotate(int number) {
    return 'Girar la página $number';
  }

  @override
  String sectionHeaderSemantics(String title, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count herramientas',
      one: '$count herramienta',
    );
    return '$title, $_temp0';
  }

  @override
  String toolCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count herramientas',
      one: '$count herramienta',
    );
    return '$_temp0';
  }

  @override
  String get homePromise =>
      'Crea tu documento y expórtalo.\nSin muros de pago al final.';

  @override
  String get homeChipNoAccount => 'Sin cuenta';

  @override
  String get homeChipNoWatermark => 'Sin marca de agua';

  @override
  String get homeChipUnlimited => 'Exportación ilimitada';

  @override
  String get homeSearchTooltip => 'Buscar una herramienta';

  @override
  String get homeColophon =>
      'Nada se desbloquea pagando al guardar. La exportación es gratuita, sin marcas de agua y sin límites.';

  @override
  String get sectionFeatured => 'Destacado';

  @override
  String get sectionToPdf => 'A PDF';

  @override
  String get sectionFromPdf => 'Desde el PDF';

  @override
  String get sectionSecurity => 'Seguridad';

  @override
  String get sectionEdit => 'Editar';

  @override
  String get toolMerge => 'Combinar';

  @override
  String get toolMergeKeywords =>
      'unir juntar fusionar agrupar concatenar anadir';

  @override
  String get toolMergeSubtitle =>
      'PDF, Word, imágenes y texto en un solo documento';

  @override
  String get toolRectoVerso => 'Doble cara';

  @override
  String get toolRectoVersoKeywords =>
      'duplex intercalar escaneo par impar dos caras';

  @override
  String get toolRectoVersoSubtitle => 'Dos escaneos, de nuevo en orden';

  @override
  String get toolImagesToPdf => 'Imágenes a PDF';

  @override
  String get toolImagesToPdfKeywords =>
      'foto jpg jpeg png fotos album camara imagen';

  @override
  String get toolImagesToPdfSubtitle => 'Fotos y capturas en un documento';

  @override
  String get toolPdfToWord => 'PDF a Word';

  @override
  String get toolPdfToWordKeywords =>
      'docx procesador de textos editable convertir doc';

  @override
  String get toolPdfToWordSubtitle => 'Texto y tablas, editables';

  @override
  String get toolOrganize => 'Organizar un PDF';

  @override
  String get toolOrganizeKeywords =>
      'dividir separar extraer reordenar orden paginas eliminar';

  @override
  String get toolOrganizeSubtitle => 'Dividir, extraer, reordenar';

  @override
  String get toolExcelToPdf => 'Excel a PDF';

  @override
  String get toolExcelToPdfKeywords => 'hoja de calculo xlsx libro hoja tabla';

  @override
  String get toolPptxToPdf => 'PowerPoint a PDF';

  @override
  String get toolPptxToPdfKeywords => 'pptx diapositiva presentacion slides';

  @override
  String get toolHtmlToPdf => 'Página web a PDF';

  @override
  String get toolHtmlToPdfKeywords => 'html sitio internet url enlace articulo';

  @override
  String get toolScan => 'Escanear un documento';

  @override
  String get toolScanKeywords => 'camara foto digitalizar escaner papel';

  @override
  String get toolPdfToExcel => 'PDF a Excel';

  @override
  String get toolPdfToExcelKeywords =>
      'hoja de calculo xlsx tabla extraer datos';

  @override
  String get toolPdfToPptx => 'PDF a PowerPoint';

  @override
  String get toolPdfToPptxKeywords => 'pptx diapositiva presentacion slides';

  @override
  String get toolPdfToImages => 'PDF a imágenes';

  @override
  String get toolPdfToImagesKeywords => 'jpg png foto exportar captura imagen';

  @override
  String get toolOcr => 'Texto seleccionable (OCR)';

  @override
  String get toolOcrKeywords =>
      'reconocimiento caracteres escaneado copiar seleccionar';

  @override
  String get toolPdfA => 'Convertir a PDF/A';

  @override
  String get toolPdfAKeywords => 'archivo norma largo plazo conservacion iso';

  @override
  String get toolProtect => 'Proteger PDF';

  @override
  String get toolProtectKeywords =>
      'contrasena candado cifrar bloquear asegurar clave';

  @override
  String get toolUnlock => 'Desbloquear PDF';

  @override
  String get toolUnlockKeywords =>
      'quitar contrasena abrir descifrar desproteger candado';

  @override
  String get toolRepair => 'Reparar PDF';

  @override
  String get toolRepairKeywords =>
      'corrupto ilegible danado recuperar roto error';

  @override
  String get toolRedact => 'Censurar un PDF';

  @override
  String get toolRedactKeywords =>
      'ocultar tachar anonimizar confidencial borrar censurar';

  @override
  String get toolEdit => 'Editar PDF';

  @override
  String get toolEditKeywords => 'texto modificar corregir anotar escribir';

  @override
  String get toolSign => 'Firmar';

  @override
  String get toolSignKeywords => 'firma rubrica contrato mano';

  @override
  String get toolWatermark => 'Marca de agua';

  @override
  String get toolWatermarkKeywords =>
      'watermark sello confidencial borrador marca';

  @override
  String get toolPageNumbers => 'Números de página';

  @override
  String get toolPageNumbersKeywords =>
      'paginacion folio numerar cifras numeros';

  @override
  String get toolCrop => 'Recortar un PDF';

  @override
  String get toolCropKeywords => 'cortar margenes recortar bordes tamano';

  @override
  String get toolCompare => 'Comparar PDF';

  @override
  String get toolCompareKeywords =>
      'diferencia versiones diff cambios comparar';

  @override
  String get searchHint => 'Combinar, contraseña, marca de agua…';

  @override
  String get searchClear => 'Borrar';

  @override
  String searchNoResultTitle(String query) {
    return 'Ninguna herramienta para «$query».';
  }

  @override
  String get searchNoResultBody =>
      'Prueba con el formato que tengas a mano — «Word», «Excel», «foto» — o con lo que quieras hacer: «firmar», «dividir», «contraseña».';

  @override
  String get actionUndo => 'Deshacer';

  @override
  String get actionApply => 'Aplicar';

  @override
  String get actionChoose => 'Elegir';

  @override
  String get actionChoosePdf => 'Elegir un PDF';

  @override
  String get actionChooseFiles => 'Elegir archivos';

  @override
  String get actionConvert => 'Convertir';

  @override
  String get actionFinish => 'Finalizar';

  @override
  String get actionBack => 'Atrás';

  @override
  String get actionAdd => 'Añadir';

  @override
  String get noFileChosen => 'Ningún archivo elegido';

  @override
  String errorExportFailed(String detail) {
    return 'Error al exportar: $detail';
  }

  @override
  String errorShareFailed(String detail) {
    return 'Error al compartir: $detail';
  }

  @override
  String errorOpenFailed(String detail) {
    return 'No se pudo abrir el archivo: $detail';
  }

  @override
  String errorConversionFailed(String detail) {
    return 'Error en la conversión: $detail';
  }

  @override
  String errorOnFile(String name, String detail) {
    return '$name: $detail';
  }

  @override
  String get errorPickPdf => 'Elige un archivo PDF.';

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
      other: '$count páginas',
      one: '$count página',
    );
    return '$_temp0';
  }

  @override
  String pageCountOfTotal(int kept, int total) {
    String _temp0 = intl.Intl.pluralLogic(
      kept,
      locale: localeName,
      other: '$kept páginas',
      one: '$kept página',
    );
    return '$_temp0 de $total';
  }

  @override
  String pageOfTotal(int current, int total) {
    return 'Página $current de $total';
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
  String get formatImages => 'Imágenes';

  @override
  String get formatText => 'Texto';

  @override
  String get mergeAddFile => 'Añadir un archivo';

  @override
  String get mergeAddHint => 'PDF, Word, imágenes o texto';

  @override
  String get mergeEmptyTitle => 'Un solo documento';

  @override
  String get mergeEmptyBody =>
      'Añade PDF, archivos de Word, imágenes o texto. Podrás reordenarlos y descartar páginas antes de exportar.';

  @override
  String get mergeNeedOnePage =>
      'Añade al menos un archivo con una página que incluir.';

  @override
  String get mergeProgress => 'Combinando…';

  @override
  String mergeFailed(String detail) {
    return 'Error al combinar: $detail';
  }

  @override
  String mergeRemoved(String name) {
    return '$name retirado.';
  }

  @override
  String mergeRemoveTooltip(String name) {
    return 'Quitar $name';
  }

  @override
  String mergeMoveSemantics(String name) {
    return 'Mover $name';
  }

  @override
  String get mergeRotateAll => 'Girar todas las páginas';

  @override
  String mergePreviewAndExport(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count páginas',
      one: '$count página',
    );
    return 'Vista previa y exportar ($_temp0)';
  }

  @override
  String previewTitle(String size) {
    return 'Vista previa · $size';
  }

  @override
  String previewZoomPage(int number) {
    return 'Página $number, ampliar';
  }

  @override
  String get previewPageUnreadable => 'Página ilegible.';

  @override
  String previewExportWhat(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count páginas',
      one: '$count página',
    );
    return 'PDF · $_temp0';
  }

  @override
  String get compressTitle => 'Compresión';

  @override
  String compressBody(String size) {
    return 'Tamaño actual: $size. Elige un nivel: el tamaño estimado aparece antes de aplicar.';
  }

  @override
  String get compressEstimating => 'Estimando…';

  @override
  String get compressProgress => 'Comprimiendo…';

  @override
  String compressFailed(String detail) {
    return 'Error al comprimir: $detail';
  }

  @override
  String get protectEmptyTitle => 'Poner una contraseña';

  @override
  String get protectEmptyBody =>
      'El PDF ya no se abrirá sin la contraseña que elijas. Guárdala: no se puede recuperar.';

  @override
  String get protectSubtitle => 'Se cifrará con AES de 256 bits';

  @override
  String get protectPassword => 'Contraseña';

  @override
  String get protectConfirmPassword => 'Confirmar la contraseña';

  @override
  String get protectShowPasswords => 'Mostrar las contraseñas';

  @override
  String get protectHidePasswords => 'Ocultar las contraseñas';

  @override
  String get protectMismatch => 'Las dos contraseñas no coinciden.';

  @override
  String get protectWarning =>
      'Anótala en algún sitio: sin ella el documento queda ilegible para siempre. No hay recuperación posible, ni por tu parte ni por parte de la aplicación.';

  @override
  String get protectAlreadyProtected =>
      'Este archivo ya está protegido: usa antes Desbloquear PDF.';

  @override
  String get protectProgress => 'Protegiendo…';

  @override
  String protectFailed(String detail) {
    return 'Error al proteger: $detail';
  }

  @override
  String get protectAction => 'Proteger';

  @override
  String get protectResultTitle => 'PDF protegido';

  @override
  String get protectResultDetail =>
      'Cifrado con AES de 256 bits. Hará falta la contraseña para abrirlo.';

  @override
  String get protectExportWhat => 'PDF protegido con contraseña';

  @override
  String get unlockEmptyTitle => 'Quitar la contraseña';

  @override
  String get unlockEmptyBody =>
      'Necesitas la contraseña actual del documento. Una vez quitada, el PDF se abrirá libremente.';

  @override
  String get unlockAcceptsProtectedPdf => 'PDF protegido';

  @override
  String get unlockChooseProtectedPdf => 'Elegir un PDF protegido';

  @override
  String get unlockCurrentPassword => 'Contraseña actual';

  @override
  String get unlockWrongPassword => 'Contraseña incorrecta.';

  @override
  String get unlockProgress => 'Desbloqueando…';

  @override
  String unlockFailed(String detail) {
    return 'Error al desbloquear: $detail';
  }

  @override
  String get unlockAction => 'Desbloquear';

  @override
  String get repairEmptyTitle => 'Reparar un archivo dañado';

  @override
  String get repairEmptyBody =>
      'Se reconstruye la estructura interna de un PDF dañado. Lo que se pueda recuperar, se recuperará.';

  @override
  String get repairProgress => 'Reparando…';

  @override
  String get repairFailed =>
      'No se puede reparar este archivo: puede estar demasiado dañado.';

  @override
  String get repairAction => 'Reparar';

  @override
  String get pdfToWordEmptyTitle => 'Un Word editable';

  @override
  String get pdfToWordEmptyBody =>
      'El texto y la estructura del PDF se trasladan a un documento .docx que podrás volver a abrir y editar.';

  @override
  String get pdfToWordAnalyzing => 'Analizando el documento…';

  @override
  String get pdfToWordAnalysisPending => 'Análisis pendiente';

  @override
  String pdfToWordAnalysisFailed(String detail) {
    return 'Error en el análisis: $detail';
  }

  @override
  String get pdfLocked =>
      'Este PDF está protegido con contraseña. Desbloquéalo primero.';

  @override
  String get pdfToWordConverting => 'Convirtiendo a Word…';

  @override
  String get pdfToWordSummaryTitle => 'Contenido detectado';

  @override
  String pdfToWordParagraphCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count párrafos',
      one: '$count párrafo',
    );
    return '$_temp0';
  }

  @override
  String pdfToWordHeadingCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count títulos',
      one: '$count título',
    );
    return '$_temp0';
  }

  @override
  String pdfToWordTableCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count tablas',
      one: '$count tabla',
    );
    return '$_temp0';
  }

  @override
  String get pdfToWordNoTables =>
      'No se ha detectado ninguna tabla: si tu PDF contiene alguna, sus filas se convertirán en párrafos.';

  @override
  String get pdfToWordCaveat =>
      'La conversión reproduce el texto, el formato y las tablas, pero no la maquetación exacta: la posición de las imágenes y de las columnas no se conserva, y las imágenes no se trasladan al documento de Word.';

  @override
  String get pdfToWordScanWarning =>
      'Este PDF parece un escaneo: no se ha encontrado texto. Usa antes la herramienta Texto buscable (OCR) y vuelve luego a convertir el PDF obtenido.';

  @override
  String get pdfToWordResultTitle => 'Documento de Word listo';

  @override
  String pdfToWordResultDetail(String name, String size) {
    return '$name — $size';
  }

  @override
  String get pdfToWordExportWhat => 'Documento de Word';

  @override
  String get pdfToWordConvertAction => 'Convertir a Word';

  @override
  String get actionConvertAgain => 'Convertir de nuevo';

  @override
  String errorSaveFailed(String detail) {
    return 'No se pudo guardar: $detail';
  }

  @override
  String get rectoVersoIntro =>
      'Un alimentador de una sola cara da dos archivos: las páginas impares en orden y las pares a menudo en orden inverso. Elige los dos para recomponerlos.';

  @override
  String get rectoVersoOddSlot => 'Archivo de las páginas impares (anverso)';

  @override
  String get rectoVersoEvenSlot => 'Archivo de las páginas pares (reverso)';

  @override
  String get rectoVersoReversed => 'El segundo archivo está en orden inverso';

  @override
  String get rectoVersoReversedHint =>
      'Es el caso más habitual, marcado por defecto';

  @override
  String rectoVersoPreview(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count páginas',
      one: '$count página',
    );
    return 'Vista previa del intercalado ($_temp0)';
  }

  @override
  String get rectoVersoProgress => 'Intercalando…';

  @override
  String fileWithPageCount(String name, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count páginas',
      one: '$count página',
    );
    return '$name · $_temp0';
  }

  @override
  String get actionPreviewAndExport => 'Vista previa y exportar';

  @override
  String errorOpenFailedShort(String detail) {
    return 'No se pudo abrir: $detail';
  }

  @override
  String errorGeneric(String detail) {
    return 'Error: $detail';
  }

  @override
  String get actionConvertToPdf => 'Convertir a PDF';

  @override
  String get convertProgress => 'Convirtiendo…';

  @override
  String get excelEmptyTitle => 'Un libro en PDF';

  @override
  String get excelEmptyBody =>
      'Las hojas de un archivo .xlsx se convierten en páginas PDF, listas para enviar o imprimir.';

  @override
  String get excelChooseWorkbook => 'Elegir un libro';

  @override
  String get excelChooseXlsx => 'Elegir un libro .xlsx';

  @override
  String get excelLegacyFormat =>
      'El formato .xls (el antiguo formato binario de Excel) no está admitido. Guarda el archivo como .xlsx y vuelve a intentarlo.';

  @override
  String get excelWrongFormat => 'Elige un libro de Excel .xlsx.';

  @override
  String excelUnreadable(String detail) {
    return 'Libro ilegible: $detail';
  }

  @override
  String excelSheetsAndRows(int sheets, int rows) {
    String _temp0 = intl.Intl.pluralLogic(
      sheets,
      locale: localeName,
      other: '$sheets hojas',
      one: '$sheets hoja',
    );
    String _temp1 = intl.Intl.pluralLogic(
      rows,
      locale: localeName,
      other: '$rows filas en total',
      one: '$rows fila en total',
    );
    return '$_temp0 · $_temp1';
  }

  @override
  String get excelSheetsDetected => 'Hojas detectadas';

  @override
  String get excelEmptySheet => 'Hoja vacía';

  @override
  String excelSheetDimensions(int rows, int columns) {
    String _temp0 = intl.Intl.pluralLogic(
      rows,
      locale: localeName,
      other: '$rows filas',
      one: '$rows fila',
    );
    String _temp1 = intl.Intl.pluralLogic(
      columns,
      locale: localeName,
      other: '$columns columnas',
      one: '$columns columna',
    );
    return '$_temp0 × $_temp1';
  }

  @override
  String get excelRepeatHeader =>
      'Repetir la fila de encabezado en cada página';

  @override
  String get excelRepeatHeaderHint =>
      'La primera fila de la hoja se vuelve a dibujar arriba en cada página de la tabla.';

  @override
  String get excelCaveat =>
      'Lo que la conversión conserva: el texto de las celdas tal como está guardado en el archivo (incluido el último resultado calculado de las fórmulas), la primera fila en negrita y una cuadrícula.\n\nLo que no conserva: colores, fuentes, formatos de número, celdas combinadas, imágenes, gráficos y las fórmulas mismas. Las columnas se reducen para caber en el ancho de la página; en hojas muy anchas, el texto de las celdas demasiado estrechas se corta con «…».';

  @override
  String get pptxEmptyTitle => 'Una presentación en PDF';

  @override
  String get pptxEmptyBody =>
      'Una página apaisada 16:9 por diapositiva, con el título y las viñetas. El texto se conserva; las imágenes, formas y fondos originales no.\n\nFormato aceptado: .pptx. Un archivo antiguo .ppt debe volver a guardarse antes como .pptx desde PowerPoint.';

  @override
  String get pptxChoosePresentation => 'Elegir una presentación';

  @override
  String get pptxTextOnlyTitle => 'Conversión solo del texto';

  @override
  String get pptxTextOnlyBody =>
      'Se conserva el texto de cada diapositiva. Las imágenes, formas, fondos, colores y maquetaciones originales no se conservan: el PDF obtenido es una maquetación sencilla y legible, no una copia fiel de tu presentación.';

  @override
  String pptxSlideCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count diapositivas',
      one: '$count diapositiva',
    );
    return '$_temp0';
  }

  @override
  String get pptxSlidesDetected => 'Diapositivas detectadas';

  @override
  String pptxMoreSlides(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count diapositivas más',
      one: '$count diapositiva más',
    );
    return 'y $_temp0…';
  }

  @override
  String get pptxUntitledSlide => 'Sin título';

  @override
  String get pptxEmptySlide => 'Sin texto (solo imagen o forma)';

  @override
  String pptxTextLineCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count líneas de texto',
      one: '$count línea de texto',
    );
    return '$_temp0';
  }

  @override
  String pptxReadFailed(String detail) {
    return 'No se pudo leer: $detail';
  }

  @override
  String get compressLevelLight => 'Ligera';

  @override
  String get compressLevelMedium => 'Media';

  @override
  String get compressLevelStrong => 'Fuerte';

  @override
  String get pptxQualityStandard => 'Estándar (150 dpi)';

  @override
  String get pptxQualityHigh => 'Alta (220 dpi)';

  @override
  String get pdfToExcelEmptyTitle => 'Recuperar las tablas';

  @override
  String get pdfToExcelEmptyBody =>
      'Las tablas de un PDF se extraen a un libro de Excel. El formato no se conserva; los valores sí.';

  @override
  String pdfToExcelPagesAnalyzed(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count páginas analizadas',
      one: '$count página analizada',
    );
    return '$_temp0';
  }

  @override
  String pdfToExcelAnalysisFailed(String detail) {
    return 'Análisis imposible. El PDF puede estar protegido con contraseña o dañado. ($detail)';
  }

  @override
  String get pdfToExcelNothingToExport =>
      'Nada que exportar: no se ha detectado ninguna tabla.';

  @override
  String get pdfToExcelBuilding => 'Creando el libro…';

  @override
  String get pdfToExcelIncludeParagraphs =>
      'Incluir también el texto fuera de las tablas (una fila por párrafo)';

  @override
  String get pdfToExcelIncludeParagraphsHint =>
      'Útil para un documento semiestructurado: el texto va a la columna A, después de las tablas de la página.';

  @override
  String get pdfToExcelCaveatTitle => 'Lo que la conversión no conserva';

  @override
  String get pdfToExcelCaveat =>
      'La detección se basa en la posición del texto en la página: las tablas sin bordes regulares, las celdas combinadas y las columnas muy irregulares pueden quedar mal divididas. Un PDF escaneado (una imagen) no contiene texto extraíble y no dará nada. Los colores, las fórmulas y las imágenes nunca se conservan: solo los valores de texto.';

  @override
  String pdfToExcelTablesFound(int tables, int pages) {
    String _temp0 = intl.Intl.pluralLogic(
      tables,
      locale: localeName,
      other: '$tables tablas detectadas',
      one: '$tables tabla detectada',
    );
    String _temp1 = intl.Intl.pluralLogic(
      pages,
      locale: localeName,
      other: '$pages páginas',
      one: '$pages página',
    );
    return '$_temp0 en $_temp1';
  }

  @override
  String pdfToExcelPagesConcerned(String pages) {
    return 'Páginas afectadas: $pages';
  }

  @override
  String pdfToExcelParagraphsOutside(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count párrafos fuera de las tablas',
      one: '$count párrafo fuera de las tablas',
    );
    return '$_temp0';
  }

  @override
  String get pdfToExcelScannedWarning =>
      'No se ha podido extraer texto de este PDF: casi con seguridad es un documento escaneado (imágenes de páginas). Una hoja de cálculo no puede sacar nada de él; usa antes la herramienta de reconocimiento de texto (OCR).';

  @override
  String get pdfToExcelNoTableWarning =>
      'No se ha reconocido ninguna estructura de tabla en este documento. El texto está ahí, pero no está dispuesto en columnas regulares. En vez de producir un libro ilegible, activa arriba «Incluir también el texto fuera de las tablas», o usa «PDF a Word», que conserva mejor los párrafos.';

  @override
  String get pdfToExcelResultTitle => 'Libro listo';

  @override
  String get pdfToExcelExportWhat => 'Libro de Excel';

  @override
  String get pdfToExcelConvertAction => 'Convertir a Excel';

  @override
  String resultNameAndSize(String name, String size) {
    return '$name — $size';
  }

  @override
  String get pdfToPptxEmptyTitle => 'Una diapositiva por página';

  @override
  String get pdfToPptxEmptyBody =>
      'El PDF se convierte en una presentación de PowerPoint idéntica. Cada página llega como imagen: la maquetación es fiel, pero el texto no se podrá editar en PowerPoint.';

  @override
  String pdfToPptxOpenFailed(String detail) {
    return 'No se pudo abrir este PDF: $detail';
  }

  @override
  String get pdfToPptxConverting => 'Convirtiendo a PowerPoint…';

  @override
  String pdfToPptxPagesToSlides(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count páginas',
      one: '$count página',
    );
    String _temp1 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count diapositivas',
      one: '$count diapositiva',
    );
    return '$_temp0 > $_temp1';
  }

  @override
  String get pdfToPptxEmptyDocument => 'Documento vacío';

  @override
  String get qualityLabel => 'Calidad';

  @override
  String get pdfToPptxQualityHint =>
      'Una resolución más alta da diapositivas más nítidas pero un archivo bastante más pesado.';

  @override
  String pdfToPptxHeavyWarning(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count páginas',
      one: '$count página',
    );
    return 'Atención: en alta calidad, una presentación de $_temp0 puede pesar varias decenas de MB y tardar en abrirse. Elige Estándar si tienes dudas.';
  }

  @override
  String get goodToKnow => 'Conviene saberlo';

  @override
  String get pdfToPptxCaveat =>
      'Cada diapositiva es una imagen de la página: la maquetación es idéntica al PDF, pero el texto no se podrá editar en PowerPoint.\nPara recuperar texto editable, usa mejor «PDF a Word».\nUna presentación solo tiene un tamaño de diapositiva: se toma de la primera página, y las páginas de otro tamaño se centran dentro.';

  @override
  String get pdfToPptxResultTitle => 'Presentación lista';

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
      other: '$count diapositivas',
      one: '$count diapositiva',
    );
    return '$name — $_temp0 · $size · $quality';
  }

  @override
  String get notSavedYet =>
      'El archivo aún no está en tu dispositivo: guárdalo o compártelo.';

  @override
  String get pdfToPptxChangeQuality => 'Cambiar la calidad';

  @override
  String get pdfToPptxConvertAction => 'Convertir a PowerPoint';

  @override
  String pdfToPptxExportWhat(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count diapositivas',
      one: '$count diapositiva',
    );
    return 'Presentación de PowerPoint · $_temp0';
  }

  @override
  String get formatLabel => 'Formato';

  @override
  String get actionExport => 'Exportar';

  @override
  String get imageQualityWeb => 'Web (72 dpi)';

  @override
  String get imageQualityStandard => 'Estándar (150 dpi)';

  @override
  String get imageQualityHigh => 'Alta calidad (300 dpi)';

  @override
  String get pdfToImagesEmptyTitle => 'Una imagen por página';

  @override
  String get pdfToImagesEmptyBody =>
      'Elige un PDF: cada página saldrá como imagen, con la resolución que ajustes después.';

  @override
  String pdfToImagesNotAPdf(String name) {
    return '$name: elige un archivo PDF.';
  }

  @override
  String errorLoadFailed(String detail) {
    return 'Error al cargar: $detail';
  }

  @override
  String get pdfToImagesProgress => 'Exportando…';

  @override
  String pdfToImagesExportWhat(int count, String format) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count imágenes $format',
      one: '$count imagen $format',
    );
    return '$_temp0';
  }

  @override
  String get pdfaEmptyTitle => 'Archivar a largo plazo';

  @override
  String get pdfaEmptyBody =>
      'PDF/A es el formato de archivo que exigen muchas administraciones. El documento se convierte sin perder su apariencia.';

  @override
  String get pdfaConformanceLevel => 'Nivel de conformidad';

  @override
  String get pdfaA1bDetail =>
      'El nivel más estricto y el más aceptado en todas partes. Elígelo si tienes dudas.';

  @override
  String get pdfaA2bDetail =>
      'Basado en PDF 1.7: compresión más eficaz, archivos algo más ligeros.';

  @override
  String get pdfaA3bDetail =>
      'Como el A-2b, pero admite archivos adjuntos (se pide a menudo para la facturación electrónica).';

  @override
  String pdfaConvertingTo(String level) {
    return 'Convirtiendo a $level…';
  }

  @override
  String get pdfaCaveatTitle => 'Lo que cambia la conversión';

  @override
  String pdfaCaveat(int dpi) {
    return 'Cada página se vuelve a dibujar como imagen a $dpi dpi: el texto pasa a ser una imagen y la maquetación queda fija. Eso es lo que hace el archivo realmente conforme sin depender de las fuentes del documento original, pero a cambio el texto ya no se puede seleccionar ni buscar, los enlaces y los formularios desaparecen, y el archivo se vuelve más pesado.';
  }

  @override
  String pdfaOpenFailed(String detail) {
    return 'No se pudo abrir este PDF: $detail';
  }

  @override
  String get imagesToPdfEmptyTitle => 'Imágenes en un PDF';

  @override
  String get imagesToPdfEmptyBody =>
      'JPG, PNG, WebP, HEIC: añade tus imágenes y se montarán en el orden que elijas.';

  @override
  String get imagesToPdfChoose => 'Elegir imágenes';

  @override
  String get imagesToPdfAdd => 'Añadir imágenes';

  @override
  String imagesToPdfRejected(String names) {
    return 'Omitido (no es una imagen): $names';
  }

  @override
  String get imagesToPdfBuilding => 'Creando el PDF…';

  @override
  String imagesToPdfBuildFailed(String detail) {
    return 'Error al crearlo: $detail';
  }

  @override
  String imagesToPdfCreateAction(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count imágenes',
      one: '$count imagen',
    );
    return 'Crear el PDF ($_temp0)';
  }

  @override
  String get actionRotate => 'Girar';

  @override
  String get actionRemove => 'Quitar';

  @override
  String get htmlTitle => 'HTML / página web a PDF';

  @override
  String get htmlIntro =>
      'Convierte una página web o código HTML en un PDF A4. El renderizado lo hace el navegador integrado en Android, así que la maquetación es la de una impresión desde Chrome.';

  @override
  String get htmlModeUrl => 'Dirección web';

  @override
  String get htmlModeCode => 'Código HTML';

  @override
  String get htmlUrlLabel => 'Dirección de la página';

  @override
  String get htmlUrlHint => 'https://ejemplo.es/articulo';

  @override
  String get htmlCodeLabel => 'Código HTML';

  @override
  String get htmlCodeHint => '<h1>Título</h1>\n<p>Texto…</p>';

  @override
  String get htmlUrlBadScheme =>
      'La dirección debe empezar por http:// o https://.';

  @override
  String get htmlUrlIncomplete => 'Escribe una dirección web completa.';

  @override
  String get htmlCodeEmpty => 'Pega código HTML para convertir.';

  @override
  String get htmlLoadingUrl => 'Cargando la página y convirtiendo…';

  @override
  String get htmlConverting => 'Convirtiendo el HTML…';

  @override
  String get htmlNetworkNotice =>
      'Hace falta conexión a internet: es la única herramienta de la aplicación que debe descargar la página. Las páginas que exigen iniciar sesión, un aviso de cookies o mucho JavaScript pueden salir incompletas.';

  @override
  String get htmlOfflineNotice =>
      'El HTML y el CSS escritos directamente en la página se renderizan sin conexión. En cambio, las imágenes, hojas de estilo o fuentes que se piden a una dirección web externa necesitan conexión a internet.';

  @override
  String get watermarkEmptyTitle => 'Poner una marca de agua';

  @override
  String get watermarkEmptyBody =>
      'Un texto que tú elijas se repite de fondo en todas las páginas, para marcar un documento como confidencial o como borrador.';

  @override
  String get watermarkEmptyNote => 'Exportación gratuita y sin límites.';

  @override
  String get watermarkTextLabel => 'Texto de la marca de agua';

  @override
  String get watermarkDefaultText => 'CONFIDENCIAL';

  @override
  String get watermarkNeedText => 'Escribe un texto para la marca de agua.';

  @override
  String watermarkOpacity(int percent) {
    return 'Opacidad: $percent %';
  }

  @override
  String watermarkRotation(int degrees) {
    return 'Ángulo de rotación: $degrees°';
  }

  @override
  String watermarkFontSize(int points) {
    return 'Tamaño del texto: $points pt';
  }

  @override
  String get watermarkColor => 'Color';

  @override
  String get colorGrey => 'Gris';

  @override
  String get colorRed => 'Rojo';

  @override
  String get colorBlue => 'Azul';

  @override
  String get colorBlack => 'Negro';

  @override
  String get watermarkProgress => 'Aplicando la marca de agua…';

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
  String get pageNumbersEmptyTitle => 'Numerar las páginas';

  @override
  String get pageNumbersEmptyBody =>
      'Elige un PDF y luego la posición y el formato de los números que se añadirán a cada página.';

  @override
  String get positionLabel => 'Posición';

  @override
  String get positionBottomCenter => 'Abajo centro';

  @override
  String get positionBottomRight => 'Abajo derecha';

  @override
  String get positionTopCenter => 'Arriba centro';

  @override
  String get positionTopRight => 'Arriba derecha';

  @override
  String get pageNumbersFormatPlain => 'N';

  @override
  String get pageNumbersFormatOfTotal => 'N / total';

  @override
  String get pageNumbersStart => 'Número inicial';

  @override
  String get pageNumbersProgress => 'Numerando…';

  @override
  String get organizeEmptyTitle => 'Reorganizar un PDF';

  @override
  String get organizeEmptyBody =>
      'Abre un documento para dividirlo, extraer páginas o cambiar su orden.';

  @override
  String get organizeOpenFile => 'Abrir un archivo';

  @override
  String get organizeNothingToExport => 'Ninguna página que exportar.';

  @override
  String organizePagesKept(int kept, int total) {
    String _temp0 = intl.Intl.pluralLogic(
      kept,
      locale: localeName,
      other: '$kept páginas conservadas',
      one: '$kept página conservada',
    );
    return '$_temp0 de $total';
  }

  @override
  String get organizePageExcluded => 'Descartada';

  @override
  String organizePageMoved(int from) {
    return 'Movida desde la posición $from';
  }

  @override
  String organizePageTitle(int number) {
    return 'Página $number';
  }

  @override
  String organizeExcludePage(int number) {
    return 'Descartar la página $number';
  }

  @override
  String organizeIncludePage(int number) {
    return 'Incluir la página $number';
  }

  @override
  String organizeMovePage(int number) {
    return 'Mover la página $number';
  }

  @override
  String get organizeExtract => 'Extraer';

  @override
  String get organizeSplit => 'Dividir';

  @override
  String get organizePreview => 'Vista previa';

  @override
  String get organizeExtractTitle => 'Extraer un intervalo de páginas';

  @override
  String organizeRangeLabel(int start, int end) {
    return 'Páginas $start a $end';
  }

  @override
  String get organizeSplitTitle => 'Dividir en varios archivos';

  @override
  String organizeFileCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count archivos',
      one: '$count archivo',
    );
    return '$_temp0';
  }

  @override
  String organizeSplitFailed(String detail) {
    return 'Error al dividir: $detail';
  }

  @override
  String get scanNoCamera =>
      'No hay ninguna cámara disponible en este dispositivo.';

  @override
  String scanCameraFailed(String detail) {
    return 'No se pudo iniciar la cámara: $detail';
  }

  @override
  String get scanCropToolbar => 'Recortar';

  @override
  String scanCaptureFailed(String detail) {
    return 'Error al capturar: $detail';
  }

  @override
  String get scanPermissionBody =>
      'Hace falta acceso a la cámara para escanear un documento.';

  @override
  String get scanGrantPermission => 'Permitir la cámara';

  @override
  String get actionRetry => 'Reintentar';

  @override
  String get scanNoPageYet => 'Todavía no hay ninguna página.';

  @override
  String scanFinishAction(int count) {
    return 'Finalizar · $count';
  }

  @override
  String get signTitle => 'Firmar un PDF';

  @override
  String get signIntro =>
      'Pon tu firma dibujada a mano en una página de un PDF. Es simplemente un dibujo añadido al documento, no una firma electrónica certificada.';

  @override
  String get signChooseSubtitle => 'Selecciona el documento que quieres firmar';

  @override
  String get signPickPage => 'Elige la página que quieres firmar.';

  @override
  String get signDrawTitle => 'Dibujar mi firma';

  @override
  String get signDrawBody =>
      'Dibuja con el dedo como en un papel. Esto pone un dibujo en la página: no es una firma electrónica certificada.';

  @override
  String get signNeedDrawing => 'Dibuja una firma antes de continuar.';

  @override
  String get signClear => 'Borrar';

  @override
  String get signValidate => 'Confirmar';

  @override
  String get signPlaceBody =>
      'Arrastra la firma al lugar que quieras en la página y luego pulsa Finalizar.';

  @override
  String get signPageUnavailable => 'No se pudo mostrar la página.';

  @override
  String get signProgress => 'Añadiendo la firma…';

  @override
  String get editTitle => 'Anotar un documento';

  @override
  String get editEmptyBody =>
      'Añade texto o resalta pasajes directamente sobre un PDF existente.';

  @override
  String get editAddTextTitle => 'Añadir texto';

  @override
  String get editTextHint => 'Tu texto';

  @override
  String editFontSize(int size) {
    return 'Tamaño del texto: $size';
  }

  @override
  String get editNeedAnnotation =>
      'Añade al menos una anotación antes de finalizar.';

  @override
  String get editProgress => 'Aplicando las anotaciones…';

  @override
  String get editChooseOther => 'Elegir otro PDF';

  @override
  String get editUndoTooltip => 'Deshacer la última anotación';

  @override
  String get editModeText => 'Texto';

  @override
  String get editModeHighlight => 'Resaltar';

  @override
  String get editPageUnavailable => 'No se pudo mostrar esta página.';

  @override
  String get ocrEmptyTitle => 'Hacer el texto buscable';

  @override
  String get ocrEmptyBody =>
      'El texto de un PDF escaneado se reconoce y se añade encima de la imagen, de forma invisible. La página no cambia de aspecto.';

  @override
  String get ocrWrongFormat => 'Elige un PDF o una imagen (JPG, PNG…).';

  @override
  String get ocrProgress => 'Reconociendo…';

  @override
  String ocrFailed(String detail) {
    return 'Error en el reconocimiento: $detail';
  }

  @override
  String get ocrRunAction => 'Iniciar el reconocimiento';

  @override
  String get ocrResultTitle => 'Resultado del OCR';

  @override
  String ocrResultBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count páginas analizadas',
      one: '$count página analizada',
    );
    return '$_temp0. El PDF buscable está listo, y también puedes copiar todo el texto reconocido.';
  }

  @override
  String get ocrCopyText => 'Copiar el texto';

  @override
  String get ocrTextCopied => 'Texto copiado.';

  @override
  String get redactIntro =>
      'Oculta de forma definitiva zonas de un PDF (nombres, direcciones, importes). A diferencia de un simple rectángulo negro puesto encima, el texto oculto se elimina realmente del archivo, no solo se tapa: ya no se puede seleccionar ni copiar.';

  @override
  String get redactChooseSubtitle =>
      'Selecciona el documento que quieres censurar';

  @override
  String get redactCaveat =>
      'Conviene saberlo: para eliminar el texto oculto, cada página del documento se vuelve a convertir en imagen (200 ppp). Por eso el resultado ya no es un PDF cuyo texto se pueda seleccionar, y el archivo obtenido suele ser más pesado que el original.';

  @override
  String get redactEmptyPdf => 'Este PDF no contiene ninguna página.';

  @override
  String redactOpenFailed(String detail) {
    return 'No se pudo abrir este PDF (puede estar protegido con contraseña): $detail';
  }

  @override
  String redactPageRenderFailed(int number, String detail) {
    return 'No se pudo mostrar la página $number: $detail';
  }

  @override
  String get redactUndoTooltip => 'Deshacer la última zona';

  @override
  String get redactInstructions =>
      'Arrastra el dedo por la página para trazar una zona que ocultar. El texto cubierto se eliminará realmente del archivo, no solo se tapará.';

  @override
  String get redactPagePrevious => 'Página anterior';

  @override
  String get redactPageNext => 'Página siguiente';

  @override
  String redactPager(int current, int total) {
    return 'Página $current / $total';
  }

  @override
  String get redactNoZone => 'Ninguna zona trazada';

  @override
  String redactZoneCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count zonas que ocultar',
      one: '$count zona que ocultar',
    );
    return '$_temp0';
  }

  @override
  String get redactOtherPdf => 'Otro PDF';

  @override
  String get redactAction => 'Censurar';

  @override
  String get redactProgress => 'Censurando…';

  @override
  String get cropEmptyTitle => 'Recortar los márgenes';

  @override
  String get cropEmptyBody =>
      'Elige un PDF y luego arrastra el dedo sobre la vista previa para delimitar la zona que quieres conservar.';

  @override
  String get cropTooSmall => 'La zona seleccionada es demasiado pequeña.';

  @override
  String get cropProgress => 'Recortando…';

  @override
  String cropFailed(String detail) {
    return 'Error al recortar: $detail';
  }

  @override
  String get cropKeptArea => 'Zona conservada';

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
  String get cropFullPage => 'Página entera';

  @override
  String get cropAllPages => 'Aplicar a todas las páginas';

  @override
  String get cropAllPagesOn => 'La misma zona se recorta en cada página.';

  @override
  String get cropAllPagesOff =>
      'Solo se recorta la página 1; las demás se conservan enteras.';

  @override
  String get cropCaveat =>
      'El recorte reduce el tamaño de la página: el contenido situado fuera de la zona ya no se muestra ni se imprime.';

  @override
  String get cropAction => 'Recortar';

  @override
  String get compareTitle => 'Comparar dos PDF';

  @override
  String get compareEmptyTitle => 'Lo que ha cambiado';

  @override
  String get compareEmptyBody =>
      'Elige dos versiones de un mismo PDF. Los pasajes añadidos y eliminados se pondrán uno frente a otro, página por página.';

  @override
  String get compareSlotA => 'Archivo A';

  @override
  String get compareSlotB => 'Archivo B';

  @override
  String get compareAction => 'Comparar';

  @override
  String get compareProgress => 'Comparando…';

  @override
  String compareFailed(String detail) {
    return 'Error en la comparación: $detail';
  }

  @override
  String compareChangedPages(int changed, int total) {
    String _temp0 = intl.Intl.pluralLogic(
      changed,
      locale: localeName,
      other: '$changed páginas difieren',
      one: '$changed página difiere',
    );
    return '$_temp0 de $total';
  }

  @override
  String get compareNoDifference =>
      'No se ha detectado ninguna diferencia entre los dos archivos.';

  @override
  String comparePageHeading(int number) {
    return 'Página $number';
  }

  @override
  String organizeFilesCreated(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count archivos creados',
      one: '$count archivo creado',
    );
    return '$_temp0';
  }

  @override
  String organizePartTitle(int number) {
    return 'Parte $number';
  }
}
