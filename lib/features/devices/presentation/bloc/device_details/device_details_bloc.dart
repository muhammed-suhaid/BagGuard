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
    on<DeviceProtectionToggled>(_onProtectionToggled);
    on<DeviceSensitivityChanged>(_onSensitivityChanged);
    on<DeviceRenamed>(_onRenamed);
    on<DeviceImageChanged>(_onImageChanged);
    on<DeviceDisconnected>(_onDisconnected);
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

      emit(DeviceDetailsLoaded(device: updatedDevice));
    } catch (_) {
      emit(
        DeviceDetailsActionState(
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

      emit(DeviceDetailsLoaded(device: updatedDevice));
    } catch (_) {
      emit(
        DeviceDetailsActionState(
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

      emit(DeviceDetailsLoaded(device: updatedDevice));

      emit(
        DeviceDetailsActionState(
          device: updatedDevice,
          action: DeviceDetailsAction.renamed,
          status: DeviceDetailsActionStatus.success,
        ),
      );
    } catch (_) {
      emit(
        DeviceDetailsActionState(
          device: currentState.device,
          action: DeviceDetailsAction.renamed,
          status: DeviceDetailsActionStatus.failure,
          message: AppStrings.failedToRenameDevice,
        ),
      );
    }
  }

  Future<void> _onImageChanged(
    DeviceImageChanged event,
    Emitter<DeviceDetailsState> emit,
  ) async {
    final currentState = state;

    if (currentState is! DeviceDetailsLoaded) {
      return;
    }
    try {
      await _deviceRepository.updateDeviceImage(
        currentState.device,
        event.imagePath,
      );

      final updatedDevice = currentState.device.copyWith(
        imagePath: event.imagePath,
      );

      emit(DeviceDetailsLoaded(device: updatedDevice));

      emit(
        DeviceDetailsActionState(
          device: updatedDevice,
          action: DeviceDetailsAction.imageChanged,
          status: DeviceDetailsActionStatus.success,
        ),
      );
    } catch (_) {
      emit(
        DeviceDetailsActionState(
          device: currentState.device,
          action: DeviceDetailsAction.imageChanged,
          status: DeviceDetailsActionStatus.failure,
          message: AppStrings.failedToChangeImage,
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

      emit(DeviceDetailsLoaded(device: updatedDevice));

      emit(
        DeviceDetailsActionState(
          device: updatedDevice,
          action: DeviceDetailsAction.disconnected,
          status: DeviceDetailsActionStatus.success,
        ),
      );
    } catch (_) {
      emit(
        DeviceDetailsActionState(
          device: currentState.device,
          action: DeviceDetailsAction.disconnected,
          status: DeviceDetailsActionStatus.failure,
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
        DeviceDetailsActionState(
          device: currentState.device,
          action: DeviceDetailsAction.forgotten,
          status: DeviceDetailsActionStatus.success,
        ),
      );
    } catch (_) {
      emit(
        DeviceDetailsActionState(
          device: currentState.device,
          action: DeviceDetailsAction.forgotten,
          status: DeviceDetailsActionStatus.failure,
          message: AppStrings.failedToForgetDevice,
        ),
      );
    }
  }
}
