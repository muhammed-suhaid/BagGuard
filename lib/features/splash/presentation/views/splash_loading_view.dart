import 'package:flutter/material.dart';

import 'package:bagguard/core/theme/app_colors.dart';
import 'package:bagguard/core/theme/app_spacing.dart';
import 'package:bagguard/core/constants/app_icons.dart';
import 'package:bagguard/core/constants/app_strings.dart';
import 'package:bagguard/shared/widgets/app_loading.dart';
import 'package:bagguard/core/enums/app_loading_size.dart';
import 'package:bagguard/core/constants/app_dimensions.dart';

class SplashLoadingView extends StatelessWidget {
  const SplashLoadingView({super.key});

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
                //TODO: Replace with startupAmination Widget
                const Icon(
                  AppIcons.shield,
                  color: AppColors.primary,
                  size: AppDimensions.logoLarge,
                ),

                const SizedBox(height: AppSpacing.xl),

                Text(
                  AppStrings.appName,
                  textAlign: TextAlign.center,
                  style: textTheme.headlineLarge,
                ),

                const SizedBox(height: AppSpacing.md),

                Text(
                  AppStrings.appSubtitle,
                  textAlign: TextAlign.center,
                  style: textTheme.bodyMedium,
                ),

                const SizedBox(height: AppSpacing.xxxl),

                const AppLoading(size: AppLoadingSize.large),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
