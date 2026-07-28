import 'package:bagguard/features/devices/data/models/device.dart';

import 'package:bagguard/features/scan/data/services/scan_service.dart';

class ScanRepository {
  const ScanRepository({required ScanService scanService})
    : _scanService = scanService;

  final ScanService _scanService;

  Future<List<Device>> scanDevices() async {
    return _scanService.scanDevices();
  }

  Future<void> connectDevice(Device device) async {
    await _scanService.connectDevice(device);
  }

  Future<void> disconnectDevice(Device device) async {
    await _scanService.disconnectDevice(device);
  }
}
