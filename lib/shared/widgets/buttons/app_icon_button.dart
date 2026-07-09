import 'package:flutter/material.dart';

import 'package:bagguard/core/constants/app_dimensions.dart';
import 'package:bagguard/core/enums/app_icon_button_variant.dart';

class AppIconButton extends StatelessWidget {
  const AppIconButton({
    super.key,
    required this.icon,
    this.onPressed,
    this.variant = AppIconButtonVariant.standard,
    this.enabled = true,
    this.tooltip,
    this.iconSize = AppDimensions.iconMedium,
  });

  final Widget icon;
  final VoidCallback? onPressed;
  final AppIconButtonVariant variant;
  final bool enabled;
  final String? tooltip;
  final double iconSize;

  bool get _canPress => enabled && onPressed != null;

  @override
  Widget build(BuildContext context) {
    switch (variant) {
      case AppIconButtonVariant.standard:
        return IconButton(
          onPressed: _canPress ? onPressed : null,
          tooltip: tooltip,
          iconSize: iconSize,
          icon: icon,
        );

      case AppIconButtonVariant.filled:
        return IconButton.filled(
          onPressed: _canPress ? onPressed : null,
          tooltip: tooltip,
          iconSize: iconSize,
          icon: icon,
        );

      case AppIconButtonVariant.filledTonal:
        return IconButton.filledTonal(
          onPressed: _canPress ? onPressed : null,
          tooltip: tooltip,
          iconSize: iconSize,
          icon: icon,
        );

      case AppIconButtonVariant.outlined:
        return IconButton.outlined(
          onPressed: _canPress ? onPressed : null,
          tooltip: tooltip,
          iconSize: iconSize,
          style: IconButton.styleFrom(
            minimumSize: const Size(36, 36),
            maximumSize: const Size(36, 36),
            fixedSize: const Size(36, 36),
            padding: EdgeInsets.zero,
            side: const BorderSide(width: 1.5),
          ),
          icon: icon,
        );
    }
  }
}
