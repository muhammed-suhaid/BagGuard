import 'package:flutter/material.dart';

import 'package:bagguard/core/theme/app_spacing.dart';

class AppBottomActionLayout extends StatelessWidget {
  const AppBottomActionLayout({
    super.key,
    required this.content,
    this.bottom,
    this.centerContent = false,
    this.padding = const EdgeInsets.all(AppSpacing.xl),
  });

  final Widget content;
  final Widget? bottom;
  final bool centerContent;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: padding,
        child: Column(
          children: [
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final Widget child = centerContent
                      ? Center(child: content)
                      : content;

                  return SingleChildScrollView(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: constraints.maxHeight,
                      ),
                      child: child,
                    ),
                  );
                },
              ),
            ),

            if (bottom != null) ...[
              const SizedBox(height: AppSpacing.xl),

              bottom!,

              const SizedBox(height: AppSpacing.xxxl),
            ],
          ],
        ),
      ),
    );
  }
}
