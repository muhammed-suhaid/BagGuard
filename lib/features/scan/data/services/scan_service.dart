import 'package:bagguard/features/scan/data/models/scan_device.dart';

class ScanService {
  const ScanService();

  Future<List<ScanDevice>> scanDevices() async {
    //TODO: Replace with flutter_blue_plus scan.

    await Future.delayed(const Duration(seconds: 2));

    return const [
      ScanDevice(id: '1', name: 'Laptop Bag', rssi: -45),
      ScanDevice(id: '2', name: 'Travel Bag', rssi: -62),
      ScanDevice(id: '3', name: 'Office Bag', rssi: -78),
      ScanDevice(id: '4', name: 'Laptop Bag', rssi: -86),
    ];
  }

  Future<void> connectDevice(ScanDevice device) async {
    //TODO: Replace with flutter_blue_plus connect.

    await Future.delayed(const Duration(seconds: 2));
  }

  Future<void> disconnectDevice(ScanDevice device) async {
    //TODO: Replace with flutter_blue_plus disconnect.

    await Future.delayed(const Duration(seconds: 2));
  }
}
