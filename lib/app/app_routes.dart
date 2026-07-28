class AppRoutes {
  AppRoutes._();

  // Startup
  static const splash = '/';
  static const permission = '/permission';

  // Device discovery
  static const bluetooth = '/bluetooth';
  static const scan = '/scan';

  // Bottom navigation
  static const dashboard = '/dashboard';
  static const devices = '/devices';
  static const settings = '/settings';

  // Secondary pages
  static const deviceDetails = '/devices/:deviceId';
  static const history = '/history';

  static String deviceDetailsPath(String deviceId) {
    return '/devices/$deviceId';
  }
}
