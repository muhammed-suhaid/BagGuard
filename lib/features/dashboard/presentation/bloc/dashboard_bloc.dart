import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bagguard/features/dashboard/presentation/bloc/dashboard_event.dart';
import 'package:bagguard/features/dashboard/presentation/bloc/dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc() : super(const DashboardInitial()) {
    on<DashboardStarted>(_onStarted);
    on<ProtectionToggled>(_onProtectionToggled);
    on<SensitivityChanged>(_onSensitivityChanged);
    on<DeviceChanged>(_onDeviceChanged);
  }

  Future<void> _onStarted(
    DashboardStarted event,
    Emitter<DashboardState> emit,
  ) async {
    emit(const DashboardLoading());

    // TODO: Load the current selected device from DeviceRepository.

    emit(const DashboardLoaded());
  }

  Future<void> _onProtectionToggled(
    ProtectionToggled event,
    Emitter<DashboardState> emit,
  ) async {
    // TODO: Update the current device protection through DeviceRepository.
  }

  Future<void> _onSensitivityChanged(
    SensitivityChanged event,
    Emitter<DashboardState> emit,
  ) async {
    // TODO: Update the current device sensitivity through DeviceRepository.
  }

  Future<void> _onDeviceChanged(
    DeviceChanged event,
    Emitter<DashboardState> emit,
  ) async {
    // TODO: Change the selected device and reload dashboard data.
  }
}
