import 'package:hive_flutter/hive_flutter.dart';
import 'package:bagguard/core/constants/hive_boxes.dart';

class HiveService {
  HiveService._();

  static Future<void> initialize() async {
    await Hive.initFlutter();

    await Hive.openBox(HiveBoxes.devices);
    await Hive.openBox(HiveBoxes.settings);
    await Hive.openBox(HiveBoxes.history);
  }
}
