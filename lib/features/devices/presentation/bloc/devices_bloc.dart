import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bagguard/core/constants/app_strings.dart';
import 'package:bagguard/features/devices/presentation/bloc/devices_event.dart';
import 'package:bagguard/features/devices/presentation/bloc/devices_state.dart';
import 'package:bagguard/features/devices/data/repositories/device_repository.dart';

class DevicesBloc extends Bloc<DevicesEvent, DevicesState> {
  DevicesBloc({required DeviceRepository deviceRepository})
    : _deviceRepository = deviceRepository,
      super(const DevicesInitial()) {
    on<DevicesStarted>(_onStarted);
  }

  final DeviceRepository _deviceRepository;

  Future<void> _onStarted(
    DevicesStarted event,
    Emitter<DevicesState> emit,
  ) async {
    emit(const DevicesLoading());

    try {
      final devices = await _deviceRepository.getDevices();

      emit(DevicesLoaded(devices: devices));
    } catch (_) {
      emit(const DevicesError(AppStrings.unableToLoadDevices));
    }
  }
}
