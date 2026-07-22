import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:bagguard/app/app_routes.dart';
import 'package:bagguard/core/theme/app_colors.dart';
import 'package:bagguard/core/theme/app_spacing.dart';
import 'package:bagguard/core/constants/app_icons.dart';
import 'package:bagguard/core/constants/app_strings.dart';
import 'package:bagguard/core/constants/app_dimensions.dart';
import 'package:bagguard/shared/widgets/buttons/app_button.dart';
import 'package:bagguard/shared/widgets/app_bottom_action_layout.dart';

class ScanConnectedView extends StatelessWidget {
  const ScanConnectedView({super.key, required this.deviceName});

  final String deviceName;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: AppBottomActionLayout(
        centerContent: true,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // TODO: Replace with illustration
            const Icon(
              AppIcons.device,
              size: AppDimensions.logoLarge,
              color: AppColors.primary,
            ),

            const SizedBox(height: AppSpacing.xl),

            Text(
              deviceName,
              textAlign: TextAlign.center,
              style: textTheme.headlineMedium,
            ),

            const SizedBox(height: AppSpacing.sm),

            Text(
              AppStrings.connectedSuccessfully,
              textAlign: TextAlign.center,
              style: textTheme.headlineMedium,
            ),

            const SizedBox(height: AppSpacing.md),

            Text(
              AppStrings.deviceReadyDescription,
              textAlign: TextAlign.center,
              style: textTheme.bodyMedium,
            ),
          ],
        ),
        bottom: AppButton(
          text: AppStrings.continueToDashboard,
          onPressed: () {
            context.go(AppRoutes.dashboard);
          },
        ),
      ),
    );
  }
}
