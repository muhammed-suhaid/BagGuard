import 'package:flutter/material.dart';

import 'package:bagguard/core/theme/app_colors.dart';
import 'package:bagguard/core/theme/app_spacing.dart';
import 'package:bagguard/core/constants/app_icons.dart';
import 'package:bagguard/core/constants/app_strings.dart';
import 'package:bagguard/core/enums/app_button_variant.dart';
import 'package:bagguard/core/constants/app_dimensions.dart';
import 'package:bagguard/shared/widgets/buttons/app_button.dart';
import 'package:bagguard/shared/widgets/app_bottom_action_layout.dart';

class ScanLoadingView extends StatelessWidget {
  const ScanLoadingView({super.key, this.isScanning = false});

  final bool isScanning;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: AppBottomActionLayout(
        centerContent: true,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            //TODO: Replace with RadarAnimation widget.
            const Icon(
              AppIcons.bluetooth,
              size: AppDimensions.logoLarge,
              color: AppColors.primary,
            ),

            const SizedBox(height: AppSpacing.xl),

            Text(
              AppStrings.scanningDevicesTitle,
              textAlign: TextAlign.center,
              style: textTheme.headlineMedium,
            ),

            const SizedBox(height: AppSpacing.md),

            Text(
              AppStrings.scanningDevicesSubtitle,
              textAlign: TextAlign.center,
              style: textTheme.bodyMedium,
            ),
          ],
        ),
        bottom: AppButton(
          text: isScanning ? AppStrings.stopScanning : AppStrings.startScanning,
          variant: isScanning
              ? AppButtonVariant.outlined
              : AppButtonVariant.filled,
          onPressed: () {
            //Bloc integration
          },
        ),
      ),
    );
  }
}
