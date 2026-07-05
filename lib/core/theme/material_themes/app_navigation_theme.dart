import 'package:flutter/material.dart';

import 'package:bagguard/core/theme/app_colors.dart';

class AppNavigationTheme {
  AppNavigationTheme._();

  static NavigationBarThemeData light = NavigationBarThemeData(
    backgroundColor: AppColors.backgroundLight,
    indicatorColor: AppColors.primary.withValues(alpha: 0.12),
  );

  static NavigationBarThemeData dark = NavigationBarThemeData(
    backgroundColor: AppColors.backgroundDark,
    indicatorColor: AppColors.primary.withValues(alpha: 0.12),
  );
}
