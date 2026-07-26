import 'package:bagguard/core/constants/app_strings.dart';

class SensitivityUtils {
  const SensitivityUtils._();

  static String label(int sensitivity) {
    if (sensitivity <= 33) {
      return AppStrings.low;
    }

    if (sensitivity <= 66) {
      return AppStrings.medium;
    }

    return AppStrings.high;
  }
}
