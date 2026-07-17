import 'package:equatable/equatable.dart';

enum PermissionDestination { bluetooth, scan, dashboard }

sealed class PermissionState extends Equatable {
  const PermissionState();

  @override
  List<Object?> get props => [];
}

final class PermissionInitial extends PermissionState {
  const PermissionInitial();
}

final class PermissionLoading extends PermissionState {
  const PermissionLoading();
}

final class PermissionNavigate extends PermissionState {
  const PermissionNavigate({required this.destination});

  final PermissionDestination destination;

  @override
  List<Object?> get props => [destination];
}

final class PermissionDenied extends PermissionState {
  const PermissionDenied();
}

final class PermissionPermanentlyDenied extends PermissionState {
  const PermissionPermanentlyDenied();
}

final class PermissionError extends PermissionState {
  const PermissionError();
}
