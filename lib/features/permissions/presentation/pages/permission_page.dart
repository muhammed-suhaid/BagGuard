import 'package:flutter/widgets.dart';

import 'package:go_router/go_router.dart';
import 'package:bagguard/app/app_routes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bagguard/core/constants/app_strings.dart';
import 'package:bagguard/shared/widgets/app_error_view.dart';
import 'package:bagguard/features/splash/data/models/startup_destination.dart';
import 'package:bagguard/features/permissions/presentation/bloc/permission_bloc.dart';
import 'package:bagguard/features/permissions/presentation/bloc/permission_event.dart';
import 'package:bagguard/features/permissions/presentation/bloc/permission_state.dart';
import 'package:bagguard/features/permissions/presentation/widgets/permission_content_view.dart';
import 'package:bagguard/features/permissions/presentation/widgets/permission_permanently_denied_view.dart';

class PermissionPage extends StatelessWidget {
  const PermissionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PermissionBloc, PermissionState>(
      listener: (context, state) {
        if (state is PermissionNavigate) {
          switch (state.destination) {
            case StartupDestination.permission:
              // Already on the permission screen.
              return;

            case StartupDestination.bluetooth:
              context.go(AppRoutes.bluetooth);
              break;

            case StartupDestination.scan:
              // TODO: Replace with Scan Devices page.
              context.go(AppRoutes.dashboard);
              break;

            case StartupDestination.dashboard:
              context.go(AppRoutes.dashboard);
              break;
          }
        }
      },
      builder: (context, state) {
        if (state is PermissionError) {
          return AppErrorView(
            message: AppStrings.unableToRequestPermissions,
            onRetry: () {
              context.read<PermissionBloc>().add(const PermissionRequested());
            },
          );
        }

        if (state is PermissionPermanentlyDenied) {
          return const PermissionPermanentlyDeniedView();
        }

        return PermissionContentView(isLoading: state is PermissionLoading);
      },
    );
  }
}
