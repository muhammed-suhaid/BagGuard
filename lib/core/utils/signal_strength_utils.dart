import 'package:flutter/material.dart';

import 'package:bagguard/core/theme/app_colors.dart';
import 'package:bagguard/core/constants/app_icons.dart';

class SignalStrengthUtils {
  SignalStrengthUtils._();

  static IconData icon(int rssi) {
    if (rssi >= -55) return AppIcons.signalFull;
    if (rssi >= -70) return AppIcons.signal3;
    if (rssi >= -85) return AppIcons.signal2;
    return AppIcons.signal1;
  }

  static Color color(int rssi) {
    if (rssi >= -55) return AppColors.success;
    if (rssi >= -70) return AppColors.info;
    if (rssi >= -85) return AppColors.warning;
    return AppColors.error;
  }

  static String label(int rssi) {
    if (rssi >= -55) return 'Excellent';
    if (rssi >= -70) return 'Good';
    if (rssi >= -85) return 'Fair';
    return 'Weak';
  }
}
