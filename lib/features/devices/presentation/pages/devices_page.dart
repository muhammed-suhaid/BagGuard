import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bagguard/core/constants/app_strings.dart';
import 'package:bagguard/shared/widgets/app_error_view.dart';
import 'package:bagguard/shared/widgets/app_loading_view.dart';
import 'package:bagguard/features/devices/presentation/bloc/devices_bloc.dart';
import 'package:bagguard/features/devices/presentation/bloc/devices_event.dart';
import 'package:bagguard/features/devices/presentation/bloc/devices_state.dart';
import 'package:bagguard/features/devices/presentation/views/devices_view.dart';

class DevicesPage extends StatelessWidget {
  const DevicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DevicesBloc, DevicesState>(
      builder: (context, state) {
        switch (state) {
          case DevicesInitial():
          case DevicesLoading():
            return const AppLoadingView(
              title: AppStrings.loadingDevices,
              message: AppStrings.loadingDevicesDescription,
            );

          case DevicesLoaded():
            return DevicesView(devices: state.devices);

          case DevicesError():
            return AppErrorView(
              message: state.message,
              onRetry: () {
                context.read<DevicesBloc>().add(const DevicesStarted());
              },
            );
        }
      },
    );
  }
}
