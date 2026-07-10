import 'package:flutter/material.dart';

import 'package:bagguard/core/theme/app_radius.dart';
import 'package:bagguard/core/theme/app_spacing.dart';
import 'package:bagguard/core/constants/app_dimensions.dart';

class AppQuickAction extends StatelessWidget {
  const AppQuickAction({
    super.key,
    required this.icon,
    required this.label,
    this.onTap,
    this.backgroundColor,
    this.iconColor,
    this.enabled = true,
  });

  final Widget icon;
  final String label;
  final VoidCallback? onTap;
  final Color? backgroundColor;
  final Color? iconColor;
  final bool enabled;

  bool get _canTap => enabled && onTap != null;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(AppRadius.card),
          onTap: _canTap ? onTap : null,
          child: Container(
            width: AppDimensions.quickActionLarge,
            height: AppDimensions.quickActionSmall,
            decoration: BoxDecoration(
              color: backgroundColor ?? colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(AppRadius.card),
            ),
            child: Center(
              child: IconTheme(
                data: IconThemeData(
                  color: iconColor ?? colorScheme.onPrimaryContainer,
                  size: AppDimensions.iconXLarge,
                ),
                child: icon,
              ),
            ),
          ),
        ),

        const SizedBox(height: AppSpacing.xs),

        Text(
          label,
          textAlign: TextAlign.center,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.labelMedium,
        ),
      ],
    );
  }
}
