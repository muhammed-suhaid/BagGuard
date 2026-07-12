import 'package:flutter/material.dart';

import 'package:bagguard/core/theme/app_colors.dart';
import 'package:bagguard/core/theme/app_spacing.dart';
import 'package:bagguard/shared/widgets/app_card.dart';
import 'package:bagguard/core/constants/app_icons.dart';
import 'package:bagguard/core/utils/battery_utils.dart';
import 'package:bagguard/core/constants/app_strings.dart';
import 'package:bagguard/shared/widgets/app_indicator.dart';
import 'package:bagguard/core/constants/app_dimensions.dart';
import 'package:bagguard/shared/widgets/buttons/app_icon_button.dart';

class DeviceCard extends StatelessWidget {
  const DeviceCard({
    super.key,
    required this.name,
    required this.image,
    required this.isConnected,
    required this.batteryLevel,
    this.onTap,
    this.onMorePressed,
    this.width = AppDimensions.deviceCardWidth,
    this.height = AppDimensions.deviceCardHeight,
  }) : assert(
         batteryLevel >= 0 && batteryLevel <= 100,
         'batteryLevel must be between 0 and 100.',
       );

  final Widget image;
  final String name;
  final bool isConnected;
  final int batteryLevel;
  final VoidCallback? onTap;
  final VoidCallback? onMorePressed;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Stack(
        children: [
          AppCard(
            onTap: onTap,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: AppSpacing.xs),

                SizedBox(
                  height: AppDimensions.deviceImage,
                  child: Center(child: image),
                ),

                const SizedBox(height: AppSpacing.sm),

                Text(
                  name,
                  style: Theme.of(context).textTheme.titleMedium,
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),

                const SizedBox(height: AppSpacing.sm),

                AppIndicator(
                  icon: Icon(
                    AppIcons.connected,
                    size: AppDimensions.iconXSmall,
                    color: isConnected
                        ? AppColors.connected
                        : AppColors.disconnected,
                  ),
                  label: isConnected
                      ? AppStrings.connected
                      : AppStrings.disconnected,
                ),

                const SizedBox(height: AppSpacing.xs),

                AppIndicator(
                  icon: Icon(
                    BatteryUtils.icon(batteryLevel),
                    size: AppDimensions.iconSmall,
                    color: BatteryUtils.color(batteryLevel),
                  ),
                  label: '$batteryLevel%',
                ),
              ],
            ),
          ),
          if (onMorePressed != null)
            Positioned(
              top: 0,
              right: 0,
              child: AppIconButton(
                icon: const Icon(AppIcons.menu),
                tooltip: AppStrings.more,
                onPressed: onMorePressed,
              ),
            ),
        ],
      ),
    );
  }
}
