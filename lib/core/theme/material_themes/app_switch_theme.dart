import 'package:flutter/material.dart';

import 'package:bagguard/core/theme/app_colors.dart';

class AppSwitchTheme {
  AppSwitchTheme._();

  static SwitchThemeData get light {
    return const SwitchThemeData(
      thumbColor: WidgetStatePropertyAll(AppColors.switchThumb),
    ).copyWith(
      trackColor: WidgetStateProperty.resolveWith(
        (states) => states.contains(WidgetState.selected)
            ? AppColors.switchTrackActive
            : AppColors.switchTrackInactiveLight,
      ),
    );
  }

  static SwitchThemeData get dark {
    return const SwitchThemeData(
      thumbColor: WidgetStatePropertyAll(AppColors.switchThumb),
    ).copyWith(
      trackColor: WidgetStateProperty.resolveWith(
        (states) => states.contains(WidgetState.selected)
            ? AppColors.switchTrackActive
            : AppColors.switchTrackInactiveDark,
      ),
    );
  }
}
