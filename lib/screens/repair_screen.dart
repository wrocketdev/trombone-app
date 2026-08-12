import 'dart:typed_data';

import 'package:flutter/material.dart';

import '../core/files/file_utils.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart' as sf;

import '../core/pdf/security_engine.dart';
import '../l10n/l10n.dart';
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
      if (mounted) _showError(context.l10n.errorOpenFailed('$e'));
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  Future<void> _repair() async {
    final picked = _picked;
    if (picked == null) return;
    // Le message d'échec est lu ici et non dans la tâche : celle-ci s'exécute
    // en dehors de l'arbre des widgets et n'a pas de contexte à interroger.
    final L l10n = context.l10n;
    setState(() => _busy = true);
    try {
      final bytes = await runWithProgressDialog<Uint8List>(
        context: context,
        title: l10n.repairProgress,
        task: (token, onProgress) async {
          onProgress(0, 1);
          sf.PdfDocument doc;
          try {
            doc = sf.PdfDocument(inputBytes: picked.bytes);
          } catch (_) {
            throw _RepairFailure(l10n.repairFailed);
          }
          try {
            final List<int> out = await doc.save();
            onProgress(1, 1);
            return Uint8List.fromList(out);
          } catch (_) {
            throw _RepairFailure(l10n.repairFailed);
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
        _showError(e is _RepairFailure ? e.message : l10n.repairFailed);
      }
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.toolRepair)),
      body: _picked == null
          ? EmptyState(
              icon: Icons.healing_outlined,
              title: l10n.repairEmptyTitle,
              body: l10n.repairEmptyBody,
              accepts: [l10n.formatPdf],
              actionLabel: l10n.actionChoosePdf,
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
                    title: Text(_picked?.name ?? l10n.actionChoosePdf),
                    subtitle: _picked == null ? Text(l10n.noFileChosen) : null,
                    trailing: TextButton(
                      onPressed: _busy ? null : _pick,
                      child: Text(
                        _picked == null ? l10n.actionChoose : l10n.actionChange,
                      ),
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
                  label: Text(l10n.repairAction, maxLines: 1),
                ),
              ),
            ),
    );
  }
}
