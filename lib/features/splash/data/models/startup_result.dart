class StartupResult {
  const StartupResult({
    required this.permissionsGranted,
    required this.bluetoothEnabled,
    required this.hasPairedDevice,
  });

  final bool permissionsGranted;
  final bool bluetoothEnabled;
  final bool hasPairedDevice;
}
