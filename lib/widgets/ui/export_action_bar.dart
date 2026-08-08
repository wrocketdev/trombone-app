import 'package:flutter/material.dart';

import '../../theme/theme.dart';

/// Barre d'action de l'écran d'aperçu.
///
/// Elle existe comme composant séparé pour deux raisons.
///
/// **La première est un défaut réel.** Les trois actions vivaient sur une seule
/// rangée, chacune dans un `Expanded`. Sur un écran de 384 dp — la largeur d'un
/// Galaxy S24 Ultra — chaque bouton reçoit 117 dp, dont 32 de rembourrage et 27
/// d'icône : il reste 58 dp pour le texte. « Enregistrer » en demande 70, et se
/// coupait en « Enregist / rer ». Un libellé cliquable coupé au milieu d'un mot
/// est un défaut de mise en page, pas une contrainte de la langue.
///
/// **La seconde est de hiérarchie.** C'est ici que se termine chaque parcours
/// de l'application. Les avis du marché montrent que le moment retenu par les
/// utilisateurs est celui de l'export réussi — et que la blessure du marché,
/// c'est le mur découvert précisément à cet instant. L'action d'enregistrer
/// mérite donc toute la largeur, et les deux actions secondaires la rangée du
/// dessous.
///
/// Le composant est isolé pour être testable seul, sans PDF chargé : c'est ce
/// qui manquait pour que le harnais de test attrape la coupure.
class ExportActionBar extends StatelessWidget {
  const ExportActionBar({
    super.key,
    required this.onSave,
    required this.onShare,
    this.onCompress,
    this.busy = false,
    this.saveLabel = 'Enregistrer',
  });

  final VoidCallback onSave;
  final VoidCallback onShare;

  /// Absent sur les écrans qui n'offrent pas la compression. La rangée
  /// secondaire s'adapte : un bouton pleine largeur au lieu de deux moitiés.
  final VoidCallback? onCompress;

  final bool busy;

  /// Le libellé de l'action principale peut être plus précis que
  /// « Enregistrer » — il dispose de toute la largeur.
  final String saveLabel;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.fromLTRB(
          Space.md,
          Space.sm,
          Space.md,
          Space.sm,
        ),
        decoration: BoxDecoration(
          color: colors.paper,
          border: Border(
            top: BorderSide(color: colors.rule, width: Rule.hair),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                onPressed: busy ? null : onSave,
                icon: const Icon(Icons.save_alt),
                label: Text(saveLabel, maxLines: 1),
              ),
            ),
            const SizedBox(height: Space.xs),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: busy ? null : onShare,
                    icon: const Icon(Icons.share_outlined),
                    label: const Text('Partager', maxLines: 1),
                  ),
                ),
                if (onCompress != null) ...[
                  const SizedBox(width: Space.xs),
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: busy ? null : onCompress,
                      icon: const Icon(Icons.compress),
                      label: const Text('Compresser', maxLines: 1),
                    ),
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }
}
