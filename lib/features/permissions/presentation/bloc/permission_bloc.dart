import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bagguard/features/splash/data/services/startup_service.dart';
import 'package:bagguard/features/permissions/data/services/permission_service.dart';
import 'package:bagguard/features/permissions/presentation/bloc/permission_event.dart';
import 'package:bagguard/features/permissions/presentation/bloc/permission_state.dart';

class PermissionBloc extends Bloc<PermissionEvent, PermissionState> {
  PermissionBloc({
    required PermissionService permissionService,
    required StartupService startupService,
  }) : _permissionService = permissionService,
       _startupService = startupService,
       super(const PermissionInitial()) {
    on<PermissionRequested>(_onPermissionRequested);
  }

  final PermissionService _permissionService;
  final StartupService _startupService;

  Future<void> _onPermissionRequested(
    PermissionRequested event,
    Emitter<PermissionState> emit,
  ) async {
    if (state is PermissionLoading) return;

    emit(const PermissionLoading());

    try {
      if (await _permissionService.hasPermissions()) {
        final startupResult = await _startupService.initialize();

        emit(PermissionNavigate(destination: startupResult.destination));
        return;
      }

      final permissionResult = await _permissionService.requestPermissions();

      if (permissionResult.isGranted) {
        final startupResult = await _startupService.initialize();

        emit(PermissionNavigate(destination: startupResult.destination));
        return;
      }

      if (permissionResult.isPermanentlyDenied) {
        emit(const PermissionPermanentlyDenied());
        return;
      }

      emit(const PermissionDenied());
    } catch (_) {
      emit(const PermissionError());
    }
  }
}
