import 'package:bagguard/core/mocks/mock_settings.dart';

import 'package:bagguard/features/settings/data/models/settings.dart';

class SettingsService {
  const SettingsService();

  Future<Settings> getSettings() async {
    // TODO: Replace with Hive settings retrieval.

    await Future.delayed(const Duration(milliseconds: 300));

    return MockSettings.settings;
  }

  Future<void> updateNotifications(bool enabled) async {
    // TODO: Enable/disable app notifications.
    // TODO: Persist notification preference in Hive.

    await Future.delayed(const Duration(milliseconds: 300));
  }

  Future<void> updateAutoReconnect(bool enabled) async {
    // TODO: Persist auto reconnect preference in Hive.

    await Future.delayed(const Duration(milliseconds: 300));
  }

  Future<void> updateDarkMode(bool enabled) async {
    // TODO: Persist theme preference in Hive.
    // TODO: Update application theme.

    await Future.delayed(const Duration(milliseconds: 300));
  }

  Future<void> updateVibration(bool enabled) async {
    // TODO: Persist vibration preference in Hive.

    await Future.delayed(const Duration(milliseconds: 300));
  }

  Future<void> updateLoudAlarm(bool enabled) async {
    // TODO: Persist loud alarm preference in Hive.

    await Future.delayed(const Duration(milliseconds: 300));
  }
}
