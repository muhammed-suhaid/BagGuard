import 'package:flutter/material.dart';

import 'package:bagguard/core/theme/app_colors.dart';
import 'package:bagguard/core/theme/app_radius.dart';

class AppButtonTheme {
  AppButtonTheme._();

  static FilledButtonThemeData get filledLight {
    return FilledButtonThemeData(
      style: FilledButton.styleFrom(
        elevation: 0,
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.button),
        ),
      ),
    );
  }

  static FilledButtonThemeData get filledDark => filledLight;

  static OutlinedButtonThemeData get outlinedLight {
    return OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        side: const BorderSide(color: AppColors.primary),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.button),
        ),
      ),
    );
  }

  static OutlinedButtonThemeData get outlinedDark => outlinedLight;

  static TextButtonThemeData get textLight {
    return TextButtonThemeData(
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.button),
        ),
      ),
    );
  }

  static TextButtonThemeData get textDark => textLight;
}
