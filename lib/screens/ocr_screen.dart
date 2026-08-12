import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../core/files/file_utils.dart';
import '../core/pdf/ocr_engine.dart';
import '../l10n/l10n.dart';
import '../models/source_doc.dart';
import '../widgets/progress_dialog.dart';
import '../widgets/ui/empty_state.dart';
import '../widgets/ui/picked_file_card.dart';
import 'preview_screen.dart';

class OcrScreen extends StatefulWidget {
  const OcrScreen({super.key});

  @override
  State<OcrScreen> createState() => _OcrScreenState();
}

class _OcrScreenState extends State<OcrScreen> {
  SourceDoc? _doc;
  bool _busy = false;

  @override
  void dispose() {
    _doc?.dispose();
    super.dispose();
  }

  static const _allowedExtensions = [
    'pdf',
    'jpg',
    'jpeg',
    'png',
    'bmp',
    'webp',
    'heic',
    'heif',
  ];

  Future<void> _pick() async {
    final L l10n = context.l10n;
    setState(() => _busy = true);
    try {
      final files = await FileUtils.pickFiles(allowMultiple: false);
      if (files.isEmpty) return;
      final file = files.first;
      final ext = file.extension?.toLowerCase() ?? '';
      if (!_allowedExtensions.contains(ext)) {
        _showError(l10n.ocrWrongFormat);
        return;
      }
      final doc = await FileUtils.buildSourceDoc(file);
      if (!mounted) return;
      setState(() {
        _doc?.dispose();
        _doc = doc;
      });
    } catch (e) {
      if (mounted) _showError(l10n.errorOpenFailedShort(_friendlyError(e)));
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  String _friendlyError(Object e) {
    final s = e.toString();
    return s.length > 140 ? '${s.substring(0, 140)}…' : s;
  }

  void _showError(String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  Future<void> _run() async {
    final doc = _doc;
    if (doc == null) return;
    final L l10n = context.l10n;
    try {
      final Uint8List sourceBytes = await FileUtils.cachedPdfBytes(doc);
      if (!mounted) return;
      final result = await runWithProgressDialog<OcrResult>(
        context: context,
        title: l10n.ocrProgress,
        task: (token, onProgress) => OcrEngine.run(
          sourceBytes,
          onProgress: onProgress,
          cancelToken: token,
        ),
      );
      if (result == null || !mounted) return;
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) =>
              _OcrResultScreen(result: result, sourceName: doc.name),
        ),
      );
    } catch (e) {
      if (mounted) {
        _showError(l10n.ocrFailed(_friendlyError(e)));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final doc = _doc;
    final L l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.toolOcr)),
      body: doc == null
          ? EmptyState(
              icon: Icons.manage_search_outlined,
              title: l10n.ocrEmptyTitle,
              body: l10n.ocrEmptyBody,
              accepts: const ['PDF', 'JPG', 'PNG'],
              actionLabel: l10n.actionChoosePdf,
              onAction: _pick,
              busy: _busy,
            )
          : ListView(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 96),
              children: [
                PickedFileCard(
                  name: doc.name,
                  subtitle: l10n.pageCount(doc.pageCount),
                  busy: _busy,
                  onChange: _pick,
                ),
              ],
            ),
      bottomNavigationBar: doc == null
          ? null
          : SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: FilledButton.icon(
                  onPressed: _busy ? null : _run,
                  icon: const Icon(Icons.document_scanner_outlined),
                  label: Text(l10n.ocrRunAction, maxLines: 1),
                ),
              ),
            ),
    );
  }
}

class _OcrResultScreen extends StatelessWidget {
  const _OcrResultScreen({required this.result, this.sourceName});
  final OcrResult result;
  final String? sourceName;

  Future<void> _copyText(BuildContext context) async {
    await Clipboard.setData(ClipboardData(text: result.allText));
    if (context.mounted) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(context.l10n.ocrTextCopied)));
    }
  }

  @override
  Widget build(BuildContext context) {
    final L l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.ocrResultTitle)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(l10n.ocrResultBody(result.pages.length)),
          const SizedBox(height: 16),
          OutlinedButton.icon(
            onPressed: () => _copyText(context),
            icon: const Icon(Icons.copy_all_outlined),
            label: Text(l10n.ocrCopyText, maxLines: 1),
          ),
          const SizedBox(height: 12),
          FilledButton.icon(
            onPressed: () => Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (_) => PreviewScreen(
                  pdfBytes: result.pdfBytes,
                  suggestedName: FileUtils.derivedName(sourceName, 'ocr'),
                ),
              ),
            ),
            icon: const Icon(Icons.remove_red_eye_outlined),
            label: Text(l10n.actionPreviewAndExport, maxLines: 1),
          ),
        ],
      ),
    );
  }
}
