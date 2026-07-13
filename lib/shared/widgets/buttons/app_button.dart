import 'package:flutter/material.dart';

import 'package:bagguard/core/theme/app_spacing.dart';
import 'package:bagguard/core/constants/app_dimensions.dart';
import 'package:bagguard/core/enums/app_button_variant.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.text,
    this.onPressed,
    this.variant = AppButtonVariant.filled,
    this.isLoading = false,
    this.enabled = true,
    this.leading,
    this.trailing,
    this.expand = true,
    this.width,
    this.height = AppDimensions.buttonLarge,
  });

  final String text;
  final VoidCallback? onPressed;
  final AppButtonVariant variant;
  final bool isLoading;
  final bool enabled;
  final Widget? leading;
  final Widget? trailing;
  final bool expand;
  final double? width;
  final double height;

  bool get _canPress => enabled && onPressed != null && !isLoading;
  bool get shouldExpand => variant != AppButtonVariant.text && expand;

  @override
  Widget build(BuildContext context) {
    final Widget button = _buildButton(context);

    if (variant == AppButtonVariant.text) {
      return button;
    }

    return SizedBox(
      width: shouldExpand ? double.infinity : width,
      height: height,
      child: button,
    );
  }

  Widget _buildButton(BuildContext context) {
    switch (variant) {
      case AppButtonVariant.filled:
        return FilledButton(
          onPressed: _canPress ? onPressed : null,
          child: _buildChild(context),
        );

      case AppButtonVariant.outlined:
        return OutlinedButton(
          onPressed: _canPress ? onPressed : null,
          child: _buildChild(context),
        );

      case AppButtonVariant.text:
        return TextButton(
          style: TextButton.styleFrom(
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            visualDensity: VisualDensity.compact,
          ),
          onPressed: _canPress ? onPressed : null,
          child: _buildChild(context),
        );
    }
  }

  Widget _buildChild(BuildContext context) {
    if (isLoading) {
      return SizedBox(
        width: AppDimensions.loadingIndicatorSmall,
        height: AppDimensions.loadingIndicatorSmall,
        child: CircularProgressIndicator(
          strokeWidth: AppDimensions.loadingIndicatorStroke,
          color: _loadingColor(context),
        ),
      );
    }
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (leading != null) ...[
          leading!,
          const SizedBox(width: AppSpacing.xs),
        ],

        Text(text, overflow: TextOverflow.ellipsis, maxLines: 1),

        if (trailing != null) ...[
          const SizedBox(width: AppSpacing.xs),
          trailing!,
        ],
      ],
    );
  }

  Color _loadingColor(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    switch (variant) {
      case AppButtonVariant.filled:
        return colorScheme.onPrimary;

      case AppButtonVariant.outlined:
      case AppButtonVariant.text:
        return colorScheme.primary;
    }
  }
}
