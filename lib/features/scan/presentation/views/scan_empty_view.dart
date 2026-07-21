import 'package:flutter/material.dart';

import 'package:bagguard/core/theme/app_colors.dart';
import 'package:bagguard/core/theme/app_spacing.dart';
import 'package:bagguard/core/constants/app_icons.dart';
import 'package:bagguard/core/constants/app_strings.dart';
import 'package:bagguard/shared/widgets/app_indicator.dart';
import 'package:bagguard/core/constants/app_dimensions.dart';
import 'package:bagguard/shared/widgets/buttons/app_button.dart';
import 'package:bagguard/shared/widgets/app_bottom_action_layout.dart';

class ScanEmptyView extends StatelessWidget {
  const ScanEmptyView({super.key});

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
              AppIcons.bluetooth,
              size: AppDimensions.logoLarge,
              color: AppColors.primary,
            ),

            const SizedBox(height: AppSpacing.xl),

            Text(
              AppStrings.noDevicesFound,
              textAlign: TextAlign.center,
              style: textTheme.headlineMedium,
            ),

            const SizedBox(height: AppSpacing.md),

            Text(
              AppStrings.noDevicesFoundDescription,
              textAlign: TextAlign.center,
              style: textTheme.bodyMedium,
            ),

            const SizedBox(height: AppSpacing.xxl),

            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AppIndicator(
                  icon: Icon(AppIcons.device, size: AppDimensions.iconSmall),
                  label: AppStrings.deviceIsOn,
                ),

                const SizedBox(height: AppSpacing.md),

                const AppIndicator(
                  icon: Icon(AppIcons.bluetooth, size: AppDimensions.iconSmall),
                  label: AppStrings.bluetoothIsOn,
                ),

                const SizedBox(height: AppSpacing.md),

                const AppIndicator(
                  icon: Icon(AppIcons.location, size: AppDimensions.iconSmall),
                  label: AppStrings.withinRange,
                ),
              ],
            ),
          ],
        ),
        bottom: AppButton(
          text: AppStrings.scanAgain,
          onPressed: () {
            // Bloc integration
          },
        ),
      ),
    );
  }
}
