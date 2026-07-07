import 'package:flutter/material.dart';

import 'package:bagguard/app/app.dart';
import 'package:bagguard/core/services/hive_service.dart';

Future<void> bootstrap() async {
  WidgetsFlutterBinding.ensureInitialized();

  await HiveService.initialize();

  runApp(const App());
}
