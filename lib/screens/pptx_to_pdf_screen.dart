import 'dart:typed_data';

import 'package:flutter/material.dart';

import '../core/office/ooxml.dart';
import '../core/office/pptx_to_pdf.dart';
import '../widgets/progress_dialog.dart';
import '../widgets/ui/empty_state.dart';
import 'preview_screen.dart';

/// Nombre de diapositives listees dans l'apercu avant conversion.
const int _kPreviewLimit = 30;

class PptxToPdfScreen extends StatefulWidget {
  const PptxToPdfScreen({super.key});

  @override
  State<PptxToPdfScreen> createState() => _PptxToPdfScreenState();
}

class _PptxToPdfScreenState extends State<PptxToPdfScreen> {
  PickedPptx? _picked;
  List<PptxSlide> _slides = const <PptxSlide>[];
  bool _busy = false;

  void _showError(String message) {
    if (!mounted) return;
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  String _friendlyError(Object e) {
    final String s = e is FormatException
        ? (e.message.isEmpty ? e.toString() : e.message)
        : e.toString();
    return s.length > 180 ? '${s.substring(0, 180)}…' : s;
  }

  Future<void> _pick() async {
    setState(() => _busy = true);
    try {
      final PickedPptx? picked = await PptxToPdf.pickPptxFile();
      if (picked == null) return;
      // La lecture est purement en memoire (ZIP + XML) : rapide, pas besoin
      // de dialogue de progression ici.
      final List<PptxSlide> slides = PptxToPdf.readSlides(picked.bytes);
      if (!mounted) return;
      setState(() {
        _picked = picked;
        _slides = slides;
      });
    } on LegacyPptException catch (e) {
      _showError(e.toString());
    } catch (e) {
      _showError('Lecture impossible : ${_friendlyError(e)}');
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  void _clear() {
    setState(() {
      _picked = null;
      _slides = const <PptxSlide>[];
    });
  }

  Future<void> _convert() async {
    final PickedPptx? picked = _picked;
    if (picked == null || _slides.isEmpty) return;
    final List<PptxSlide> slides = _slides;
    try {
      final Uint8List? bytes = await runWithProgressDialog<Uint8List>(
        context: context,
        title: 'Conversion en cours…',
        task: (token, onProgress) => PptxToPdf.convert(
          slides,
          onProgress: onProgress,
          cancelToken: token,
        ),
      );
      if (bytes == null || !mounted) return;
      Navigator.of(context).push(
        MaterialPageRoute<void>(
          builder: (_) => PreviewScreen(
            pdfBytes: bytes,
            suggestedName: PptxToPdf.suggestedPdfName(picked.name),
          ),
        ),
      );
    } catch (e) {
      _showError('Echec de la conversion : ${_friendlyError(e)}');
    }
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final PickedPptx? picked = _picked;
    final int slideCount = _slides.length;
    final int shown = slideCount > _kPreviewLimit ? _kPreviewLimit : slideCount;

    return Scaffold(
      appBar: AppBar(title: const Text('PowerPoint vers PDF')),
      body: picked == null
          ? EmptyState(
              icon: Icons.slideshow_outlined,
              title: 'Une présentation en PDF',
              // L'avertissement sur le .ppt vivait dans une branche
              // `if (picked == null)` écrite à l'intérieur du cas « fichier
              // chargé » : il ne pouvait plus s'afficher. Sa place est ici, au
              // moment où l'on va choisir le fichier — après coup, il arrive
              // trop tard pour servir à quoi que ce soit.
              body:
                  'Une page paysage 16:9 par diapositive, reprenant le titre '
                  'et les puces. Le texte est repris ; les images, formes et '
                  'arrière-plans d’origine ne le sont pas.\n\n'
                  'Format accepté : .pptx. Un ancien fichier .ppt doit d’abord '
                  'être réenregistré en .pptx depuis PowerPoint.',
              accepts: const ['PPTX'],
              actionLabel: 'Choisir une présentation',
              onAction: _pick,
              busy: _busy,
            )
          : ListView(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 96),
              children: [
                Card(
                  color: theme.colorScheme.secondaryContainer,
                  child: Padding(
                    padding: const EdgeInsets.all(14),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.info_outline,
                          color: theme.colorScheme.onSecondaryContainer,
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Conversion du texte uniquement',
                                style: theme.textTheme.titleSmall?.copyWith(
                                  color: theme.colorScheme.onSecondaryContainer,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                'Le texte de chaque diapositive est repris. Les '
                                'images, formes, arrière-plans, couleurs et mises '
                                'en page d\'origine ne sont pas conservés : le PDF '
                                'obtenu est une mise en page simple et lisible, pas '
                                'une copie fidèle de votre présentation.',
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: theme.colorScheme.onSecondaryContainer,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Card(
                  child: ListTile(
                    leading: const Icon(Icons.slideshow_outlined),
                    title: Text(
                      picked.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    subtitle: Text(
                      '$slideCount diapositive${slideCount > 1 ? 's' : ''}',
                    ),
                    trailing: IconButton(
                      tooltip: 'Retirer ce fichier',
                      icon: const Icon(Icons.close),
                      onPressed: _busy ? null : _clear,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Diapositives détectées',
                  style: theme.textTheme.titleSmall,
                ),
                const SizedBox(height: 8),
                for (int i = 0; i < shown; i++)
                  _slideTile(theme, i, _slides[i]),
                if (slideCount > shown)
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(
                      'et ${slideCount - shown} autre'
                      '${slideCount - shown > 1 ? 's' : ''} diapositive'
                      '${slideCount - shown > 1 ? 's' : ''}…',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ),
              ],
            ),
      bottomNavigationBar: picked == null
          ? null
          : SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: FilledButton.icon(
                  onPressed: _busy || _slides.isEmpty ? null : _convert,
                  icon: const Icon(Icons.picture_as_pdf_outlined),
                  label: const Text('Convertir en PDF', maxLines: 1),
                ),
              ),
            ),
    );
  }

  Widget _slideTile(ThemeData theme, int index, PptxSlide slide) {
    final String title = slide.title.trim();
    final int bullets = slide.bullets
        .where((String b) => b.trim().isNotEmpty)
        .length;
    final bool empty = title.isEmpty && bullets == 0;

    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        dense: true,
        leading: CircleAvatar(
          radius: 16,
          backgroundColor: theme.colorScheme.primaryContainer,
          child: Text(
            '${index + 1}',
            style: theme.textTheme.labelMedium?.copyWith(
              color: theme.colorScheme.onPrimaryContainer,
            ),
          ),
        ),
        title: Text(
          title.isEmpty ? 'Sans titre' : title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: title.isEmpty
              ? TextStyle(
                  fontStyle: FontStyle.italic,
                  color: theme.colorScheme.onSurfaceVariant,
                )
              : null,
        ),
        subtitle: Text(
          empty
              ? 'Aucun texte (image ou forme uniquement)'
              : '$bullets ligne${bullets > 1 ? 's' : ''} de texte',
        ),
      ),
    );
  }
}
