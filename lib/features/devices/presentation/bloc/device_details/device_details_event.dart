import 'package:equatable/equatable.dart';

sealed class DeviceDetailsEvent extends Equatable {
  const DeviceDetailsEvent();

  @override
  List<Object?> get props => [];
}

final class DeviceDetailsStarted extends DeviceDetailsEvent {
  const DeviceDetailsStarted(this.deviceId);

  final String deviceId;

  @override
  List<Object?> get props => [deviceId];
}

final class DeviceProtectionToggled extends DeviceDetailsEvent {
  const DeviceProtectionToggled({required this.enabled});

  final bool enabled;

  @override
  List<Object?> get props => [enabled];
}

final class DeviceSensitivityChanged extends DeviceDetailsEvent {
  const DeviceSensitivityChanged({required this.value});

  final int value;

  @override
  List<Object?> get props => [value];
}

final class DeviceRenamed extends DeviceDetailsEvent {
  const DeviceRenamed({required this.name});

  final String name;

  @override
  List<Object?> get props => [name];
}

final class DeviceImageChanged extends DeviceDetailsEvent {
  const DeviceImageChanged({required this.imagePath});

  final String imagePath;

  @override
  List<Object?> get props => [imagePath];
}

final class DeviceDisconnected extends DeviceDetailsEvent {
  const DeviceDisconnected();
}

final class DeviceForgotten extends DeviceDetailsEvent {
  const DeviceForgotten();
}
