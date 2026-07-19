import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:bagguard/app/app_routes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bagguard/features/bluetooth/presentation/bloc/bluetooth_bloc.dart';
import 'package:bagguard/features/bluetooth/presentation/bloc/bluetooth_state.dart';
import 'package:bagguard/features/bluetooth/presentation/widgets/bluetooth_error_view.dart';
import 'package:bagguard/features/bluetooth/presentation/widgets/bluetooth_required_view.dart';

class BluetoothPage extends StatelessWidget {
  const BluetoothPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BluetoothBloc, BluetoothState>(
      listener: (context, state) {
        if (state is BluetoothNavigate) {
          switch (state.destination) {
            case BluetoothDestination.scan:
              // TODO: Replace with Scan page.
              context.go(AppRoutes.dashboard);
              break;

            case BluetoothDestination.dashboard:
              context.go(AppRoutes.dashboard);
              break;
          }
        }
      },
      builder: (context, state) {
        if (state is BluetoothError) {
          return const BluetoothErrorView();
        }

        return const BluetoothRequiredView();
      },
    );
  }
}
