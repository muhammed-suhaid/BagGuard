import 'package:flutter/material.dart';

import 'package:bagguard/core/theme/app_spacing.dart';

class AppIndicator extends StatelessWidget {
  const AppIndicator({
    super.key,
    required this.icon,
    required this.label,
    this.labelStyle,
    this.spacing = AppSpacing.xs,
  });

  final Widget icon;
  final String label;
  final TextStyle? labelStyle;
  final double spacing;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        icon,

        SizedBox(width: spacing),

        Text(
          label,
          style: labelStyle ?? Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}
