import 'package:equatable/equatable.dart';
import 'package:bagguard/features/scan/data/models/scan_device.dart';

sealed class ScanState extends Equatable {
  const ScanState();

  @override
  List<Object?> get props => [];
}

final class ScanInitial extends ScanState {
  const ScanInitial();
}

final class ScanLoading extends ScanState {
  const ScanLoading();
}

final class ScanResult extends ScanState {
  const ScanResult({required this.devices});

  final List<ScanDevice> devices;

  @override
  List<Object?> get props => [devices];
}

final class ScanEmpty extends ScanState {
  const ScanEmpty();
}

final class ScanConnecting extends ScanState {
  const ScanConnecting({required this.device});

  final ScanDevice device;

  @override
  List<Object?> get props => [device];
}

final class ScanConnected extends ScanState {
  const ScanConnected({required this.device});

  final ScanDevice device;

  @override
  List<Object?> get props => [device];
}

final class ScanError extends ScanState {
  const ScanError({required this.message});

  final String message;

  @override
  List<Object?> get props => [message];
}
