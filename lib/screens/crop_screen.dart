import 'dart:typed_data';

import 'package:flutter/material.dart';

import '../core/files/file_utils.dart';
import '../core/pdf/crop_engine.dart';
import '../core/pdf/security_engine.dart';
import '../widgets/progress_dialog.dart';
import '../widgets/ui/empty_state.dart';
import '../widgets/ui/picked_file_card.dart';
import 'preview_screen.dart';

class CropScreen extends StatefulWidget {
  const CropScreen({super.key});

  @override
  State<CropScreen> createState() => _CropScreenState();
}

class _CropScreenState extends State<CropScreen> {
  PickedPdf? _picked;
  PdfFirstPageInfo? _info;
  Uint8List? _preview;
  CropRect _rect = const CropRect(
    left: 0.08,
    top: 0.08,
    right: 0.92,
    bottom: 0.92,
  );
  bool _allPages = true;
  bool _busy = false;

  Offset? _dragAnchor;

  void _showError(String message) {
    if (!mounted) return;
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  Future<void> _pick() async {
    setState(() => _busy = true);
    try {
      final PickedPdf? picked = await SecurityEngine.pickPdfFile();
      if (picked == null) return;
      final PdfFirstPageInfo info = CropEngine.firstPageInfo(picked.bytes);
      final Uint8List thumb = await FileUtils.renderPdfPageThumbnail(
        picked.bytes,
        targetWidth: 700,
      );
      if (!mounted) return;
      setState(() {
        _picked = picked;
        _info = info;
        _preview = thumb;
        _rect = const CropRect(
          left: 0.08,
          top: 0.08,
          right: 0.92,
          bottom: 0.92,
        );
        _allPages = true;
      });
    } catch (e) {
      _showError('Impossible d\'ouvrir ce PDF : $e');
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  void _updateFromDrag(Offset anchor, Offset current, Size box) {
    final double w = box.width <= 0 ? 1 : box.width;
    final double h = box.height <= 0 ? 1 : box.height;
    final double x1 = (anchor.dx / w).clamp(0.0, 1.0);
    final double y1 = (anchor.dy / h).clamp(0.0, 1.0);
    final double x2 = (current.dx / w).clamp(0.0, 1.0);
    final double y2 = (current.dy / h).clamp(0.0, 1.0);
    setState(() {
      _rect = CropRect(
        left: x1 < x2 ? x1 : x2,
        top: y1 < y2 ? y1 : y2,
        right: x1 < x2 ? x2 : x1,
        bottom: y1 < y2 ? y2 : y1,
      );
    });
  }

  Future<void> _apply() async {
    final PickedPdf? picked = _picked;
    if (picked == null) return;
    if (!_rect.isUsable) {
      _showError('La zone sélectionnée est trop petite.');
      return;
    }
    try {
      final Uint8List? bytes = await runWithProgressDialog<Uint8List>(
        context: context,
        title: 'Rognage en cours…',
        task: (token, onProgress) => CropEngine.crop(
          picked.bytes,
          rect: _rect,
          allPages: _allPages,
          onProgress: onProgress,
          cancelToken: token,
        ),
      );
      if (bytes == null || !mounted) return;
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => PreviewScreen(
            pdfBytes: bytes,
            suggestedName: FileUtils.derivedName(_picked?.name, 'rogne'),
          ),
        ),
      );
    } catch (e) {
      _showError('Échec du rognage : $e');
    }
  }

  String _sizeLabel() {
    final PdfFirstPageInfo? info = _info;
    if (info == null) return '';
    final double wMm = _rect.width * info.displayedSize.width * 25.4 / 72;
    final double hMm = _rect.height * info.displayedSize.height * 25.4 / 72;
    return '${wMm.round()} × ${hMm.round()} mm '
        '(${(_rect.width * 100).round()} % × ${(_rect.height * 100).round()} %)';
  }

  @override
  Widget build(BuildContext context) {
    final PickedPdf? picked = _picked;
    final PdfFirstPageInfo? info = _info;
    final Uint8List? preview = _preview;
    final ColorScheme scheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Rogner un PDF')),
      body: picked == null
          ? EmptyState(
              icon: Icons.crop_outlined,
              title: 'Rogner les marges',
              body:
                  'Choisissez un PDF, puis faites glisser votre doigt sur l’aperçu pour délimiter la zone à conserver.',
              accepts: const ['PDF'],
              actionLabel: 'Choisir un PDF',
              onAction: _pick,
              busy: _busy,
            )
          : ListView(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 96),
              children: [
                PickedFileCard(
                  name: picked.name,
                  subtitle: '${info?.pageCount ?? 0} page(s)',
                  busy: _busy,
                  onChange: _pick,
                ),
                if (info != null && preview != null) ...[
                  const SizedBox(height: 20),
                  Text(
                    'Zone conservée',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 8),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: AspectRatio(
                      aspectRatio: info.aspectRatio,
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          final Size box = Size(
                            constraints.maxWidth,
                            constraints.maxHeight,
                          );
                          return GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            onPanStart: (d) {
                              _dragAnchor = d.localPosition;
                              _updateFromDrag(
                                d.localPosition,
                                d.localPosition,
                                box,
                              );
                            },
                            onPanUpdate: (d) {
                              final Offset? anchor = _dragAnchor;
                              if (anchor == null) return;
                              _updateFromDrag(anchor, d.localPosition, box);
                            },
                            onPanEnd: (_) => _dragAnchor = null,
                            child: Stack(
                              fit: StackFit.expand,
                              children: [
                                Image.memory(
                                  preview,
                                  fit: BoxFit.fill,
                                  gaplessPlayback: true,
                                ),
                                CustomPaint(
                                  painter: _CropPainter(
                                    rect: _rect,
                                    accent: scheme.primary,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          _sizeLabel(),
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),
                      TextButton.icon(
                        onPressed: () => setState(() => _rect = CropRect.full),
                        icon: const Icon(Icons.crop_free, size: 18),
                        label: const Text('Page entière', maxLines: 1),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Card(
                    child: SwitchListTile(
                      value: _allPages,
                      onChanged: (v) => setState(() => _allPages = v),
                      title: const Text('Appliquer à toutes les pages'),
                      subtitle: Text(
                        _allPages
                            ? 'La même zone est découpée sur chaque page.'
                            : 'Seule la page 1 est rognée, les autres sont '
                                  'conservées entières.',
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Le rognage réduit la taille de la page : le contenu situé en '
                    'dehors de la zone n\'est plus affiché ni imprimé.',
                  ),
                ],
              ],
            ),
      bottomNavigationBar: picked == null
          ? null
          : SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: FilledButton.icon(
                  onPressed: _busy ? null : _apply,
                  icon: const Icon(Icons.crop),
                  label: const Text('Rogner', maxLines: 1),
                ),
              ),
            ),
    );
  }
}

class _CropPainter extends CustomPainter {
  _CropPainter({required this.rect, required this.accent});

  final CropRect rect;
  final Color accent;

  @override
  void paint(Canvas canvas, Size size) {
    final Rect r = Rect.fromLTRB(
      rect.left * size.width,
      rect.top * size.height,
      rect.right * size.width,
      rect.bottom * size.height,
    );

    // evenOdd : un seul remplissage assombrit tout SAUF la zone conservée.
    final Path mask = Path()
      ..fillType = PathFillType.evenOdd
      ..addRect(Offset.zero & size)
      ..addRect(r);
    canvas.drawPath(mask, Paint()..color = Colors.black.withValues(alpha: 0.5));

    canvas.drawRect(
      r,
      Paint()
        ..color = accent
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2,
    );

    final Paint handle = Paint()..color = accent;
    const double hs = 5;
    for (final Offset c in <Offset>[
      r.topLeft,
      r.topRight,
      r.bottomLeft,
      r.bottomRight,
    ]) {
      canvas.drawCircle(c, hs, handle);
    }
  }

  @override
  bool shouldRepaint(covariant _CropPainter oldDelegate) =>
      oldDelegate.rect != rect || oldDelegate.accent != accent;
}
