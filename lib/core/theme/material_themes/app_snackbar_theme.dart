import 'package:flutter/material.dart';

import 'package:bagguard/core/theme/app_colors.dart';
import 'package:bagguard/core/theme/app_radius.dart';

class AppSnackBarTheme {
  AppSnackBarTheme._();

  static const SnackBarThemeData light = SnackBarThemeData(
    behavior: SnackBarBehavior.floating,
    backgroundColor: AppColors.cardLight,
    contentTextStyle: TextStyle(
      color: AppColors.textPrimaryLight,
      fontSize: 14,
    ),
    actionTextColor: AppColors.primary,
    elevation: 2,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(AppRadius.button)),
    ),
  );

  static const SnackBarThemeData dark = SnackBarThemeData(
    behavior: SnackBarBehavior.floating,
    backgroundColor: AppColors.cardDark,
    contentTextStyle: TextStyle(
      color: AppColors.textPrimaryDark, 
      fontSize: 14,
    ),
    actionTextColor: AppColors.primary,
    elevation: 2,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(AppRadius.button)),
    ),
  );
}
