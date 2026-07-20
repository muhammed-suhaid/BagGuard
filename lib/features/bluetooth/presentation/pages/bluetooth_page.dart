import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:bagguard/app/app_routes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bagguard/core/constants/app_strings.dart';
import 'package:bagguard/shared/widgets/app_error_view.dart';
import 'package:bagguard/features/splash/data/models/startup_destination.dart';
import 'package:bagguard/features/bluetooth/presentation/bloc/bluetooth_bloc.dart';
import 'package:bagguard/features/bluetooth/presentation/bloc/bluetooth_event.dart';
import 'package:bagguard/features/bluetooth/presentation/bloc/bluetooth_state.dart';
import 'package:bagguard/features/bluetooth/presentation/widgets/bluetooth_required_view.dart';

class BluetoothPage extends StatelessWidget {
  const BluetoothPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BluetoothBloc, BluetoothState>(
      listener: (context, state) {
        if (state is BluetoothNavigate) {
          switch (state.destination) {
            case StartupDestination.permission:
              context.go(AppRoutes.permission);
              break;

            case StartupDestination.bluetooth:
              // Already on the bluetooth screen.
              return;

            case StartupDestination.scan:
              context.go(AppRoutes.scan);
              break;

            case StartupDestination.dashboard:
              context.go(AppRoutes.dashboard);
              break;
          }
        }
      },
      builder: (context, state) {
        if (state is BluetoothError) {
          return AppErrorView(
            message: AppStrings.unableToCheckBluetoothStatus,
            onRetry: () {
              context.read<BluetoothBloc>().add(const BluetoothRequested());
            },
          );
        }

        return BluetoothRequiredView(isLoading: state is BluetoothLoading);
      },
    );
  }
}
