import 'package:flutter/material.dart';

import 'package:bagguard/core/theme/app_spacing.dart';

class AppStateContent extends StatelessWidget {
  const AppStateContent({
    super.key,
    required this.illustration,
    required this.title,
    required this.message,
    this.action,
  });

  final Widget illustration;
  final String title;
  final String message;
  final Widget? action;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        illustration,

        const SizedBox(height: AppSpacing.lg),

        Text(
          title,
          textAlign: TextAlign.center,
          style: theme.textTheme.titleLarge,
        ),

        const SizedBox(height: AppSpacing.md),

        Text(
          message,
          textAlign: TextAlign.center,
          style: theme.textTheme.bodyMedium,
        ),

        if (action != null) ...[const SizedBox(height: AppSpacing.xl), action!],
      ],
    );
  }
}
