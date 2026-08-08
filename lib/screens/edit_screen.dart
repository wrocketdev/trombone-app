import 'dart:math' as math;
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

import '../core/files/file_utils.dart';
import '../core/pdf/edit_engine.dart';
import '../widgets/progress_dialog.dart';
import 'preview_screen.dart';
import '../widgets/ui/empty_state.dart';

enum _EditMode { text, highlight }

class _PageImage {
  const _PageImage(this.bytes, this.aspectRatio);
  final Uint8List bytes;
  final double aspectRatio;
}

class EditScreen extends StatefulWidget {
  const EditScreen({super.key});

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  Uint8List? _pdfBytes;
  String? _fileName;
  int _pageCount = 0;
  int _pageIndex = 0;
  bool _busy = false;
  _EditMode _mode = _EditMode.text;

  Future<_PageImage>? _pageImageFuture;

  final Map<int, List<EditAnnotation>> _annotationsByPage = {};
  final List<int> _order = [];

  Offset? _dragStartFrac;
  Offset? _dragCurrentFrac;

  int get _totalAnnotations => _order.length;

  Future<void> _pickFile() async {
    setState(() => _busy = true);
    try {
      final files = await FileUtils.pickFiles(allowMultiple: false);
      if (files.isEmpty) return;
      final file = files.first;
      final ext = (file.extension ?? file.name.split('.').last).toLowerCase();
      if (ext != 'pdf') {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Veuillez choisir un fichier PDF.')),
          );
        }
        return;
      }
      final doc = await FileUtils.buildSourceDoc(file);
      final bytes = await FileUtils.cachedPdfBytes(doc);
      doc.dispose();
      final pageCount = await FileUtils.pdfPageCount(bytes);
      setState(() {
        _pdfBytes = bytes;
        _fileName = file.name;
        _pageCount = pageCount;
        _pageIndex = 0;
        _annotationsByPage.clear();
        _order.clear();
        _dragStartFrac = null;
        _dragCurrentFrac = null;
      });
      _loadPage(0);
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Impossible d\'ouvrir : $e')));
      }
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  void _loadPage(int index) {
    setState(() {
      _pageIndex = index;
      _pageImageFuture = _loadPageImage(index);
      _dragStartFrac = null;
      _dragCurrentFrac = null;
    });
  }

  Future<_PageImage> _loadPageImage(int index) async {
    final bytes = await FileUtils.renderPdfPageThumbnail(
      _pdfBytes!,
      pageNumber: index + 1,
      targetWidth: 700,
    );
    final codec = await ui.instantiateImageCodec(bytes);
    final frame = await codec.getNextFrame();
    final ratio = frame.image.width / frame.image.height;
    frame.image.dispose();
    return _PageImage(bytes, ratio);
  }

  double _clampFrac(double v) => v.clamp(0.0, 1.0);

  Rect? get _dragPreviewRect {
    final start = _dragStartFrac;
    final current = _dragCurrentFrac;
    if (start == null || current == null) return null;
    return Rect.fromLTRB(
      math.min(start.dx, current.dx),
      math.min(start.dy, current.dy),
      math.max(start.dx, current.dx),
      math.max(start.dy, current.dy),
    );
  }

  Future<void> _onTapUp(TapUpDetails details, Size boxSize) async {
    final dx = _clampFrac(details.localPosition.dx / boxSize.width);
    final dy = _clampFrac(details.localPosition.dy / boxSize.height);
    await _promptTextAnnotation(dx, dy);
  }

  void _onPanStart(DragStartDetails details, Size boxSize) {
    final dx = _clampFrac(details.localPosition.dx / boxSize.width);
    final dy = _clampFrac(details.localPosition.dy / boxSize.height);
    setState(() {
      _dragStartFrac = Offset(dx, dy);
      _dragCurrentFrac = Offset(dx, dy);
    });
  }

  void _onPanUpdate(DragUpdateDetails details, Size boxSize) {
    if (_dragStartFrac == null) return;
    final dx = _clampFrac(details.localPosition.dx / boxSize.width);
    final dy = _clampFrac(details.localPosition.dy / boxSize.height);
    setState(() => _dragCurrentFrac = Offset(dx, dy));
  }

  void _onPanEnd(DragEndDetails details) {
    final rect = _dragPreviewRect;
    setState(() {
      _dragStartFrac = null;
      _dragCurrentFrac = null;
    });
    if (rect == null || rect.width < 0.01 || rect.height < 0.01) return;
    setState(() {
      _annotationsByPage
          .putIfAbsent(_pageIndex, () => [])
          .add(
            EditAnnotation.highlight(
              dx: rect.left,
              dy: rect.top,
              w: rect.width,
              h: rect.height,
            ),
          );
      _order.add(_pageIndex);
    });
  }

  Future<void> _promptTextAnnotation(double fracDx, double fracDy) async {
    final controller = TextEditingController();
    double fontSize = 16;
    final result = await showDialog<Map<String, Object>>(
      context: context,
      builder: (dialogContext) {
        return StatefulBuilder(
          builder: (dialogContext, setDialogState) {
            return AlertDialog(
              title: const Text('Ajouter du texte'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    controller: controller,
                    autofocus: true,
                    decoration: const InputDecoration(hintText: 'Votre texte'),
                  ),
                  const SizedBox(height: 16),
                  Text('Taille du texte : ${fontSize.round()}'),
                  Slider(
                    value: fontSize,
                    min: 10,
                    max: 48,
                    divisions: 38,
                    label: '${fontSize.round()}',
                    onChanged: (v) => setDialogState(() => fontSize = v),
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(dialogContext).pop(),
                  child: const Text('Annuler'),
                ),
                FilledButton(
                  onPressed: () => Navigator.of(
                    dialogContext,
                  ).pop({'text': controller.text.trim(), 'fontSize': fontSize}),
                  child: const Text('Ajouter'),
                ),
              ],
            );
          },
        );
      },
    );
    controller.dispose();
    if (result == null) return;
    final text = result['text'] as String;
    if (text.isEmpty) return;
    setState(() {
      _annotationsByPage
          .putIfAbsent(_pageIndex, () => [])
          .add(
            EditAnnotation.text(
              dx: fracDx,
              dy: fracDy,
              text: text,
              fontSize: result['fontSize'] as double,
            ),
          );
      _order.add(_pageIndex);
    });
  }

  void _undo() {
    if (_order.isEmpty) return;
    setState(() {
      final lastPage = _order.removeLast();
      _annotationsByPage[lastPage]?.removeLast();
    });
  }

  Future<void> _finish() async {
    final bytes = _pdfBytes;
    if (bytes == null) return;
    if (_order.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Ajoutez au moins une annotation avant de terminer.'),
        ),
      );
      return;
    }
    try {
      final result = await runWithProgressDialog<Uint8List>(
        context: context,
        title: 'Application des annotations…',
        task: (_, _) => EditEngine.apply(bytes, _annotationsByPage),
      );
      if (result == null || !mounted) return;
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => PreviewScreen(
            pdfBytes: result,
            suggestedName: FileUtils.derivedName(_fileName, 'edite'),
          ),
        ),
      );
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Échec : $e')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _pdfBytes == null
              ? 'Éditer PDF'
              : 'Page ${_pageIndex + 1} / $_pageCount',
        ),
        actions: [
          if (_pdfBytes != null)
            IconButton(
              tooltip: 'Choisir un autre PDF',
              icon: const Icon(Icons.folder_open_outlined),
              onPressed: _busy ? null : _pickFile,
            ),
        ],
      ),
      body: _pdfBytes == null ? _buildEmptyState() : _buildEditor(),
      bottomNavigationBar: _pdfBytes == null
          ? null
          : SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    Badge(
                      isLabelVisible: _totalAnnotations > 0,
                      label: Text('$_totalAnnotations', maxLines: 1),
                      child: IconButton.filledTonal(
                        tooltip: 'Annuler la dernière annotation',
                        icon: const Icon(Icons.undo),
                        onPressed: _order.isEmpty ? null : _undo,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: FilledButton.icon(
                        onPressed: _finish,
                        icon: const Icon(Icons.check),
                        label: const Text('Terminer', maxLines: 1),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }

  Widget _buildEmptyState() {
    return EmptyState(
      icon: Icons.edit_note_outlined,
      title: 'Annoter un document',
      body:
          'Ajoutez du texte ou surlignez des passages directement sur '
          'un PDF existant.',
      accepts: const ['PDF'],
      actionLabel: 'Choisir un PDF',
      onAction: _pickFile,
      busy: _busy,
    );
  }

  Widget _buildEditor() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  _fileName ?? '',
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
              SegmentedButton<_EditMode>(
                segments: const [
                  ButtonSegment(
                    value: _EditMode.text,
                    label: Text('Texte', maxLines: 1),
                    icon: Icon(Icons.text_fields),
                  ),
                  ButtonSegment(
                    value: _EditMode.highlight,
                    label: Text('Surligner', maxLines: 1),
                    icon: Icon(Icons.border_color),
                  ),
                ],
                selected: {_mode},
                onSelectionChanged: (s) => setState(() => _mode = s.first),
              ),
            ],
          ),
        ),
        Expanded(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: FutureBuilder<_PageImage>(
                future: _pageImageFuture,
                builder: (context, snap) {
                  if (snap.connectionState != ConnectionState.done) {
                    return const CircularProgressIndicator();
                  }
                  if (snap.hasError || snap.data == null) {
                    return const Text('Impossible d\'afficher cette page.');
                  }
                  return _buildPageCanvas(snap.data!);
                },
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.chevron_left),
                onPressed: _pageIndex > 0
                    ? () => _loadPage(_pageIndex - 1)
                    : null,
              ),
              Text('Page ${_pageIndex + 1} / $_pageCount'),
              IconButton(
                icon: const Icon(Icons.chevron_right),
                onPressed: _pageIndex < _pageCount - 1
                    ? () => _loadPage(_pageIndex + 1)
                    : null,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPageCanvas(_PageImage pageImage) {
    final annotations = _annotationsByPage[_pageIndex] ?? const [];
    return AspectRatio(
      aspectRatio: pageImage.aspectRatio,
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).dividerColor),
        ),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final size = constraints.biggest;
            final dragRect = _dragPreviewRect;
            return GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTapUp: _mode == _EditMode.text
                  ? (d) => _onTapUp(d, size)
                  : null,
              onPanStart: _mode == _EditMode.highlight
                  ? (d) => _onPanStart(d, size)
                  : null,
              onPanUpdate: _mode == _EditMode.highlight
                  ? (d) => _onPanUpdate(d, size)
                  : null,
              onPanEnd: _mode == _EditMode.highlight ? _onPanEnd : null,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.memory(
                    pageImage.bytes,
                    fit: BoxFit.fill,
                    gaplessPlayback: true,
                  ),
                  for (final ann in annotations)
                    if (ann.type == EditAnnotationType.highlight)
                      Positioned(
                        left: ann.dx * size.width,
                        top: ann.dy * size.height,
                        width: ann.w * size.width,
                        height: ann.h * size.height,
                        child: Container(color: Colors.yellow.withAlpha(90)),
                      )
                    else
                      Positioned(
                        left: ann.dx * size.width,
                        top: ann.dy * size.height,
                        child: Text(
                          ann.text,
                          style: TextStyle(
                            fontSize: ann.fontSize * (size.width / 700.0),
                            color: Colors.black,
                          ),
                        ),
                      ),
                  if (dragRect != null)
                    Positioned(
                      left: dragRect.left * size.width,
                      top: dragRect.top * size.height,
                      width: dragRect.width * size.width,
                      height: dragRect.height * size.height,
                      child: Container(color: Colors.yellow.withAlpha(90)),
                    ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
