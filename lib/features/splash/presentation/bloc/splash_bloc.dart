import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bagguard/features/splash/data/services/startup_service.dart';
import 'package:bagguard/features/splash/presentation/bloc/splash_event.dart';
import 'package:bagguard/features/splash/presentation/bloc/splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc({required StartupService startupService})
    : _startupService = startupService,
      super(const SplashInitial()) {
    on<SplashStarted>(_onSplashStarted);
  }

  final StartupService _startupService;

  Future<void> _onSplashStarted(
    SplashStarted event,
    Emitter<SplashState> emit,
  ) async {
    emit(const SplashLoading());

    try {
      final result = await _startupService.initialize();

      if (!result.permissionsGranted) {
        emit(const SplashNavigate(SplashDestination.permission));
        return;
      }

      if (!result.bluetoothEnabled) {
        emit(const SplashNavigate(SplashDestination.bluetooth));
        return;
      }

      if (result.hasPairedDevice) {
        emit(const SplashNavigate(SplashDestination.dashboard));
        return;
      }

      emit(const SplashNavigate(SplashDestination.scan));
    } catch (_) {
      emit(const SplashError());
    }
  }
}
