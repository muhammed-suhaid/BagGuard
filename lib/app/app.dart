import 'package:bagguard/core/constants/app_strings.dart';
import 'package:flutter/material.dart';

import 'package:bagguard/app/app_router.dart';
import 'package:bagguard/core/theme/app_theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: AppStrings.appName,
      debugShowCheckedModeBanner: false,

      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.system,

      routerConfig: AppRouter.router,
    );
  }
}
