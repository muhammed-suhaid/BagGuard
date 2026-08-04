import 'package:equatable/equatable.dart';

import 'package:bagguard/features/settings/data/models/settings.dart';

enum SettingsAction {
  notificationsChanged,
  autoReconnectChanged,
  darkModeChanged,
  vibrationChanged,
  loudAlarmChanged,
}

enum SettingsActionStatus { success, failure }

sealed class SettingsState extends Equatable {
  const SettingsState();

  @override
  List<Object?> get props => [];
}

final class SettingsInitial extends SettingsState {
  const SettingsInitial();
}

final class SettingsLoading extends SettingsState {
  const SettingsLoading();
}

final class SettingsLoaded extends SettingsState {
  const SettingsLoaded({required this.settings});

  final Settings settings;

  @override
  List<Object?> get props => [settings];
}

final class SettingsError extends SettingsState {
  const SettingsError(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}

final class SettingsLoadedAction extends SettingsLoaded {
  const SettingsLoadedAction({
    required super.settings,
    required this.action,
    required this.status,
    this.message,
  });

  final SettingsAction action;
  final SettingsActionStatus status;
  final String? message;

  @override
  List<Object?> get props => [...super.props, action, status, message];
}
