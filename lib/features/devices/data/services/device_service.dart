import 'package:bagguard/features/devices/data/models/device.dart';

class DeviceService {
  const DeviceService();

  Future<List<Device>> getDevices() async {
    // TODO: Replace with Hive/BLE device retrieval.

    await Future.delayed(const Duration(milliseconds: 300));

    return const [
      Device(
        id: '1',
        name: 'Laptop Bag',
        macAddress: 'AA:BB:CC:DD:EE:01',
        batteryLevel: 92,
        isConnected: true,
        protectionEnabled: true,
        sensitivity: 50,
      ),
      Device(
        id: '2',
        name: 'Travel Bag',
        macAddress: 'AA:BB:CC:DD:EE:02',
        batteryLevel: 71,
        isConnected: false,
        protectionEnabled: false,
        sensitivity: 65,
      ),
      Device(
        id: '3',
        name: 'Backpack',
        macAddress: 'AA:BB:CC:DD:EE:03',
        batteryLevel: 50,
        isConnected: false,
        protectionEnabled: false,
        sensitivity: 40,
      ),
      Device(
        id: '4',
        name: 'Camera Bag',
        macAddress: 'AA:BB:CC:DD:EE:04',
        batteryLevel: 86,
        isConnected: true,
        protectionEnabled: true,
        sensitivity: 80,
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
}
