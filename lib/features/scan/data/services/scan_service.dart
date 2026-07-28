import 'package:bagguard/core/mocks/mock_devices.dart';

import 'package:bagguard/features/devices/data/models/device.dart';

class ScanService {
  const ScanService();

  Future<List<Device>> scanDevices() async {
    //TODO: Replace with flutter_blue_plus scan.

    await Future.delayed(const Duration(seconds: 2));

    return MockDevices.devices;
  }

  Future<void> connectDevice(Device device) async {
    //TODO: Replace with flutter_blue_plus connect.

    await Future.delayed(const Duration(seconds: 2));
  }

  Future<void> disconnectDevice(Device device) async {
    //TODO: Replace with flutter_blue_plus disconnect.

    await Future.delayed(const Duration(seconds: 2));
  }
}
