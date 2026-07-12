import 'package:flutter/material.dart';

import 'package:bagguard/core/theme/app_colors.dart';
import 'package:bagguard/core/constants/app_icons.dart';

class BatteryUtils {
  BatteryUtils._();

  static IconData icon(int level) {
    if (level >= 90) return AppIcons.batteryFull;
    if (level >= 80) return AppIcons.battery6;
    if (level >= 70) return AppIcons.battery5;
    if (level >= 60) return AppIcons.battery4;
    if (level >= 50) return AppIcons.battery3;
    if (level >= 30) return AppIcons.battery2;
    if (level >= 15) return AppIcons.battery1;
    return AppIcons.batteryAlert;
  }

  static Color color(int level) {
    if (level >= 50) return AppColors.success;
    if (level >= 20) return AppColors.warning;
    return AppColors.error;
  }
}
