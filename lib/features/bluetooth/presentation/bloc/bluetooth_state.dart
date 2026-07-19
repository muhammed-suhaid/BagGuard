import 'package:equatable/equatable.dart';

enum BluetoothDestination { scan, dashboard }

sealed class BluetoothState extends Equatable {
  const BluetoothState();

  @override
  List<Object?> get props => [];
}

final class BluetoothInitial extends BluetoothState {
  const BluetoothInitial();
}

final class BluetoothLoading extends BluetoothState {
  const BluetoothLoading();
}

final class BluetoothNavigate extends BluetoothState {
  const BluetoothNavigate({required this.destination});

  final BluetoothDestination destination;

  @override
  List<Object?> get props => [destination];
}

final class BluetoothDisabled extends BluetoothState {
  const BluetoothDisabled();
}

final class BluetoothError extends BluetoothState {
  const BluetoothError();
}
