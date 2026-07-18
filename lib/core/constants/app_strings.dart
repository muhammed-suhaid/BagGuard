class AppStrings {
  AppStrings._();

  // General
  static const appName = 'BagGuard';
  static const appSubtitle = 'Smart Bag Security';

  // Navigation
  static const toDashboard = 'Go to Dashboard';

  // Device
  static const connected = 'Connected';
  static const disconnected = 'Disconnected';
  static const protection = 'Protection';
  static const location = 'Location';
  static const battery = 'Battery';
  static const more = 'More';

  // Dashboard
  static const myDevices = 'My Devices';
  static const quickActions = 'Quick Actions';

  // Bluetooth
  static const bluetoothOff = 'Bluetooth is off';
  static const scanDevices = 'Scan Devices';

  // Empty States
  static const noDevices = 'No devices found';
  static const pairFirstDevice = 'Pair your first BagGuard device.';

  // Buttons
  static const cancel = 'Cancel';
  static const save = 'Save';
  static const rename = 'Rename';
  static const delete = 'Delete';
  static const retry = 'Retry';
  static const grantPermissions = 'Grant Permissions';
  static const openSettings = 'Open Settings';

  // Page Not Found
  static const pageNotFound = 'Page Not Found';
  static const pageNotFoundMessage =
      'The page you are looking for does not exist.';

  // Errors
  static const somethingWentWrong = 'Something went wrong';
  static const unableToRequest = 'Unable to request. Please try again.';

  // Splash
  static const startupErrorTitle = 'Unable to Start';
  static const startupErrorMessage =
      'Something went wrong while starting the application. Please try again.';

  // Permission
  static const permissionsRequired = 'Permissions Required';
  static const nearbyDevices = 'Nearby devices';
  static const permissionsDescription =
      'BagGuard requires Bluetooth and Location permissions '
      'to discover and connect to your BagGuard device.';
  static const permissionRequired = 'Permissions Required';
  static const permissionSettingsMessage =
      'Permissions have been permanently denied. Please enable them in Settings.';
}
