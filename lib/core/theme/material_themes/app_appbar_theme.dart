import 'package:flutter/material.dart';

import 'package:bagguard/core/theme/app_colors.dart';

class AppAppBarTheme {
  AppAppBarTheme._();

  static const AppBarTheme light = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    backgroundColor: AppColors.backgroundLight,
    foregroundColor: AppColors.textPrimaryLight,
  );

  static const AppBarTheme dark = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    backgroundColor: AppColors.backgroundDark,
    foregroundColor: AppColors.textPrimaryDark,
  );
}
