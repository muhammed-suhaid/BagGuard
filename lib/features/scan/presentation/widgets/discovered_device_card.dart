import 'package:flutter/material.dart';

import 'package:bagguard/core/theme/app_colors.dart';
import 'package:bagguard/core/theme/app_spacing.dart';
import 'package:bagguard/shared/widgets/app_card.dart';
import 'package:bagguard/core/constants/app_icons.dart';
import 'package:bagguard/core/constants/app_strings.dart';
import 'package:bagguard/core/constants/app_dimensions.dart';
import 'package:bagguard/shared/widgets/buttons/app_button.dart';
import 'package:bagguard/shared/widgets/buttons/app_icon_button.dart';

class DiscoveredDeviceCard extends StatelessWidget {
  const DiscoveredDeviceCard({
    super.key,
    required this.name,
    required this.rssi,
    required this.onConnect,
    this.isConnecting = false,
  });

  final String name;
  final int rssi;
  final bool isConnecting;
  final VoidCallback onConnect;

  String get signalText {
    if (rssi >= -55) return 'Excellent';
    if (rssi >= -70) return 'Good';
    if (rssi >= -85) return 'Fair';
    return 'Weak';
  }

  Color get signalColor {
    if (rssi >= -55) return AppColors.success;
    if (rssi >= -70) return AppColors.success;
    if (rssi >= -85) return AppColors.warning;
    return AppColors.error;
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return AppCard(
      child: Row(
        children: [
          AppIconButton(
            icon: const Icon(AppIcons.bluetooth, color: AppColors.primary),
          ),

          const SizedBox(width: AppSpacing.md),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: textTheme.titleMedium,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),

                const SizedBox(height: AppSpacing.xs),

                Row(
                  children: [
                    Text('$rssi dBm', style: textTheme.bodySmall),

                    const SizedBox(width: AppSpacing.xl),

                    Text(
                      signalText,
                      style: textTheme.bodySmall?.copyWith(color: signalColor),
                    ),
                  ],
                ),
              ],
            ),
          ),
          AppButton(
            text: AppStrings.connect,
            expand: false,
            height: AppDimensions.buttonSmall,
            isLoading: isConnecting,
            onPressed: onConnect,
          ),
        ],
      ),
    );
  }
}
