import 'package:flutter/material.dart';

import 'package:bagguard/core/theme/app_colors.dart';
import 'package:bagguard/core/constants/app_icons.dart';
import 'package:bagguard/core/constants/app_strings.dart';
import 'package:bagguard/core/constants/app_dimensions.dart';
import 'package:bagguard/shared/widgets/app_state_content.dart';
import 'package:bagguard/shared/widgets/buttons/app_button.dart';
import 'package:bagguard/shared/widgets/app_bottom_action_layout.dart';

class AppErrorView extends StatelessWidget {
  const AppErrorView({super.key, required this.message, required this.onRetry});

  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppBottomActionLayout(
        centerContent: true,
        content: AppStateContent(
          illustration: const Icon(
            AppIcons.error,
            color: AppColors.error,
            size: AppDimensions.iconXXXLarge,
          ),
          title: AppStrings.somethingWentWrong,
          message: message,
        ),
        bottom: AppButton(text: AppStrings.retry, onPressed: onRetry),
      ),
    );
  }
}
