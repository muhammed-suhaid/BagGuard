import 'package:equatable/equatable.dart';

sealed class BluetoothEvent extends Equatable {
  const BluetoothEvent();

  @override
  List<Object?> get props => [];
}

final class BluetoothRequested extends BluetoothEvent {
  const BluetoothRequested();
}
