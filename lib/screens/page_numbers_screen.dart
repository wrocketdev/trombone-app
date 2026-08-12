import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../core/files/file_utils.dart';
import '../core/pdf/page_numbers_engine.dart';
import '../l10n/l10n.dart';
import '../models/source_doc.dart';
import '../widgets/progress_dialog.dart';
import '../widgets/ui/empty_state.dart';
import '../widgets/ui/picked_file_card.dart';
import 'preview_screen.dart';

class PageNumbersScreen extends StatefulWidget {
  const PageNumbersScreen({super.key});

  @override
  State<PageNumbersScreen> createState() => _PageNumbersScreenState();
}

class _PageNumbersScreenState extends State<PageNumbersScreen> {
  SourceDoc? _doc;
  bool _busy = false;
  PageNumberPosition _position = PageNumberPosition.bottomCenter;
  PageNumberFormat _format = PageNumberFormat.pageOfTotal;
  final TextEditingController _startController = TextEditingController(
    text: '1',
  );

  @override
  void dispose() {
    _doc?.dispose();
    _startController.dispose();
    super.dispose();
  }

  Future<void> _pick() async {
    final L l10n = context.l10n;
    setState(() => _busy = true);
    try {
      final files = await FileUtils.pickFiles(allowMultiple: false);
      final pdfOnly = files
          .where((f) => (f.extension ?? '').toLowerCase() == 'pdf')
          .toList();
      if (pdfOnly.isEmpty) return;
      final doc = await FileUtils.buildSourceDoc(pdfOnly.first);
      setState(() {
        _doc?.dispose();
        _doc = doc;
      });
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(l10n.errorOpenFailedShort('$e'))),
        );
      }
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  Future<void> _apply() async {
    final doc = _doc;
    if (doc == null) return;
    final int startNumber = int.tryParse(_startController.text.trim()) ?? 1;
    final L l10n = context.l10n;
    try {
      final bytes = await runWithProgressDialog<Uint8List>(
        context: context,
        title: l10n.pageNumbersProgress,
        task: (token, onProgress) async {
          final pdfBytes = await FileUtils.cachedPdfBytes(doc);
          return PageNumbersEngine.apply(
            pdfBytes: pdfBytes,
            position: _position,
            format: _format,
            startNumber: startNumber,
            onProgress: onProgress,
            cancelToken: token,
          );
        },
      );
      if (bytes == null || !mounted) return;
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => PreviewScreen(
            pdfBytes: bytes,
            suggestedName: FileUtils.derivedName(_doc?.name, 'numerotation'),
          ),
        ),
      );
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(l10n.errorGeneric('$e'))));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final doc = _doc;
    final L l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.toolPageNumbers)),
      body: doc == null
          ? EmptyState(
              icon: Icons.format_list_numbered,
              title: l10n.pageNumbersEmptyTitle,
              body: l10n.pageNumbersEmptyBody,
              accepts: [l10n.formatPdf],
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
                const SizedBox(height: 24),
                Text(
                  l10n.positionLabel,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    _positionChip(
                      l10n.positionBottomCenter,
                      PageNumberPosition.bottomCenter,
                    ),
                    _positionChip(
                      l10n.positionBottomRight,
                      PageNumberPosition.bottomRight,
                    ),
                    _positionChip(
                      l10n.positionTopCenter,
                      PageNumberPosition.topCenter,
                    ),
                    _positionChip(
                      l10n.positionTopRight,
                      PageNumberPosition.topRight,
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Text(
                  l10n.formatLabel,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 8),
                SegmentedButton<PageNumberFormat>(
                  segments: [
                    ButtonSegment(
                      value: PageNumberFormat.pageOnly,
                      label: Text(l10n.pageNumbersFormatPlain, maxLines: 1),
                    ),
                    ButtonSegment(
                      value: PageNumberFormat.pageOfTotal,
                      label: Text(l10n.pageNumbersFormatOfTotal, maxLines: 1),
                    ),
                  ],
                  selected: {_format},
                  onSelectionChanged: (s) => setState(() => _format = s.first),
                ),
                const SizedBox(height: 24),
                Text(
                  l10n.pageNumbersStart,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: _startController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: '1',
                  ),
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
                  icon: const Icon(Icons.format_list_numbered),
                  label: Text(l10n.actionApply, maxLines: 1),
                ),
              ),
            ),
    );
  }

  Widget _positionChip(String label, PageNumberPosition value) {
    return ChoiceChip(
      label: Text(label),
      selected: _position == value,
      onSelected: (_) => setState(() => _position = value),
    );
  }
}
