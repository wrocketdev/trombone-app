import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';

import '../core/ads/ad_service.dart';
import '../core/files/export_service.dart';
import '../core/files/file_utils.dart';
import '../core/pdf/compressor.dart';
import '../l10n/l10n.dart';
import '../theme/theme.dart';
import '../widgets/page_thumb.dart';
import '../widgets/progress_dialog.dart';
import '../widgets/ui/export_action_bar.dart';
import '../widgets/ui/export_outcome.dart';

class PreviewScreen extends StatefulWidget {
  const PreviewScreen({
    super.key,
    required this.pdfBytes,
    required this.suggestedName,
  });

  final Uint8List pdfBytes;
  final String suggestedName;

  @override
  State<PreviewScreen> createState() => _PreviewScreenState();
}

class _PreviewScreenState extends State<PreviewScreen> {
  late Uint8List _currentBytes = widget.pdfBytes;
  int? _pageCount;
  bool _compressed = false;
  bool _busy = false;

  @override
  void initState() {
    super.initState();
    _refreshPageCount();
  }

  Future<void> _refreshPageCount() async {
    final n = await FileUtils.pdfPageCount(_currentBytes);
    if (mounted) setState(() => _pageCount = n);
  }

  String _formatSize(int bytes) => formatFileSize(context.l10n, bytes);

  Future<void> _openCompressSheet() async {
    final result = await showModalBottomSheet<Uint8List>(
      context: context,
      isScrollControlled: true,
      builder: (context) => _CompressSheet(originalBytes: widget.pdfBytes),
    );
    if (result != null && mounted) {
      setState(() {
        _currentBytes = result;
        _compressed = true;
      });
      _refreshPageCount();
    }
  }

  void _resetCompression() {
    setState(() {
      _currentBytes = widget.pdfBytes;
      _compressed = false;
    });
    _refreshPageCount();
  }

  Future<void> _save() async {
    setState(() => _busy = true);
    try {
      final bool ok = await ExportService.saveToDevice(
        _currentBytes,
        widget.suggestedName,
        dialogTitle: context.l10n.exportSaveDialogTitle,
      );
      if (ok && mounted) {
        final int n = _pageCount ?? 0;
        final bool done = await showExportSuccess(
          context,
          what: context.l10n.previewExportWhat(n),
          onShare: _share,
        );
        // « Terminé » terminait la feuille, pas le parcours : après la
        // publicité, on retombait sur cet écran d'aperçu, avec son bouton
        // « Enregistrer » intact, comme si rien n'avait eu lieu. Le seul geste
        // qui dit « j'ai fini » ramenait à l'endroit qu'on venait de quitter.
        // Il rend maintenant la main à l'outil.
        if (done && mounted) Navigator.of(context).pop();
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(context.l10n.errorExportFailed('$e'))),
        );
      }
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  Future<void> _share() async {
    setState(() => _busy = true);
    try {
      await ExportService.share(_currentBytes, widget.suggestedName);
      unawaited(AdService.instance.showAfterSuccessfulExport());
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(context.l10n.errorShareFailed('$e'))),
        );
      }
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  static int _columnsFor(int pages) {
    if (pages <= 2) return 2;
    if (pages <= 9) return 3;
    return 4;
  }

  /// Ouvre une page en plein écran, zoomable.
  ///
  /// L'écran s'appelle « Aperçu » et ne permettait d'apercevoir rien du tout :
  /// les vignettes n'étaient pas touchables, et à 110 dp de large une page A4
  /// ne laisse lire aucune ligne. On enregistrait donc sans avoir jamais pu
  /// vérifier le contenu — sur le seul écran dont c'est la fonction.
  Future<void> _openPage(int pageNumber, int total) async {
    await Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => _PageViewerScreen(
          bytes: _currentBytes,
          initialPage: pageNumber,
          totalPages: total,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final int n = _pageCount ?? 0;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.l10n.previewTitle(_formatSize(_currentBytes.length)),
        ),
        actions: [
          // Le libellé était écrit en blanc en dur : invisible sur le papier
          // clair. Il prend maintenant la couleur d'accent du thème, comme
          // tout bouton de texte.
          if (_compressed)
            TextButton(
              onPressed: _resetCompression,
              child: Text(context.l10n.actionUndo, maxLines: 1),
            ),
        ],
      ),
      body: _pageCount == null
          ? const Center(child: CircularProgressIndicator())
          : GridView.builder(
              padding: const EdgeInsets.all(Space.sm),
              // Le nombre de colonnes suit le nombre de pages. À trois
              // colonnes fixes, un document de deux pages produisait deux
              // vignettes de la taille d'un timbre suivies de mille pixels de
              // vide — sur un écran dont le titre annonce « Aperçu ». Peu de
              // pages : on les montre grandes, puisqu'il y a la place.
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: _columnsFor(n),
                mainAxisSpacing: Space.xs,
                crossAxisSpacing: Space.xs,
                childAspectRatio: 0.72,
              ),
              itemCount: n,
              itemBuilder: (context, i) => _PreviewPage(
                number: i + 1,
                bytes: _currentBytes,
                onOpen: () => _openPage(i + 1, n),
              ),
            ),
      bottomNavigationBar: ExportActionBar(
        busy: _busy,
        onSave: _save,
        onShare: _share,
        onCompress: _openCompressSheet,
      ),
    );
  }
}

/// Une vignette de l'aperçu : la page, son numéro, et le geste qui l'ouvre.
class _PreviewPage extends StatelessWidget {
  const _PreviewPage({
    required this.number,
    required this.bytes,
    required this.onOpen,
  });

  final int number;
  final Uint8List bytes;
  final VoidCallback onOpen;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Semantics(
      button: true,
      label: context.l10n.previewZoomPage(number),
      child: InkWell(
        onTap: onOpen,
        borderRadius: Radii.allXs,
        child: Column(
          children: [
            Expanded(
              child: PageThumb(
                bytesFuture: FileUtils.renderPdfPageThumbnail(
                  bytes,
                  pageNumber: number,
                  targetWidth: 320,
                ),
              ),
            ),
            const SizedBox(height: Space.xxs),
            Text(
              '$number',
              style: AppTypography.microNumeric.copyWith(
                color: colors.inkMuted,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Une page, en grand, zoomable, avec navigation d'une page à l'autre.
class _PageViewerScreen extends StatefulWidget {
  const _PageViewerScreen({
    required this.bytes,
    required this.initialPage,
    required this.totalPages,
  });

  final Uint8List bytes;
  final int initialPage;
  final int totalPages;

  @override
  State<_PageViewerScreen> createState() => _PageViewerScreenState();
}

class _PageViewerScreenState extends State<_PageViewerScreen> {
  late final PageController _controller = PageController(
    initialPage: widget.initialPage - 1,
  );
  late int _current = widget.initialPage;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.pageOfTotal(_current, widget.totalPages)),
      ),
      body: PageView.builder(
        controller: _controller,
        itemCount: widget.totalPages,
        onPageChanged: (i) => setState(() => _current = i + 1),
        itemBuilder: (context, i) => InteractiveViewer(
          maxScale: 5,
          child: Padding(
            padding: const EdgeInsets.all(Space.sm),
            child: FutureBuilder<Uint8List>(
              // Rendu à pleine largeur d'écran, pas à celle de la vignette :
              // c'est tout l'intérêt de l'agrandissement.
              future: FileUtils.renderPdfPageThumbnail(
                widget.bytes,
                pageNumber: i + 1,
                targetWidth: 1400,
              ),
              builder: (context, snap) {
                if (snap.connectionState != ConnectionState.done) {
                  return Center(
                    child: CircularProgressIndicator(color: colors.accent),
                  );
                }
                if (snap.hasError || snap.data == null) {
                  return Center(
                    child: Text(
                      context.l10n.previewPageUnreadable,
                      style: AppTypography.body.copyWith(
                        color: colors.inkMuted,
                      ),
                    ),
                  );
                }
                return Center(
                  child: Image.memory(snap.data!, fit: BoxFit.contain),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class _CompressSheet extends StatefulWidget {
  const _CompressSheet({required this.originalBytes});
  final Uint8List originalBytes;

  @override
  State<_CompressSheet> createState() => _CompressSheetState();
}

class _CompressSheetState extends State<_CompressSheet> {
  final Map<CompressionLevel, int?> _estimates = {
    for (final l in CompressionLevel.values) l: null,
  };

  @override
  void initState() {
    super.initState();
    for (final level in CompressionLevel.values) {
      Compressor.estimateSize(widget.originalBytes, level).then((size) {
        if (mounted) setState(() => _estimates[level] = size);
      });
    }
  }

  String _formatSize(int bytes) => formatFileSize(context.l10n, bytes);

  Future<void> _apply(CompressionLevel level) async {
    try {
      final bytes = await runWithProgressDialog<Uint8List>(
        context: context,
        title: context.l10n.compressProgress,
        task: (token, onProgress) => Compressor.compress(
          widget.originalBytes,
          level,
          onProgress: onProgress,
          cancelToken: token,
        ),
      );
      if (bytes != null && mounted) {
        Navigator.of(context).pop(bytes);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(context.l10n.compressFailed('$e'))),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              context.l10n.compressTitle,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 4),
            Text(
              context.l10n.compressBody(
                _formatSize(widget.originalBytes.length),
              ),
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: 12),
            for (final level in CompressionLevel.values)
              ListTile(
                leading: const Icon(Icons.picture_as_pdf_outlined),
                title: Text(level.label(context.l10n)),
                subtitle: Text(
                  _estimates[level] == null
                      ? context.l10n.compressEstimating
                      : context.l10n.sizeApprox(
                          _formatSize(_estimates[level]!),
                        ),
                ),
                trailing: FilledButton(
                  onPressed: () => _apply(level),
                  child: Text(context.l10n.actionApply),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
