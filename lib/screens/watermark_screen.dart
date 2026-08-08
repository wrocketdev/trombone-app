import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart' as sf;

import '../core/files/file_utils.dart';
import '../core/pdf/watermark_engine.dart';
import '../models/source_doc.dart';
import '../widgets/page_thumb.dart';
import '../widgets/progress_dialog.dart';
import '../widgets/ui/empty_state.dart';
import '../widgets/ui/picked_file_card.dart';
import 'preview_screen.dart';

class _WatermarkColor {
  _WatermarkColor(this.label, this.color, this.swatch);
  final String label;
  final sf.PdfColor color;
  final Color swatch;
}

List<_WatermarkColor> _buildColors() => [
  _WatermarkColor('Gris', sf.PdfColor(128, 128, 128), Colors.grey),
  _WatermarkColor('Rouge', sf.PdfColor(200, 30, 30), Colors.red),
  _WatermarkColor('Bleu', sf.PdfColor(30, 60, 200), Colors.blue),
  _WatermarkColor('Noir', sf.PdfColor(0, 0, 0), Colors.black),
];

class WatermarkScreen extends StatefulWidget {
  const WatermarkScreen({super.key});

  @override
  State<WatermarkScreen> createState() => _WatermarkScreenState();
}

class _WatermarkScreenState extends State<WatermarkScreen> {
  final List<_WatermarkColor> _colors = _buildColors();
  SourceDoc? _doc;
  bool _busy = false;

  final TextEditingController _textController = TextEditingController(
    text: 'CONFIDENTIEL',
  );
  double _opacity = 0.35;
  double _rotation = -45;
  double _fontSize = 60;
  int _colorIndex = 0;

  @override
  void dispose() {
    _doc?.dispose();
    _textController.dispose();
    super.dispose();
  }

  Future<void> _pick() async {
    setState(() => _busy = true);
    try {
      final files = await FileUtils.pickFiles(allowMultiple: false);
      if (files.isEmpty) return;
      final ext = files.first.name.split('.').last.toLowerCase();
      if (ext != 'pdf') {
        _showError('Veuillez choisir un fichier PDF.');
        return;
      }
      final doc = await FileUtils.buildSourceDoc(files.first);
      setState(() {
        _doc?.dispose();
        _doc = doc;
      });
    } catch (e) {
      _showError('Impossible d\'ouvrir : $e');
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  void _showError(String message) {
    if (!mounted) return;
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  Future<void> _apply() async {
    final doc = _doc;
    final text = _textController.text.trim();
    if (doc == null) return;
    if (text.isEmpty) {
      _showError('Entrez un texte pour le filigrane.');
      return;
    }
    try {
      final sourceBytes = await FileUtils.cachedPdfBytes(doc);
      if (!mounted) return;
      final bytes = await runWithProgressDialog<Uint8List>(
        context: context,
        title: 'Application du filigrane en cours...',
        task: (token, onProgress) => WatermarkEngine.apply(
          sourceBytes,
          text: text,
          opacity: _opacity,
          rotationDegrees: _rotation,
          fontSize: _fontSize,
          color: _colors[_colorIndex].color,
          onProgress: onProgress,
        ),
      );
      if (bytes == null || !mounted) return;
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => PreviewScreen(
            pdfBytes: bytes,
            suggestedName: FileUtils.derivedName(_doc?.name, 'filigrane'),
          ),
        ),
      );
    } catch (e) {
      _showError('Echec : $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final doc = _doc;
    return Scaffold(
      appBar: AppBar(title: const Text('Filigrane')),
      body: doc == null
          ? EmptyState(
              icon: Icons.water_drop_outlined,
              title: 'Apposer un filigrane',
              body:
                  'Un texte de votre choix est répété en fond sur toutes les pages — pour marquer un document comme confidentiel ou brouillon.',
              accepts: const ['PDF'],
              actionLabel: 'Choisir un PDF',
              onAction: _pick,
              busy: _busy,
              // La note par défaut annonce « sans filigrane » : sur cet
              // écran-là, elle contredirait l'outil.
              note: 'Export gratuit et sans limite de nombre.',
            )
          : ListView(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 96),
              children: [
                PickedFileCard(
                  name: doc.name,
                  subtitle: '${doc.pageCount} pages',
                  busy: _busy,
                  onChange: _pick,
                ),
                const SizedBox(height: 16),
                Center(
                  child: SizedBox(
                    width: 140,
                    height: 180,
                    child: PageThumb(
                      bytesFuture: FileUtils.cachedPdfBytes(
                        doc,
                      ).then((b) => FileUtils.renderPdfPageThumbnail(b)),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                TextField(
                  controller: _textController,
                  decoration: const InputDecoration(
                    labelText: 'Texte du filigrane',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Opacite : ${(_opacity * 100).round()} %',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                Slider(
                  value: _opacity,
                  min: 0.1,
                  max: 1.0,
                  divisions: 18,
                  label: '${(_opacity * 100).round()} %',
                  onChanged: (v) => setState(() => _opacity = v),
                ),
                Text(
                  'Angle de rotation : ${_rotation.round()} deg',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                Slider(
                  value: _rotation,
                  min: -90,
                  max: 90,
                  divisions: 36,
                  label: '${_rotation.round()} deg',
                  onChanged: (v) => setState(() => _rotation = v),
                ),
                Text(
                  'Taille du texte : ${_fontSize.round()} pt',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                Slider(
                  value: _fontSize,
                  min: 40,
                  max: 80,
                  divisions: 40,
                  label: '${_fontSize.round()} pt',
                  onChanged: (v) => setState(() => _fontSize = v),
                ),
                const SizedBox(height: 8),
                Text('Couleur', style: Theme.of(context).textTheme.titleSmall),
                const SizedBox(height: 8),
                Row(
                  children: [
                    for (var i = 0; i < _colors.length; i++)
                      Padding(
                        padding: const EdgeInsets.only(right: 12),
                        child: GestureDetector(
                          onTap: () => setState(() => _colorIndex = i),
                          child: Column(
                            children: [
                              Container(
                                width: 36,
                                height: 36,
                                decoration: BoxDecoration(
                                  color: _colors[i].swatch,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: i == _colorIndex
                                        ? Theme.of(context).colorScheme.primary
                                        : Colors.transparent,
                                    width: 3,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                _colors[i].label,
                                style: Theme.of(context).textTheme.labelSmall,
                              ),
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
              ],
            ),
      bottomNavigationBar: doc == null
          ? null
          : SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: FilledButton.icon(
                  onPressed: _busy ? null : _apply,
                  icon: const Icon(Icons.water_drop_outlined),
                  label: const Text('Appliquer', maxLines: 1),
                ),
              ),
            ),
    );
  }
}
