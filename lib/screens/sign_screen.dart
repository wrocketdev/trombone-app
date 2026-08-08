import 'dart:math' as math;
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

import '../core/files/file_utils.dart';
import '../core/pdf/signature_engine.dart';
import '../models/source_doc.dart';
import '../widgets/page_thumb.dart';
import '../widgets/progress_dialog.dart';
import '../widgets/signature_pad.dart';
import 'preview_screen.dart';

enum _SignStep { pickFile, pickPage, draw, place }

/// Stamps a hand-drawn signature onto a chosen page of a PDF. This is a
/// casual visual stamp — the drawing is placed as an image on the page —
/// not a certified, cryptographic electronic signature.
class SignScreen extends StatefulWidget {
  const SignScreen({super.key});

  @override
  State<SignScreen> createState() => _SignScreenState();
}

class _SignScreenState extends State<SignScreen> {
  static const double _sigWidthFraction = 0.35;

  _SignStep _step = _SignStep.pickFile;
  SourceDoc? _doc;
  int _pageIndex = 0;
  bool _busy = false;

  final GlobalKey<SignaturePadState> _padKey = GlobalKey<SignaturePadState>();
  bool _padEmpty = true;

  Uint8List? _signatureBytes;
  double _signatureAspect = 3;
  Offset _fracOffset = const Offset(0.32, 0.72);

  @override
  void dispose() {
    _doc?.dispose();
    super.dispose();
  }

  double _sigHeightFraction(Size pageSize) {
    final double pageAspect = pageSize.width / pageSize.height;
    return _sigWidthFraction / _signatureAspect * pageAspect;
  }

  Future<void> _pickFile() async {
    setState(() => _busy = true);
    try {
      final files = await FileUtils.pickFiles(allowMultiple: false);
      final pdfFiles = files
          .where((f) => f.name.toLowerCase().endsWith('.pdf'))
          .toList();
      if (pdfFiles.isEmpty) {
        if (files.isNotEmpty && mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Choisissez un fichier PDF.')),
          );
        }
        return;
      }
      final doc = await FileUtils.buildSourceDoc(pdfFiles.first);
      setState(() {
        _doc?.dispose();
        _doc = doc;
        _pageIndex = 0;
        _step = _SignStep.pickPage;
      });
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

  Future<void> _validateSignature() async {
    final bytes = await _padKey.currentState?.exportPng();
    if (bytes == null) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Dessinez une signature avant de continuer.'),
          ),
        );
      }
      return;
    }
    double aspect = 3;
    try {
      final ui.Codec codec = await ui.instantiateImageCodec(bytes);
      final ui.FrameInfo frame = await codec.getNextFrame();
      if (frame.image.height > 0) {
        aspect = frame.image.width / frame.image.height;
      }
      frame.image.dispose();
      codec.dispose();
    } catch (_) {}

    final pageSize = _doc!.document.pages[_pageIndex].size;
    setState(() {
      _signatureBytes = bytes;
      _signatureAspect = aspect;
      final double maxDx = math.max(0.0, 1.0 - _sigWidthFraction);
      final double maxDy = math.max(0.0, 1.0 - _sigHeightFraction(pageSize));
      _fracOffset = Offset(
        _fracOffset.dx.clamp(0.0, maxDx),
        _fracOffset.dy.clamp(0.0, maxDy),
      );
      _step = _SignStep.place;
    });
  }

  void _goBack() {
    setState(() {
      switch (_step) {
        case _SignStep.pickFile:
          break;
        case _SignStep.pickPage:
          _doc?.dispose();
          _doc = null;
          _step = _SignStep.pickFile;
        case _SignStep.draw:
          _step = _SignStep.pickPage;
        case _SignStep.place:
          _step = _SignStep.draw;
      }
    });
  }

  Future<void> _finish() async {
    final doc = _doc;
    final sig = _signatureBytes;
    if (doc == null || sig == null) return;
    try {
      final pdfBytes = await FileUtils.cachedPdfBytes(doc);
      if (!mounted) return;
      final pageSize = doc.document.pages[_pageIndex].size;
      final Rect placement = Rect.fromLTWH(
        _fracOffset.dx * pageSize.width,
        _fracOffset.dy * pageSize.height,
        _sigWidthFraction * pageSize.width,
        _sigHeightFraction(pageSize) * pageSize.height,
      );
      final result = await runWithProgressDialog<Uint8List>(
        context: context,
        title: 'Ajout de la signature…',
        task: (token, onProgress) => SignatureEngine.stampSignature(
          pdfBytes: pdfBytes,
          signaturePngBytes: sig,
          pageIndex: _pageIndex,
          placement: placement,
        ),
      );
      if (result == null || !mounted) return;
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => PreviewScreen(
            pdfBytes: result,
            suggestedName: FileUtils.derivedName(_doc?.name, 'signe'),
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
      appBar: AppBar(title: const Text('Signer un PDF')),
      body: _bodyForStep(),
      bottomNavigationBar: _bottomBar(),
    );
  }

  Widget _bodyForStep() {
    switch (_step) {
      case _SignStep.pickFile:
        return _pickFileStep();
      case _SignStep.pickPage:
        return _pickPageStep();
      case _SignStep.draw:
        return _drawStep();
      case _SignStep.place:
        return _placeStep();
    }
  }

  Widget? _bottomBar() {
    switch (_step) {
      case _SignStep.pickFile:
        return null;
      case _SignStep.pickPage:
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: _busy ? null : _goBack,
                    child: const Text('Retour'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: FilledButton.icon(
                    onPressed: _busy
                        ? null
                        : () => setState(() => _step = _SignStep.draw),
                    icon: const Icon(Icons.arrow_forward),
                    label: const Text('Continuer', maxLines: 1),
                  ),
                ),
              ],
            ),
          ),
        );
      case _SignStep.draw:
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: OutlinedButton(
              onPressed: _goBack,
              child: const Text('Retour'),
            ),
          ),
        );
      case _SignStep.place:
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: _goBack,
                    child: const Text('Retour'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: FilledButton.icon(
                    onPressed: _finish,
                    icon: const Icon(Icons.check_circle_outline),
                    label: const Text('Terminer', maxLines: 1),
                  ),
                ),
              ],
            ),
          ),
        );
    }
  }

  Widget _pickFileStep() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Text(
          'Apposez votre signature dessinée à la main sur une page d\'un '
          'PDF. C\'est un simple dessin ajouté au document, pas une '
          'signature électronique certifiée.',
        ),
        const SizedBox(height: 20),
        Card(
          child: ListTile(
            leading: const Icon(Icons.upload_file),
            title: const Text('Choisir un PDF'),
            subtitle: const Text('Sélectionnez le document à signer'),
            onTap: _busy ? null : _pickFile,
          ),
        ),
        if (_busy) ...[
          const SizedBox(height: 20),
          const Center(child: CircularProgressIndicator()),
        ],
      ],
    );
  }

  Widget _pickPageStep() {
    final doc = _doc!;
    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
      children: [
        Text(
          '${doc.name} · ${doc.pageCount} pages',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 4),
        const Text('Choisissez la page à signer.'),
        const SizedBox(height: 16),
        SizedBox(
          height: 190,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: doc.pageCount,
            separatorBuilder: (_, _) => const SizedBox(width: 8),
            itemBuilder: (context, i) {
              return GestureDetector(
                onTap: () => setState(() => _pageIndex = i),
                child: SizedBox(
                  width: 130,
                  child: PageThumb(
                    bytesFuture: FileUtils.cachedPdfBytes(doc).then(
                      (b) => FileUtils.renderPdfPageThumbnail(
                        b,
                        pageNumber: i + 1,
                        targetWidth: 220,
                      ),
                    ),
                    selected: i == _pageIndex,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _drawStep() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Dessiner ma signature',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          const Text(
            'Dessinez avec le doigt comme sur papier. Ceci appose un '
            'dessin sur la page — ce n\'est pas une signature '
            'électronique certifiée.',
          ),
          const SizedBox(height: 16),
          Container(
            height: 260,
            decoration: BoxDecoration(
              border: Border.all(color: Theme.of(context).dividerColor),
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
            ),
            clipBehavior: Clip.antiAlias,
            child: SignaturePad(
              key: _padKey,
              onChanged: (points) {
                final empty = points.every((p) => p == null);
                if (empty != _padEmpty) setState(() => _padEmpty = empty);
              },
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: _padEmpty
                      ? null
                      : () {
                          _padKey.currentState?.clear();
                          setState(() => _padEmpty = true);
                        },
                  icon: const Icon(Icons.refresh),
                  label: const Text('Effacer', maxLines: 1),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: FilledButton.icon(
                  onPressed: _padEmpty ? null : _validateSignature,
                  icon: const Icon(Icons.check),
                  label: const Text('Valider', maxLines: 1),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _placeStep() {
    final doc = _doc!;
    final signatureBytes = _signatureBytes!;
    final Size pageSize = doc.document.pages[_pageIndex].size;
    final double sigHFrac = _sigHeightFraction(pageSize);

    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
          child: Text(
            'Faites glisser la signature à l\'endroit voulu sur la page, '
            'puis appuyez sur Terminer.',
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: FutureBuilder<Uint8List>(
              future: FileUtils.cachedPdfBytes(doc).then(
                (b) => FileUtils.renderPdfPageThumbnail(
                  b,
                  pageNumber: _pageIndex + 1,
                  targetWidth: 600,
                ),
              ),
              builder: (context, snap) {
                if (snap.connectionState != ConnectionState.done) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (snap.hasError || snap.data == null) {
                  return const Center(
                    child: Text('Impossible d\'afficher la page.'),
                  );
                }
                final pageBytes = snap.data!;
                return LayoutBuilder(
                  builder: (context, constraints) {
                    final double displayW = math.min(
                      constraints.maxWidth,
                      600.0,
                    );
                    final double displayH =
                        displayW * (pageSize.height / pageSize.width);
                    final double sigW = displayW * _sigWidthFraction;
                    final double maxDx = math.max(0.0, 1.0 - _sigWidthFraction);
                    final double maxDy = math.max(0.0, 1.0 - sigHFrac);
                    return Center(
                      child: SizedBox(
                        width: displayW,
                        height: displayH,
                        child: Stack(
                          children: [
                            Positioned.fill(
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Theme.of(context).dividerColor,
                                  ),
                                ),
                                child: Image.memory(
                                  pageBytes,
                                  fit: BoxFit.fill,
                                  gaplessPlayback: true,
                                ),
                              ),
                            ),
                            Positioned(
                              left: _fracOffset.dx * displayW,
                              top: _fracOffset.dy * displayH,
                              width: sigW,
                              child: GestureDetector(
                                onPanUpdate: (details) {
                                  setState(() {
                                    final double dx =
                                        (_fracOffset.dx +
                                                details.delta.dx / displayW)
                                            .clamp(0.0, maxDx);
                                    final double dy =
                                        (_fracOffset.dy +
                                                details.delta.dy / displayH)
                                            .clamp(0.0, maxDy);
                                    _fracOffset = Offset(dx, dy);
                                  });
                                },
                                child: Image.memory(
                                  signatureBytes,
                                  gaplessPlayback: true,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
