import 'package:bagguard/features/settings/data/models/settings.dart';

import 'package:bagguard/features/settings/data/services/settings_service.dart';

class SettingsRepository {
  const SettingsRepository({required SettingsService settingsService})
    : _settingsService = settingsService;

  final SettingsService _settingsService;

  Future<Settings> getSettings() async {
    return _settingsService.getSettings();
  }

  Future<void> updateNotifications(bool enabled) async {
    await _settingsService.updateNotifications(enabled);
  }

  Future<void> updateAutoReconnect(bool enabled) async {
    await _settingsService.updateAutoReconnect(enabled);
  }

  Future<void> updateDarkMode(bool enabled) async {
    await _settingsService.updateDarkMode(enabled);
  }

  Future<void> updateVibration(bool enabled) async {
    await _settingsService.updateVibration(enabled);
  }

  Future<void> updateLoudAlarm(bool enabled) async {
    await _settingsService.updateLoudAlarm(enabled);
  }
}
