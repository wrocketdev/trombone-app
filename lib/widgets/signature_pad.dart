import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

/// A blank canvas the user draws their signature on with a finger. Each
/// continuous drag becomes one stroke; a `null` entry in the points list
/// marks the gap between two strokes (pen lifted).
///
/// The parent controls this widget through a `GlobalKey<SignaturePadState>`:
/// call [SignaturePadState.exportPng] to capture the drawing as PNG bytes
/// and [SignaturePadState.clear] to reset it.
class SignaturePad extends StatefulWidget {
  const SignaturePad({super.key, required this.onChanged});

  final ValueChanged<List<Offset?>> onChanged;

  @override
  SignaturePadState createState() => SignaturePadState();
}

class SignaturePadState extends State<SignaturePad> {
  final GlobalKey _repaintKey = GlobalKey();
  final List<Offset?> _points = <Offset?>[];

  bool get isEmpty => _points.every((p) => p == null);

  void clear() {
    setState(_points.clear);
    widget.onChanged(_points);
  }

  void _addPoint(Offset? point) {
    setState(() => _points.add(point));
    widget.onChanged(_points);
  }

  /// Captures the current drawing as PNG bytes with a transparent
  /// background, or null if nothing has been drawn yet.
  Future<Uint8List?> exportPng() async {
    if (isEmpty) return null;
    final RenderObject? renderObject = _repaintKey.currentContext
        ?.findRenderObject();
    if (renderObject is! RenderRepaintBoundary) return null;
    final ui.Image image = await renderObject.toImage(pixelRatio: 3);
    try {
      final ByteData? byteData = await image.toByteData(
        format: ui.ImageByteFormat.png,
      );
      if (byteData == null) return null;
      return byteData.buffer.asUint8List();
    } finally {
      image.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanStart: (details) =>
          _addPoint(_localPosition(details.globalPosition)),
      onPanUpdate: (details) =>
          _addPoint(_localPosition(details.globalPosition)),
      onPanEnd: (_) => _addPoint(null),
      child: RepaintBoundary(
        key: _repaintKey,
        child: CustomPaint(
          painter: _SignaturePainter(_points),
          child: const SizedBox.expand(),
        ),
      ),
    );
  }

  Offset _localPosition(Offset globalPosition) {
    final RenderBox box = context.findRenderObject()! as RenderBox;
    return box.globalToLocal(globalPosition);
  }
}

class _SignaturePainter extends CustomPainter {
  _SignaturePainter(this.points);

  final List<Offset?> points;

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 4
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..style = PaintingStyle.stroke;

    Path? currentPath;
    for (final Offset? point in points) {
      if (point == null) {
        if (currentPath != null) canvas.drawPath(currentPath, paint);
        currentPath = null;
        continue;
      }
      if (currentPath == null) {
        currentPath = Path()..moveTo(point.dx, point.dy);
      } else {
        currentPath.lineTo(point.dx, point.dy);
      }
    }
    if (currentPath != null) canvas.drawPath(currentPath, paint);
  }

  @override
  bool shouldRepaint(covariant _SignaturePainter oldDelegate) =>
      oldDelegate.points != points;
}
