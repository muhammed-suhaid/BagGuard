import 'package:flutter/material.dart';

import 'package:bagguard/core/theme/app_colors.dart';

class AppSliderTheme {
  AppSliderTheme._();

  static const SliderThemeData light = SliderThemeData(
    activeTrackColor: AppColors.primary,
    inactiveTrackColor: AppColors.sliderInactiveLight,
    thumbColor: AppColors.primary,
    overlayColor: AppColors.sliderOverlay,
    trackHeight: 4,
    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 8),
    overlayShape: RoundSliderOverlayShape(overlayRadius: 18),
    showValueIndicator: ShowValueIndicator.onDrag,
  );

  static const SliderThemeData dark = SliderThemeData(
    activeTrackColor: AppColors.primary,
    inactiveTrackColor: AppColors.sliderInactiveDark,
    thumbColor: AppColors.primary,
    overlayColor: AppColors.sliderOverlay,
    trackHeight: 4,
    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 8),
    overlayShape: RoundSliderOverlayShape(overlayRadius: 18),
    showValueIndicator: ShowValueIndicator.onDrag,
  );
}
