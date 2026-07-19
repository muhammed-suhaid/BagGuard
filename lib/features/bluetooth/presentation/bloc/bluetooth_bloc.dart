import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bagguard/features/bluetooth/data/services/bluetooth_service.dart';
import 'package:bagguard/features/bluetooth/presentation/bloc/bluetooth_event.dart';
import 'package:bagguard/features/bluetooth/presentation/bloc/bluetooth_state.dart';

class BluetoothBloc extends Bloc<BluetoothEvent, BluetoothState> {
  BluetoothBloc({required BluetoothService bluetoothService})
    : _bluetoothService = bluetoothService,
      super(const BluetoothInitial()) {
    on<BluetoothRequested>(_onBluetoothRequested);
  }

  final BluetoothService _bluetoothService;

  Future<void> _onBluetoothRequested(
    BluetoothRequested event,
    Emitter<BluetoothState> emit,
  ) async {
    if (state is BluetoothLoading) return;
    emit(const BluetoothLoading());

    try {
      final bluetoothEnabled = await _bluetoothService.enableBluetooth();

      if (bluetoothEnabled) {
        emit(const BluetoothNavigate(destination: BluetoothDestination.scan));
        return;
      }

      emit(const BluetoothDisabled());
    } catch (_) {
      emit(const BluetoothError());
    }
  }
}
