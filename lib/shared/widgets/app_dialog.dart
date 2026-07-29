import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import 'package:bagguard/core/theme/app_colors.dart';
import 'package:bagguard/core/theme/app_radius.dart';
import 'package:bagguard/core/theme/app_spacing.dart';
import 'package:bagguard/core/constants/app_strings.dart';
import 'package:bagguard/core/enums/app_button_variant.dart';
import 'package:bagguard/shared/widgets/buttons/app_button.dart';

class AppDialog {
  AppDialog._();

  static Future<bool?> show(
    BuildContext context, {
    required String title,
    required String confirmText,
    required Widget content,
    String cancelText = AppStrings.cancel,
    Color confirmColor = AppColors.primary,
    IconData? icon,
    bool barrierDismissible = true,
    bool showCancelButton = true,
  }) {
    return showDialog<bool>(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (context) {
        return AlertDialog(
          contentPadding: const EdgeInsets.all(AppSpacing.lg),
          backgroundColor: Theme.of(context).colorScheme.surface,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadius.dialog),
          ),
          content: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 400),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (icon != null) ...[
                  Icon(icon, size: 48, color: confirmColor),
                  const SizedBox(height: AppSpacing.md),
                ],

                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge,
                ),

                const SizedBox(height: AppSpacing.sm),

                content,

                const SizedBox(height: AppSpacing.xl),

                Row(
                  children: [
                    Expanded(
                      child: AppButton(
                        text: cancelText,
                        variant: AppButtonVariant.outlined,
                        onPressed: () {
                          context.pop(false);
                        },
                      ),
                    ),

                    const SizedBox(width: AppSpacing.md),

                    Expanded(
                      child: AppButton(
                        text: confirmText,
                        backgroundColor: confirmColor,
                        onPressed: () {
                          context.pop(true);
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
