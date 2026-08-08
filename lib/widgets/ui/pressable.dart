import 'package:flutter/material.dart';

import '../../theme/theme.dart';

/// Surface tactile de l'application — `press-sink`, l'une des deux seules
/// primitives de mouvement du système.
///
/// Elle couvre les huit états attendus d'un élément interactif :
/// repos, survol, focus clavier, appui, désactivé, occupé, sélectionné, erreur.
/// Les trois derniers sont pilotés par les paramètres [busy], [selected] et
/// [invalid] plutôt que par des variantes de widget, pour qu'un écran n'ait
/// jamais à réinventer l'apparence d'une carte occupée.
class Pressable extends StatefulWidget {
  const Pressable({
    super.key,
    required this.child,
    this.onTap,
    this.onLongPress,
    this.borderRadius = Radii.allLg,
    this.busy = false,
    this.selected = false,
    this.invalid = false,
    this.semanticLabel,
  });

  final Widget child;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final BorderRadius borderRadius;

  /// Une opération est en cours : la surface reste visible mais n'accepte
  /// plus d'entrée, sans sauter à un rendu « désactivé » qui la ferait
  /// disparaître visuellement.
  final bool busy;

  final bool selected;
  final bool invalid;
  final String? semanticLabel;

  bool get _enabled => onTap != null && !busy;

  @override
  State<Pressable> createState() => _PressableState();
}

class _PressableState extends State<Pressable> {
  bool _pressed = false;
  bool _focused = false;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final reduced = Motion.reduced(context);
    final sink = _pressed && !reduced ? 0.975 : 1.0;

    Widget surface = AnimatedScale(
      scale: sink,
      duration: Motion.instant,
      curve: Motion.easeOut,
      child: AnimatedOpacity(
        opacity: widget.busy ? 0.55 : 1,
        duration: Motion.quick,
        child: widget.child,
      ),
    );

    // L'anneau de focus n'est jamais animé : il doit apparaître à l'instant
    // où le focus arrive, sinon il ne sert plus à se repérer au clavier.
    if (_focused) {
      surface = DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: widget.borderRadius,
          border: Border.all(color: colors.accent, width: Rule.thick),
        ),
        child: surface,
      );
    } else if (widget.invalid) {
      surface = DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: widget.borderRadius,
          border: Border.all(color: colors.accentDeep, width: Rule.hair),
        ),
        child: surface,
      );
    }

    return Semantics(
      label: widget.semanticLabel,
      button: true,
      enabled: widget._enabled,
      selected: widget.selected,
      child: Focus(
        onFocusChange: (v) => setState(() => _focused = v),
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: widget._enabled ? widget.onTap : null,
          onLongPress: widget._enabled ? widget.onLongPress : null,
          onTapDown: widget._enabled
              ? (_) => setState(() => _pressed = true)
              : null,
          onTapUp: widget._enabled
              ? (_) => setState(() => _pressed = false)
              : null,
          onTapCancel: widget._enabled
              ? () => setState(() => _pressed = false)
              : null,
          child: surface,
        ),
      ),
    );
  }
}
