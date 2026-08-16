// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class LPt extends L {
  LPt([String locale = 'pt']) : super(locale);

  @override
  String get appTitle => 'Trombone — PDF, Scanner e Word';

  @override
  String get appWordmark => 'Trombone';

  @override
  String get actionSave => 'Salvar';

  @override
  String get actionShare => 'Compartilhar';

  @override
  String get actionCompress => 'Comprimir';

  @override
  String get actionDone => 'Concluído';

  @override
  String get actionCancel => 'Cancelar';

  @override
  String get actionChange => 'Trocar';

  @override
  String get actionContinue => 'Continuar';

  @override
  String get actionOpening => 'Abrindo…';

  @override
  String get actionRemoveFile => 'Remover este arquivo';

  @override
  String get progressPreparing => 'Preparando…';

  @override
  String progressPercent(int percent) {
    return '$percent%';
  }

  @override
  String get emptyReassurance =>
      'Exportação grátis, sem marca-d’água nem limite.';

  @override
  String get emptyAcceptedFormats => 'Formatos aceitos';

  @override
  String get exportSavedTitle => 'Salvo.';

  @override
  String get exportSavedBody =>
      'Com o nome e na pasta que você acabou de escolher. Sem marca-d’água, sem limite, nada a desbloquear.';

  @override
  String get exportSaveDialogTitle => 'Salvar o PDF';

  @override
  String pageTileIncluded(int number) {
    return 'Página $number, incluída. Toque para descartar.';
  }

  @override
  String pageTileExcluded(int number) {
    return 'Página $number, descartada. Toque para incluir.';
  }

  @override
  String pageTileRotate(int number) {
    return 'Girar a página $number';
  }

  @override
  String sectionHeaderSemantics(String title, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ferramentas',
      one: '$count ferramenta',
    );
    return '$title, $_temp0';
  }

  @override
  String toolCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ferramentas',
      one: '$count ferramenta',
    );
    return '$_temp0';
  }

  @override
  String get homePromise =>
      'Crie seu documento e exporte.\nSem paywall no final.';

  @override
  String get homeChipNoAccount => 'Sem conta';

  @override
  String get homeChipNoWatermark => 'Sem marca-d’água';

  @override
  String get homeChipUnlimited => 'Exportação ilimitada';

  @override
  String get homeSearchTooltip => 'Procurar uma ferramenta';

  @override
  String get homeColophon =>
      'Nada é desbloqueado mediante pagamento ao salvar. A exportação é gratuita, sem marca-d’água e sem limites.';

  @override
  String get sectionFeatured => 'Em destaque';

  @override
  String get sectionToPdf => 'Para o PDF';

  @override
  String get sectionFromPdf => 'A partir do PDF';

  @override
  String get sectionSecurity => 'Segurança';

  @override
  String get sectionEdit => 'Editar';

  @override
  String get toolMerge => 'Juntar';

  @override
  String get toolMergeKeywords =>
      'unir combinar mesclar agrupar concatenar juntar';

  @override
  String get toolMergeSubtitle => 'PDF, Word, imagens e texto num só documento';

  @override
  String get toolRectoVerso => 'Frente e verso';

  @override
  String get toolRectoVersoKeywords =>
      'duplex intercalar digitalizacao par impar dois lados';

  @override
  String get toolRectoVersoSubtitle => 'Duas digitalizações, de volta em ordem';

  @override
  String get toolImagesToPdf => 'Imagens para PDF';

  @override
  String get toolImagesToPdfKeywords =>
      'foto jpg jpeg png fotos album camera imagem';

  @override
  String get toolImagesToPdfSubtitle => 'Fotos e capturas num documento';

  @override
  String get toolPdfToWord => 'PDF para Word';

  @override
  String get toolPdfToWordKeywords =>
      'docx editor de texto editavel converter doc';

  @override
  String get toolPdfToWordSubtitle => 'Texto e tabelas, editáveis';

  @override
  String get toolOrganize => 'Organizar um PDF';

  @override
  String get toolOrganizeKeywords =>
      'dividir separar extrair reordenar ordem paginas excluir';

  @override
  String get toolOrganizeSubtitle => 'Dividir, extrair, reordenar';

  @override
  String get toolExcelToPdf => 'Excel para PDF';

  @override
  String get toolExcelToPdfKeywords =>
      'planilha xlsx pasta de trabalho folha calculo';

  @override
  String get toolPptxToPdf => 'PowerPoint para PDF';

  @override
  String get toolPptxToPdfKeywords => 'pptx slide apresentacao slides';

  @override
  String get toolHtmlToPdf => 'Página web para PDF';

  @override
  String get toolHtmlToPdfKeywords => 'html site internet url link artigo';

  @override
  String get toolScan => 'Digitalizar um documento';

  @override
  String get toolScanKeywords => 'camera foto digitalizar scanner papel';

  @override
  String get toolPdfToExcel => 'PDF para Excel';

  @override
  String get toolPdfToExcelKeywords => 'planilha xlsx tabela extrair dados';

  @override
  String get toolPdfToPptx => 'PDF para PowerPoint';

  @override
  String get toolPdfToPptxKeywords => 'pptx slide apresentacao slides';

  @override
  String get toolPdfToImages => 'PDF para imagens';

  @override
  String get toolPdfToImagesKeywords => 'jpg png foto exportar captura imagem';

  @override
  String get toolOcr => 'Texto pesquisável (OCR)';

  @override
  String get toolOcrKeywords =>
      'reconhecimento caracteres digitalizado copiar selecionar';

  @override
  String get toolPdfA => 'Converter em PDF/A';

  @override
  String get toolPdfAKeywords =>
      'arquivamento norma longo prazo preservacao iso';

  @override
  String get toolProtect => 'Proteger PDF';

  @override
  String get toolProtectKeywords =>
      'senha cadeado criptografar bloquear proteger';

  @override
  String get toolUnlock => 'Desbloquear PDF';

  @override
  String get toolUnlockKeywords =>
      'remover senha abrir descriptografar desproteger cadeado';

  @override
  String get toolRepair => 'Reparar PDF';

  @override
  String get toolRepairKeywords =>
      'corrompido ilegivel danificado recuperar quebrado erro';

  @override
  String get toolRedact => 'Tarjar um PDF';

  @override
  String get toolRedactKeywords =>
      'ocultar tarjar anonimizar confidencial apagar censurar';

  @override
  String get toolEdit => 'Editar PDF';

  @override
  String get toolEditKeywords => 'texto modificar corrigir anotar escrever';

  @override
  String get toolSign => 'Assinar';

  @override
  String get toolSignKeywords => 'assinatura rubrica contrato mao';

  @override
  String get toolWatermark => 'Marca-d’água';

  @override
  String get toolWatermarkKeywords =>
      'watermark carimbo confidencial rascunho marca';

  @override
  String get toolPageNumbers => 'Números de página';

  @override
  String get toolPageNumbersKeywords =>
      'paginacao folio numerar algarismos numeros';

  @override
  String get toolCrop => 'Recortar um PDF';

  @override
  String get toolCropKeywords => 'cortar margens recortar bordas tamanho';

  @override
  String get toolCompare => 'Comparar PDF';

  @override
  String get toolCompareKeywords =>
      'diferenca versoes diff alteracoes comparar';

  @override
  String get searchHint => 'Juntar, senha, marca-d’água…';

  @override
  String get searchClear => 'Limpar';

  @override
  String searchNoResultTitle(String query) {
    return 'Nenhuma ferramenta para “$query”.';
  }

  @override
  String get searchNoResultBody =>
      'Tente o formato que você tem em mãos — “Word”, “Excel”, “foto” — ou o que quer fazer com ele: “assinar”, “dividir”, “senha”.';

  @override
  String get actionUndo => 'Desfazer';

  @override
  String get actionApply => 'Aplicar';

  @override
  String get actionChoose => 'Escolher';

  @override
  String get actionChoosePdf => 'Escolher um PDF';

  @override
  String get actionChooseFiles => 'Escolher arquivos';

  @override
  String get actionConvert => 'Converter';

  @override
  String get actionFinish => 'Concluir';

  @override
  String get actionBack => 'Voltar';

  @override
  String get actionAdd => 'Adicionar';

  @override
  String get noFileChosen => 'Nenhum arquivo escolhido';

  @override
  String errorExportFailed(String detail) {
    return 'Falha ao exportar: $detail';
  }

  @override
  String errorShareFailed(String detail) {
    return 'Falha ao compartilhar: $detail';
  }

  @override
  String errorOpenFailed(String detail) {
    return 'Não foi possível abrir o arquivo: $detail';
  }

  @override
  String errorConversionFailed(String detail) {
    return 'Falha na conversão: $detail';
  }

  @override
  String errorOnFile(String name, String detail) {
    return '$name: $detail';
  }

  @override
  String get errorPickPdf => 'Escolha um arquivo PDF.';

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
  String get formatImages => 'Imagens';

  @override
  String get formatText => 'Texto';

  @override
  String get mergeAddFile => 'Adicionar um arquivo';

  @override
  String get mergeAddHint => 'PDF, Word, imagens ou texto';

  @override
  String get mergeEmptyTitle => 'Um só documento';

  @override
  String get mergeEmptyBody =>
      'Adicione PDFs, arquivos do Word, imagens ou texto. Você poderá reordená-los e descartar páginas antes de exportar.';

  @override
  String get mergeNeedOnePage =>
      'Adicione ao menos um arquivo com uma página a incluir.';

  @override
  String get mergeProgress => 'Juntando…';

  @override
  String mergeFailed(String detail) {
    return 'Falha ao juntar: $detail';
  }

  @override
  String mergeRemoved(String name) {
    return '$name removido.';
  }

  @override
  String mergeRemoveTooltip(String name) {
    return 'Remover $name';
  }

  @override
  String mergeMoveSemantics(String name) {
    return 'Mover $name';
  }

  @override
  String get mergeRotateAll => 'Girar todas as páginas';

  @override
  String mergePreviewAndExport(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count páginas',
      one: '$count página',
    );
    return 'Pré-visualizar e exportar ($_temp0)';
  }

  @override
  String previewTitle(String size) {
    return 'Pré-visualização · $size';
  }

  @override
  String previewZoomPage(int number) {
    return 'Página $number, ampliar';
  }

  @override
  String get previewPageUnreadable => 'Página ilegível.';

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
  String get compressTitle => 'Compressão';

  @override
  String compressBody(String size) {
    return 'Tamanho atual: $size. Escolha um nível — o tamanho estimado aparece antes de aplicar.';
  }

  @override
  String get compressEstimating => 'Estimando…';

  @override
  String get compressProgress => 'Comprimindo…';

  @override
  String compressFailed(String detail) {
    return 'Falha ao comprimir: $detail';
  }

  @override
  String get protectEmptyTitle => 'Colocar uma senha';

  @override
  String get protectEmptyBody =>
      'O PDF não abrirá mais sem a senha que você escolher. Guarde-a: não há como recuperá-la.';

  @override
  String get protectSubtitle => 'Será criptografado com AES de 256 bits';

  @override
  String get protectPassword => 'Senha';

  @override
  String get protectConfirmPassword => 'Confirmar a senha';

  @override
  String get protectShowPasswords => 'Mostrar as senhas';

  @override
  String get protectHidePasswords => 'Ocultar as senhas';

  @override
  String get protectMismatch => 'As duas senhas são diferentes.';

  @override
  String get protectWarning =>
      'Anote-a em algum lugar: sem ela o documento fica ilegível para sempre. Nenhuma recuperação é possível, nem por você nem pelo aplicativo.';

  @override
  String get protectAlreadyProtected =>
      'Este arquivo já está protegido — use antes Desbloquear PDF.';

  @override
  String get protectProgress => 'Protegendo…';

  @override
  String protectFailed(String detail) {
    return 'Falha ao proteger: $detail';
  }

  @override
  String get protectAction => 'Proteger';

  @override
  String get protectResultTitle => 'PDF protegido';

  @override
  String get protectResultDetail =>
      'Criptografado com AES de 256 bits. Será preciso a senha para abri-lo.';

  @override
  String get protectExportWhat => 'PDF protegido por senha';

  @override
  String get unlockEmptyTitle => 'Remover a senha';

  @override
  String get unlockEmptyBody =>
      'Você precisa da senha atual do documento. Uma vez removida, o PDF abrirá livremente.';

  @override
  String get unlockAcceptsProtectedPdf => 'PDF protegido';

  @override
  String get unlockChooseProtectedPdf => 'Escolher um PDF protegido';

  @override
  String get unlockCurrentPassword => 'Senha atual';

  @override
  String get unlockWrongPassword => 'Senha incorreta.';

  @override
  String get unlockProgress => 'Desbloqueando…';

  @override
  String unlockFailed(String detail) {
    return 'Falha ao desbloquear: $detail';
  }

  @override
  String get unlockAction => 'Desbloquear';

  @override
  String get repairEmptyTitle => 'Reparar um arquivo danificado';

  @override
  String get repairEmptyBody =>
      'A estrutura interna de um PDF danificado é reconstruída. O que for recuperável será recuperado.';

  @override
  String get repairProgress => 'Reparando…';

  @override
  String get repairFailed =>
      'Não é possível reparar este arquivo — ele pode estar danificado demais.';

  @override
  String get repairAction => 'Reparar';

  @override
  String get pdfToWordEmptyTitle => 'Um Word editável';

  @override
  String get pdfToWordEmptyBody =>
      'O texto e a estrutura do PDF são transferidos para um documento .docx que você poderá reabrir e editar.';

  @override
  String get pdfToWordAnalyzing => 'Analisando o documento…';

  @override
  String get pdfToWordAnalysisPending => 'Análise pendente';

  @override
  String pdfToWordAnalysisFailed(String detail) {
    return 'Falha na análise: $detail';
  }

  @override
  String get pdfLocked =>
      'Este PDF está protegido por senha. Desbloqueie-o primeiro.';

  @override
  String get pdfToWordConverting => 'Convertendo para Word…';

  @override
  String get pdfToWordSummaryTitle => 'Conteúdo detectado';

  @override
  String pdfToWordParagraphCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count parágrafos',
      one: '$count parágrafo',
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
      other: '$count tabelas',
      one: '$count tabela',
    );
    return '$_temp0';
  }

  @override
  String get pdfToWordNoTables =>
      'Nenhuma tabela detectada: se o seu PDF tiver alguma, as linhas dela virarão parágrafos.';

  @override
  String get pdfToWordCaveat =>
      'A conversão reproduz o texto, a formatação e as tabelas, mas não o layout exato: a posição das imagens e das colunas não é mantida, e as imagens não são levadas para o documento do Word.';

  @override
  String get pdfToWordScanWarning =>
      'Este PDF parece uma digitalização: nenhum texto foi encontrado. Use antes a ferramenta Texto pesquisável (OCR) e depois volte para converter o PDF obtido.';

  @override
  String get pdfToWordResultTitle => 'Documento do Word pronto';

  @override
  String pdfToWordResultDetail(String name, String size) {
    return '$name — $size';
  }

  @override
  String get pdfToWordExportWhat => 'Documento do Word';

  @override
  String get pdfToWordConvertAction => 'Converter para Word';

  @override
  String get actionConvertAgain => 'Converter de novo';

  @override
  String errorSaveFailed(String detail) {
    return 'Não foi possível salvar: $detail';
  }

  @override
  String get rectoVersoIntro =>
      'Um alimentador de face única gera dois arquivos: as páginas ímpares em ordem e as pares muitas vezes em ordem inversa. Escolha os dois para recompô-los.';

  @override
  String get rectoVersoOddSlot => 'Arquivo das páginas ímpares (frente)';

  @override
  String get rectoVersoEvenSlot => 'Arquivo das páginas pares (verso)';

  @override
  String get rectoVersoReversed => 'O segundo arquivo está em ordem inversa';

  @override
  String get rectoVersoReversedHint =>
      'É o caso mais comum, marcado por padrão';

  @override
  String rectoVersoPreview(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count páginas',
      one: '$count página',
    );
    return 'Prévia da intercalação ($_temp0)';
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
  String get actionPreviewAndExport => 'Pré-visualizar e exportar';

  @override
  String errorOpenFailedShort(String detail) {
    return 'Não foi possível abrir: $detail';
  }

  @override
  String errorGeneric(String detail) {
    return 'Falha: $detail';
  }

  @override
  String get actionConvertToPdf => 'Converter em PDF';

  @override
  String get convertProgress => 'Convertendo…';

  @override
  String get excelEmptyTitle => 'Uma planilha em PDF';

  @override
  String get excelEmptyBody =>
      'As folhas de um arquivo .xlsx viram páginas PDF, prontas para enviar ou imprimir.';

  @override
  String get excelChooseWorkbook => 'Escolher uma planilha';

  @override
  String get excelChooseXlsx => 'Escolher uma planilha .xlsx';

  @override
  String get excelLegacyFormat =>
      'O formato .xls (o antigo formato binário do Excel) não é compatível. Salve o arquivo como .xlsx e tente de novo.';

  @override
  String get excelWrongFormat => 'Escolha uma planilha do Excel .xlsx.';

  @override
  String excelUnreadable(String detail) {
    return 'Planilha ilegível: $detail';
  }

  @override
  String excelSheetsAndRows(int sheets, int rows) {
    String _temp0 = intl.Intl.pluralLogic(
      sheets,
      locale: localeName,
      other: '$sheets folhas',
      one: '$sheets folha',
    );
    String _temp1 = intl.Intl.pluralLogic(
      rows,
      locale: localeName,
      other: '$rows linhas no total',
      one: '$rows linha no total',
    );
    return '$_temp0 · $_temp1';
  }

  @override
  String get excelSheetsDetected => 'Folhas detectadas';

  @override
  String get excelEmptySheet => 'Folha vazia';

  @override
  String excelSheetDimensions(int rows, int columns) {
    String _temp0 = intl.Intl.pluralLogic(
      rows,
      locale: localeName,
      other: '$rows linhas',
      one: '$rows linha',
    );
    String _temp1 = intl.Intl.pluralLogic(
      columns,
      locale: localeName,
      other: '$columns colunas',
      one: '$columns coluna',
    );
    return '$_temp0 × $_temp1';
  }

  @override
  String get excelRepeatHeader => 'Repetir a linha de cabeçalho em cada página';

  @override
  String get excelRepeatHeaderHint =>
      'A primeira linha da folha é redesenhada no topo de cada página da tabela.';

  @override
  String get excelCaveat =>
      'O que a conversão mantém: o texto das células como está salvo no arquivo (inclusive o último resultado calculado das fórmulas), a primeira linha em negrito e uma grade.\n\nO que não mantém: cores, fontes, formatos de número, células mescladas, imagens, gráficos e as próprias fórmulas. As colunas são reduzidas para caber na largura da página; em folhas muito largas, o texto das células estreitas demais é cortado com “…”.';

  @override
  String get pptxEmptyTitle => 'Uma apresentação em PDF';

  @override
  String get pptxEmptyBody =>
      'Uma página paisagem 16:9 por slide, com o título e os marcadores. O texto é mantido; as imagens, formas e planos de fundo originais não.\n\nFormato aceito: .pptx. Um arquivo antigo .ppt precisa ser salvo antes como .pptx no PowerPoint.';

  @override
  String get pptxChoosePresentation => 'Escolher uma apresentação';

  @override
  String get pptxTextOnlyTitle => 'Conversão apenas do texto';

  @override
  String get pptxTextOnlyBody =>
      'O texto de cada slide é mantido. As imagens, formas, planos de fundo, cores e layouts originais não são preservados: o PDF obtido é um layout simples e legível, não uma cópia fiel da sua apresentação.';

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
  String get pptxSlidesDetected => 'Slides detectados';

  @override
  String pptxMoreSlides(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count slides',
      one: '$count slide',
    );
    return 'e mais $_temp0…';
  }

  @override
  String get pptxUntitledSlide => 'Sem título';

  @override
  String get pptxEmptySlide => 'Sem texto (apenas imagem ou forma)';

  @override
  String pptxTextLineCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count linhas de texto',
      one: '$count linha de texto',
    );
    return '$_temp0';
  }

  @override
  String pptxReadFailed(String detail) {
    return 'Não foi possível ler: $detail';
  }

  @override
  String get compressLevelLight => 'Leve';

  @override
  String get compressLevelMedium => 'Média';

  @override
  String get compressLevelStrong => 'Forte';

  @override
  String get pptxQualityStandard => 'Padrão (150 dpi)';

  @override
  String get pptxQualityHigh => 'Alta (220 dpi)';

  @override
  String get pdfToExcelEmptyTitle => 'Recuperar as tabelas';

  @override
  String get pdfToExcelEmptyBody =>
      'As tabelas de um PDF são extraídas para uma planilha do Excel. A formatação não é mantida; os valores sim.';

  @override
  String pdfToExcelPagesAnalyzed(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count páginas analisadas',
      one: '$count página analisada',
    );
    return '$_temp0';
  }

  @override
  String pdfToExcelAnalysisFailed(String detail) {
    return 'Análise impossível. O PDF pode estar protegido por senha ou danificado. ($detail)';
  }

  @override
  String get pdfToExcelNothingToExport =>
      'Nada a exportar: nenhuma tabela detectada.';

  @override
  String get pdfToExcelBuilding => 'Criando a planilha…';

  @override
  String get pdfToExcelIncludeParagraphs =>
      'Incluir também o texto fora das tabelas (uma linha por parágrafo)';

  @override
  String get pdfToExcelIncludeParagraphsHint =>
      'Útil para um documento semiestruturado: o texto vai para a coluna A, depois das tabelas da página.';

  @override
  String get pdfToExcelCaveatTitle => 'O que a conversão não mantém';

  @override
  String get pdfToExcelCaveat =>
      'A detecção se baseia na posição do texto na página: tabelas sem borda regular, células mescladas e colunas muito irregulares podem ficar mal divididas. Um PDF digitalizado (uma imagem) não contém texto extraível e não dará nada. Cores, fórmulas e imagens nunca são mantidas: apenas os valores de texto.';

  @override
  String pdfToExcelTablesFound(int tables, int pages) {
    String _temp0 = intl.Intl.pluralLogic(
      tables,
      locale: localeName,
      other: '$tables tabelas detectadas',
      one: '$tables tabela detectada',
    );
    String _temp1 = intl.Intl.pluralLogic(
      pages,
      locale: localeName,
      other: '$pages páginas',
      one: '$pages página',
    );
    return '$_temp0 em $_temp1';
  }

  @override
  String pdfToExcelPagesConcerned(String pages) {
    return 'Páginas envolvidas: $pages';
  }

  @override
  String pdfToExcelParagraphsOutside(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count parágrafos fora das tabelas',
      one: '$count parágrafo fora das tabelas',
    );
    return '$_temp0';
  }

  @override
  String get pdfToExcelScannedWarning =>
      'Nenhum texto pôde ser extraído deste PDF: quase certamente é um documento digitalizado (imagens de páginas). Uma planilha não consegue tirar nada dele; use antes a ferramenta de reconhecimento de texto (OCR).';

  @override
  String get pdfToExcelNoTableWarning =>
      'Nenhuma estrutura de tabela foi reconhecida neste documento. O texto está lá, mas não está disposto em colunas regulares. Em vez de gerar uma planilha ilegível, ative acima “Incluir também o texto fora das tabelas”, ou use “PDF para Word”, que preserva melhor os parágrafos.';

  @override
  String get pdfToExcelResultTitle => 'Planilha pronta';

  @override
  String get pdfToExcelExportWhat => 'Planilha do Excel';

  @override
  String get pdfToExcelConvertAction => 'Converter para Excel';

  @override
  String resultNameAndSize(String name, String size) {
    return '$name — $size';
  }

  @override
  String get pdfToPptxEmptyTitle => 'Um slide por página';

  @override
  String get pdfToPptxEmptyBody =>
      'O PDF vira uma apresentação do PowerPoint idêntica. Cada página chega como imagem: o layout é fiel, mas o texto não poderá ser editado no PowerPoint.';

  @override
  String pdfToPptxOpenFailed(String detail) {
    return 'Não foi possível abrir este PDF: $detail';
  }

  @override
  String get pdfToPptxConverting => 'Convertendo para PowerPoint…';

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
      other: '$count slides',
      one: '$count slide',
    );
    return '$_temp0 > $_temp1';
  }

  @override
  String get pdfToPptxEmptyDocument => 'Documento vazio';

  @override
  String get qualityLabel => 'Qualidade';

  @override
  String get pdfToPptxQualityHint =>
      'Uma resolução maior dá slides mais nítidos, mas um arquivo bem mais pesado.';

  @override
  String pdfToPptxHeavyWarning(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count páginas',
      one: '$count página',
    );
    return 'Atenção: em alta qualidade, uma apresentação de $_temp0 pode pesar dezenas de MB e demorar a abrir. Escolha Padrão na dúvida.';
  }

  @override
  String get goodToKnow => 'Vale saber';

  @override
  String get pdfToPptxCaveat =>
      'Cada slide é uma imagem da página: o layout é idêntico ao PDF, mas o texto não poderá ser editado no PowerPoint.\nPara recuperar texto editável, use antes “PDF para Word”.\nUma apresentação tem um só tamanho de slide: ele vem da primeira página, e as páginas de tamanho diferente são centralizadas dentro dele.';

  @override
  String get pdfToPptxResultTitle => 'Apresentação pronta';

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
      'O arquivo ainda não está no seu aparelho: salve-o ou compartilhe-o.';

  @override
  String get pdfToPptxChangeQuality => 'Trocar a qualidade';

  @override
  String get pdfToPptxConvertAction => 'Converter para PowerPoint';

  @override
  String pdfToPptxExportWhat(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count slides',
      one: '$count slide',
    );
    return 'Apresentação do PowerPoint · $_temp0';
  }

  @override
  String get formatLabel => 'Formato';

  @override
  String get actionExport => 'Exportar';

  @override
  String get imageQualityWeb => 'Web (72 dpi)';

  @override
  String get imageQualityStandard => 'Padrão (150 dpi)';

  @override
  String get imageQualityHigh => 'Alta qualidade (300 dpi)';

  @override
  String get pdfToImagesEmptyTitle => 'Uma imagem por página';

  @override
  String get pdfToImagesEmptyBody =>
      'Escolha um PDF: cada página sairá como imagem, na resolução que você ajustar depois.';

  @override
  String pdfToImagesNotAPdf(String name) {
    return '$name: escolha um arquivo PDF.';
  }

  @override
  String errorLoadFailed(String detail) {
    return 'Falha ao carregar: $detail';
  }

  @override
  String get pdfToImagesProgress => 'Exportando…';

  @override
  String pdfToImagesExportWhat(int count, String format) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count imagens $format',
      one: '$count imagem $format',
    );
    return '$_temp0';
  }

  @override
  String get pdfaEmptyTitle => 'Arquivar por muito tempo';

  @override
  String get pdfaEmptyBody =>
      'O PDF/A é o formato de arquivamento exigido por muitos órgãos públicos. O documento é convertido sem perder a aparência.';

  @override
  String get pdfaConformanceLevel => 'Nível de conformidade';

  @override
  String get pdfaA1bDetail =>
      'O nível mais estrito e mais aceito em todo lugar. Escolha este na dúvida.';

  @override
  String get pdfaA2bDetail =>
      'Baseado no PDF 1.7: compressão mais eficiente, arquivos um pouco mais leves.';

  @override
  String get pdfaA3bDetail =>
      'Como o A-2b, mas permite anexos (muitas vezes exigido para nota fiscal eletrônica).';

  @override
  String pdfaConvertingTo(String level) {
    return 'Convertendo em $level…';
  }

  @override
  String get pdfaCaveatTitle => 'O que a conversão muda';

  @override
  String pdfaCaveat(int dpi) {
    return 'Cada página é redesenhada como imagem a $dpi dpi: o texto vira imagem e o layout fica fixo. É isso que torna o arquivo realmente conforme sem depender das fontes do documento original, mas em troca o texto não pode mais ser selecionado nem pesquisado, os links e formulários desaparecem, e o arquivo fica mais pesado.';
  }

  @override
  String pdfaOpenFailed(String detail) {
    return 'Não foi possível abrir este PDF: $detail';
  }

  @override
  String get imagesToPdfEmptyTitle => 'Imagens num PDF';

  @override
  String get imagesToPdfEmptyBody =>
      'JPG, PNG, WebP, HEIC — adicione suas imagens e elas serão montadas na ordem que você escolher.';

  @override
  String get imagesToPdfChoose => 'Escolher imagens';

  @override
  String get imagesToPdfAdd => 'Adicionar imagens';

  @override
  String imagesToPdfRejected(String names) {
    return 'Ignorado (não é imagem): $names';
  }

  @override
  String get imagesToPdfBuilding => 'Criando o PDF…';

  @override
  String imagesToPdfBuildFailed(String detail) {
    return 'Falha ao criar: $detail';
  }

  @override
  String imagesToPdfCreateAction(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count imagens',
      one: '$count imagem',
    );
    return 'Criar o PDF ($_temp0)';
  }

  @override
  String get actionRotate => 'Girar';

  @override
  String get actionRemove => 'Remover';

  @override
  String get htmlTitle => 'HTML / página web para PDF';

  @override
  String get htmlIntro =>
      'Transforme uma página web ou código HTML num PDF A4. A renderização é feita pelo navegador embutido no Android, então o layout é o de uma impressão a partir do Chrome.';

  @override
  String get htmlModeUrl => 'Endereço web';

  @override
  String get htmlModeCode => 'Código HTML';

  @override
  String get htmlUrlLabel => 'Endereço da página';

  @override
  String get htmlUrlHint => 'https://exemplo.com.br/artigo';

  @override
  String get htmlCodeLabel => 'Código HTML';

  @override
  String get htmlCodeHint => '<h1>Título</h1>\n<p>Texto…</p>';

  @override
  String get htmlUrlBadScheme =>
      'O endereço precisa começar com http:// ou https://.';

  @override
  String get htmlUrlIncomplete => 'Digite um endereço web completo.';

  @override
  String get htmlCodeEmpty => 'Cole um código HTML para converter.';

  @override
  String get htmlLoadingUrl => 'Carregando a página e convertendo…';

  @override
  String get htmlConverting => 'Convertendo o HTML…';

  @override
  String get htmlNetworkNotice =>
      'É preciso conexão com a internet: esta é a única ferramenta do aplicativo que precisa baixar a página. Páginas que exigem login, um aviso de cookies ou muito JavaScript podem sair incompletas.';

  @override
  String get htmlOfflineNotice =>
      'O HTML e o CSS escritos diretamente na página são renderizados sem conexão. Já as imagens, folhas de estilo ou fontes buscadas num endereço web externo precisam de conexão com a internet.';

  @override
  String get watermarkEmptyTitle => 'Aplicar uma marca-d’água';

  @override
  String get watermarkEmptyBody =>
      'Um texto à sua escolha é repetido ao fundo em todas as páginas — para marcar um documento como confidencial ou como rascunho.';

  @override
  String get watermarkEmptyNote => 'Exportação gratuita e sem limites.';

  @override
  String get watermarkTextLabel => 'Texto da marca-d’água';

  @override
  String get watermarkDefaultText => 'CONFIDENCIAL';

  @override
  String get watermarkNeedText => 'Digite um texto para a marca-d’água.';

  @override
  String watermarkOpacity(int percent) {
    return 'Opacidade: $percent%';
  }

  @override
  String watermarkRotation(int degrees) {
    return 'Ângulo de rotação: $degrees°';
  }

  @override
  String watermarkFontSize(int points) {
    return 'Tamanho do texto: $points pt';
  }

  @override
  String get watermarkColor => 'Cor';

  @override
  String get colorGrey => 'Cinza';

  @override
  String get colorRed => 'Vermelho';

  @override
  String get colorBlue => 'Azul';

  @override
  String get colorBlack => 'Preto';

  @override
  String get watermarkProgress => 'Aplicando a marca-d’água…';

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
  String get pageNumbersEmptyTitle => 'Numerar as páginas';

  @override
  String get pageNumbersEmptyBody =>
      'Escolha um PDF e depois a posição e o formato dos números que serão colocados em cada página.';

  @override
  String get positionLabel => 'Posição';

  @override
  String get positionBottomCenter => 'Rodapé centro';

  @override
  String get positionBottomRight => 'Rodapé direita';

  @override
  String get positionTopCenter => 'Topo centro';

  @override
  String get positionTopRight => 'Topo direita';

  @override
  String get pageNumbersFormatPlain => 'N';

  @override
  String get pageNumbersFormatOfTotal => 'N / total';

  @override
  String get pageNumbersStart => 'Número inicial';

  @override
  String get pageNumbersProgress => 'Numerando…';

  @override
  String get organizeEmptyTitle => 'Reorganizar um PDF';

  @override
  String get organizeEmptyBody =>
      'Abra um documento para dividi-lo, extrair páginas ou mudar a ordem delas.';

  @override
  String get organizeOpenFile => 'Abrir um arquivo';

  @override
  String get organizeNothingToExport => 'Nenhuma página a exportar.';

  @override
  String organizePagesKept(int kept, int total) {
    String _temp0 = intl.Intl.pluralLogic(
      kept,
      locale: localeName,
      other: '$kept páginas mantidas',
      one: '$kept página mantida',
    );
    return '$_temp0 de $total';
  }

  @override
  String get organizePageExcluded => 'Descartada';

  @override
  String organizePageMoved(int from) {
    return 'Movida da posição $from';
  }

  @override
  String organizePageTitle(int number) {
    return 'Página $number';
  }

  @override
  String organizeExcludePage(int number) {
    return 'Descartar a página $number';
  }

  @override
  String organizeIncludePage(int number) {
    return 'Incluir a página $number';
  }

  @override
  String organizeMovePage(int number) {
    return 'Mover a página $number';
  }

  @override
  String get organizeExtract => 'Extrair';

  @override
  String get organizeSplit => 'Dividir';

  @override
  String get organizePreview => 'Prévia';

  @override
  String get organizeExtractTitle => 'Extrair um intervalo de páginas';

  @override
  String organizeRangeLabel(int start, int end) {
    return 'Páginas $start a $end';
  }

  @override
  String get organizeSplitTitle => 'Dividir em vários arquivos';

  @override
  String organizeFileCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count arquivos',
      one: '$count arquivo',
    );
    return '$_temp0';
  }

  @override
  String organizeSplitFailed(String detail) {
    return 'Falha ao dividir: $detail';
  }

  @override
  String get scanNoCamera => 'Nenhuma câmera disponível neste aparelho.';

  @override
  String scanCameraFailed(String detail) {
    return 'Não foi possível iniciar a câmera: $detail';
  }

  @override
  String get scanCropToolbar => 'Ajustar';

  @override
  String scanCaptureFailed(String detail) {
    return 'Falha na captura: $detail';
  }

  @override
  String get scanPermissionBody =>
      'O acesso à câmera é necessário para digitalizar um documento.';

  @override
  String get scanGrantPermission => 'Permitir a câmera';

  @override
  String get actionRetry => 'Tentar de novo';

  @override
  String get scanNoPageYet => 'Nenhuma página por enquanto.';

  @override
  String scanFinishAction(int count) {
    return 'Concluir · $count';
  }

  @override
  String get signTitle => 'Assinar um PDF';

  @override
  String get signIntro =>
      'Coloque sua assinatura feita à mão numa página de um PDF. É apenas um desenho acrescentado ao documento, não uma assinatura eletrônica certificada.';

  @override
  String get signChooseSubtitle => 'Selecione o documento a assinar';

  @override
  String get signPickPage => 'Escolha a página a assinar.';

  @override
  String get signDrawTitle => 'Desenhar minha assinatura';

  @override
  String get signDrawBody =>
      'Desenhe com o dedo como faria no papel. Isso coloca um desenho na página — não é uma assinatura eletrônica certificada.';

  @override
  String get signNeedDrawing => 'Desenhe uma assinatura antes de continuar.';

  @override
  String get signClear => 'Apagar';

  @override
  String get signValidate => 'Confirmar';

  @override
  String get signPlaceBody =>
      'Arraste a assinatura para o lugar que quiser na página e depois toque em Concluir.';

  @override
  String get signPageUnavailable => 'Não foi possível exibir a página.';

  @override
  String get signProgress => 'Adicionando a assinatura…';

  @override
  String get editTitle => 'Anotar um documento';

  @override
  String get editEmptyBody =>
      'Acrescente texto ou destaque trechos diretamente num PDF existente.';

  @override
  String get editAddTextTitle => 'Adicionar texto';

  @override
  String get editTextHint => 'Seu texto';

  @override
  String editFontSize(int size) {
    return 'Tamanho do texto: $size';
  }

  @override
  String get editNeedAnnotation =>
      'Adicione ao menos uma anotação antes de concluir.';

  @override
  String get editProgress => 'Aplicando as anotações…';

  @override
  String get editChooseOther => 'Escolher outro PDF';

  @override
  String get editUndoTooltip => 'Desfazer a última anotação';

  @override
  String get editModeText => 'Texto';

  @override
  String get editModeHighlight => 'Destacar';

  @override
  String get editPageUnavailable => 'Não foi possível exibir esta página.';

  @override
  String get ocrEmptyTitle => 'Tornar o texto pesquisável';

  @override
  String get ocrEmptyBody =>
      'O texto de um PDF digitalizado é reconhecido e acrescentado por cima da imagem, de forma invisível. A página não muda de aparência.';

  @override
  String get ocrWrongFormat => 'Escolha um PDF ou uma imagem (JPG, PNG…).';

  @override
  String get ocrProgress => 'Reconhecendo…';

  @override
  String ocrFailed(String detail) {
    return 'Falha no reconhecimento: $detail';
  }

  @override
  String get ocrRunAction => 'Iniciar o reconhecimento';

  @override
  String get ocrResultTitle => 'Resultado do OCR';

  @override
  String ocrResultBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count páginas analisadas',
      one: '$count página analisada',
    );
    return '$_temp0. O PDF pesquisável está pronto, e você também pode copiar todo o texto reconhecido.';
  }

  @override
  String get ocrCopyText => 'Copiar o texto';

  @override
  String get ocrTextCopied => 'Texto copiado.';

  @override
  String get redactIntro =>
      'Oculte definitivamente áreas de um PDF (nomes, endereços, valores). Ao contrário de um simples retângulo preto por cima, o texto oculto é realmente removido do arquivo, não apenas coberto: ele não pode mais ser selecionado nem copiado.';

  @override
  String get redactChooseSubtitle => 'Selecione o documento a tarjar';

  @override
  String get redactCaveat =>
      'Vale saber: para remover o texto oculto, cada página do documento é reconvertida em imagem (200 dpi). Por isso o resultado não é mais um PDF cujo texto se possa selecionar, e o arquivo obtido costuma ser mais pesado que o original.';

  @override
  String get redactEmptyPdf => 'Este PDF não contém nenhuma página.';

  @override
  String redactOpenFailed(String detail) {
    return 'Não foi possível abrir este PDF (ele pode estar protegido por senha): $detail';
  }

  @override
  String redactPageRenderFailed(int number, String detail) {
    return 'Não foi possível exibir a página $number: $detail';
  }

  @override
  String get redactUndoTooltip => 'Desfazer a última área';

  @override
  String get redactInstructions =>
      'Arraste o dedo pela página para traçar uma área a ocultar. O texto coberto será realmente removido do arquivo, não apenas coberto.';

  @override
  String get redactPagePrevious => 'Página anterior';

  @override
  String get redactPageNext => 'Próxima página';

  @override
  String redactPager(int current, int total) {
    return 'Página $current / $total';
  }

  @override
  String get redactNoZone => 'Nenhuma área traçada';

  @override
  String redactZoneCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count áreas a ocultar',
      one: '$count área a ocultar',
    );
    return '$_temp0';
  }

  @override
  String get redactOtherPdf => 'Outro PDF';

  @override
  String get redactAction => 'Tarjar';

  @override
  String get redactProgress => 'Tarjando…';

  @override
  String get cropEmptyTitle => 'Recortar as margens';

  @override
  String get cropEmptyBody =>
      'Escolha um PDF e depois arraste o dedo sobre a prévia para delimitar a área a manter.';

  @override
  String get cropTooSmall => 'A área selecionada é pequena demais.';

  @override
  String get cropProgress => 'Recortando…';

  @override
  String cropFailed(String detail) {
    return 'Falha ao recortar: $detail';
  }

  @override
  String get cropKeptArea => 'Área mantida';

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
  String get cropFullPage => 'Página inteira';

  @override
  String get cropAllPages => 'Aplicar a todas as páginas';

  @override
  String get cropAllPagesOn => 'A mesma área é recortada em cada página.';

  @override
  String get cropAllPagesOff =>
      'Só a página 1 é recortada, as outras ficam inteiras.';

  @override
  String get cropCaveat =>
      'O recorte reduz o tamanho da página: o conteúdo fora da área não é mais exibido nem impresso.';

  @override
  String get cropAction => 'Recortar';

  @override
  String get compareTitle => 'Comparar dois PDF';

  @override
  String get compareEmptyTitle => 'O que mudou';

  @override
  String get compareEmptyBody =>
      'Escolha duas versões de um mesmo PDF. Os trechos acrescentados e removidos serão postos lado a lado, página por página.';

  @override
  String get compareSlotA => 'Arquivo A';

  @override
  String get compareSlotB => 'Arquivo B';

  @override
  String get compareAction => 'Comparar';

  @override
  String get compareProgress => 'Comparando…';

  @override
  String compareFailed(String detail) {
    return 'Falha na comparação: $detail';
  }

  @override
  String compareChangedPages(int changed, int total) {
    String _temp0 = intl.Intl.pluralLogic(
      changed,
      locale: localeName,
      other: '$changed páginas diferem',
      one: '$changed página difere',
    );
    return '$_temp0 de $total';
  }

  @override
  String get compareNoDifference =>
      'Nenhuma diferença detectada entre os dois arquivos.';

  @override
  String comparePageHeading(int number) {
    return 'Página $number';
  }

  @override
  String organizeFilesCreated(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count arquivos criados',
      one: '$count arquivo criado',
    );
    return '$_temp0';
  }

  @override
  String organizePartTitle(int number) {
    return 'Parte $number';
  }
}
