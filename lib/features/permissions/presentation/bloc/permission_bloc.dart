import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bagguard/features/permissions/data/services/permission_service.dart';
import 'package:bagguard/features/permissions/presentation/bloc/permission_event.dart';
import 'package:bagguard/features/permissions/presentation/bloc/permission_state.dart';

class PermissionBloc extends Bloc<PermissionEvent, PermissionState> {
  PermissionBloc({required PermissionService permissionService})
    : _permissionService = permissionService,
      super(const PermissionInitial()) {
    on<PermissionRequested>(_onPermissionRequested);
  }

  final PermissionService _permissionService;

  Future<void> _onPermissionRequested(
    PermissionRequested event,
    Emitter<PermissionState> emit,
  ) async {
    emit(const PermissionLoading());

    try {
      final result = await _permissionService.requestPermissions();

      if (result.isGranted) {
        emit(
          const PermissionNavigate(
            destination: PermissionDestination.bluetooth,
          ),
        );
        return;
      }

      if (result.isPermanentlyDenied) {
        emit(const PermissionPermanentlyDenied());
        return;
      }

      emit(const PermissionDenied());
    } catch (_) {
      emit(const PermissionError());
    }
  }
}
