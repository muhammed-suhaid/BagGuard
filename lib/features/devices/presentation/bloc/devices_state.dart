import 'package:equatable/equatable.dart';

import 'package:bagguard/features/devices/data/models/device.dart';

sealed class DevicesState extends Equatable {
  const DevicesState();

  @override
  List<Object?> get props => [];
}

final class DevicesInitial extends DevicesState {
  const DevicesInitial();
}

final class DevicesLoading extends DevicesState {
  const DevicesLoading();
}

final class DevicesLoaded extends DevicesState {
  const DevicesLoaded({required this.devices});

  final List<Device> devices;

  @override
  List<Object?> get props => [devices];
}

final class DevicesError extends DevicesState {
  const DevicesError(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}
