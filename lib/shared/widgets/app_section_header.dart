import 'package:flutter/material.dart';

import 'package:bagguard/core/theme/app_spacing.dart';

class AppSectionHeader extends StatelessWidget {
  const AppSectionHeader({
    super.key,
    required this.title,
    this.subtitle,
    this.action,
    this.actionText,
    this.onActionPressed,
  }) : assert(
         action == null || actionText == null,
         'Provide either action or actionText, not both.',
       ),
       assert(
         actionText == null || onActionPressed != null,
         'onActionPressed must be provided when using actionText.',
       );

  final String title;
  final String? subtitle;
  final Widget? action;
  final String? actionText;
  final VoidCallback? onActionPressed;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(child: Text(title, style: textTheme.titleLarge)),

            if (action != null)
              action!
            else if (actionText != null)
              TextButton(
                onPressed: onActionPressed,
                style: TextButton.styleFrom(
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  visualDensity: VisualDensity.compact,
                ),
                child: Text(actionText!),
              ),
          ],
        ),
        if (subtitle != null) ...[
          const SizedBox(height: AppSpacing.xs),
          Text(subtitle!, style: textTheme.bodyMedium),
        ],
      ],
    );
  }
}
