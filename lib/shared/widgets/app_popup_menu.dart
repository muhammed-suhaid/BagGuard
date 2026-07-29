import 'package:flutter/material.dart';

import 'package:bagguard/core/theme/app_colors.dart';
import 'package:bagguard/core/theme/app_radius.dart';
import 'package:bagguard/core/theme/app_spacing.dart';
import 'package:bagguard/core/constants/app_dimensions.dart';

class AppPopupMenuItem<T> {
  const AppPopupMenuItem({
    required this.value,
    required this.title,
    this.icon,
    this.isDestructive = false,
  });

  final T value;
  final String title;
  final IconData? icon;
  final bool isDestructive;
}

class AppPopupMenu<T> extends StatelessWidget {
  const AppPopupMenu({
    super.key,
    required this.items,
    required this.onSelected,
    this.icon = Icons.more_vert,
  });

  final List<AppPopupMenuItem<T>> items;
  final ValueChanged<T> onSelected;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return PopupMenuButton<T>(
      elevation: 8,
      color: Theme.of(context).colorScheme.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadius.card),
      ),
      onSelected: onSelected,
      itemBuilder: (context) {
        return items.map((item) {
          return PopupMenuItem<T>(
            value: item.value,
            child: Row(
              children: [
                if (item.icon != null) ...[
                  Icon(
                    item.icon,
                    size: AppDimensions.iconSmall,
                    color: item.isDestructive ? AppColors.error : null,
                  ),
                  const SizedBox(width: AppSpacing.md),
                ],

                Text(
                  item.title,
                  style: textTheme.bodyLarge?.copyWith(
                    color: item.isDestructive ? AppColors.error : null,
                  ),
                ),
              ],
            ),
          );
        }).toList();
      },
    );
  }
}
