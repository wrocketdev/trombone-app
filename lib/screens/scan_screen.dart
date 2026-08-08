import 'dart:io';
import 'dart:typed_data';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:permission_handler/permission_handler.dart';

import '../core/pdf/converters.dart';
import '../core/pdf/pdf_engine.dart';
import '../models/page_selection.dart';
import '../models/source_doc.dart';
import '../widgets/progress_dialog.dart';
import 'preview_screen.dart';

/// Captures one or more pages with the device camera, lets the user crop
/// each one, then assembles the cropped pages into a single PDF using the
/// same [Converters] + [PdfEngine] pipeline every other tool relies on.
class ScanScreen extends StatefulWidget {
  const ScanScreen({super.key});

  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  bool? _permissionGranted;
  String? _cameraError;
  CameraController? _controller;
  bool _capturing = false;
  bool _showCamera = true;
  final List<String> _pages = [];

  @override
  void initState() {
    super.initState();
    _init();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  Future<void> _init() async {
    final status = await Permission.camera.request();
    if (!mounted) return;
    if (!status.isGranted) {
      setState(() => _permissionGranted = false);
      return;
    }
    setState(() => _permissionGranted = true);
    await _initCamera();
  }

  Future<void> _initCamera() async {
    try {
      final cameras = await availableCameras();
      if (cameras.isEmpty) {
        if (mounted) {
          setState(
            () => _cameraError = 'Aucune caméra disponible sur cet appareil.',
          );
        }
        return;
      }
      final controller = CameraController(
        cameras.first,
        ResolutionPreset.high,
        enableAudio: false,
      );
      await controller.initialize();
      if (!mounted) {
        controller.dispose();
        return;
      }
      setState(() => _controller = controller);
    } catch (e) {
      if (mounted) {
        setState(
          () => _cameraError = 'Impossible d\'initialiser la caméra : $e',
        );
      }
    }
  }

  Future<void> _capture() async {
    final controller = _controller;
    if (controller == null || !controller.value.isInitialized || _capturing) {
      return;
    }
    setState(() => _capturing = true);
    try {
      final photo = await controller.takePicture();
      final cropped = await ImageCropper().cropImage(
        sourcePath: photo.path,
        uiSettings: [
          AndroidUiSettings(toolbarTitle: 'Ajuster', lockAspectRatio: false),
        ],
      );
      if (cropped == null) return;
      setState(() {
        _pages.add(cropped.path);
        _showCamera = false;
      });
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Échec de la capture : $e')));
      }
    } finally {
      if (mounted) setState(() => _capturing = false);
    }
  }

  Future<void> _backToCamera() async {
    setState(() => _showCamera = true);
    try {
      await _controller?.resumePreview();
    } catch (_) {
      // Not all platforms need/support resumePreview(); ignore if it fails.
    }
  }

  void _removePage(int index) {
    setState(() => _pages.removeAt(index));
  }

  Future<void> _finish() async {
    if (_pages.isEmpty) return;
    final List<SourceDoc> docs = [];
    try {
      final bytes = await runWithProgressDialog<Uint8List>(
        context: context,
        title: 'Création du PDF…',
        task: (token, onProgress) async {
          final int totalSteps = _pages.length * 2;
          for (var i = 0; i < _pages.length; i++) {
            if (token.isCancelled) throw CancelledException();
            final fileBytes = await File(_pages[i]).readAsBytes();
            final pageDoc = await Converters.imageToPdfDocument(fileBytes);
            docs.add(
              SourceDoc(
                id: 'scan$i',
                name: 'page$i',
                kind: SourceKind.image,
                document: pageDoc,
                thumbnail: null,
              ),
            );
            onProgress(i + 1, totalSteps);
          }
          final selections = [
            for (final d in docs) PageSelection(source: d, pageIndex: 0),
          ];
          return PdfEngine.buildPdf(
            selections,
            onProgress: (done, total) =>
                onProgress(_pages.length + done, totalSteps),
            cancelToken: token,
          );
        },
      );
      if (bytes == null || !mounted) return;
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) =>
              PreviewScreen(pdfBytes: bytes, suggestedName: 'scan.pdf'),
        ),
      );
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Échec : $e')));
      }
    } finally {
      for (final d in docs) {
        d.dispose();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Scanner un document')),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (_permissionGranted == null) {
      return const Center(child: CircularProgressIndicator());
    }
    if (_permissionGranted == false) {
      return _permissionCard();
    }
    if (_cameraError != null) {
      return _errorCard(_cameraError!);
    }
    final controller = _controller;
    if (controller == null || !controller.value.isInitialized) {
      return const Center(child: CircularProgressIndicator());
    }
    return _showCamera ? _cameraView(controller) : _reviewView();
  }

  Widget _permissionCard() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.photo_camera_outlined, size: 40),
                const SizedBox(height: 12),
                const Text(
                  'L\'accès à l\'appareil photo est nécessaire pour scanner un document.',
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                FilledButton.icon(
                  onPressed: _init,
                  icon: const Icon(Icons.lock_open),
                  label: const Text('Autoriser l\'appareil photo', maxLines: 1),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _errorCard(String message) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.error_outline, size: 40),
                const SizedBox(height: 12),
                Text(message, textAlign: TextAlign.center),
                const SizedBox(height: 16),
                FilledButton.icon(
                  onPressed: () {
                    setState(() => _cameraError = null);
                    _initCamera();
                  },
                  icon: const Icon(Icons.refresh),
                  label: const Text('Réessayer', maxLines: 1),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _cameraView(CameraController controller) {
    return Stack(
      fit: StackFit.expand,
      children: [
        CameraPreview(controller),
        if (_pages.isNotEmpty)
          Positioned(
            top: 12,
            right: 12,
            child: Chip(
              backgroundColor: Colors.black54,
              label: Text(
                '${_pages.length} page(s)',
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 24,
          child: Center(
            child: FloatingActionButton.large(
              onPressed: _capturing ? null : _capture,
              child: _capturing
                  ? const CircularProgressIndicator(color: Colors.white)
                  : const Icon(Icons.camera_alt),
            ),
          ),
        ),
      ],
    );
  }

  Widget _reviewView() {
    return Column(
      children: [
        Expanded(
          child: _pages.isEmpty
              ? const Center(child: Text('Aucune page pour le moment.'))
              : GridView.builder(
                  padding: const EdgeInsets.all(12),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 0.72,
                  ),
                  itemCount: _pages.length,
                  itemBuilder: (context, i) => _ScanPageThumb(
                    path: _pages[i],
                    pageNumber: i + 1,
                    onRemove: () => _removePage(i),
                  ),
                ),
        ),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(12, 8, 12, 12),
            child: Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: _backToCamera,
                    icon: const Icon(Icons.camera_alt_outlined),
                    label: const Text('Ajouter', maxLines: 1),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: FilledButton.icon(
                    onPressed: _pages.isEmpty ? null : _finish,
                    icon: const Icon(Icons.check),
                    label: Text('Terminer · ${_pages.length}', maxLines: 1),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _ScanPageThumb extends StatelessWidget {
  const _ScanPageThumb({
    required this.path,
    required this.pageNumber,
    required this.onRemove,
  });

  final String path;
  final int pageNumber;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Theme.of(context).dividerColor),
              borderRadius: BorderRadius.circular(8),
              color: Theme.of(context).colorScheme.surfaceContainerHighest,
            ),
            clipBehavior: Clip.antiAlias,
            child: Column(
              children: [
                Expanded(
                  child: Image.file(
                    File(path),
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Text(
                    '$pageNumber',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 2,
          right: 2,
          child: GestureDetector(
            onTap: onRemove,
            child: const CircleAvatar(
              radius: 12,
              backgroundColor: Colors.black54,
              child: Icon(Icons.close, size: 14, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
