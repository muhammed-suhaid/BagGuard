class Settings {
  const Settings({
    required this.notificationsEnabled,
    required this.autoReconnectEnabled,
    required this.darkModeEnabled,
    required this.vibrationEnabled,
    required this.loudAlarmEnabled,
    required this.appVersion,
  });

  final bool notificationsEnabled;
  final bool autoReconnectEnabled;
  final bool darkModeEnabled;
  final bool vibrationEnabled;
  final bool loudAlarmEnabled;
  final String appVersion;

  Settings copyWith({
    bool? notificationsEnabled,
    bool? autoReconnectEnabled,
    bool? darkModeEnabled,
    bool? vibrationEnabled,
    bool? loudAlarmEnabled,
    String? appVersion,
  }) {
    return Settings(
      notificationsEnabled: notificationsEnabled ?? this.notificationsEnabled,
      autoReconnectEnabled: autoReconnectEnabled ?? this.autoReconnectEnabled,
      darkModeEnabled: darkModeEnabled ?? this.darkModeEnabled,
      vibrationEnabled: vibrationEnabled ?? this.vibrationEnabled,
      loudAlarmEnabled: loudAlarmEnabled ?? this.loudAlarmEnabled,
      appVersion: appVersion ?? this.appVersion,
    );
  }
}
