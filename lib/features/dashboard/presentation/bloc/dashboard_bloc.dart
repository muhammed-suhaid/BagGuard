import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bagguard/core/constants/app_strings.dart';
import 'package:bagguard/features/dashboard/presentation/bloc/dashboard_event.dart';
import 'package:bagguard/features/dashboard/presentation/bloc/dashboard_state.dart';
import 'package:bagguard/features/devices/data/repositories/device_repository.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc({required DeviceRepository deviceRepository})
    : _deviceRepository = deviceRepository,
      super(const DashboardInitial()) {
    on<DashboardStarted>(_onStarted);
    on<ProtectionToggled>(_onProtectionToggled);
    on<SensitivityChanged>(_onSensitivityChanged);
    on<DeviceChanged>(_onDeviceChanged);
    on<AddDeviceSelected>(_onAddDeviceSelected);
  }

  final DeviceRepository _deviceRepository;

  Future<void> _onStarted(
    DashboardStarted event,
    Emitter<DashboardState> emit,
  ) async {
    emit(const DashboardLoading());

    try {
      final devices = await _deviceRepository.getDevices();

      emit(
        DashboardLoaded(
          devices: devices,
          selectedDevice: devices.first,
          isAddDeviceSelected: false,
        ),
      );
    } catch (_) {
      emit(const DashboardError(AppStrings.somethingWentWrong));
    }
  }

  Future<void> _onProtectionToggled(
    ProtectionToggled event,
    Emitter<DashboardState> emit,
  ) async {
    final currentState = state;

    if (currentState is! DashboardLoaded) {
      return;
    }

    try {
      await _deviceRepository.updateProtection(
        currentState.selectedDevice,
        event.enabled,
      );

      final updatedDevice = currentState.selectedDevice.copyWith(
        protectionEnabled: event.enabled,
      );

      final updatedDevices = currentState.devices
          .map(
            (device) => device.id == updatedDevice.id ? updatedDevice : device,
          )
          .toList();

      emit(
        DashboardLoadedAction(
          devices: updatedDevices,
          selectedDevice: updatedDevice,
          isAddDeviceSelected: currentState.isAddDeviceSelected,
          action: DashboardAction.protectionChanged,
          status: DashboardActionStatus.success,
          message: event.enabled
              ? AppStrings.protectionEnabledSuccessfully
              : AppStrings.protectionDisabledSuccessfully,
        ),
      );
    } catch (_) {
      emit(
        DashboardLoadedAction(
          devices: currentState.devices,
          selectedDevice: currentState.selectedDevice,
          isAddDeviceSelected: currentState.isAddDeviceSelected,
          action: DashboardAction.protectionChanged,
          status: DashboardActionStatus.failure,
          message: AppStrings.failedToUpdateProtection,
        ),
      );
    }
  }

  Future<void> _onSensitivityChanged(
    SensitivityChanged event,
    Emitter<DashboardState> emit,
  ) async {
    final currentState = state;

    if (currentState is! DashboardLoaded) {
      return;
    }

    try {
      await _deviceRepository.updateSensitivity(
        currentState.selectedDevice,
        event.value,
      );

      final updatedDevice = currentState.selectedDevice.copyWith(
        sensitivity: event.value,
      );

      final updatedDevices = currentState.devices
          .map(
            (device) => device.id == updatedDevice.id ? updatedDevice : device,
          )
          .toList();

      emit(
        DashboardLoadedAction(
          devices: updatedDevices,
          selectedDevice: updatedDevice,
          isAddDeviceSelected: currentState.isAddDeviceSelected,
          action: DashboardAction.sensitivityChanged,
          status: DashboardActionStatus.success,
          message: AppStrings.sensitivityUpdatedSuccessfully,
        ),
      );
    } catch (_) {
      emit(
        DashboardLoadedAction(
          devices: currentState.devices,
          selectedDevice: currentState.selectedDevice,
          isAddDeviceSelected: currentState.isAddDeviceSelected,
          action: DashboardAction.sensitivityChanged,
          status: DashboardActionStatus.failure,
          message: AppStrings.failedToUpdateSensitivity,
        ),
      );
    }
  }

  Future<void> _onDeviceChanged(
    DeviceChanged event,
    Emitter<DashboardState> emit,
  ) async {
    final currentState = state;

    if (currentState is! DashboardLoaded) {
      return;
    }

    final selectedDevice = currentState.devices.firstWhere(
      (device) => device.id == event.deviceId,
    );

    emit(
      DashboardLoaded(
        devices: currentState.devices,
        selectedDevice: selectedDevice,
        isAddDeviceSelected: false,
      ),
    );
  }

  Future<void> _onAddDeviceSelected(
    AddDeviceSelected event,
    Emitter<DashboardState> emit,
  ) async {
    final currentState = state;

    if (currentState is! DashboardLoaded) {
      return;
    }

    emit(
      DashboardLoaded(
        devices: currentState.devices,
        selectedDevice: currentState.selectedDevice,
        isAddDeviceSelected: true,
      ),
    );
  }
}
