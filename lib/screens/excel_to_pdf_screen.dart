import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import '../core/office/excel_to_pdf.dart';
import '../core/office/ooxml.dart';
import '../widgets/progress_dialog.dart';
import '../widgets/ui/empty_state.dart';
import 'preview_screen.dart';

class ExcelToPdfScreen extends StatefulWidget {
  const ExcelToPdfScreen({super.key});

  @override
  State<ExcelToPdfScreen> createState() => _ExcelToPdfScreenState();
}

class _ExcelToPdfScreenState extends State<ExcelToPdfScreen> {
  String? _fileName;
  List<XlsxSheet>? _sheets;
  bool _repeatHeader = true;
  bool _busy = false;

  void _showError(String message) {
    if (!mounted) return;
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  Future<void> _pick() async {
    setState(() => _busy = true);
    try {
      // FileUtils.pickFiles est verrouille sur les extensions PDF/Word/image,
      // le classeur ne serait meme pas selectionnable : on ouvre donc le
      // selecteur systeme directement sur les tableurs.
      final FilePickerResult? result = await FilePicker.pickFiles(
        allowMultiple: false,
        type: FileType.custom,
        allowedExtensions: const <String>['xlsx', 'xls'],
        withData: false,
      );
      final PlatformFile? file = result?.files.isNotEmpty ?? false
          ? result!.files.first
          : null;
      if (file == null) return;

      final String name = file.name;
      final String ext = name.contains('.')
          ? name.split('.').last.toLowerCase()
          : '';
      if (ext == 'xls') {
        _showError(
          'Le format .xls (ancien format binaire Excel) n\'est pas pris en '
          'charge. Enregistrez le fichier en .xlsx puis reessayez.',
        );
        return;
      }
      if (ext != 'xlsx') {
        _showError('Veuillez choisir un classeur Excel .xlsx.');
        return;
      }

      final Uint8List bytes =
          file.bytes ??
          (file.path != null
              ? await File(file.path!).readAsBytes()
              : throw StateError('Fichier illisible : $name'));

      final List<XlsxSheet> sheets = ExcelToPdf.readSheets(bytes);
      if (!mounted) return;
      setState(() {
        _fileName = name;
        _sheets = sheets;
      });
    } on FormatException catch (e) {
      _showError('Classeur illisible : ${e.message}');
    } catch (e) {
      _showError('Impossible d\'ouvrir : $e');
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  void _clear() {
    setState(() {
      _fileName = null;
      _sheets = null;
    });
  }

  String _suggestedName() {
    final String base = _fileName ?? 'classeur.xlsx';
    final int dot = base.lastIndexOf('.');
    final String stem = dot > 0 ? base.substring(0, dot) : base;
    return '${stem.isEmpty ? 'classeur' : stem}.pdf';
  }

  Future<void> _convert() async {
    final List<XlsxSheet>? sheets = _sheets;
    if (sheets == null) return;
    try {
      final Uint8List? bytes = await runWithProgressDialog<Uint8List>(
        context: context,
        title: 'Conversion en cours…',
        task: (token, onProgress) => ExcelToPdf.convertSheets(
          sheets,
          repeatHeaderRow: _repeatHeader,
          onProgress: onProgress,
          cancelToken: token,
        ),
      );
      if (bytes == null || !mounted) return;
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) =>
              PreviewScreen(pdfBytes: bytes, suggestedName: _suggestedName()),
        ),
      );
    } catch (e) {
      _showError('Échec de la conversion : $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<XlsxSheet>? sheets = _sheets;
    final int totalRows = sheets == null
        ? 0
        : sheets.fold<int>(0, (int s, XlsxSheet f) => s + f.rows.length);

    return Scaffold(
      appBar: AppBar(title: const Text('Excel vers PDF')),
      body: _fileName == null
          ? EmptyState(
              icon: Icons.table_view_outlined,
              title: 'Un classeur en PDF',
              body:
                  'Les feuilles d’un fichier .xlsx deviennent des pages PDF, prêtes à envoyer ou à imprimer.',
              accepts: const ['XLSX', 'XLS'],
              actionLabel: 'Choisir un classeur',
              onAction: _pick,
              busy: _busy,
            )
          : ListView(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 96),
              children: [
                Card(
                  child: ListTile(
                    leading: Icon(
                      _fileName == null ? Icons.upload_file : Icons.table_view,
                    ),
                    title: Text(_fileName ?? 'Choisir un classeur .xlsx'),
                    subtitle: Text(
                      sheets == null
                          ? 'Aucun fichier choisi'
                          : '${sheets.length} feuille(s) · $totalRows ligne(s) au total',
                    ),
                    trailing: _fileName == null
                        ? TextButton(
                            onPressed: _busy ? null : _pick,
                            child: const Text('Choisir'),
                          )
                        : IconButton(
                            icon: const Icon(Icons.close),
                            onPressed: _busy ? null : _clear,
                          ),
                    onTap: _fileName == null && !_busy ? _pick : null,
                  ),
                ),
                if (_busy && sheets == null) ...[
                  const SizedBox(height: 24),
                  const Center(child: CircularProgressIndicator()),
                ],
                if (sheets != null) ...[
                  const SizedBox(height: 20),
                  Text(
                    'Feuilles détectées',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  const SizedBox(height: 8),
                  Card(
                    child: Column(
                      children: [
                        for (int i = 0; i < sheets.length; i++) ...[
                          if (i > 0) const Divider(height: 1),
                          ListTile(
                            dense: true,
                            leading: const Icon(Icons.grid_on_outlined),
                            title: Text(sheets[i].name),
                            subtitle: Text(
                              sheets[i].rows.isEmpty
                                  ? 'Feuille vide'
                                  : '${sheets[i].rows.length} ligne(s) × '
                                        '${sheets[i].columnCount} colonne(s)',
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Card(
                    child: SwitchListTile(
                      value: _repeatHeader,
                      onChanged: (bool v) => setState(() => _repeatHeader = v),
                      title: const Text(
                        'Répéter la ligne d\'en-tête sur chaque page',
                      ),
                      subtitle: const Text(
                        'La première ligne de la feuille est redessinée en haut de '
                        'chaque page du tableau.',
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Card(
                    color: Theme.of(
                      context,
                    ).colorScheme.surfaceContainerHighest,
                    child: const Padding(
                      padding: EdgeInsets.all(14),
                      child: Text(
                        'Ce que la conversion reprend : le texte des cellules tel '
                        'qu\'il est enregistré dans le fichier (y compris le dernier '
                        'résultat calculé des formules), la première ligne en gras et '
                        'un quadrillage.\n\n'
                        'Ce qui n\'est pas repris : couleurs, polices, formats de '
                        'nombres, cellules fusionnées, images, graphiques et formules '
                        'elles-mêmes. Les colonnes sont réduites pour tenir dans la '
                        'largeur de la page ; sur les feuilles très larges, le texte '
                        'des cellules trop étroites est tronqué par « … ».',
                        style: TextStyle(fontSize: 13),
                      ),
                    ),
                  ),
                ],
              ],
            ),
      bottomNavigationBar: sheets == null
          ? null
          : SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: FilledButton.icon(
                  onPressed: _busy ? null : _convert,
                  icon: const Icon(Icons.picture_as_pdf_outlined),
                  label: const Text('Convertir en PDF', maxLines: 1),
                ),
              ),
            ),
    );
  }
}
