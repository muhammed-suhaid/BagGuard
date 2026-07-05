import 'package:flutter/material.dart';

import 'package:bagguard/core/theme/material_themes/app_color_scheme.dart';
import 'package:bagguard/core/theme/material_themes/app_text_theme.dart';
import 'package:bagguard/core/theme/material_themes/app_appbar_theme.dart';
import 'package:bagguard/core/theme/material_themes/app_button_theme.dart';
import 'package:bagguard/core/theme/material_themes/app_card_theme.dart';
import 'package:bagguard/core/theme/material_themes/app_dialog_theme.dart';
import 'package:bagguard/core/theme/material_themes/app_input_theme.dart';
import 'package:bagguard/core/theme/material_themes/app_navigation_theme.dart';
import 'package:bagguard/core/theme/material_themes/app_slider_theme.dart';
import 'package:bagguard/core/theme/material_themes/app_snackbar_theme.dart';
import 'package:bagguard/core/theme/material_themes/app_switch_theme.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get light {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,

      colorScheme: AppColorScheme.light,

      scaffoldBackgroundColor: AppColorScheme.light.surface,
      cardColor: AppColorScheme.light.surfaceContainerHighest,
      dividerColor: AppColorScheme.light.outlineVariant,

      textTheme: AppTextTheme.light,

      appBarTheme: AppAppBarTheme.light,
      cardTheme: AppCardTheme.light,
      dialogTheme: AppDialogTheme.light,
      inputDecorationTheme: AppInputTheme.light,

      elevatedButtonTheme: AppButtonTheme.elevatedLight,
      outlinedButtonTheme: AppButtonTheme.outlinedLight,

      snackBarTheme: AppSnackBarTheme.light,
      switchTheme: AppSwitchTheme.light,
      sliderTheme: AppSliderTheme.light,

      navigationBarTheme: AppNavigationTheme.light,
    );
  }

  static ThemeData get dark {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,

      colorScheme: AppColorScheme.dark,

      scaffoldBackgroundColor: AppColorScheme.dark.surface,
      cardColor: AppColorScheme.dark.surfaceContainerHighest,
      dividerColor: AppColorScheme.dark.outlineVariant,

      textTheme: AppTextTheme.dark,

      appBarTheme: AppAppBarTheme.dark,
      cardTheme: AppCardTheme.dark,
      dialogTheme: AppDialogTheme.dark,
      inputDecorationTheme: AppInputTheme.dark,

      elevatedButtonTheme: AppButtonTheme.elevatedDark,
      outlinedButtonTheme: AppButtonTheme.outlinedDark,

      snackBarTheme: AppSnackBarTheme.dark,
      switchTheme: AppSwitchTheme.dark,
      sliderTheme: AppSliderTheme.dark,

      navigationBarTheme: AppNavigationTheme.dark,
    );
  }
}
