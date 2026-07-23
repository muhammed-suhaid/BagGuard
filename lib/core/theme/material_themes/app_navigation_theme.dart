import 'package:flutter/material.dart';

import 'package:bagguard/core/theme/app_colors.dart';

class AppNavigationTheme {
  AppNavigationTheme._();

  static NavigationBarThemeData light = NavigationBarThemeData(
    backgroundColor: AppColors.backgroundLight,
    indicatorColor: Colors.transparent,
    iconTheme: WidgetStateProperty.resolveWith((states) {
      return IconThemeData(
        color: states.contains(WidgetState.selected)
            ? AppColors.navigationSelected
            : AppColors.navigationUnselectedLight,
      );
    }),
    labelTextStyle: WidgetStateProperty.resolveWith((states) {
      return TextStyle(
        color: states.contains(WidgetState.selected)
            ? AppColors.navigationSelected
            : AppColors.navigationUnselectedLight,
      );
    }),
  );

  static NavigationBarThemeData dark = NavigationBarThemeData(
    backgroundColor: AppColors.backgroundDark,
    indicatorColor: Colors.transparent,
    iconTheme: WidgetStateProperty.resolveWith((states) {
      return IconThemeData(
        color: states.contains(WidgetState.selected)
            ? AppColors.navigationSelected
            : AppColors.navigationUnselectedDark,
      );
    }),
    labelTextStyle: WidgetStateProperty.resolveWith((states) {
      return TextStyle(
        color: states.contains(WidgetState.selected)
            ? AppColors.navigationSelected
            : AppColors.navigationUnselectedDark,
      );
    }),
  );
}
