import 'package:bagguard/features/splash/data/models/startup_result.dart';
import 'package:bagguard/features/splash/data/models/startup_destination.dart';
import 'package:bagguard/features/bluetooth/data/services/bluetooth_service.dart';
import 'package:bagguard/features/permissions/data/services/permission_service.dart';

class StartupService {
  StartupService({
    required PermissionService permissionService,
    required BluetoothService bluetoothService,
  }) : _permissionService = permissionService,
       _bluetoothService = bluetoothService;

  final PermissionService _permissionService;
  final BluetoothService _bluetoothService;

  Future<StartupResult> initialize() async {
    await Future.delayed(const Duration(seconds: 2));

    if (!await _permissionService.hasPermissions()) {
      return const StartupResult(destination: StartupDestination.permission);
    }

    if (!await _bluetoothService.isBluetoothEnabled()) {
      return const StartupResult(destination: StartupDestination.bluetooth);
    }

    // TODO: Check paired device.
    return const StartupResult(destination: StartupDestination.dashboard);
  }
}
