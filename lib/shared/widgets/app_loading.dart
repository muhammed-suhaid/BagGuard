import 'package:flutter/material.dart';

import 'package:bagguard/core/theme/app_colors.dart';
import 'package:bagguard/core/theme/app_spacing.dart';
import 'package:bagguard/core/enums/app_loading_size.dart';
import 'package:bagguard/core/constants/app_dimensions.dart';

class AppLoading extends StatelessWidget {
  const AppLoading({super.key, this.message, this.size = AppLoadingSize.large});

  final String? message;
  final AppLoadingSize size;

  @override
  Widget build(BuildContext context) {
    final indicatorSize = switch (size) {
      AppLoadingSize.small => AppDimensions.loadingIndicatorSmall,
      AppLoadingSize.large => AppDimensions.loadingIndicatorLarge,
    };

    return Center(
      child: Column(
        children: [
          SizedBox(
            width: indicatorSize,
            height: indicatorSize,
            child: CircularProgressIndicator(
              color: AppColors.primary,
              strokeWidth: AppDimensions.loadingIndicatorStroke,
            ),
          ),

          if (message != null) ...[
            const SizedBox(height: AppSpacing.xs),

            Text(
              message!,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ],
      ),
    );
  }
}
