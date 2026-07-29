import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bagguard/core/theme/app_colors.dart';
import 'package:bagguard/core/theme/app_spacing.dart';
import 'package:bagguard/shared/widgets/app_card.dart';
import 'package:bagguard/core/utils/battery_utils.dart';
import 'package:bagguard/core/constants/app_icons.dart';
import 'package:bagguard/shared/widgets/app_dialog.dart';
import 'package:bagguard/shared/widgets/app_slider.dart';
import 'package:bagguard/shared/widgets/app_switch.dart';
import 'package:bagguard/shared/widgets/app_header.dart';
import 'package:bagguard/core/utils/date_time_utils.dart';
import 'package:bagguard/core/constants/app_strings.dart';
import 'package:bagguard/shared/widgets/app_indicator.dart';
import 'package:bagguard/shared/widgets/app_list_tile.dart';
import 'package:bagguard/core/utils/sensitivity_utils.dart';
import 'package:bagguard/shared/widgets/app_text_field.dart';
import 'package:bagguard/shared/widgets/app_popup_menu.dart';
import 'package:bagguard/core/constants/app_dimensions.dart';
import 'package:bagguard/core/utils/signal_strength_utils.dart';
import 'package:bagguard/shared/widgets/buttons/app_button.dart';
import 'package:bagguard/features/devices/data/models/device.dart';
import 'package:bagguard/shared/widgets/buttons/app_icon_button.dart';
import 'package:bagguard/features/devices/data/models/device_menu_action.dart';
import 'package:bagguard/features/devices/presentation/bloc/device_details/device_details_bloc.dart';
import 'package:bagguard/features/devices/presentation/bloc/device_details/device_details_event.dart';

class DeviceDetailsView extends StatelessWidget {
  const DeviceDetailsView({super.key, required this.device});

  final Device device;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            context.read<DeviceDetailsBloc>().add(
              DeviceDetailsStarted(device.id),
            );
          },
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(AppSpacing.sm),
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              children: [
                AppHeader(
                  leading: AppIconButton(
                    icon: const Icon(AppIcons.back),
                    iconSize: AppDimensions.iconLarge,
                    onPressed: context.pop,
                  ),
                  trailing: _buildMoreMenu(context),
                ),

                const SizedBox(height: AppSpacing.lg),

                Center(
                  child: SizedBox(
                    height: 150,
                    child: const FlutterLogo(size: 120),
                  ),
                ),

                const SizedBox(height: AppSpacing.lg),

                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.md,
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Center(
                            child: Text(
                              device.name,
                              style: textTheme.headlineMedium,
                            ),
                          ),

                          Center(
                            child: AppIndicator(
                              icon: Icon(
                                AppIcons.connected,
                                color: device.isConnected
                                    ? AppColors.connected
                                    : AppColors.disconnected,
                                size: AppDimensions.iconXSmall,
                              ),
                              label: device.isConnected
                                  ? AppStrings.connected
                                  : AppStrings.disconnected,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: AppSpacing.xl),

                      AppCard(
                        padding: EdgeInsets.zero,
                        child: Column(
                          children: [
                            AppListTile(
                              title: AppStrings.battery,
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    BatteryUtils.icon(device.batteryLevel),
                                    size: AppDimensions.iconSmall,
                                    color: BatteryUtils.color(
                                      device.batteryLevel,
                                    ),
                                  ),

                                  const SizedBox(width: AppSpacing.xs),

                                  Text(
                                    '${device.batteryLevel}%',
                                    style: textTheme.bodyLarge,
                                  ),
                                ],
                              ),
                              showDivider: true,
                            ),

                            AppListTile(
                              title: AppStrings.firmwareVersion,
                              trailing: Text(
                                device.firmwareVersion,
                                style: textTheme.bodyLarge,
                              ),
                              showDivider: true,
                            ),

                            AppListTile(
                              title: AppStrings.signalStrength,
                              trailing: device.signalStrength == null
                                  ? Text(
                                      AppStrings.unavailable,
                                      style: textTheme.bodyLarge,
                                    )
                                  : Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(
                                          SignalStrengthUtils.icon(
                                            device.signalStrength!,
                                          ),
                                          size: AppDimensions.iconSmall,
                                          color: SignalStrengthUtils.color(
                                            device.signalStrength!,
                                          ),
                                        ),

                                        const SizedBox(width: AppSpacing.xs),

                                        Text(
                                          SignalStrengthUtils.label(
                                            device.signalStrength!,
                                          ),
                                          style: textTheme.bodyLarge?.copyWith(
                                            color: SignalStrengthUtils.color(
                                              device.signalStrength!,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                              showDivider: true,
                            ),

                            AppListTile(
                              title: AppStrings.macAddress,
                              trailing: Text(
                                device.macAddress,
                                style: textTheme.bodyLarge,
                              ),
                              showDivider: true,
                            ),

                            AppListTile(
                              title: AppStrings.lastConnected,
                              trailing: Text(
                                device.lastConnected == null
                                    ? AppStrings.never
                                    : DateTimeUtils.relative(
                                        device.lastConnected!,
                                      ),
                                style: textTheme.bodyLarge,
                              ),
                              showDivider: true,
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: AppSpacing.lg),

                      AppCard(
                        padding: EdgeInsets.zero,
                        child: Column(
                          children: [
                            AppListTile(
                              title: AppStrings.protection,
                              trailing: AppSwitch(
                                value: device.protectionEnabled,
                                onChanged: (value) {
                                  context.read<DeviceDetailsBloc>().add(
                                    DeviceProtectionToggled(enabled: value),
                                  );
                                },
                              ),
                              showDivider: true,
                            ),

                            AppListTile(
                              title: AppStrings.sensitivity,
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    SensitivityUtils.label(device.sensitivity),
                                    style: textTheme.bodyLarge,
                                  ),

                                  const SizedBox(width: AppSpacing.xs),

                                  const Icon(Icons.chevron_right),
                                ],
                              ),
                              onTap: () => _showSensitivityDialog(context),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: AppSpacing.xl),

                      AppButton(
                        text: device.isConnected
                            ? AppStrings.disconnectDevice
                            : AppStrings.connectDevice,
                        backgroundColor: device.isConnected
                            ? AppColors.error
                            : AppColors.success,
                        onPressed: () {
                          if (device.isConnected) {
                            context.read<DeviceDetailsBloc>().add(
                              const DeviceDisconnected(),
                            );
                          } else {
                            context.read<DeviceDetailsBloc>().add(
                              const DeviceConnected(),
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMoreMenu(BuildContext context) {
    return AppPopupMenu<DeviceMenuAction>(
      items: const [
        AppPopupMenuItem(
          value: DeviceMenuAction.rename,
          title: AppStrings.changeDeviceName,
          icon: AppIcons.edit,
        ),

        // AppPopupMenuItem(
        //   value: DeviceMenuAction.changeBagType,
        //   title: AppStrings.changeBagType,
        //   icon: AppIcons.bag,
        // ),
        AppPopupMenuItem(
          value: DeviceMenuAction.forget,
          title: AppStrings.forgetDevice,
          icon: AppIcons.delete,
          isDestructive: true,
        ),
      ],
      onSelected: (action) async {
        switch (action) {
          case DeviceMenuAction.rename:
            await _showRenameDialog(context);
            break;

          case DeviceMenuAction.changeBagType:
            // await _showChangeBagTypeDialog(context);
            break;

          case DeviceMenuAction.forget:
            await _showForgetDeviceDialog(context);
            break;
        }
      },
    );
  }

  Future<void> _showRenameDialog(BuildContext context) async {
    final controller = TextEditingController(text: device.name);
    final focusNode = FocusNode();

    final confirmed = await AppDialog.show(
      context,
      title: AppStrings.renameDevice,
      confirmText: AppStrings.save,
      content: Padding(
        padding: const EdgeInsets.only(top: AppSpacing.sm),
        child: AppTextField(
          controller: controller,
          focusNode: focusNode,
          hintText: AppStrings.enterDeviceName,
          textCapitalization: TextCapitalization.words,
          textInputAction: TextInputAction.done,
          autofocus: true,
        ),
      ),
    );

    if (confirmed == true &&
        context.mounted &&
        controller.text.trim().isNotEmpty &&
        controller.text.trim() != device.name) {
      context.read<DeviceDetailsBloc>().add(
        DeviceRenamed(name: controller.text.trim()),
      );
    }

    focusNode.dispose();
  }
  // TODO: Implement a curated bag icon/category picker.
  // Future<void> _showChangeBagTypeDialog(BuildContext context) async {
  // }

  Future<void> _showSensitivityDialog(BuildContext context) async {
    double sensitivity = device.sensitivity.toDouble();

    final confirmed = await AppDialog.show(
      context,
      title: AppStrings.sensitivity,
      confirmText: AppStrings.save,
      content: StatefulBuilder(
        builder: (context, setState) {
          return Padding(
            padding: const EdgeInsets.only(top: AppSpacing.sm),
            child: AppSlider(
              value: sensitivity,
              label: sensitivity.round().toString(),
              onChanged: (value) {
                setState(() {
                  sensitivity = value;
                });
              },
            ),
          );
        },
      ),
    );
    if (confirmed == true &&
        context.mounted &&
        sensitivity.round() != device.sensitivity) {
      context.read<DeviceDetailsBloc>().add(
        DeviceSensitivityChanged(value: sensitivity.round()),
      );
    }
  }

  Future<void> _showForgetDeviceDialog(BuildContext context) async {
    final confirmed = await AppDialog.show(
      context,
      title: AppStrings.forgetDevice,
      confirmText: AppStrings.forget,
      confirmColor: AppColors.error,
      content: Padding(
        padding: const EdgeInsets.only(top: AppSpacing.sm),
        child: Text(
          AppStrings.forgetDeviceMessage,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    );

    if (confirmed == true && context.mounted) {
      context.read<DeviceDetailsBloc>().add(const DeviceForgotten());
    }
  }
}
