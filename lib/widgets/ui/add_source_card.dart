import 'package:flutter/material.dart';

import '../../theme/theme.dart';

/// La carte « ajouter un fichier », en dernière position d'une liste.
///
/// **Ce qu'elle remplace.** Un `FloatingActionButton` plein accent, posé au
/// coin bas droit, à quelques dizaines de pixels d'un bouton d'export lui aussi
/// plein accent et pleine largeur. Deux surfaces de la même couleur, de la même
/// importance apparente, se disputant le même coin : rien ne disait laquelle
/// terminait le travail.
///
/// **Et ce qu'elle répare en plus.** Une liste de deux fichiers laissait, sur
/// un S24 Ultra, près des deux tiers de l'écran vides entre la dernière rangée
/// et la barre du bas. Le vide n'était pas de la respiration : c'était une
/// liste qui ne disait pas qu'elle pouvait continuer. La carte occupe cet
/// espace en énonçant précisément ce qui manquait — que l'on peut en ajouter
/// d'autres, et lesquels.
///
/// Le contour tireté n'est pas décoratif : il distingue au premier coup d'œil
/// une case à remplir d'une carte qui porte déjà un contenu.
class AddSourceCard extends StatelessWidget {
  const AddSourceCard({
    super.key,
    required this.label,
    required this.onTap,
    this.hint,
    this.busy = false,
  });

  final String label;

  /// Une ligne sous le libellé — les formats acceptés, le plus souvent.
  final String? hint;

  final VoidCallback? onTap;
  final bool busy;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final ink = ToolFamily.of(context);

    return Semantics(
      button: true,
      label: hint == null ? label : '$label. $hint',
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: busy ? null : onTap,
          borderRadius: Radii.allLg,
          child: CustomPaint(
            painter: _DashedBorderPainter(
              color: colors.ruleStrong,
              radius: Radii.lg.x,
            ),
            child: Container(
              constraints: const BoxConstraints(minHeight: 76),
              padding: const EdgeInsets.symmetric(
                horizontal: Space.md,
                vertical: Space.sm,
              ),
              child: Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: ink.wash,
                      borderRadius: Radii.allXs,
                    ),
                    child: busy
                        ? Padding(
                            padding: const EdgeInsets.all(Space.sm),
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: ink.stroke,
                            ),
                          )
                        : Icon(Icons.add, size: 21, color: ink.stroke),
                  ),
                  const SizedBox(width: Space.sm),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          busy ? 'Ouverture…' : label,
                          style: AppTypography.bodyStrong.copyWith(
                            color: colors.ink,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        if (hint != null) ...[
                          const SizedBox(height: 2),
                          Text(
                            hint!,
                            style: AppTypography.micro.copyWith(
                              color: colors.inkFaint,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// Contour tireté à coins arrondis.
///
/// Flutter n'en fournit pas : `Border` ne connaît que le trait plein. Le tracé
/// passe par `PathMetric`, qui donne la longueur exacte du contour arrondi et
/// permet de répartir les tirets sans les casser dans les angles.
class _DashedBorderPainter extends CustomPainter {
  const _DashedBorderPainter({required this.color, required this.radius});

  final Color color;
  final double radius;

  static const double _dash = 5;
  static const double _gap = 4;

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = Rule.hair;

    final Path path = Path()
      ..addRRect(
        RRect.fromRectAndRadius(
          Offset.zero & size,
          Radius.circular(radius),
        ).deflate(Rule.hair / 2),
      );

    for (final metric in path.computeMetrics()) {
      double distance = 0;
      while (distance < metric.length) {
        final double next = (distance + _dash).clamp(0, metric.length);
        canvas.drawPath(metric.extractPath(distance, next), paint);
        distance = next + _gap;
      }
    }
  }

  @override
  bool shouldRepaint(_DashedBorderPainter old) =>
      old.color != color || old.radius != radius;
}
