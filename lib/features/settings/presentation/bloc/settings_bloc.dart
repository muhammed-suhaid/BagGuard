import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bagguard/core/constants/app_strings.dart';
import 'package:bagguard/features/settings/presentation/bloc/settings_event.dart';
import 'package:bagguard/features/settings/presentation/bloc/settings_state.dart';
import 'package:bagguard/features/settings/data/repositories/settings_repositories.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc({required SettingsRepository settingsRepository})
    : _settingsRepository = settingsRepository,
      super(const SettingsInitial()) {
    on<SettingsStarted>(_onStarted);
    on<NotificationsChanged>(_onNotificationsChanged);
    on<AutoReconnectChanged>(_onAutoReconnectChanged);
    on<DarkModeChanged>(_onDarkModeChanged);
    on<VibrationChanged>(_onVibrationChanged);
    on<LoudAlarmChanged>(_onLoudAlarmChanged);
  }

  final SettingsRepository _settingsRepository;

  Future<void> _onStarted(
    SettingsStarted event,
    Emitter<SettingsState> emit,
  ) async {
    if (state is SettingsLoading) return;

    emit(const SettingsLoading());

    try {
      final settings = await _settingsRepository.getSettings();

      emit(SettingsLoaded(settings: settings));
    } catch (_) {
      emit(SettingsError(AppStrings.unableToLoadSettings));
    }
  }

  Future<void> _onNotificationsChanged(
    NotificationsChanged event,
    Emitter<SettingsState> emit,
  ) async {
    final currentState = state;

    if (currentState is! SettingsLoaded) return;

    try {
      await _settingsRepository.updateNotifications(event.enabled);

      final updatedSettings = currentState.settings.copyWith(
        notificationsEnabled: event.enabled,
      );

      emit(
        SettingsLoadedAction(
          settings: updatedSettings,
          action: SettingsAction.notificationsChanged,
          status: SettingsActionStatus.success,
          message: event.enabled
              ? AppStrings.notificationsEnabledSuccessfully
              : AppStrings.notificationsDisabledSuccessfully,
        ),
      );
    } catch (_) {
      emit(
        SettingsLoadedAction(
          settings: currentState.settings,
          action: SettingsAction.notificationsChanged,
          status: SettingsActionStatus.failure,
          message: AppStrings.failedToUpdateNotifications,
        ),
      );
    }
  }

  Future<void> _onAutoReconnectChanged(
    AutoReconnectChanged event,
    Emitter<SettingsState> emit,
  ) async {
    final currentState = state;

    if (currentState is! SettingsLoaded) return;

    try {
      await _settingsRepository.updateAutoReconnect(event.enabled);

      final updatedSettings = currentState.settings.copyWith(
        autoReconnectEnabled: event.enabled,
      );

      emit(
        SettingsLoadedAction(
          settings: updatedSettings,
          action: SettingsAction.autoReconnectChanged,
          status: SettingsActionStatus.success,
          message: event.enabled
              ? AppStrings.autoReconnectEnabledSuccessfully
              : AppStrings.autoReconnectDisabledSuccessfully,
        ),
      );
    } catch (_) {
      emit(
        SettingsLoadedAction(
          settings: currentState.settings,
          action: SettingsAction.autoReconnectChanged,
          status: SettingsActionStatus.failure,
          message: AppStrings.failedToUpdateAutoReconnect,
        ),
      );
    }
  }

  Future<void> _onDarkModeChanged(
    DarkModeChanged event,
    Emitter<SettingsState> emit,
  ) async {
    final currentState = state;

    if (currentState is! SettingsLoaded) return;

    try {
      await _settingsRepository.updateDarkMode(event.enabled);

      final updatedSettings = currentState.settings.copyWith(
        darkModeEnabled: event.enabled,
      );

      emit(
        SettingsLoadedAction(
          settings: updatedSettings,
          action: SettingsAction.darkModeChanged,
          status: SettingsActionStatus.success,
          message: event.enabled
              ? AppStrings.darkModeEnabledSuccessfully
              : AppStrings.darkModeDisabledSuccessfully,
        ),
      );
    } catch (_) {
      emit(
        SettingsLoadedAction(
          settings: currentState.settings,
          action: SettingsAction.darkModeChanged,
          status: SettingsActionStatus.failure,
          message: AppStrings.failedToUpdateDarkMode,
        ),
      );
    }
  }

  Future<void> _onVibrationChanged(
    VibrationChanged event,
    Emitter<SettingsState> emit,
  ) async {
    final currentState = state;

    if (currentState is! SettingsLoaded) return;

    try {
      await _settingsRepository.updateVibration(event.enabled);

      final updatedSettings = currentState.settings.copyWith(
        vibrationEnabled: event.enabled,
      );

      emit(
        SettingsLoadedAction(
          settings: updatedSettings,
          action: SettingsAction.vibrationChanged,
          status: SettingsActionStatus.success,
          message: event.enabled
              ? AppStrings.vibrationEnabledSuccessfully
              : AppStrings.vibrationDisabledSuccessfully,
        ),
      );
    } catch (_) {
      emit(
        SettingsLoadedAction(
          settings: currentState.settings,
          action: SettingsAction.vibrationChanged,
          status: SettingsActionStatus.failure,
          message: AppStrings.failedToUpdateVibration,
        ),
      );
    }
  }

  Future<void> _onLoudAlarmChanged(
    LoudAlarmChanged event,
    Emitter<SettingsState> emit,
  ) async {
    final currentState = state;

    if (currentState is! SettingsLoaded) return;

    try {
      await _settingsRepository.updateLoudAlarm(event.enabled);

      final updatedSettings = currentState.settings.copyWith(
        loudAlarmEnabled: event.enabled,
      );

      emit(
        SettingsLoadedAction(
          settings: updatedSettings,
          action: SettingsAction.loudAlarmChanged,
          status: SettingsActionStatus.success,
          message: event.enabled
              ? AppStrings.loudAlarmEnabledSuccessfully
              : AppStrings.loudAlarmDisabledSuccessfully,
        ),
      );
    } catch (_) {
      emit(
        SettingsLoadedAction(
          settings: currentState.settings,
          action: SettingsAction.loudAlarmChanged,
          status: SettingsActionStatus.failure,
          message: AppStrings.failedToUpdateLoudAlarm,
        ),
      );
    }
  }
}
