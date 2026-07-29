class AppStrings {
  AppStrings._();

  // General
  static const appName = 'BagGuard';
  static const appSubtitle = 'Smart Bag Security';

  // Navigation
  static const toDashboard = 'Go to Dashboard';
  static const continueToDashboard = 'Continue to Dashboard';

  // Device
  static const myDevices = 'My Devices';
  static const connected = 'Connected';
  static const disconnected = 'Disconnected';
  static const protection = 'Protection';
  static const location = 'Location';
  static const battery = 'Battery';
  static const firmwareVersion = 'Firmware Version';
  static const signalStrength = 'Signal Strength';
  static const lastConnected = 'Last Connected';
  static const macAddress = 'MAC Address';
  static const more = 'More';
  static const loadingDevices = 'Loading devices...';
  static const loadingDevicesDescription =
      'Please wait while we prepare your devices.';
  static const loadingDevice = 'Loading device...';
  static const loadingDeviceDescription =
      'Please wait while we prepare your device.';
  static const renameDevice = 'Rename Device';
  static const enterDeviceName = 'Enter a device name';

  // Dashboard
  static const quickActions = 'Quick Actions';
  static const sensitivity = 'Sensitivity';
  static const low = 'Low';
  static const medium = 'Medium';
  static const high = 'High';
  static const addDevice = 'Add Device';
  static const loadingDashboard = 'Loading dashboard...';
  static const loadingDashboardDescription =
      'Fetching your devices and security settings.';

  // Bluetooth
  static const bluetooth = 'Bluetooth';
  static const bluetoothOff = 'Bluetooth is off';
  static const bluetoothRequired = 'Bluetooth Required';
  static const bluetoothIsOn = 'Bluetooth is enabled';
  static const bluetoothRequiredDescription =
      'Turn on Bluetooth to connect to your BagGuard device.';

  // Empty States
  static const never = 'Never';

  // Buttons
  static const cancel = 'Cancel';
  static const save = 'Save';
  static const rename = 'Rename';
  static const delete = 'Delete';
  static const retry = 'Retry';
  static const grantPermissions = 'Grant Permissions';
  static const openSettings = 'Open Settings';
  static const turnOnBluetooth = 'Turn On Bluetooth';
  static const startScanning = 'Start Scanning';
  static const stopScanning = 'Stop Scanning';
  static const scanAgain = 'Scan Again';
  static const connect = 'Connect';
  static const testAlarm = 'Test Alarm';
  static const forgetDevice = 'Forget Device';
  static const disconnectDevice = 'Disconnect Device';
  static const changeDeviceName = 'Change Device Name';
  static const changeBagType = 'Change Bag Type';

  // Page Not Found
  static const pageNotFound = 'Page Not Found';
  static const pageNotFoundMessage =
      'The page you are looking for does not exist.';

  // Success
  static const connectedSuccessfully = 'Connected Successfully';
  static const protectionEnabledSuccessfully =
      'Protection enabled successfully.';
  static const protectionDisabledSuccessfully =
      'Protection disabled successfully.';
  static const sensitivityUpdatedSuccessfully =
      'Sensitivity updated successfully.';
  static const deviceRenamedSuccessfully = 'Device renamed successfully.';
  static const deviceBagTypeUpdatedSuccessfully =
      'Device bag type updated successfully.';
  static const deviceDisconnectedSuccessfully =
      'Device disconnected successfully.';
  static const deviceForgottenSuccessfully = 'Device removed successfully.';

  // Errors
  static const unavailable = 'Unavailable';
  static const somethingWentWrong = 'Something went wrong';
  static const unableToStartApplication =
      'Unable to start the application. Please try again.';
  static const unableToRequestPermissions =
      'Unable to request permissions. Please try again.';
  static const unableToCheckBluetoothStatus =
      'Unable to check Bluetooth status. Please try again.';
  static const unableToScanNearbyDevices = 'Unable to scan nearby devices.';
  static const unableToConnectDevice = 'Unable to connect to device.';
  static const unableToCancelConnection =
      'Unable to cancel the connection. Please try again.';
  static const failedToUpdateProtection =
      'Failed to update protection. Please try again.';
  static const failedToUpdateSensitivity =
      'Failed to update sensitivity. Please try again.';
  static const failedToRenameDevice =
      'Failed to rename device. Please try again.';
  static const failedToUpdateDeviceBagType =
      'Failed to update device bag type. Please try again.';
  static const failedToDisconnectDevice =
      'Failed to disconnect device. Please try again.';
  static const failedToForgetDevice =
      'Failed to remove device. Please try again.';

  // Confirmation Dialog
  static const String forgetDeviceMessage =
      'Are you sure you want to forget this device? '
      'You will need to pair it again before using it.';
  static const String forget = 'Forget';

  // Permission
  static const permissionsRequired = 'Permissions Required';
  static const nearbyDevices = 'Nearby devices';
  static const permissionsDescription =
      'BagGuard requires Bluetooth and Location permissions '
      'to discover and connect to your BagGuard device.';
  static const permissionRequired = 'Permissions Required';
  static const permissionSettingsMessage =
      'Permissions have been permanently denied. Please enable them in Settings.';

  // Scan
  static const scan = 'Scan';
  static const scanDevices = 'Scan Devices';
  static const deviceFound = 'Device found';
  static const devicesFound = 'Devices found';
  static const deviceIsOn = 'Device is turned on';
  static const withinRange = 'Within Range';
  static const scanningDevicesInitialTitle = 'Ready to Protect';
  static const scanningDevicesInitialSubtitle =
      'Connect your BagGuard device to keep your belongings safe and secure.';
  static const scanningDevicesLoadingTitle =
      'Scanning for\nBagGuard devices...';
  static const scanningDevicesLoadingSubtitle =
      'Make sure your device is powered on and nearby.';
  static const keepYourDevicesClose = 'Keep Your Devices Close';
  static const noDevicesFound = 'No BagGuard devices found';
  static const noDevicesFoundDescription =
      'Make sure your BagGuard device is powered on, nearby, and in pairing mode. then try scanning again.';
  static const connectingTo = 'Connecting to...';
  static const connectingDescription =
      'Please wait while we establish a secure connection.';
  static const deviceReadyDescription =
      'Your BagGuard device is now ready to protect your belongings.';

  // History
  static const history = 'History';
}
