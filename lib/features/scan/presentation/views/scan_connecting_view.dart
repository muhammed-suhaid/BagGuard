import 'package:flutter/material.dart';

import 'package:bagguard/core/theme/app_colors.dart';
import 'package:bagguard/core/theme/app_spacing.dart';
import 'package:bagguard/core/constants/app_icons.dart';
import 'package:bagguard/shared/widgets/app_loading.dart';
import 'package:bagguard/core/constants/app_strings.dart';
import 'package:bagguard/core/constants/app_dimensions.dart';
import 'package:bagguard/shared/widgets/app_bottom_action_layout.dart';

class ScanConnectingView extends StatelessWidget {
  const ScanConnectingView({super.key, required this.deviceName});

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
              '${AppStrings.connectingTo}\n$deviceName',
              textAlign: TextAlign.center,
              style: textTheme.headlineMedium,
            ),

            const SizedBox(height: AppSpacing.md),

            Text(
              AppStrings.connectingDescription,
              textAlign: TextAlign.center,
              style: textTheme.bodyMedium,
            ),
          ],
        ),
        bottom: const AppLoading(),
      ),
    );
  }
}
