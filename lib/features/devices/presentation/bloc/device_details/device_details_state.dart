import 'package:equatable/equatable.dart';

import 'package:bagguard/features/devices/data/models/device.dart';

enum DeviceDetailsAction {
  protectionChanged,
  sensitivityChanged,
  renamed,
  imageChanged,
  disconnected,
  forgotten,
}

enum DeviceDetailsActionStatus { success, failure }

sealed class DeviceDetailsState extends Equatable {
  const DeviceDetailsState();

  @override
  List<Object?> get props => [];
}

final class DeviceDetailsInitial extends DeviceDetailsState {
  const DeviceDetailsInitial();
}

final class DeviceDetailsLoading extends DeviceDetailsState {
  const DeviceDetailsLoading();
}

final class DeviceDetailsLoaded extends DeviceDetailsState {
  const DeviceDetailsLoaded({required this.device});

  final Device device;

  @override
  List<Object?> get props => [device];
}

final class DeviceDetailsError extends DeviceDetailsState {
  const DeviceDetailsError(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}

final class DeviceDetailsActionState extends DeviceDetailsState {
  const DeviceDetailsActionState({
    required this.device,
    required this.action,
    required this.status,
    this.message,
  });

  final Device device;
  final DeviceDetailsAction action;
  final DeviceDetailsActionStatus status;
  final String? message;

  @override
  List<Object?> get props => [device, action, status, message];
}
