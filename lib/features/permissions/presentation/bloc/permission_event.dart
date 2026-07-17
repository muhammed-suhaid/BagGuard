import 'package:equatable/equatable.dart';

sealed class PermissionEvent extends Equatable {
  const PermissionEvent();

  @override
  List<Object?> get props => [];
}

final class PermissionRequested extends PermissionEvent {
  const PermissionRequested();
}
