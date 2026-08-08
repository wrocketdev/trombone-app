import 'dart:typed_data';

import 'package:flutter/material.dart';

import '../core/files/file_utils.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart' as sf;

import '../core/pdf/security_engine.dart';
import '../widgets/progress_dialog.dart';
import '../widgets/ui/empty_state.dart';
import 'preview_screen.dart';

class _RepairFailure implements Exception {
  const _RepairFailure(this.message);
  final String message;
}

class RepairScreen extends StatefulWidget {
  const RepairScreen({super.key});

  @override
  State<RepairScreen> createState() => _RepairScreenState();
}

class _RepairScreenState extends State<RepairScreen> {
  PickedPdf? _picked;
  bool _busy = false;

  static const String _genericFailureMessage =
      'Impossible de réparer ce fichier — il est peut-être trop endommagé.';

  void _showError(String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  Future<void> _pick() async {
    setState(() => _busy = true);
    try {
      final picked = await SecurityEngine.pickPdfFile();
      if (picked == null) return;
      setState(() => _picked = picked);
    } catch (e) {
      if (mounted) _showError('Impossible d\'ouvrir le fichier : $e');
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  Future<void> _repair() async {
    final picked = _picked;
    if (picked == null) return;
    setState(() => _busy = true);
    try {
      final bytes = await runWithProgressDialog<Uint8List>(
        context: context,
        title: 'Réparation en cours…',
        task: (token, onProgress) async {
          onProgress(0, 1);
          sf.PdfDocument doc;
          try {
            doc = sf.PdfDocument(inputBytes: picked.bytes);
          } catch (_) {
            throw const _RepairFailure(_genericFailureMessage);
          }
          try {
            final List<int> out = await doc.save();
            onProgress(1, 1);
            return Uint8List.fromList(out);
          } catch (_) {
            throw const _RepairFailure(_genericFailureMessage);
          } finally {
            doc.dispose();
          }
        },
      );
      if (bytes == null || !mounted) return;
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => PreviewScreen(
            pdfBytes: bytes,
            suggestedName: FileUtils.derivedName(_picked?.name, 'repare'),
          ),
        ),
      );
    } catch (e) {
      if (mounted) {
        _showError(e is _RepairFailure ? e.message : _genericFailureMessage);
      }
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Réparer PDF')),
      body: _picked == null
          ? EmptyState(
              icon: Icons.healing_outlined,
              title: 'Réparer un fichier abîmé',
              body:
                  'La structure interne d’un PDF endommagé est reconstruite. Ce qui est récupérable le sera.',
              accepts: const ['PDF'],
              actionLabel: 'Choisir un PDF',
              onAction: _pick,
              busy: _busy,
            )
          : ListView(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 96),
              children: [
                Card(
                  child: ListTile(
                    leading: Icon(
                      _picked == null
                          ? Icons.upload_file
                          : Icons.picture_as_pdf_outlined,
                    ),
                    title: Text(_picked?.name ?? 'Choisir un PDF'),
                    subtitle: _picked == null
                        ? const Text('Aucun fichier choisi')
                        : null,
                    trailing: TextButton(
                      onPressed: _busy ? null : _pick,
                      child: Text(_picked == null ? 'Choisir' : 'Changer'),
                    ),
                    onTap: _busy ? null : _pick,
                  ),
                ),
              ],
            ),
      bottomNavigationBar: _picked == null
          ? null
          : SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: FilledButton.icon(
                  onPressed: _busy ? null : _repair,
                  icon: const Icon(Icons.build_outlined),
                  label: const Text('Réparer', maxLines: 1),
                ),
              ),
            ),
    );
  }
}
