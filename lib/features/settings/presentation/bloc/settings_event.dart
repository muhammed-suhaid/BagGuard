import 'package:equatable/equatable.dart';

sealed class SettingsEvent extends Equatable {
  const SettingsEvent();

  @override
  List<Object?> get props => [];
}

final class SettingsStarted extends SettingsEvent {
  const SettingsStarted();
}

final class NotificationsToggled extends SettingsEvent {
  const NotificationsToggled({required this.enabled});

  final bool enabled;

  @override
  List<Object?> get props => [enabled];
}

final class AutoReconnectToggled extends SettingsEvent {
  const AutoReconnectToggled({required this.enabled});

  final bool enabled;

  @override
  List<Object?> get props => [enabled];
}

final class DarkModeToggled extends SettingsEvent {
  const DarkModeToggled({required this.enabled});

  final bool enabled;

  @override
  List<Object?> get props => [enabled];
}

final class VibrationToggled extends SettingsEvent {
  const VibrationToggled({required this.enabled});

  final bool enabled;

  @override
  List<Object?> get props => [enabled];
}

final class LoudAlarmToggled extends SettingsEvent {
  const LoudAlarmToggled({required this.enabled});

  final bool enabled;

  @override
  List<Object?> get props => [enabled];
}
