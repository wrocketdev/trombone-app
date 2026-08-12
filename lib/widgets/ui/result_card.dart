import 'package:flutter/material.dart';

import '../../l10n/l10n.dart';
import '../../theme/theme.dart';

/// « Le fichier est prêt » — la carte de résultat, avant l'enregistrement.
///
/// À ne pas confondre avec `showExportSuccess`, qui dit « c'est enregistré ».
/// Les deux moments sont distincts et méritent deux formes distinctes : ici on
/// annonce qu'un fichier existe en mémoire et on propose de le poser quelque
/// part ; là on confirme qu'il est posé.
///
/// **Ce que ce composant unifie.** Chaque écran de conversion portait sa propre
/// version de cette carte : `secondaryContainer` chez l'un, `Card` neutre avec
/// une icône sauge chez l'autre, ordre des boutons inversé entre les deux —
/// « Partager / Enregistrer » ici, « Enregistrer / Partager » là. Le même
/// moment du parcours ne peut pas avoir deux dessins et deux ordres de lecture.
///
/// L'action d'enregistrer prend toute la largeur, le partage la rangée du
/// dessous : c'est la même hiérarchie que la barre d'export de l'aperçu, pour
/// la même raison — c'est le geste qui termine le travail.
class ResultCard extends StatelessWidget {
  const ResultCard({
    super.key,
    required this.title,
    required this.detail,
    required this.onSave,
    this.onShare,
    this.busy = false,
    this.saveLabel,
  });

  /// « Document Word prêt », « PDF protégé ».
  final String title;

  /// Le nom et le poids du fichier produit, quand on les connaît.
  final String detail;

  final VoidCallback onSave;
  final VoidCallback? onShare;
  final bool busy;

  /// Nul, il retombe sur « Enregistrer » traduit — la valeur par défaut dépend
  /// de la langue, elle ne peut donc pas être un paramètre constant.
  final String? saveLabel;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final l10n = context.l10n;
    return Container(
      padding: const EdgeInsets.all(Space.md),
      decoration: BoxDecoration(
        color: colors.sageWash,
        borderRadius: Radii.allLg,
        border: Border.all(
          color: colors.sage.withValues(alpha: 0.28),
          width: Rule.hair,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Icon(Icons.check_circle_outline, size: 20, color: colors.sage),
              const SizedBox(width: Space.xs),
              Expanded(
                child: Text(
                  title,
                  style: AppTypography.bodyStrong.copyWith(
                    color: colors.sageDeep,
                  ),
                  maxLines: 2,
                ),
              ),
            ],
          ),
          const SizedBox(height: Space.xxs),
          Text(
            detail,
            style: AppTypography.small.copyWith(color: colors.inkMuted),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: Space.md),
          FilledButton.icon(
            onPressed: busy ? null : onSave,
            icon: const Icon(Icons.save_alt),
            label: Text(saveLabel ?? l10n.actionSave, maxLines: 1),
          ),
          if (onShare != null) ...[
            const SizedBox(height: Space.xs),
            OutlinedButton.icon(
              onPressed: busy ? null : onShare,
              icon: const Icon(Icons.share_outlined),
              label: Text(l10n.actionShare, maxLines: 1),
            ),
          ],
        ],
      ),
    );
  }
}
