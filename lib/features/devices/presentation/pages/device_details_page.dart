import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bagguard/core/constants/app_strings.dart';
import 'package:bagguard/shared/widgets/app_snackbar.dart';
import 'package:bagguard/shared/widgets/app_error_view.dart';
import 'package:bagguard/shared/widgets/app_loading_view.dart';
import 'package:bagguard/features/devices/presentation/views/device_details_view.dart';
import 'package:bagguard/features/devices/presentation/bloc/device_details/device_details_bloc.dart';
import 'package:bagguard/features/devices/presentation/bloc/device_details/device_details_event.dart';
import 'package:bagguard/features/devices/presentation/bloc/device_details/device_details_state.dart';

class DeviceDetailsPage extends StatelessWidget {
  const DeviceDetailsPage({super.key, required this.deviceId});

  final String deviceId;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DeviceDetailsBloc, DeviceDetailsState>(
      listener: (context, state) {
        if (state is! DeviceDetailsActionState) {
          return;
        }

        switch (state.action) {
          case DeviceDetailsAction.forgotten:
            if (state.status == DeviceDetailsActionStatus.success) {
              AppSnackbar.showSuccess(context, state.message!);
              context.pop();
            } else {
              AppSnackbar.showError(context, state.message!);
            }
            return;

          default:
            if (state.status == DeviceDetailsActionStatus.success) {
              AppSnackbar.showSuccess(context, state.message!);
            } else {
              AppSnackbar.showError(context, state.message!);
            }
        }
      },
      builder: (context, state) {
        switch (state) {
          case DeviceDetailsInitial():
          case DeviceDetailsLoading():
            return Scaffold(
              body: const AppLoadingView(
                title: AppStrings.loadingDevice,
                message: AppStrings.loadingDeviceDescription,
              ),
            );

          case DeviceDetailsLoaded():
            return DeviceDetailsView(device: state.device);

          case DeviceDetailsActionState():
            return DeviceDetailsView(device: state.device);

          case DeviceDetailsError():
            return AppErrorView(
              message: state.message,
              onRetry: () {
                context.read<DeviceDetailsBloc>().add(
                  DeviceDetailsStarted(deviceId),
                );
              },
            );
        }
      },
    );
  }
}
