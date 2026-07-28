import 'package:bagguard/features/devices/data/models/device.dart';

class DeviceService {
  const DeviceService();

  Future<List<Device>> getDevices() async {
    // TODO: Replace with Hive/BLE device retrieval.

    await Future.delayed(const Duration(milliseconds: 300));

    return [
      Device(
        id: '1',
        name: 'Laptop Bag',
        macAddress: 'AA:BB:CC:DD:EE:01',
        batteryLevel: 92,
        isConnected: true,
        protectionEnabled: true,
        sensitivity: 50,
        firmwareVersion: '1.0.2',
        signalStrength: -48,
        lastConnected: null,
      ),

      Device(
        id: '2',
        name: 'Travel Bag',
        macAddress: 'AA:BB:CC:DD:EE:02',
        batteryLevel: 71,
        isConnected: true,
        protectionEnabled: false,
        sensitivity: 65,
        firmwareVersion: '1.0.1',
        signalStrength: -63,
        lastConnected: null,
      ),

      Device(
        id: '3',
        name: 'Backpack',
        macAddress: 'AA:BB:CC:DD:EE:03',
        batteryLevel: 50,
        isConnected: false,
        protectionEnabled: false,
        sensitivity: 40,
        firmwareVersion: '0.9.8',
        signalStrength: null,
        lastConnected: DateTime(2026, 7, 24, 18, 30),
      ),

      Device(
        id: '4',
        name: 'Camera Bag',
        macAddress: 'AA:BB:CC:DD:EE:04',
        batteryLevel: 86,
        isConnected: true,
        protectionEnabled: true,
        sensitivity: 80,
        firmwareVersion: '1.1.0',
        signalStrength: -54,
        lastConnected: null,
      ),
    ];
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
