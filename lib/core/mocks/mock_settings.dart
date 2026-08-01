import 'package:bagguard/features/settings/data/models/settings.dart';

class MockSettings {
  MockSettings._();

  static final settings = Settings(
    notificationsEnabled: true,
    autoReconnectEnabled: true,
    darkModeEnabled: false,
    vibrationEnabled: true,
    loudAlarmEnabled: true,
    appVersion: '1.0.0',
  );
}
