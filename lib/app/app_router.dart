import 'package:go_router/go_router.dart';

import 'package:bagguard/app/app_routes.dart';

import 'package:bagguard/features/bluetooth/presentation/pages/bluetooth_page.dart';
import 'package:bagguard/features/dashboard/presentation/pages/dashboard_page.dart';
import 'package:bagguard/features/devices/presentation/pages/device_details_page.dart';
import 'package:bagguard/features/devices/presentation/pages/devices_page.dart';
import 'package:bagguard/features/history/presentation/pages/history_page.dart';
import 'package:bagguard/features/settings/presentation/pages/settings_page.dart';
import 'package:bagguard/features/splash/presentation/pages/splash_page.dart';

class AppRouter {
  AppRouter._();

  static final GoRouter router = GoRouter(
    initialLocation: AppRoutes.splash,
    routes: [
      GoRoute(
        path: AppRoutes.splash,
        builder: (context, state) => const SplashPage(),
      ),

      GoRoute(
        path: AppRoutes.bluetooth,
        builder: (context, state) => const BluetoothPage(),
      ),

      GoRoute(
        path: AppRoutes.dashboard,
        builder: (context, state) => const DashboardPage(),
      ),

      GoRoute(
        path: AppRoutes.devices,
        builder: (context, state) => const DevicesPage(),
      ),

      GoRoute(
        path: AppRoutes.deviceDetails,
        builder: (context, state) => const DeviceDetailsPage(),
      ),

      GoRoute(
        path: AppRoutes.history,
        builder: (context, state) => const HistoryPage(),
      ),

      GoRoute(
        path: AppRoutes.settings,
        builder: (context, state) => const SettingsPage(),
      ),
    ],
  );
}
