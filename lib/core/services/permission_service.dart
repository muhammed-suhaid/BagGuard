import 'package:permission_handler/permission_handler.dart';

class PermissionService {
  PermissionService._();

  // Required permissions list
  static final List<Permission> _permissions = [
    Permission.bluetoothScan,
    Permission.bluetoothConnect,
    Permission.locationWhenInUse,
  ];

  // Return TRUE if all required permissions are granted
  static Future<bool> hasBluetoothPermissions() async {
    for (final permission in _permissions) {
      if (!await permission.isGranted) {
        return false;
      }
    }
    return true;
  }

  // Request all required permissions
  static Future<Map<Permission, PermissionStatus>>
  requestBluetoothPermissions() async {
    return _permissions.request();
  }

  // Returns all permanently denied permissions
  static Future<bool> hasPermanentlyDeniedPermissions() async {
    for (final permission in _permissions) {
      if (await permission.isPermanentlyDenied) {
        return true;
      }
    }
    return false;
  }

  // Opens application settings
  static Future<bool> openSettings() {
    return openAppSettings();
  }
}
