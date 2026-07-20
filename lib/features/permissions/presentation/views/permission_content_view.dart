import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bagguard/core/theme/app_colors.dart';
import 'package:bagguard/core/theme/app_spacing.dart';
import 'package:bagguard/core/constants/app_icons.dart';
import 'package:bagguard/core/constants/app_strings.dart';
import 'package:bagguard/shared/widgets/app_indicator.dart';
import 'package:bagguard/core/constants/app_dimensions.dart';
import 'package:bagguard/shared/widgets/buttons/app_button.dart';
import 'package:bagguard/shared/widgets/app_bottom_action_layout.dart';
import 'package:bagguard/features/permissions/presentation/bloc/permission_bloc.dart';
import 'package:bagguard/features/permissions/presentation/bloc/permission_event.dart';

class PermissionContentView extends StatelessWidget {
  const PermissionContentView({super.key, this.isLoading = false});

  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: AppBottomActionLayout(
        centerContent: true,
        content: Column(
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
          ],
        ),
        bottom: AppButton(
          text: AppStrings.grantPermissions,
          isLoading: isLoading,
          onPressed: () {
            context.read<PermissionBloc>().add(const PermissionRequested());
          },
        ),
      ),
    );
  }
}
