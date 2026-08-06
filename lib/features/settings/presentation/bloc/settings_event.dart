import 'package:equatable/equatable.dart';

sealed class SettingsEvent extends Equatable {
  const SettingsEvent();

  @override
  List<Object?> get props => [];
}

final class SettingsStarted extends SettingsEvent {
  const SettingsStarted();
}

final class NotificationsChanged extends SettingsEvent {
  const NotificationsChanged({required this.enabled});

  final bool enabled;

  @override
  List<Object?> get props => [enabled];
}

final class AutoReconnectChanged extends SettingsEvent {
  const AutoReconnectChanged({required this.enabled});

  final bool enabled;

  @override
  List<Object?> get props => [enabled];
}

final class DarkModeChanged extends SettingsEvent {
  const DarkModeChanged({required this.enabled});

  final bool enabled;

  @override
  List<Object?> get props => [enabled];
}

final class VibrationChanged extends SettingsEvent {
  const VibrationChanged({required this.enabled});

  final bool enabled;

  @override
  List<Object?> get props => [enabled];
}

final class LoudAlarmChanged extends SettingsEvent {
  const LoudAlarmChanged({required this.enabled});

  final bool enabled;

  @override
  List<Object?> get props => [enabled];
}
