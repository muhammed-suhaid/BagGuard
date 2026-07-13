import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:bagguard/app/app_routes.dart';
import 'package:bagguard/core/theme/app_colors.dart';
import 'package:bagguard/core/theme/app_spacing.dart';
import 'package:bagguard/core/constants/app_icons.dart';
import 'package:bagguard/core/constants/app_strings.dart';
import 'package:bagguard/core/constants/app_dimensions.dart';
import 'package:bagguard/shared/widgets/app_state_content.dart';
import 'package:bagguard/shared/widgets/buttons/app_button.dart';

class NotFoundScreen extends StatelessWidget {
  const NotFoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: AppStateContent(
                  illustration: Icon(
                    AppIcons.error,
                    size: AppDimensions.iconXLarge * 2,
                    color: AppColors.error,
                  ),
                  title: AppStrings.pageNotFound,
                  message: AppStrings.pageNotFoundMessage,
                ),
              ),
            ),

            AppButton(
              text: AppStrings.toDashboard,
              onPressed: () => context.go(AppRoutes.dashboard),
            ),
          ],
        ),
      ),
    );
  }
}
