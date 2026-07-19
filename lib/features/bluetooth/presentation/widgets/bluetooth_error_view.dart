import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bagguard/core/theme/app_colors.dart';
import 'package:bagguard/core/theme/app_spacing.dart';
import 'package:bagguard/core/constants/app_icons.dart';
import 'package:bagguard/core/constants/app_strings.dart';
import 'package:bagguard/core/constants/app_dimensions.dart';
import 'package:bagguard/shared/widgets/app_state_content.dart';
import 'package:bagguard/shared/widgets/buttons/app_button.dart';
import 'package:bagguard/features/bluetooth/presentation/bloc/bluetooth_bloc.dart';
import 'package:bagguard/features/bluetooth/presentation/bloc/bluetooth_event.dart';

class BluetoothErrorView extends StatelessWidget {
  const BluetoothErrorView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(AppSpacing.xl),
            child: AppStateContent(
              illustration: const Icon(
                AppIcons.error,
                color: AppColors.error,
                size: AppDimensions.iconXXXLarge,
              ),
              title: AppStrings.somethingWentWrong,
              message: AppStrings.unableToCheckBluetoothStatus,
              action: AppButton(
                text: AppStrings.retry,
                onPressed: () {
                  context.read<BluetoothBloc>().add(const BluetoothRequested());
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
