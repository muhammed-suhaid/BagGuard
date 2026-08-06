import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bagguard/core/constants/app_strings.dart';
import 'package:bagguard/shared/widgets/app_snackbar.dart';
import 'package:bagguard/shared/widgets/app_error_view.dart';
import 'package:bagguard/shared/widgets/app_loading_view.dart';
import 'package:bagguard/features/settings/presentation/bloc/settings_bloc.dart';
import 'package:bagguard/features/settings/presentation/bloc/settings_event.dart';
import 'package:bagguard/features/settings/presentation/bloc/settings_state.dart';
import 'package:bagguard/features/settings/presentation/views/settings_view.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SettingsBloc, SettingsState>(
      listener: (context, state) {
        if (state is! SettingsLoadedAction) {
          return;
        }

        if (state.status == SettingsActionStatus.success) {
          AppSnackbar.showSuccess(context, state.message!);
        } else {
          AppSnackbar.showError(context, state.message!);
        }
      },
      builder: (context, state) {
        switch (state) {
          case SettingsInitial():
          case SettingsLoading():
            return const AppLoadingView(
              title: AppStrings.loadingSettings,
              message: AppStrings.loadingSettingsDescription,
            );

          case SettingsLoaded():
            return SettingsView(settings: state.settings);

          case SettingsError():
            return AppErrorView(
              message: state.message,
              onRetry: () {
                context.read<SettingsBloc>().add(const SettingsStarted());
              },
            );
        }
      },
    );
  }
}
