import 'package:flutter/material.dart';

import 'package:bagguard/shared/widgets/app_card.dart';
import 'package:bagguard/core/constants/app_icons.dart';
import 'package:bagguard/core/constants/app_dimensions.dart';
import 'package:bagguard/shared/widgets/buttons/app_icon_button.dart';

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
      child: AppCard(
        onTap: onTap,
        child: Center(
          child: AppIconButton(
            icon: const Icon(AppIcons.add),
            iconSize: AppDimensions.iconXXLarge,
          ),
        ),
      ),
    );
  }
}
