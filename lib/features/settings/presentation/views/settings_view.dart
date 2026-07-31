import 'package:flutter/material.dart';

import 'package:bagguard/core/theme/app_spacing.dart';
import 'package:bagguard/shared/widgets/app_card.dart';
import 'package:bagguard/core/constants/app_icons.dart';
import 'package:bagguard/shared/widgets/app_switch.dart';
import 'package:bagguard/shared/widgets/app_header.dart';
import 'package:bagguard/core/constants/app_strings.dart';
import 'package:bagguard/shared/widgets/app_list_tile.dart';
import 'package:bagguard/core/constants/app_dimensions.dart';
import 'package:bagguard/shared/widgets/buttons/app_icon_button.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return SafeArea(
      child: RefreshIndicator(
        onRefresh: () async {},
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppSpacing.sm),
          physics: const AlwaysScrollableScrollPhysics(
            parent: BouncingScrollPhysics(),
          ),
          child: Column(
            children: [
              AppHeader(
                leading: Padding(
                  padding: const EdgeInsets.only(left: AppSpacing.sm),
                  child: Text(
                    AppStrings.settings,
                    style: textTheme.headlineLarge,
                  ),
                ),
                trailing: AppIconButton(
                  icon: const Icon(AppIcons.help),
                  iconSize: AppDimensions.iconLarge,
                  onPressed: () {},
                ),
              ),

              const SizedBox(height: AppSpacing.lg),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(AppStrings.general, style: textTheme.titleMedium),

                    const SizedBox(height: AppSpacing.sm),

                    AppCard(
                      padding: EdgeInsets.zero,
                      child: Column(
                        children: [
                          AppListTile(
                            padding: const EdgeInsets.symmetric(
                              horizontal: AppSpacing.md,
                            ),
                            title: AppStrings.notifications,
                            trailing: AppSwitch(
                              value: true,
                              onChanged: (value) {},
                            ),
                            showDivider: true,
                          ),
                          AppListTile(
                            padding: const EdgeInsets.symmetric(
                              horizontal: AppSpacing.md,
                            ),
                            title: AppStrings.autoReconnect,
                            trailing: AppSwitch(
                              value: true,
                              onChanged: (value) {},
                            ),
                            showDivider: true,
                          ),
                          AppListTile(
                            padding: const EdgeInsets.symmetric(
                              horizontal: AppSpacing.md,
                            ),
                            title: AppStrings.darkMode,
                            trailing: AppSwitch(
                              value: false,
                              onChanged: (value) {},
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: AppSpacing.lg),

                    Text(AppStrings.device, style: textTheme.titleMedium),

                    const SizedBox(height: AppSpacing.sm),

                    AppCard(
                      padding: EdgeInsets.zero,
                      child: Column(
                        children: [
                          AppListTile(
                            padding: const EdgeInsets.symmetric(
                              horizontal: AppSpacing.md,
                            ),
                            title: AppStrings.vibration,
                            trailing: AppSwitch(
                              value: true,
                              onChanged: (value) {},
                            ),
                            showDivider: true,
                          ),
                          AppListTile(
                            padding: const EdgeInsets.symmetric(
                              horizontal: AppSpacing.md,
                            ),
                            title: AppStrings.loudAlarm,
                            trailing: AppSwitch(
                              value: false,
                              onChanged: (value) {},
                            ),
                            showDivider: true,
                          ),
                          AppListTile(
                            title: AppStrings.sensitivityLevels,
                            trailing: const Icon(AppIcons.right),
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: AppSpacing.lg),

                    Text(AppStrings.about, style: textTheme.titleMedium),

                    const SizedBox(height: AppSpacing.sm),

                    AppCard(
                      padding: EdgeInsets.zero,
                      child: Column(
                        children: [
                          AppListTile(
                            title: AppStrings.privacyPolicy,
                            trailing: const Icon(AppIcons.right),
                            onTap: () {},
                            showDivider: true,
                          ),
                          AppListTile(
                            title: AppStrings.termsofService,
                            trailing: const Icon(AppIcons.right),
                            onTap: () {},
                            showDivider: true,
                          ),
                          AppListTile(
                            title: AppStrings.appVersion,
                            trailing: Text('1.0.0', style: textTheme.bodyLarge),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: AppSpacing.xxxl),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
