import 'package:flutter/material.dart';

import 'package:bagguard/core/theme/app_colors.dart';

class AppColorScheme {
  AppColorScheme._();

  static const ColorScheme light = ColorScheme(
    brightness: Brightness.light,

    primary: AppColors.primary,
    onPrimary: Colors.white,

    secondary: AppColors.primary,
    onSecondary: Colors.white,

    error: AppColors.error,
    onError: Colors.white,

    surface: AppColors.surfaceLight,
    onSurface: AppColors.textPrimaryLight,

    primaryContainer: AppColors.primaryLight,
    onPrimaryContainer: AppColors.textPrimaryLight,

    secondaryContainer: AppColors.surfaceLight,
    onSecondaryContainer: AppColors.textPrimaryLight,

    tertiary: AppColors.info,
    onTertiary: Colors.white,

    tertiaryContainer: AppColors.surfaceLight,
    onTertiaryContainer: AppColors.textPrimaryLight,

    surfaceContainerHighest: AppColors.cardLight,

    outline: AppColors.borderLight,
    outlineVariant: AppColors.dividerLight,

    shadow: Colors.black,
    scrim: Colors.black,

    inverseSurface: AppColors.backgroundDark,
    onInverseSurface: AppColors.textPrimaryDark,
    inversePrimary: AppColors.primaryLight,
  );

  static const ColorScheme dark = ColorScheme(
    brightness: Brightness.dark,

    primary: AppColors.primary,
    onPrimary: Colors.white,

    secondary: AppColors.primary,
    onSecondary: Colors.white,

    error: AppColors.error,
    onError: Colors.white,

    surface: AppColors.surfaceDark,
    onSurface: AppColors.textPrimaryDark,

    primaryContainer: AppColors.primaryDark,
    onPrimaryContainer: Colors.white,

    secondaryContainer: AppColors.surfaceDark,
    onSecondaryContainer: AppColors.textPrimaryDark,

    tertiary: AppColors.info,
    onTertiary: Colors.white,

    tertiaryContainer: AppColors.surfaceDark,
    onTertiaryContainer: AppColors.textPrimaryDark,

    surfaceContainerHighest: AppColors.cardDark,

    outline: AppColors.borderDark,
    outlineVariant: AppColors.dividerDark,

    shadow: Colors.black,
    scrim: Colors.black,

    inverseSurface: AppColors.backgroundLight,
    onInverseSurface: AppColors.textPrimaryLight,
    inversePrimary: AppColors.primary,
  );
}
