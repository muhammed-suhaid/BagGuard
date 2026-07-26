import 'package:equatable/equatable.dart';

sealed class DashboardEvent extends Equatable {
  const DashboardEvent();

  @override
  List<Object?> get props => [];
}

final class DashboardStarted extends DashboardEvent {
  const DashboardStarted();
}

final class ProtectionToggled extends DashboardEvent {
  const ProtectionToggled({required this.enabled});

  final bool enabled;

  @override
  List<Object?> get props => [enabled];
}

final class SensitivityChanged extends DashboardEvent {
  const SensitivityChanged({required this.value});

  final int value;

  @override
  List<Object?> get props => [value];
}

final class DeviceChanged extends DashboardEvent {
  const DeviceChanged(this.deviceId);

  final String deviceId;

  @override
  List<Object?> get props => [deviceId];
}

final class AddDeviceSelected extends DashboardEvent {
  const AddDeviceSelected();
}
