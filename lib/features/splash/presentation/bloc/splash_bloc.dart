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

      emit(SplashNavigate(result.destination));
    } catch (_) {
      emit(const SplashError());
    }
  }
}
