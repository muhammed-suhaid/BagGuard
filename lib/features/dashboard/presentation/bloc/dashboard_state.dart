import 'package:equatable/equatable.dart';
import 'package:bagguard/features/devices/data/models/device.dart';

sealed class DashboardState extends Equatable {
  const DashboardState();

  @override
  List<Object?> get props => [];
}

final class DashboardInitial extends DashboardState {
  const DashboardInitial();
}

final class DashboardLoading extends DashboardState {
  const DashboardLoading();
}

final class DashboardLoaded extends DashboardState {
  const DashboardLoaded({required this.devices, required this.selectedDevice});

  final List<Device> devices;
  final Device selectedDevice;

  @override
  List<Object?> get props => [devices, selectedDevice];
}

final class DashboardError extends DashboardState {
  const DashboardError(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}
