import 'package:bagguard/app/app.dart';
import 'package:flutter/material.dart';

Future<void> bootstrap() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const App());
}
