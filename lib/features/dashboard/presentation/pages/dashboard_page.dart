import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bagguard/core/constants/app_strings.dart';
import 'package:bagguard/shared/widgets/app_snackbar.dart';
import 'package:bagguard/shared/widgets/app_error_view.dart';
import 'package:bagguard/shared/widgets/app_loading_view.dart';
import 'package:bagguard/features/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:bagguard/features/dashboard/presentation/bloc/dashboard_event.dart';
import 'package:bagguard/features/dashboard/presentation/bloc/dashboard_state.dart';
import 'package:bagguard/features/dashboard/presentation/views/dashboard_view.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DashboardBloc, DashboardState>(
      listener: (context, state) {
        if (state is! DashboardLoadedAction) {
          return;
        }

        if (state.status == DashboardActionStatus.success) {
          AppSnackbar.showSuccess(context, state.message!);
        } else {
          AppSnackbar.showError(context, state.message!);
        }
      },
      builder: (context, state) {
        switch (state) {
          case DashboardInitial():
          case DashboardLoading():
            return AppLoadingView(
              title: AppStrings.loadingDashboard,
              message: AppStrings.loadingDashboardDescription,
            );

          case DashboardLoaded():
            return DashboardView(
              devices: state.devices,
              selectedDevice: state.selectedDevice,
              isAddDeviceSelected: state.isAddDeviceSelected,
            );

          case DashboardError():
            return AppErrorView(
              message: state.message,
              onRetry: () {
                context.read<DashboardBloc>().add(const DashboardStarted());
              },
            );
        }
      },
    );
  }
}
