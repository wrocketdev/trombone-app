import 'package:flutter/material.dart';

import 'app_colors.dart';

export 'app_colors.dart';
export 'app_spacing.dart';
export 'app_theme.dart';
export 'app_typography.dart';
export 'tool_family.dart';

/// Accès court aux jetons de couleur depuis n'importe quel widget.
///
/// `context.colors.ink` plutôt que
/// `Theme.of(context).extension<AppColors>()!.ink`. Le raccourci compte : plus
/// l'accès aux jetons est court, moins la tentation d'écrire une couleur en
/// dur est forte.
extension AppThemeContext on BuildContext {
  AppColors get colors =>
      Theme.of(this).extension<AppColors>() ?? AppColors.light;

  TextTheme get texts => Theme.of(this).textTheme;

  bool get isDark => Theme.of(this).brightness == Brightness.dark;
}
