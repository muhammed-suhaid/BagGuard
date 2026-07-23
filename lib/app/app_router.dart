import 'package:bagguard/app/shell/app_shell.dart';
import 'package:go_router/go_router.dart';

import 'package:bagguard/app/app_routes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bagguard/app/widgets/not_found_screen.dart';

import 'package:bagguard/features/splash/data/services/startup_service.dart';
import 'package:bagguard/features/splash/presentation/bloc/splash_bloc.dart';
import 'package:bagguard/features/splash/presentation/bloc/splash_event.dart';
import 'package:bagguard/features/splash/presentation/pages/splash_page.dart';

import 'package:bagguard/features/permissions/data/services/permission_service.dart';
import 'package:bagguard/features/permissions/presentation/bloc/permission_bloc.dart';
import 'package:bagguard/features/permissions/presentation/pages/permission_page.dart';

import 'package:bagguard/features/bluetooth/data/services/bluetooth_service.dart';
import 'package:bagguard/features/bluetooth/presentation/bloc/bluetooth_bloc.dart';
import 'package:bagguard/features/bluetooth/presentation/pages/bluetooth_page.dart';

import 'package:bagguard/features/scan/data/services/scan_service.dart';
import 'package:bagguard/features/scan/presentation/bloc/scan_bloc.dart';
import 'package:bagguard/features/scan/presentation/pages/scan_page.dart';
import 'package:bagguard/features/scan/data/repositories/scan_repository.dart';

import 'package:bagguard/features/history/presentation/pages/history_page.dart';
import 'package:bagguard/features/devices/presentation/pages/devices_page.dart';
import 'package:bagguard/features/settings/presentation/pages/settings_page.dart';
import 'package:bagguard/features/dashboard/presentation/pages/dashboard_page.dart';
import 'package:bagguard/features/devices/presentation/pages/device_details_page.dart';

class AppRouter {
  AppRouter._();

  static final GoRouter router = GoRouter(
    initialLocation: AppRoutes.splash,

    errorBuilder: (_, _) => const NotFoundScreen(),

    routes: [
      GoRoute(
        path: AppRoutes.splash,
        builder: (_, _) => BlocProvider(
          create: (_) => SplashBloc(
            startupService: StartupService(
              permissionService: const PermissionService(),
              bluetoothService: const BluetoothService(),
            ),
          )..add(const SplashStarted()),
          child: const SplashPage(),
        ),
      ),

      GoRoute(
        path: AppRoutes.permission,
        builder: (_, _) => BlocProvider(
          create: (_) => PermissionBloc(
            permissionService: const PermissionService(),
            startupService: StartupService(
              permissionService: const PermissionService(),
              bluetoothService: const BluetoothService(),
            ),
          ),
          child: const PermissionPage(),
        ),
      ),

      GoRoute(
        path: AppRoutes.bluetooth,
        builder: (_, _) => BlocProvider(
          create: (_) => BluetoothBloc(
            bluetoothService: const BluetoothService(),
            startupService: StartupService(
              permissionService: const PermissionService(),
              bluetoothService: const BluetoothService(),
            ),
          ),
          child: const BluetoothPage(),
        ),
      ),

      GoRoute(
        path: AppRoutes.scan,
        builder: (_, _) => BlocProvider(
          create: (_) => ScanBloc(
            scanRepository: const ScanRepository(scanService: ScanService()),
          ),
          child: const ScanPage(),
        ),
      ),

      StatefulShellRoute.indexedStack(
        builder: (_, _, navigationShell) {
          return AppShell(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.dashboard,
                builder: (_, _) => const DashboardPage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.devices,
                builder: (_, _) => const DevicesPage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.settings,
                builder: (_, _) => const SettingsPage(),
              ),
            ],
          ),
        ],
      ),

      GoRoute(
        path: AppRoutes.deviceDetails,
        builder: (_, _) => const DeviceDetailsPage(),
      ),

      GoRoute(path: AppRoutes.history, builder: (_, _) => const HistoryPage()),
    ],
  );
}
