import 'package:bagguard/features/splash/data/models/startup_result.dart';
import 'package:bagguard/features/permissions/data/services/permission_service.dart';

class StartupService {
  StartupService({required PermissionService permissionService})
    : _permissionService = permissionService;

  final PermissionService _permissionService;

  Future<StartupResult> initialize() async {
    await Future.delayed(const Duration(seconds: 2));

    final permissionsGranted = await _permissionService.hasPermissions();

    return StartupResult(
      permissionsGranted: permissionsGranted,
      bluetoothEnabled: true,
      hasPairedDevice: false,
    );
  }
}
