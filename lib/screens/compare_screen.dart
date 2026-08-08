import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart' as sf;

import '../core/files/file_utils.dart';
import '../theme/theme.dart';
import '../core/pdf/compare_engine.dart';
import '../core/pdf/pdf_engine.dart';
import '../models/source_doc.dart';
import '../widgets/progress_dialog.dart';
import '../widgets/ui/empty_state.dart';

class CompareScreen extends StatefulWidget {
  const CompareScreen({super.key});

  @override
  State<CompareScreen> createState() => _CompareScreenState();
}

class _DisplayRow {
  const _DisplayRow.gap() : isGap = true, line = null;
  const _DisplayRow.line(DiffLine this.line) : isGap = false;

  final bool isGap;
  final DiffLine? line;
}

class _CompareScreenState extends State<CompareScreen> {
  SourceDoc? _docA;
  SourceDoc? _docB;
  bool _busy = false;
  List<PageDiff>? _result;

  @override
  void dispose() {
    _docA?.dispose();
    _docB?.dispose();
    super.dispose();
  }

  Future<void> _pick({required bool isA}) async {
    setState(() => _busy = true);
    try {
      final files = await FileUtils.pickFiles(allowMultiple: false);
      if (files.isEmpty) return;
      final doc = await FileUtils.buildSourceDoc(files.first);
      setState(() {
        if (isA) {
          _docA?.dispose();
          _docA = doc;
        } else {
          _docB?.dispose();
          _docB = doc;
        }
        _result = null;
      });
    } catch (e) {
      if (mounted) {
        _showError('Impossible d\'ouvrir le fichier : ${_friendlyError(e)}');
      }
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  void _clear({required bool isA}) {
    setState(() {
      if (isA) {
        _docA?.dispose();
        _docA = null;
      } else {
        _docB?.dispose();
        _docB = null;
      }
      _result = null;
    });
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

  String _pageText(SourceDoc doc, int pageIndex) {
    if (pageIndex >= doc.pageCount) return '';
    try {
      return sf.PdfTextExtractor(
        doc.document,
      ).extractText(startPageIndex: pageIndex, endPageIndex: pageIndex);
    } catch (_) {
      return '';
    }
  }

  Future<void> _compare() async {
    final docA = _docA;
    final docB = _docB;
    if (docA == null || docB == null) return;
    try {
      final result = await runWithProgressDialog<List<PageDiff>>(
        context: context,
        title: 'Comparaison en cours…',
        task: (token, onProgress) async {
          final int maxPages = docA.pageCount > docB.pageCount
              ? docA.pageCount
              : docB.pageCount;
          final List<PageDiff> diffs = [];
          for (var i = 0; i < maxPages; i++) {
            if (token.isCancelled) throw CancelledException();
            final textA = _pageText(docA, i);
            final textB = _pageText(docB, i);
            diffs.add(CompareEngine.diffPage(i + 1, textA, textB));
            onProgress(i + 1, maxPages);
          }
          return diffs;
        },
      );
      if (result == null || !mounted) return;
      setState(() => _result = result);
    } catch (e) {
      if (mounted) _showError('Échec de la comparaison : ${_friendlyError(e)}');
    }
  }

  List<_DisplayRow> _collapseSame(List<DiffLine> lines) {
    final List<_DisplayRow> out = [];
    var i = 0;
    while (i < lines.length) {
      if (lines[i].type == DiffLineType.same) {
        var j = i;
        while (j < lines.length && lines[j].type == DiffLineType.same) {
          j++;
        }
        if (out.isNotEmpty && j < lines.length) {
          out.add(const _DisplayRow.gap());
        }
        i = j;
      } else {
        out.add(_DisplayRow.line(lines[i]));
        i++;
      }
    }
    return out;
  }

  @override
  Widget build(BuildContext context) {
    final bool canCompare = _docA != null && _docB != null && !_busy;
    final result = _result;
    final int changedPages = result?.where((d) => d.hasChanges).length ?? 0;
    final int totalPages = result?.length ?? 0;

    return Scaffold(
      appBar: AppBar(title: const Text('Comparer deux PDF')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _slot(
                  title: 'Fichier A',
                  doc: _docA,
                  onPick: () => _pick(isA: true),
                  onClear: () => _clear(isA: true),
                ),
                const SizedBox(height: 12),
                _slot(
                  title: 'Fichier B',
                  doc: _docB,
                  onPick: () => _pick(isA: false),
                  onClear: () => _clear(isA: false),
                ),
                const SizedBox(height: 12),
                FilledButton.icon(
                  onPressed: canCompare ? _compare : null,
                  icon: const Icon(Icons.compare_arrows),
                  label: const Text('Comparer', maxLines: 1),
                ),
                if (result != null) ...[
                  const SizedBox(height: 16),
                  Text(
                    '$changedPages page${changedPages > 1 ? 's' : ''} diffère'
                    '${changedPages > 1 ? 'nt' : ''} sur $totalPages',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ],
            ),
          ),
          const Divider(height: 1),
          Expanded(
            child: result == null
                ? const _Placeholder()
                : _buildDiffList(result),
          ),
        ],
      ),
    );
  }

  Widget _buildDiffList(List<PageDiff> pages) {
    final changed = pages.where((d) => d.hasChanges).toList();
    if (changed.isEmpty) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Text('Aucune différence détectée entre les deux fichiers.'),
        ),
      );
    }
    return ListView.builder(
      padding: const EdgeInsets.fromLTRB(12, 12, 12, 24),
      itemCount: changed.length,
      itemBuilder: (context, index) => _buildPageCard(changed[index]),
    );
  }

  Widget _buildPageCard(PageDiff diff) {
    final rows = _collapseSame(diff.lines);
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Page ${diff.pageNumber}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            ...rows.map((r) => _buildRow(context, r)),
          ],
        ),
      ),
    );
  }

  Widget _buildRow(BuildContext context, _DisplayRow row) {
    final colors = context.colors;
    if (row.isGap) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Text('…', style: TextStyle(color: colors.inkFaint)),
      );
    }
    final line = row.line!;
    final bool added = line.type == DiffLineType.added;
    // L'ajout prend le vert, la suppression prend l'accent : ce sont les deux
    // seules teintes du système, et elles portent déjà « ce qui va bien » et
    // « ce à quoi il faut faire attention » partout ailleurs dans l'app.
    final Color bg = added ? colors.sageWash : colors.accentWash;
    final Color fg = added ? colors.sageDeep : colors.accentDeep;
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 2),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(added ? Icons.add : Icons.remove, size: 16, color: fg),
          const SizedBox(width: 6),
          Expanded(
            child: Text(
              line.text,
              style: TextStyle(
                color: fg,
                decoration: added ? null : TextDecoration.lineThrough,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _slot({
    required String title,
    required SourceDoc? doc,
    required VoidCallback onPick,
    required VoidCallback onClear,
  }) {
    return Card(
      child: ListTile(
        leading: Icon(
          doc == null ? Icons.upload_file : Icons.picture_as_pdf_outlined,
        ),
        title: Text(title),
        subtitle: Text(
          doc == null
              ? 'Aucun fichier choisi'
              : '${doc.name} · ${doc.pageCount} page${doc.pageCount > 1 ? 's' : ''}',
        ),
        trailing: doc == null
            ? TextButton(
                onPressed: _busy ? null : onPick,
                child: const Text('Choisir'),
              )
            : IconButton(icon: const Icon(Icons.close), onPressed: onClear),
        onTap: doc == null && !_busy ? onPick : null,
      ),
    );
  }
}

class _Placeholder extends StatelessWidget {
  const _Placeholder();

  @override
  Widget build(BuildContext context) {
    return const EmptyState(
      icon: Icons.compare_arrows_outlined,
      title: 'Ce qui a changé',
      body:
          'Choisissez deux versions d’un même PDF. Les passages ajoutés '
          'et supprimés seront mis en regard, page par page.',
    );
  }
}
