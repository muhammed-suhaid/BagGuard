class PermissionResult {
  const PermissionResult({
    required this.isGranted,
    required this.isPermanentlyDenied,
  });

  final bool isGranted;
  final bool isPermanentlyDenied;
}
