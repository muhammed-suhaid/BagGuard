import 'package:bagguard/features/scan/data/models/scan_device.dart';

import 'package:bagguard/features/scan/data/services/scan_service.dart';

class ScanRepository {
  const ScanRepository({required ScanService scanService})
    : _scanService = scanService;

  final ScanService _scanService;

  Future<List<ScanDevice>> scanDevices() async {
    return _scanService.scanDevices();
  }

  Future<void> connectDevice(ScanDevice device) {
    return _scanService.connectDevice(device);
  }

  Future<void> disconnectDevice(ScanDevice device) {
    return _scanService.disconnectDevice(device);
  }
}
