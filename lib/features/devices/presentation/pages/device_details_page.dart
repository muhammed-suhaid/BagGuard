import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bagguard/core/constants/app_strings.dart';
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
          //TODO: Add snackbars
          case DeviceDetailsAction.protectionChanged:
            if (state.status == DeviceDetailsActionStatus.failure) {
              // Show snackbar
              return;
            }

          case DeviceDetailsAction.sensitivityChanged:
            if (state.status == DeviceDetailsActionStatus.failure) {
              // Show snackbar
              return;
            }

          case DeviceDetailsAction.renamed:
            if (state.status == DeviceDetailsActionStatus.success) {
              // Success snackbar
              return;
            }
            // Error snackbar
            return;

          case DeviceDetailsAction.imageChanged:
            if (state.status == DeviceDetailsActionStatus.success) {
              // Success snackbar
              return;
            }
            // Error snackbar
            return;

          case DeviceDetailsAction.disconnected:
            if (state.status == DeviceDetailsActionStatus.success) {
              // Success snackbar
              return;
            }
            // Error snackbar
            return;

          case DeviceDetailsAction.forgotten:
            if (state.status == DeviceDetailsActionStatus.success) {
              context.pop();
              return;
            }
            // Error snackbar
            return;
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
