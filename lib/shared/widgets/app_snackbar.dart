import 'package:flutter/material.dart';

import 'package:bagguard/core/theme/app_radius.dart';
import 'package:bagguard/core/theme/app_colors.dart';
import 'package:bagguard/core/theme/app_shadows.dart';
import 'package:bagguard/core/theme/app_spacing.dart';
import 'package:bagguard/core/constants/app_icons.dart';

//************************* REUSABLE SNACKBAR *************************//
class AppSnackbar {
  //************************* SUCCESS SNACKBAR *************************//
  static void showSuccess(BuildContext context, String message) {
    _show(context, message, AppColors.success, AppIcons.showSuccess);
  }

  //************************* ERROR SNACKBAR *************************//
  static void showError(BuildContext context, String message) {
    _show(context, message, AppColors.error, AppIcons.showError);
  }

  //************************* INFO SNACKBAR *************************//
  static void showInfo(BuildContext context, String message) {
    _show(context, message, AppColors.primary, AppIcons.showInfo);
  }

  //************************* SNACKBAR *************************//
  static void _show(
    BuildContext context,
    String message,
    Color bgColor,
    IconData icon,
  ) {
    final overlay = Overlay.of(context);
    final entry = OverlayEntry(
      builder: (context) => _AnimatedFloatingSnackbar(
        message: message,
        bgColor: bgColor,
        icon: icon,
      ),
    );

    overlay.insert(entry);

    Future.delayed(const Duration(seconds: 3), () {
      if (entry.mounted) {
        entry.remove();
      }
    });
  }
}

class _AnimatedFloatingSnackbar extends StatefulWidget {
  final String message;
  final Color bgColor;
  final IconData icon;

  const _AnimatedFloatingSnackbar({
    required this.message,
    required this.bgColor,
    required this.icon,
  });

  @override
  State<_AnimatedFloatingSnackbar> createState() =>
      _AnimatedFloatingSnackbarState();
}

class _AnimatedFloatingSnackbarState extends State<_AnimatedFloatingSnackbar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
      reverseDuration: const Duration(milliseconds: 300),
    );

    _slideAnimation =
        Tween<Offset>(begin: const Offset(0, 1.0), end: Offset.zero).animate(
          CurvedAnimation(
            parent: _controller,
            curve: Curves.easeOutCubic,
            reverseCurve: Curves.easeInCubic,
          ),
        );

    _fadeAnimation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);

    _controller.forward();

    Future.delayed(const Duration(milliseconds: 2600), () {
      if (mounted) {
        _controller.reverse();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: MediaQuery.of(context).padding.bottom + 20,
      left: 16,
      right: 16,
      child: Material(
        color: Colors.transparent,
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: SlideTransition(
            position: _slideAnimation,
            child: Container(
              padding: const EdgeInsets.all(AppSpacing.md),
              decoration: BoxDecoration(
                color: widget.bgColor,
                borderRadius: BorderRadius.circular(AppRadius.button),
                boxShadow: AppShadow.card,
              ),
              child: Row(
                children: [
                  Icon(widget.icon, color: Colors.white, size: 28),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      widget.message,
                      style: Theme.of(
                        context,
                      ).textTheme.titleMedium?.copyWith(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
