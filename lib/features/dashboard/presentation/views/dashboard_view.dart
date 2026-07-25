import 'package:flutter/material.dart';

import 'package:bagguard/core/theme/app_colors.dart';
import 'package:bagguard/core/theme/app_spacing.dart';
import 'package:bagguard/shared/widgets/app_card.dart';
import 'package:bagguard/core/constants/app_icons.dart';
import 'package:bagguard/shared/widgets/app_slider.dart';
import 'package:bagguard/shared/widgets/app_header.dart';
import 'package:bagguard/shared/widgets/app_switch.dart';
import 'package:bagguard/core/constants/app_strings.dart';
import 'package:bagguard/core/constants/app_dimensions.dart';
import 'package:bagguard/shared/widgets/app_quick_action.dart';
import 'package:bagguard/shared/widgets/app_section_header.dart';
import 'package:bagguard/shared/widgets/buttons/app_icon_button.dart';
import 'package:bagguard/features/dashboard/presentation/widgets/device_carousel.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.sm),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppHeader(
              leading: AppIconButton(
                icon: const Icon(AppIcons.hamMenu),
                iconSize: AppDimensions.iconLarge,
                onPressed: () {},
              ),
              trailing: AppIconButton(
                icon: const Icon(AppIcons.notification),
                iconSize: AppDimensions.iconLarge,
                onPressed: () {},
              ),
            ),

            const SizedBox(height: AppSpacing.xs),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(AppStrings.appName, style: textTheme.headlineLarge),

                  const SizedBox(height: AppSpacing.xs),

                  Text(AppStrings.appSubtitle, style: textTheme.bodyMedium),

                  const SizedBox(height: AppSpacing.xl),

                  DeviceCarousel(),

                  const SizedBox(height: AppSpacing.xl),

                  AppCard(
                    child: AppSectionHeader(
                      title: AppStrings.protection,
                      action: AppSwitch(value: true, onChanged: (_) {}),
                    ),
                  ),

                  const SizedBox(height: AppSpacing.lg),

                  AppCard(
                    child: Column(
                      children: [
                        AppSectionHeader(
                          title: AppStrings.sensitivity,
                          action: const Text(AppStrings.medium),
                        ),

                        const SizedBox(height: AppSpacing.md),

                        AppSlider(value: 50, label: '50', onChanged: (_) {}),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(AppStrings.low, style: textTheme.bodyMedium),
                            Text(AppStrings.high, style: textTheme.bodyMedium),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: AppSpacing.xl),

                  const AppSectionHeader(title: AppStrings.quickActions),

                  const SizedBox(height: AppSpacing.md),

                  Row(
                    children: [
                      Expanded(
                        child: AppQuickAction(
                          icon: const Icon(AppIcons.alarm),
                          label: AppStrings.testAlarm,
                          backgroundColor: AppColors.alarm.withAlpha(50),
                          onTap: () {},
                        ),
                      ),

                      const SizedBox(width: AppSpacing.md),

                      Expanded(
                        child: AppQuickAction(
                          icon: const Icon(AppIcons.scan),
                          label: AppStrings.scan,
                          backgroundColor: AppColors.buttonPrimary.withAlpha(
                            50,
                          ),
                          onTap: () {},
                        ),
                      ),

                      const SizedBox(width: AppSpacing.md),

                      Expanded(
                        child: AppQuickAction(
                          icon: const Icon(AppIcons.history),
                          label: AppStrings.history,
                          backgroundColor: AppColors.info.withAlpha(50),
                          onTap: () {},
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
