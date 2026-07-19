import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:bagguard/app/app_routes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bagguard/features/splash/presentation/bloc/splash_bloc.dart';
import 'package:bagguard/features/splash/presentation/bloc/splash_state.dart';
import 'package:bagguard/features/splash/data/models/startup_destination.dart';
import 'package:bagguard/features/splash/presentation/widgets/splash_error_view.dart';
import 'package:bagguard/features/splash/presentation/widgets/splash_loading_view.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SplashBloc, SplashState>(
      listener: (context, state) {
        if (state is SplashNavigate) {
          switch (state.destination) {
            case StartupDestination.permission:
              context.go(AppRoutes.permission);
              break;

            case StartupDestination.bluetooth:
              context.go(AppRoutes.bluetooth);
              break;

            case StartupDestination.dashboard:
              context.go(AppRoutes.dashboard);
              break;

            case StartupDestination.scan:
              // TODO: Replace with Scan Devices page.
              context.go(AppRoutes.bluetooth);
              break;
          }
        }
      },

      builder: (context, state) {
        if (state is SplashError) {
          return const SplashErrorView();
        }
        return const SplashLoadingView();
      },
    );
  }
}
