import 'package:bagguard/features/bluetooth/data/models/bluetooth_result.dart';

class BluetoothService {
  const BluetoothService();

  Future<BluetoothResult> enableBluetooth() async {
    // TODO: Implement with BLE package.
    return const BluetoothResult(isEnabled: false);
  }

  Future<bool> isBluetoothEnabled() async {
    // TODO: Implement with BLE package.
    return false;
  }
}
