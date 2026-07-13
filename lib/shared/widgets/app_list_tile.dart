import 'package:flutter/material.dart';

import 'package:bagguard/core/theme/app_colors.dart';
import 'package:bagguard/core/theme/app_spacing.dart';

class AppListTile extends StatelessWidget {
  const AppListTile({
    super.key,
    required this.title,
    this.subtitle,
    this.leading,
    this.trailing,
    this.onTap,
    this.padding,
    this.showDivider = false,
  });

  final String title;
  final String? subtitle;
  final Widget? leading;
  final Widget? trailing;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry? padding;
  final bool showDivider;

  @override
  Widget build(BuildContext context) {
    final content = Padding(
      padding:
          padding ??
          const EdgeInsets.symmetric(
            horizontal: AppSpacing.md,
            vertical: AppSpacing.sm,
          ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (leading != null) ...[
            leading!,
            const SizedBox(width: AppSpacing.md),
          ],

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),

                if (subtitle != null) ...[
                  Text(
                    subtitle!,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ],
            ),
          ),

          if (trailing != null) ...[
            const SizedBox(width: AppSpacing.md),
            trailing!,
          ],
        ],
      ),
    );

    final child = onTap == null
        ? content
        : Material(
            color: Colors.transparent,
            child: InkWell(onTap: onTap, child: content),
          );

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        child,

        if (showDivider)
          Divider(
            height: 1,
            indent: leading != null ? 56 : 0,
            color: AppColors.borderLight,
          ),
      ],
    );
  }
}
