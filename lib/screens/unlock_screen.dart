import 'dart:typed_data';

import 'package:flutter/material.dart';

import '../core/files/file_utils.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart' as sf;

import '../core/pdf/pdf_engine.dart';
import '../l10n/l10n.dart';
import '../core/pdf/security_engine.dart';
import '../models/page_selection.dart';
import '../models/source_doc.dart';
import '../widgets/progress_dialog.dart';
import '../widgets/ui/empty_state.dart';
import 'preview_screen.dart';

class UnlockScreen extends StatefulWidget {
  const UnlockScreen({super.key});

  @override
  State<UnlockScreen> createState() => _UnlockScreenState();
}

class _UnlockScreenState extends State<UnlockScreen> {
  final TextEditingController _passwordController = TextEditingController();

  PickedPdf? _picked;
  bool _busy = false;
  bool _obscure = true;

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

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

  Future<void> _unlock() async {
    final picked = _picked;
    if (picked == null) return;
    final String password = _passwordController.text;

    setState(() => _busy = true);
    sf.PdfDocument loadedDoc;
    try {
      loadedDoc = sf.PdfDocument(inputBytes: picked.bytes, password: password);
    } catch (_) {
      if (mounted) _showError(context.l10n.unlockWrongPassword);
      if (mounted) setState(() => _busy = false);
      return;
    }

    SourceDoc? source;
    try {
      source = SourceDoc(
        id: 'unlock',
        name: picked.name,
        kind: SourceKind.pdf,
        document: loadedDoc,
        thumbnail: null,
      );
      final List<PageSelection> selections = [
        for (var i = 0; i < source.pageCount; i++)
          PageSelection(source: source, pageIndex: i),
      ];
      final bytes = await runWithProgressDialog<Uint8List>(
        context: context,
        title: context.l10n.unlockProgress,
        task: (token, onProgress) => PdfEngine.buildPdf(
          selections,
          onProgress: onProgress,
          cancelToken: token,
        ),
      );
      if (bytes == null || !mounted) return;
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => PreviewScreen(
            pdfBytes: bytes,
            suggestedName: FileUtils.derivedName(_picked?.name, 'deverrouille'),
          ),
        ),
      );
    } catch (e) {
      if (mounted) _showError(context.l10n.unlockFailed('$e'));
    } finally {
      source?.dispose();
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final bool canUnlock =
        _picked != null && _passwordController.text.isNotEmpty && !_busy;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.toolUnlock)),
      body: _picked == null
          ? EmptyState(
              icon: Icons.lock_open_outlined,
              title: l10n.unlockEmptyTitle,
              body: l10n.unlockEmptyBody,
              accepts: [l10n.unlockAcceptsProtectedPdf],
              actionLabel: l10n.unlockChooseProtectedPdf,
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
                    title: Text(_picked?.name ?? l10n.unlockChooseProtectedPdf),
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
                if (_picked != null) ...[
                  const SizedBox(height: 20),
                  TextField(
                    controller: _passwordController,
                    obscureText: _obscure,
                    onChanged: (_) => setState(() {}),
                    onSubmitted: (_) => canUnlock ? _unlock() : null,
                    decoration: InputDecoration(
                      labelText: l10n.unlockCurrentPassword,
                      border: const OutlineInputBorder(),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscure
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                        ),
                        onPressed: () => setState(() => _obscure = !_obscure),
                      ),
                    ),
                  ),
                ],
              ],
            ),
      bottomNavigationBar: _picked == null
          ? null
          : SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: FilledButton.icon(
                  onPressed: canUnlock ? _unlock : null,
                  icon: const Icon(Icons.lock_open_outlined),
                  label: Text(l10n.unlockAction, maxLines: 1),
                ),
              ),
            ),
    );
  }
}
