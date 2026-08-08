import 'package:flutter/material.dart';

import '../../theme/theme.dart';

/// `stagger-rise` — la seconde et dernière primitive de mouvement du système.
///
/// Les blocs d'un écran apparaissent en cascade courte. L'animation ne porte
/// que `opacity` et `transform`, jamais une propriété de mise en page. Si le
/// système demande de réduire les animations, il ne reste rien : le bloc est
/// posé à sa place définitive dès la première image.
///
/// Le décalage est encodé dans la courbe (`Interval`), pas dans un
/// `Future.delayed`. Un timer détaché du contrôleur survit à la disparition du
/// widget, traîne dans les tests, et oblige à parsemer le code de `mounted` :
/// la version à intervalle n'a aucun de ces défauts.
class StaggerRise extends StatefulWidget {
  const StaggerRise({super.key, required this.index, required this.child});

  /// Rang du bloc dans la cascade. C'est lui qui porte le décalage.
  final int index;
  final Widget child;

  /// Décalage entre deux blocs voisins.
  static const Duration _step = Motion.stagger;

  /// Durée du mouvement d'un bloc, une fois son tour venu.
  static const Duration _rise = Motion.slow;

  /// La cascade est plafonnée : au-delà d'une dizaine de blocs, attendre une
  /// demi-seconde pour voir le bas de l'écran serait une gêne, pas un effet.
  static const int _maxRank = 10;

  @override
  State<StaggerRise> createState() => _StaggerRiseState();
}

class _StaggerRiseState extends State<StaggerRise>
    with SingleTickerProviderStateMixin {
  late final int _rank = widget.index.clamp(0, StaggerRise._maxRank);
  late final Duration _delay = StaggerRise._step * _rank;
  late final Duration _total = _delay + StaggerRise._rise;

  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: _total,
  );

  late final Animation<double> _progress = CurvedAnimation(
    parent: _controller,
    curve: Interval(
      _total.inMicroseconds == 0
          ? 0
          : _delay.inMicroseconds / _total.inMicroseconds,
      1,
      curve: Motion.easeOut,
    ),
  );

  bool _started = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_started) return;
    _started = true;
    if (Motion.reduced(context)) {
      _controller.value = 1;
    } else {
      _controller.forward();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _progress,
      builder: (context, child) => Opacity(
        opacity: _progress.value,
        child: Transform.translate(
          offset: Offset(0, 12 * (1 - _progress.value)),
          child: child,
        ),
      ),
      child: widget.child,
    );
  }
}
