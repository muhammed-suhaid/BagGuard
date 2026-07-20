import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bagguard/core/theme/app_colors.dart';
import 'package:bagguard/core/theme/app_spacing.dart';
import 'package:bagguard/core/constants/app_icons.dart';
import 'package:bagguard/core/constants/app_strings.dart';
import 'package:bagguard/core/enums/app_button_variant.dart';
import 'package:bagguard/core/constants/app_dimensions.dart';
import 'package:bagguard/shared/widgets/app_state_content.dart';
import 'package:bagguard/shared/widgets/buttons/app_button.dart';
import 'package:bagguard/shared/widgets/app_bottom_action_layout.dart';
import 'package:bagguard/features/permissions/data/services/permission_service.dart';
import 'package:bagguard/features/permissions/presentation/bloc/permission_bloc.dart';
import 'package:bagguard/features/permissions/presentation/bloc/permission_event.dart';

class PermissionPermanentlyDeniedView extends StatelessWidget {
  const PermissionPermanentlyDeniedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppBottomActionLayout(
        centerContent: true,
        content: AppStateContent(
          illustration: const Icon(
            AppIcons.lock,
            color: AppColors.warning,
            size: AppDimensions.iconXXXLarge,
          ),
          title: AppStrings.permissionRequired,
          message: AppStrings.permissionSettingsMessage,
        ),
        bottom: Column(
          children: [
            AppButton(
              text: AppStrings.openSettings,
              onPressed: () async {
                await const PermissionService().openSettings();
              },
            ),

            const SizedBox(height: AppSpacing.md),

            AppButton(
              text: AppStrings.retry,
              variant: AppButtonVariant.outlined,
              onPressed: () {
                context.read<PermissionBloc>().add(const PermissionRequested());
              },
            ),
          ],
        ),
      ),
    );
  }
}
