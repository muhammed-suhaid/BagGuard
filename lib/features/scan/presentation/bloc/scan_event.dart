import 'package:equatable/equatable.dart';

import 'package:bagguard/features/devices/data/models/device.dart';

sealed class ScanEvent extends Equatable {
  const ScanEvent();

  @override
  List<Object?> get props => [];
}

final class ScanStarted extends ScanEvent {
  const ScanStarted();
}

final class ScanStopped extends ScanEvent {
  const ScanStopped();
}

final class ScanAgainRequested extends ScanEvent {
  const ScanAgainRequested();
}

final class ScanDeviceConnectionRequested extends ScanEvent {
  const ScanDeviceConnectionRequested({required this.device});

  final Device device;

  @override
  List<Object?> get props => [device];
}

final class ScanConnectionCancelled extends ScanEvent {
  const ScanConnectionCancelled();
}
