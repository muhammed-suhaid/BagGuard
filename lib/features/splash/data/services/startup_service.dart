import 'package:bagguard/features/splash/data/models/startup_result.dart';

class StartupService {
  Future<StartupResult> initialize() async {
    await Future.delayed(const Duration(seconds: 2));

    return const StartupResult(
      permissionsGranted: true,
      bluetoothEnabled: true,
      hasPairedDevice: false,
    );
  }
}
