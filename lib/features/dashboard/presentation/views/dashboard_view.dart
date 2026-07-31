import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bagguard/core/theme/app_colors.dart';
import 'package:bagguard/core/theme/app_spacing.dart';
import 'package:bagguard/shared/widgets/app_card.dart';
import 'package:bagguard/core/constants/app_icons.dart';
import 'package:bagguard/shared/widgets/app_header.dart';
import 'package:bagguard/shared/widgets/app_switch.dart';
import 'package:bagguard/core/constants/app_strings.dart';
import 'package:bagguard/core/constants/app_dimensions.dart';
import 'package:bagguard/shared/widgets/app_quick_action.dart';
import 'package:bagguard/shared/widgets/app_section_header.dart';
import 'package:bagguard/features/devices/data/models/device.dart';
import 'package:bagguard/shared/widgets/buttons/app_icon_button.dart';
import 'package:bagguard/features/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:bagguard/features/dashboard/presentation/bloc/dashboard_event.dart';
import 'package:bagguard/features/dashboard/presentation/widgets/device_carousel.dart';
import 'package:bagguard/features/dashboard/presentation/widgets/sensitivity_card.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({
    super.key,
    required this.devices,
    required this.selectedDevice,
    required this.isAddDeviceSelected,
  });

  final List<Device> devices;
  final Device selectedDevice;
  final bool isAddDeviceSelected;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return SafeArea(
      child: RefreshIndicator(
        onRefresh: () async {
          context.read<DashboardBloc>().add(const DashboardStarted());
        },
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(
            AppSpacing.sm,
            AppSpacing.sm,
            AppSpacing.sm,
            AppSpacing.xxxl,
          ),
          physics: const AlwaysScrollableScrollPhysics(
            parent: BouncingScrollPhysics(),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppHeader(
                leading: Padding(
                  padding: const EdgeInsets.only(left: AppSpacing.sm),
                  child: Text(
                    AppStrings.appName,
                    style: textTheme.headlineLarge,
                  ),
                ),
                trailing: AppIconButton(
                  icon: const Icon(AppIcons.notification),
                  iconSize: AppDimensions.iconLarge,
                  onPressed: () {},
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(AppStrings.appSubtitle, style: textTheme.bodyMedium),

                    const SizedBox(height: AppSpacing.xl),

                    DeviceCarousel(
                      devices: devices,
                      onDeviceChanged: (deviceId) {
                        context.read<DashboardBloc>().add(
                          DeviceChanged(deviceId),
                        );
                      },
                      onAddDeviceSelected: () {
                        context.read<DashboardBloc>().add(
                          const AddDeviceSelected(),
                        );
                      },
                    ),

                    const SizedBox(height: AppSpacing.xl),

                    AppCard(
                      child: AppSectionHeader(
                        title: AppStrings.protection,
                        action: AppSwitch(
                          value: isAddDeviceSelected
                              ? false
                              : selectedDevice.protectionEnabled,
                          onChanged: isAddDeviceSelected
                              ? null
                              : (value) {
                                  context.read<DashboardBloc>().add(
                                    ProtectionToggled(enabled: value),
                                  );
                                },
                        ),
                      ),
                    ),

                    const SizedBox(height: AppSpacing.lg),

                    SensitivityCard(
                      device: selectedDevice,
                      enabled: !isAddDeviceSelected,
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
      ),
    );
  }
}
