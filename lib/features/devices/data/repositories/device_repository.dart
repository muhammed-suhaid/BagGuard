import 'package:bagguard/features/devices/data/models/device.dart';

import 'package:bagguard/features/devices/data/services/device_service.dart';

class DeviceRepository {
  const DeviceRepository({required DeviceService deviceService})
    : _deviceService = deviceService;

  final DeviceService _deviceService;

  Future<List<Device>> getDevices() async {
    return _deviceService.getDevices();
  }

  Future<Device> getDevice(String deviceId) async {
    return _deviceService.getDevice(deviceId);
  }

  Future<void> updateProtection(Device device, bool enabled) async {
    await _deviceService.updateProtection(device, enabled);
  }

  Future<void> updateSensitivity(Device device, int sensitivity) async {
    await _deviceService.updateSensitivity(device, sensitivity);
  }
}
