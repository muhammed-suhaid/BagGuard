import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bagguard/features/splash/data/services/startup_service.dart';
import 'package:bagguard/features/bluetooth/data/services/bluetooth_service.dart';
import 'package:bagguard/features/bluetooth/presentation/bloc/bluetooth_event.dart';
import 'package:bagguard/features/bluetooth/presentation/bloc/bluetooth_state.dart';

class BluetoothBloc extends Bloc<BluetoothEvent, BluetoothState> {
  BluetoothBloc({
    required BluetoothService bluetoothService,
    required StartupService startupService,
  }) : _bluetoothService = bluetoothService,
       _startupService = startupService,
       super(const BluetoothInitial()) {
    on<BluetoothRequested>(_onBluetoothRequested);
  }

  final BluetoothService _bluetoothService;
  final StartupService _startupService;

  Future<void> _onBluetoothRequested(
    BluetoothRequested event,
    Emitter<BluetoothState> emit,
  ) async {
    if (state is BluetoothLoading) return;
    emit(const BluetoothLoading());

    try {
      if (await _bluetoothService.isBluetoothEnabled()) {
        final startupResult = await _startupService.initialize();

        emit(BluetoothNavigate(destination: startupResult.destination));
        return;
      }

      final bluetoothEnabled = await _bluetoothService.enableBluetooth();

      if (bluetoothEnabled) {
        final startupResult = await _startupService.initialize();

        emit(BluetoothNavigate(destination: startupResult.destination));
        return;
      }

      emit(const BluetoothDisabled());
    } catch (_) {
      emit(const BluetoothError());
    }
  }
}
