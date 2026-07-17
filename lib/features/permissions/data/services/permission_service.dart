import 'package:permission_handler/permission_handler.dart';
import 'package:bagguard/features/permissions/data/models/permission_result.dart';

class PermissionService {
  const PermissionService();

  // Required permissions list
  static const List<Permission> _permissions = [
    Permission.bluetoothScan,
    Permission.bluetoothConnect,
    Permission.locationWhenInUse,
  ];

  // Request all required permissions
  Future<PermissionResult> requestPermissions() async {
    final statuses = await _permissions.request();

    final granted = statuses.values.every((status) => status.isGranted);
    final permanentlyDenied = statuses.values.any(
      (status) => status.isPermanentlyDenied,
    );

    return PermissionResult(
      isGranted: granted,
      isPermanentlyDenied: permanentlyDenied,
    );
  }

  // Return TRUE if all required permissions are granted
  Future<bool> hasPermissions() async {
    final statuses = await Future.wait(
      _permissions.map((permission) => permission.status),
    );

    return statuses.every((status) => status.isGranted);
  }

  // Returns all permanently denied permissions
  Future<bool> hasPermanentlyDeniedPermissions() async {
    final statuses = await Future.wait(
      _permissions.map((permission) => permission.status),
    );

    return statuses.any((status) => status.isPermanentlyDenied);
  }

  // Opens application settings
  Future<bool> openSettings() {
    return openAppSettings();
  }
}
