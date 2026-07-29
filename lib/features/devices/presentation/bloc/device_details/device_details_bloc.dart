import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bagguard/core/constants/app_strings.dart';
import 'package:bagguard/features/scan/data/repositories/scan_repository.dart';
import 'package:bagguard/features/devices/data/repositories/device_repository.dart';
import 'package:bagguard/features/devices/presentation/bloc/device_details/device_details_event.dart';
import 'package:bagguard/features/devices/presentation/bloc/device_details/device_details_state.dart';

class DeviceDetailsBloc extends Bloc<DeviceDetailsEvent, DeviceDetailsState> {
  DeviceDetailsBloc({
    required DeviceRepository deviceRepository,
    required ScanRepository scanRepository,
  }) : _deviceRepository = deviceRepository,
       _scanRepository = scanRepository,
       super(const DeviceDetailsInitial()) {
    on<DeviceDetailsStarted>(_onStarted);
    on<DeviceConnected>(_onConnected);
    on<DeviceDisconnected>(_onDisconnected);
    on<DeviceProtectionToggled>(_onProtectionToggled);
    on<DeviceSensitivityChanged>(_onSensitivityChanged);
    on<DeviceRenamed>(_onRenamed);
    on<DeviceBagTypeChanged>(_onBagTypeChanged);
    on<DeviceForgotten>(_onForgotten);
  }

  final DeviceRepository _deviceRepository;
  final ScanRepository _scanRepository;

  Future<void> _onStarted(
    DeviceDetailsStarted event,
    Emitter<DeviceDetailsState> emit,
  ) async {
    if (state is DeviceDetailsLoading) return;

    emit(const DeviceDetailsLoading());

    try {
      final device = await _deviceRepository.getDevice(event.deviceId);

      emit(DeviceDetailsLoaded(device: device));
    } catch (_) {
      emit(DeviceDetailsError(AppStrings.somethingWentWrong));
    }
  }

  Future<void> _onConnected(
    DeviceConnected event,
    Emitter<DeviceDetailsState> emit,
  ) async {
    final currentState = state;

    if (currentState is! DeviceDetailsLoaded) {
      return;
    }

    try {
      await _scanRepository.connectDevice(currentState.device);

      final updatedDevice = currentState.device.copyWith(isConnected: true);

      emit(
        DeviceDetailsLoadedAction(
          device: updatedDevice,
          action: DeviceDetailsAction.connected,
          status: DeviceDetailsActionStatus.success,
          message: AppStrings.deviceConnectedSuccessfully,
        ),
      );
    } catch (_) {
      emit(
        DeviceDetailsLoadedAction(
          device: currentState.device,
          action: DeviceDetailsAction.connected,
          status: DeviceDetailsActionStatus.failure,
          message: AppStrings.unableToConnectDevice,
        ),
      );
    }
  }

  Future<void> _onDisconnected(
    DeviceDisconnected event,
    Emitter<DeviceDetailsState> emit,
  ) async {
    final currentState = state;

    if (currentState is! DeviceDetailsLoaded) {
      return;
    }

    try {
      await _scanRepository.disconnectDevice(currentState.device);

      final updatedDevice = currentState.device.copyWith(isConnected: false);

      emit(
        DeviceDetailsLoadedAction(
          device: updatedDevice,
          action: DeviceDetailsAction.disconnected,
          status: DeviceDetailsActionStatus.success,
          message: AppStrings.deviceDisconnectedSuccessfully,
        ),
      );
    } catch (_) {
      emit(
        DeviceDetailsLoadedAction(
          device: currentState.device,
          action: DeviceDetailsAction.disconnected,
          status: DeviceDetailsActionStatus.failure,
          message: AppStrings.unableToDisconnectDevice,
        ),
      );
    }
  }

  Future<void> _onProtectionToggled(
    DeviceProtectionToggled event,
    Emitter<DeviceDetailsState> emit,
  ) async {
    final currentState = state;

    if (currentState is! DeviceDetailsLoaded) {
      return;
    }

    try {
      await _deviceRepository.updateProtection(
        currentState.device,
        event.enabled,
      );

      final updatedDevice = currentState.device.copyWith(
        protectionEnabled: event.enabled,
      );

      emit(
        DeviceDetailsLoadedAction(
          device: updatedDevice,
          action: DeviceDetailsAction.protectionChanged,
          status: DeviceDetailsActionStatus.success,
          message: event.enabled
              ? AppStrings.protectionEnabledSuccessfully
              : AppStrings.protectionDisabledSuccessfully,
        ),
      );
    } catch (_) {
      emit(
        DeviceDetailsLoadedAction(
          device: currentState.device,
          action: DeviceDetailsAction.protectionChanged,
          status: DeviceDetailsActionStatus.failure,
          message: AppStrings.failedToUpdateProtection,
        ),
      );
    }
  }

  Future<void> _onSensitivityChanged(
    DeviceSensitivityChanged event,
    Emitter<DeviceDetailsState> emit,
  ) async {
    final currentState = state;

    if (currentState is! DeviceDetailsLoaded) {
      return;
    }

    try {
      await _deviceRepository.updateSensitivity(
        currentState.device,
        event.value,
      );

      final updatedDevice = currentState.device.copyWith(
        sensitivity: event.value,
      );

      emit(
        DeviceDetailsLoadedAction(
          device: updatedDevice,
          action: DeviceDetailsAction.sensitivityChanged,
          status: DeviceDetailsActionStatus.success,
          message: AppStrings.sensitivityUpdatedSuccessfully,
        ),
      );
    } catch (_) {
      emit(
        DeviceDetailsLoadedAction(
          device: currentState.device,
          action: DeviceDetailsAction.sensitivityChanged,
          status: DeviceDetailsActionStatus.failure,
          message: AppStrings.failedToUpdateSensitivity,
        ),
      );
    }
  }

  Future<void> _onRenamed(
    DeviceRenamed event,
    Emitter<DeviceDetailsState> emit,
  ) async {
    final currentState = state;

    if (currentState is! DeviceDetailsLoaded) {
      return;
    }

    try {
      await _deviceRepository.renameDevice(currentState.device, event.name);

      final updatedDevice = currentState.device.copyWith(name: event.name);

      emit(
        DeviceDetailsLoadedAction(
          device: updatedDevice,
          action: DeviceDetailsAction.renamed,
          status: DeviceDetailsActionStatus.success,
          message: AppStrings.deviceRenamedSuccessfully,
        ),
      );
    } catch (_) {
      emit(
        DeviceDetailsLoadedAction(
          device: currentState.device,
          action: DeviceDetailsAction.renamed,
          status: DeviceDetailsActionStatus.failure,
          message: AppStrings.failedToRenameDevice,
        ),
      );
    }
  }

  Future<void> _onBagTypeChanged(
    DeviceBagTypeChanged event,
    Emitter<DeviceDetailsState> emit,
  ) async {
    final currentState = state;

    if (currentState is! DeviceDetailsLoaded) {
      return;
    }

    try {
      await _deviceRepository.updateBagType(currentState.device, event.bagType);

      final updatedDevice = currentState.device.copyWith(
        bagType: event.bagType,
      );

      emit(
        DeviceDetailsLoadedAction(
          device: updatedDevice,
          action: DeviceDetailsAction.bagTypeChanged,
          status: DeviceDetailsActionStatus.success,
          message: AppStrings.bagTypeUpdatedSuccessfully,
        ),
      );
    } catch (_) {
      emit(
        DeviceDetailsLoadedAction(
          device: currentState.device,
          action: DeviceDetailsAction.bagTypeChanged,
          status: DeviceDetailsActionStatus.failure,
          message: AppStrings.failedToUpdateBagType,
        ),
      );
    }
  }

  Future<void> _onForgotten(
    DeviceForgotten event,
    Emitter<DeviceDetailsState> emit,
  ) async {
    final currentState = state;

    if (currentState is! DeviceDetailsLoaded) {
      return;
    }

    try {
      await _deviceRepository.forgetDevice(currentState.device);

      emit(
        DeviceDetailsLoadedAction(
          device: currentState.device,
          action: DeviceDetailsAction.forgotten,
          status: DeviceDetailsActionStatus.success,
          message: AppStrings.deviceForgottenSuccessfully,
        ),
      );
    } catch (_) {
      emit(
        DeviceDetailsLoadedAction(
          device: currentState.device,
          action: DeviceDetailsAction.forgotten,
          status: DeviceDetailsActionStatus.failure,
          message: AppStrings.failedToForgetDevice,
        ),
      );
    }
  }
}
