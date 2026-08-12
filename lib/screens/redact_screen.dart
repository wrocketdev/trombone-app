import 'dart:math' as math;
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

import '../core/files/file_utils.dart';
import '../core/pdf/redact_engine.dart';
import '../l10n/l10n.dart';
import '../core/pdf/security_engine.dart';
import '../widgets/progress_dialog.dart';
import 'preview_screen.dart';

/// A rendered preview of one page, with the aspect ratio needed to lay the
/// drawing surface out before the image itself is measured.
class _RenderedPage {
  const _RenderedPage(this.bytes, this.aspect);
  final Uint8List bytes;
  final double aspect; // largeur / hauteur
}

/// A committed redaction box together with the page it belongs to. Kept in a
/// flat, chronological list so "Annuler" can undo the last box drawn whatever
/// page it was on.
class _PlacedRect {
  const _PlacedRect(this.pageIndex, this.rect);
  final int pageIndex;
  final RedactRect rect;
}

/// Permanently removes chosen areas from a PDF: the boxes are painted, then
/// every page is re-imaged so the hidden text is gone from the file.
class RedactScreen extends StatefulWidget {
  const RedactScreen({super.key});

  @override
  State<RedactScreen> createState() => _RedactScreenState();
}

class _RedactScreenState extends State<RedactScreen> {
  static const double _maxPageWidth = 700;
  static const double _minDragPx = 6;

  PickedPdf? _picked;
  int _pageCount = 0;
  int _pageIndex = 0;
  bool _busy = false;

  final Map<int, _RenderedPage> _pages = <int, _RenderedPage>{};
  final List<_PlacedRect> _placed = <_PlacedRect>[];

  Offset? _dragStart;
  Offset? _dragEnd;

  void _showError(String message) {
    if (!mounted) return;
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  Future<void> _pick() async {
    final L l10n = context.l10n;
    setState(() => _busy = true);
    try {
      final PickedPdf? picked = await SecurityEngine.pickPdfFile();
      if (picked == null) return;
      final int count = await FileUtils.pdfPageCount(picked.bytes);
      if (count == 0) {
        _showError(l10n.redactEmptyPdf);
        return;
      }
      if (!mounted) return;
      setState(() {
        _picked = picked;
        _pageCount = count;
        _pageIndex = 0;
        _pages.clear();
        _placed.clear();
        _dragStart = null;
        _dragEnd = null;
      });
      await _loadPage(0);
    } catch (e) {
      _showError(l10n.redactOpenFailed('$e'));
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  Future<void> _loadPage(int index) async {
    final PickedPdf? picked = _picked;
    if (picked == null || _pages.containsKey(index)) return;
    try {
      final Uint8List bytes = await FileUtils.renderPdfPageThumbnail(
        picked.bytes,
        pageNumber: index + 1,
        targetWidth: _maxPageWidth,
      );
      final ui.Codec codec = await ui.instantiateImageCodec(bytes);
      final ui.FrameInfo frame = await codec.getNextFrame();
      final double aspect = frame.image.height == 0
          ? 1 / math.sqrt2
          : frame.image.width / frame.image.height;
      frame.image.dispose();
      codec.dispose();
      if (!mounted) return;
      setState(() => _pages[index] = _RenderedPage(bytes, aspect));
    } catch (e) {
      _showError(context.l10n.redactPageRenderFailed(index + 1, '$e'));
    }
  }

  void _goToPage(int index) {
    if (index < 0 || index >= _pageCount || index == _pageIndex) return;
    setState(() {
      _pageIndex = index;
      _dragStart = null;
      _dragEnd = null;
    });
    _loadPage(index);
  }

  void _undo() {
    if (_placed.isEmpty) return;
    final _PlacedRect last = _placed.removeLast();
    setState(() {
      _dragStart = null;
      _dragEnd = null;
      if (last.pageIndex != _pageIndex) _pageIndex = last.pageIndex;
    });
    _loadPage(_pageIndex);
  }

  void _commitDrag(double displayWidth, double displayHeight) {
    final Offset? start = _dragStart;
    final Offset? end = _dragEnd;
    setState(() {
      _dragStart = null;
      _dragEnd = null;
    });
    if (start == null || end == null) return;
    final Rect raw = Rect.fromPoints(start, end);
    if (raw.width < _minDragPx || raw.height < _minDragPx) return;
    final Rect box = raw.intersect(
      Rect.fromLTWH(0, 0, displayWidth, displayHeight),
    );
    if (box.width < _minDragPx || box.height < _minDragPx) return;
    setState(() {
      _placed.add(
        _PlacedRect(
          _pageIndex,
          RedactRect(
            left: box.left / displayWidth,
            top: box.top / displayHeight,
            width: box.width / displayWidth,
            height: box.height / displayHeight,
          ),
        ),
      );
    });
  }

  Future<void> _apply() async {
    final PickedPdf? picked = _picked;
    if (picked == null || _placed.isEmpty) return;
    final L l10n = context.l10n;
    final Map<int, List<RedactRect>> byPage = <int, List<RedactRect>>{};
    for (final _PlacedRect placed in _placed) {
      byPage
          .putIfAbsent(placed.pageIndex, () => <RedactRect>[])
          .add(placed.rect);
    }
    try {
      final Uint8List? bytes = await runWithProgressDialog<Uint8List>(
        context: context,
        title: l10n.redactProgress,
        task: (token, onProgress) => RedactEngine.redact(
          picked.bytes,
          rectsByPage: byPage,
          onProgress: onProgress,
          cancelToken: token,
        ),
      );
      if (bytes == null || !mounted) return;
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => PreviewScreen(
            pdfBytes: bytes,
            suggestedName: FileUtils.derivedName(_picked?.name, 'caviarde'),
          ),
        ),
      );
    } catch (e) {
      _showError(l10n.errorGeneric('$e'));
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool hasFile = _picked != null;
    final L l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.toolRedact),
        actions: [
          if (hasFile)
            IconButton(
              tooltip: l10n.redactUndoTooltip,
              onPressed: _placed.isEmpty ? null : _undo,
              icon: Badge.count(
                count: _placed.length,
                isLabelVisible: _placed.isNotEmpty,
                child: const Icon(Icons.undo),
              ),
            ),
        ],
      ),
      body: hasFile ? _editorBody() : _pickBody(),
      bottomNavigationBar: hasFile ? _bottomBar() : null,
    );
  }

  Widget _pickBody() {
    final L l10n = context.l10n;
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Text(l10n.redactIntro),
        const SizedBox(height: 20),
        Card(
          child: ListTile(
            leading: const Icon(Icons.upload_file),
            title: Text(l10n.actionChoosePdf),
            subtitle: Text(l10n.redactChooseSubtitle),
            onTap: _busy ? null : _pick,
          ),
        ),
        const SizedBox(height: 20),
        Card(
          color: Theme.of(context).colorScheme.surfaceContainerHighest,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              l10n.redactCaveat,
              style: const TextStyle(fontSize: 13),
            ),
          ),
        ),
        if (_busy) ...[
          const SizedBox(height: 20),
          const Center(child: CircularProgressIndicator()),
        ],
      ],
    );
  }

  Widget _editorBody() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _picked!.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const SizedBox(height: 4),
              Text(context.l10n.redactInstructions),
            ],
          ),
        ),
        Expanded(child: _pageArea()),
        _pager(),
      ],
    );
  }

  Widget _pageArea() {
    final _RenderedPage? page = _pages[_pageIndex];
    if (page == null) {
      return const Center(child: CircularProgressIndicator());
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: LayoutBuilder(
        builder: (context, constraints) {
          double width = math.min(constraints.maxWidth, _maxPageWidth);
          double height = width / page.aspect;
          if (constraints.maxHeight.isFinite &&
              height > constraints.maxHeight) {
            height = constraints.maxHeight;
            width = height * page.aspect;
          }
          final List<_PlacedRect> onPage = _placed
              .where((p) => p.pageIndex == _pageIndex)
              .toList();
          final Rect? live = (_dragStart != null && _dragEnd != null)
              ? Rect.fromPoints(_dragStart!, _dragEnd!)
              : null;

          return Center(
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onPanDown: (d) => setState(() {
                _dragStart = d.localPosition;
                _dragEnd = d.localPosition;
              }),
              onPanUpdate: (d) => setState(() => _dragEnd = d.localPosition),
              onPanEnd: (_) => _commitDrag(width, height),
              onPanCancel: () => setState(() {
                _dragStart = null;
                _dragEnd = null;
              }),
              child: SizedBox(
                width: width,
                height: height,
                child: Stack(
                  clipBehavior: Clip.hardEdge,
                  children: [
                    Positioned.fill(
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Theme.of(context).dividerColor,
                          ),
                        ),
                        child: Image.memory(
                          page.bytes,
                          fit: BoxFit.fill,
                          gaplessPlayback: true,
                        ),
                      ),
                    ),
                    for (final _PlacedRect placed in onPage)
                      Positioned(
                        left: placed.rect.left * width,
                        top: placed.rect.top * height,
                        width: placed.rect.width * width,
                        height: placed.rect.height * height,
                        child: const ColoredBox(color: Colors.black),
                      ),
                    if (live != null)
                      Positioned(
                        left: live.left,
                        top: live.top,
                        width: live.width,
                        height: live.height,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: Colors.black.withValues(alpha: 0.6),
                            border: Border.all(
                              color: Theme.of(context).colorScheme.primary,
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _pager() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            tooltip: context.l10n.redactPagePrevious,
            onPressed: _pageIndex > 0 ? () => _goToPage(_pageIndex - 1) : null,
            icon: const Icon(Icons.chevron_left),
          ),
          Text(
            context.l10n.redactPager(_pageIndex + 1, _pageCount),
            style: Theme.of(context).textTheme.titleSmall,
          ),
          IconButton(
            tooltip: context.l10n.redactPageNext,
            onPressed: _pageIndex < _pageCount - 1
                ? () => _goToPage(_pageIndex + 1)
                : null,
            icon: const Icon(Icons.chevron_right),
          ),
        ],
      ),
    );
  }

  Widget _bottomBar() {
    final L l10n = context.l10n;
    final int count = _placed.length;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              count == 0 ? l10n.redactNoZone : l10n.redactZoneCount(count),
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: _busy ? null : _pick,
                    icon: const Icon(Icons.folder_open),
                    label: Text(l10n.redactOtherPdf, maxLines: 1),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: FilledButton.icon(
                    onPressed: (_busy || count == 0) ? null : _apply,
                    icon: const Icon(Icons.format_color_fill),
                    label: Text(l10n.redactAction, maxLines: 1),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
