import 'package:bagguard/core/mocks/mock_devices.dart';

import 'package:bagguard/features/devices/data/models/device.dart';

class DeviceService {
  const DeviceService();

  Future<List<Device>> getDevices() async {
    // TODO: Replace with Hive/BLE device retrieval.

    await Future.delayed(const Duration(milliseconds: 300));

    return MockDevices.devices;
  }

  Future<Device> getDevice(String deviceId) async {
    // TODO: Replace with BLE protection update.

    await Future.delayed(const Duration(milliseconds: 300));

    final devices = await getDevices();

    return devices.firstWhere((device) => device.id == deviceId);
  }

  Future<void> updateProtection(Device device, bool enabled) async {
    // TODO: Replace with BLE protection update.

    await Future.delayed(const Duration(milliseconds: 300));
  }

  Future<void> updateSensitivity(Device device, int sensitivity) async {
    // TODO: Replace with BLE sensitivity update.

    await Future.delayed(const Duration(milliseconds: 300));
  }

  Future<void> renameDevice(Device device, String name) async {
    // TODO: Replace with Hive update.

    await Future.delayed(const Duration(milliseconds: 300));
  }

  Future<void> updateDeviceImage(Device device, String imagePath) async {
    // TODO: Replace with local image storage.

    await Future.delayed(const Duration(milliseconds: 300));
  }

  Future<void> forgetDevice(Device device) async {
    // TODO: Follow these steps :
    // 1. Disconnect if connected.
    // 2. Remove from Hive.
    // 3. Delete local image.
    // 4. Remove cached settings.

    await Future.delayed(const Duration(milliseconds: 300));
  }
}
