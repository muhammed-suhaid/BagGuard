import 'package:flutter/material.dart';

import 'package:bagguard/core/theme/app_colors.dart';

class AppSwitchTheme {
  AppSwitchTheme._();

  static SwitchThemeData get light {
    return SwitchThemeData(
      thumbColor: const WidgetStatePropertyAll(AppColors.switchThumb),
      trackColor: WidgetStateProperty.resolveWith((states) {
        return states.contains(WidgetState.selected)
            ? AppColors.switchTrackActive
            : AppColors.switchTrackInactiveLight;
      }),
    );
  }

  static SwitchThemeData get dark {
    return SwitchThemeData(
      thumbColor: const WidgetStatePropertyAll(AppColors.switchThumb),
      trackColor: WidgetStateProperty.resolveWith((states) {
        return states.contains(WidgetState.selected)
            ? AppColors.switchTrackActive
            : AppColors.switchTrackInactiveDark;
      }),
    );
  }
}
