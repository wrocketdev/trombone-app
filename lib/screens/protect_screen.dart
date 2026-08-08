import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart' as sf;

import '../core/ads/ad_service.dart';
import '../core/files/export_service.dart';
import '../core/pdf/security_engine.dart';
import '../widgets/progress_dialog.dart';
import '../theme/theme.dart';
import '../core/files/file_utils.dart';
import '../widgets/ui/empty_state.dart';
import '../widgets/ui/export_outcome.dart';
import '../widgets/ui/picked_file_card.dart';
import '../widgets/ui/result_card.dart';

class ProtectScreen extends StatefulWidget {
  const ProtectScreen({super.key});

  @override
  State<ProtectScreen> createState() => _ProtectScreenState();
}

class _ProtectScreenState extends State<ProtectScreen> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmController = TextEditingController();

  PickedPdf? _picked;
  Uint8List? _resultBytes;
  bool _busy = false;
  bool _obscure = true;

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmController.dispose();
    super.dispose();
  }

  bool get _passwordsValid =>
      _passwordController.text.isNotEmpty &&
      _passwordController.text == _confirmController.text;

  bool get _mismatch => _confirmController.text.isNotEmpty && !_passwordsValid;

  Widget _obscureToggle() => IconButton(
    tooltip: _obscure
        ? 'Afficher les mots de passe'
        : 'Masquer les mots de passe',
    icon: Icon(
      _obscure ? Icons.visibility_outlined : Icons.visibility_off_outlined,
    ),
    onPressed: () => setState(() => _obscure = !_obscure),
  );

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
      setState(() {
        _picked = picked;
        _resultBytes = null;
      });
    } catch (e) {
      if (mounted) _showError('Impossible d\'ouvrir le fichier : $e');
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  Future<void> _protect() async {
    final picked = _picked;
    if (picked == null || !_passwordsValid) return;
    final String password = _passwordController.text;

    sf.PdfDocument doc;
    try {
      doc = sf.PdfDocument(inputBytes: picked.bytes);
    } catch (_) {
      _showError(
        'Ce fichier est déjà protégé — utilisez d\'abord Déverrouiller PDF.',
      );
      return;
    }

    setState(() => _busy = true);
    try {
      final bytes = await runWithProgressDialog<Uint8List>(
        context: context,
        title: 'Protection en cours…',
        task: (token, onProgress) async {
          onProgress(0, 1);
          doc.security.algorithm =
              sf.PdfEncryptionAlgorithm.aesx256BitRevision6;
          doc.security.userPassword = password;
          doc.security.ownerPassword = password;
          final List<int> out = await doc.save();
          onProgress(1, 1);
          return Uint8List.fromList(out);
        },
      );
      if (bytes != null && mounted) {
        setState(() => _resultBytes = bytes);
      }
    } catch (e) {
      if (mounted) _showError('Échec de la protection : $e');
    } finally {
      doc.dispose();
      if (mounted) setState(() => _busy = false);
    }
  }

  Future<void> _save() async {
    final bytes = _resultBytes;
    if (bytes == null) return;
    setState(() => _busy = true);
    try {
      final bool ok = await ExportService.saveToDevice(
        bytes,
        FileUtils.derivedName(_picked?.name, 'protege'),
      );
      if (ok && mounted) {
        await showExportSuccess(
          context,
          what: 'PDF protégé par mot de passe',
          onShare: _share,
        );
      }
    } catch (e) {
      if (mounted) _showError('Échec de l\'export : $e');
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  Future<void> _share() async {
    final bytes = _resultBytes;
    if (bytes == null) return;
    setState(() => _busy = true);
    try {
      await ExportService.share(
        bytes,
        FileUtils.derivedName(_picked?.name, 'protege'),
      );
      unawaited(AdService.instance.showAfterSuccessfulExport());
    } catch (e) {
      if (mounted) _showError('Échec du partage : $e');
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool canProtect = _picked != null && _passwordsValid && !_busy;
    return Scaffold(
      appBar: AppBar(title: const Text('Protéger PDF')),
      body: _picked == null
          ? EmptyState(
              icon: Icons.lock_outline,
              title: 'Mettre sous mot de passe',
              body:
                  'Le PDF ne s’ouvrira plus sans le mot de passe que vous choisissez. Gardez-le : il ne peut pas être récupéré.',
              accepts: const ['PDF'],
              actionLabel: 'Choisir un PDF',
              onAction: _pick,
              busy: _busy,
            )
          : ListView(
              padding: const EdgeInsets.fromLTRB(
                Space.md,
                Space.md,
                Space.md,
                96,
              ),
              children: [
                // La carte du fichier, les deux champs de saisie et le bouton
                // désactivé partageaient le même remplissage beige et le même
                // rayon : quatre boîtes identiques dont une seule portait de
                // l'information, deux attendaient une frappe et une attendait
                // un toucher. [PickedFileCard] rend à la première sa forme de
                // carte, et le bouton désactivé reçoit un contour dans le
                // thème.
                PickedFileCard(
                  name: _picked!.name,
                  subtitle: 'Sera chiffré en AES 256 bits',
                  onChange: _pick,
                  busy: _busy,
                ),
                if (_resultBytes == null) ...[
                  const SizedBox(height: Space.lg),
                  TextField(
                    controller: _passwordController,
                    obscureText: _obscure,
                    autofillHints: const [AutofillHints.newPassword],
                    onChanged: (_) => setState(() {}),
                    decoration: InputDecoration(
                      labelText: 'Mot de passe',
                      suffixIcon: _obscureToggle(),
                    ),
                  ),
                  const SizedBox(height: Space.sm),
                  TextField(
                    controller: _confirmController,
                    obscureText: _obscure,
                    autofillHints: const [AutofillHints.newPassword],
                    onChanged: (_) => setState(() {}),
                    decoration: InputDecoration(
                      labelText: 'Confirmer le mot de passe',
                      // Le second champ n'avait pas de bouton œil, alors que
                      // c'est précisément celui qu'on veut relire quand la
                      // confirmation échoue.
                      suffixIcon: _obscureToggle(),
                      // Le message vivait sous les deux champs, en texte
                      // libre : il ne désignait pas le champ fautif, et le
                      // lecteur d'écran ne le rattachait à aucun. Passé en
                      // `errorText`, il colore le bon champ, s'annonce avec
                      // lui, et prend le carmin — non plus l'orangé de marque,
                      // qui est aussi celui du lien « Changer » juste au-dessus.
                      errorText: _mismatch
                          ? 'Les deux mots de passe diffèrent.'
                          : null,
                    ),
                  ),
                  const SizedBox(height: Space.sm),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.info_outline,
                        size: 14,
                        color: context.colors.inkFaint,
                      ),
                      const SizedBox(width: Space.xxs),
                      Expanded(
                        child: Text(
                          'Notez-le quelque part : sans lui, le document '
                          'devient définitivement illisible. Aucune '
                          'récupération n’est possible, ni par vous ni par '
                          'l’application.',
                          style: AppTypography.micro.copyWith(
                            color: context.colors.inkFaint,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
                if (_resultBytes != null) ...[
                  const SizedBox(height: Space.lg),
                  ResultCard(
                    title: 'PDF protégé',
                    detail:
                        'Chiffré en AES 256 bits. Il faudra le mot de passe '
                        'pour l’ouvrir.',
                    busy: _busy,
                    onSave: _save,
                    onShare: _share,
                  ),
                ],
              ],
            ),
      bottomNavigationBar: (_picked == null || _resultBytes != null)
          ? null
          : SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: FilledButton.icon(
                  onPressed: canProtect ? _protect : null,
                  icon: const Icon(Icons.lock_outline),
                  label: const Text('Protéger', maxLines: 1),
                ),
              ),
            ),
    );
  }
}
