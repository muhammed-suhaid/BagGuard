import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bagguard/shared/widgets/app_error_view.dart';
import 'package:bagguard/features/scan/presentation/bloc/scan_bloc.dart';
import 'package:bagguard/features/scan/presentation/bloc/scan_event.dart';
import 'package:bagguard/features/scan/presentation/bloc/scan_state.dart';
import 'package:bagguard/features/scan/presentation/views/scan_empty_view.dart';
import 'package:bagguard/features/scan/presentation/views/scan_result_view.dart';
import 'package:bagguard/features/scan/presentation/views/scan_loading_view.dart';
import 'package:bagguard/features/scan/presentation/views/scan_connected_view.dart';
import 'package:bagguard/features/scan/presentation/views/scan_connecting_view.dart';

class ScanPage extends StatelessWidget {
  const ScanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ScanBloc, ScanState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is ScanResult) {
          return ScanResultView(devices: state.devices);
        }

        if (state is ScanEmpty) {
          return const ScanEmptyView();
        }

        if (state is ScanConnecting) {
          return ScanConnectingView(deviceName: state.device.name);
        }

        if (state is ScanConnected) {
          return ScanConnectedView(deviceName: state.device.name);
        }

        if (state is ScanError) {
          return AppErrorView(
            message: state.message,
            onRetry: () {
              context.read<ScanBloc>().add(const ScanAgainRequested());
            },
          );
        }

        return ScanLoadingView(isScanning: state is ScanLoading);
      },
    );
  }
}
