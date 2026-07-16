import 'package:flutter/material.dart';

import 'package:bagguard/core/theme/app_colors.dart';
import 'package:bagguard/core/theme/app_spacing.dart';
import 'package:bagguard/core/constants/app_icons.dart';
import 'package:bagguard/core/constants/app_strings.dart';
import 'package:bagguard/shared/widgets/app_indicator.dart';
import 'package:bagguard/core/constants/app_dimensions.dart';
import 'package:bagguard/shared/widgets/buttons/app_button.dart';

class PermissionContentView extends StatelessWidget {
  const PermissionContentView({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(AppSpacing.xl),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  AppIcons.shield,
                  size: AppDimensions.logoLarge,
                  color: AppColors.primary,
                ),

                const SizedBox(height: AppSpacing.xl),

                Text(
                  AppStrings.permissionsRequired,
                  textAlign: TextAlign.center,
                  style: textTheme.headlineMedium,
                ),

                const SizedBox(height: AppSpacing.md),

                Text(
                  AppStrings.permissionsDescription,
                  textAlign: TextAlign.center,
                  style: textTheme.bodyMedium,
                ),

                const SizedBox(height: AppSpacing.xxl),

                const AppIndicator(
                  icon: Icon(AppIcons.bluetooth, size: AppDimensions.iconSmall),
                  label: AppStrings.nearbyDevices,
                ),

                const SizedBox(height: AppSpacing.md),

                const AppIndicator(
                  icon: Icon(AppIcons.location, size: AppDimensions.iconSmall),
                  label: AppStrings.location,
                ),

                const SizedBox(height: AppSpacing.xxxl),

                AppButton(
                  text: AppStrings.grantPermissions,
                  onPressed: () {
                    // BLoC integration
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
