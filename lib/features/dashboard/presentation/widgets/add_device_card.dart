import 'package:flutter/material.dart';

import 'package:bagguard/core/theme/app_spacing.dart';
import 'package:bagguard/shared/widgets/app_card.dart';
import 'package:bagguard/core/constants/app_icons.dart';
import 'package:bagguard/core/constants/app_strings.dart';
import 'package:bagguard/core/constants/app_dimensions.dart';

class AddDeviceCard extends StatelessWidget {
  const AddDeviceCard({
    super.key,
    this.onTap,
    this.width = AppDimensions.deviceCardWidth,
    this.height = AppDimensions.deviceCardHeight,
  });

  final VoidCallback? onTap;
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
                  child: Center(
                    child: Icon(
                      AppIcons.add,
                      size: AppDimensions.iconXXLarge,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),

                const SizedBox(height: AppSpacing.sm),

                Text(
                  AppStrings.addDevice,
                  style: Theme.of(context).textTheme.titleMedium,
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),

                const SizedBox(height: AppSpacing.sm),

                Opacity(opacity: 0, child: Text("Placeholder")),

                const SizedBox(height: AppSpacing.xs),

                Opacity(opacity: 0, child: Text("Placeholder")),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
