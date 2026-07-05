import 'package:flutter/material.dart';

import 'package:bagguard/core/theme/app_colors.dart';
import 'package:bagguard/core/theme/app_radius.dart';

class AppDialogTheme {
  AppDialogTheme._();

  static DialogThemeData get light {
    return DialogThemeData(
      backgroundColor: AppColors.dialogLight,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadius.dialog),
      ),
    );
  }

  static DialogThemeData get dark {
    return DialogThemeData(
      backgroundColor: AppColors.dialogDark,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadius.dialog),
      ),
    );
  }
}
