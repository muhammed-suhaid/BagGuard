import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class BluetoothService {
  const BluetoothService();

  static const int _userRejectedErrorCode = 11;

  Future<bool> enableBluetooth() async {
    if (!await FlutterBluePlus.isSupported) {
      return false;
    }

    if (await isBluetoothEnabled()) {
      return true;
    }

    try {
      if (!kIsWeb && Platform.isAndroid) {
        await FlutterBluePlus.turnOn();
      }
    } on FlutterBluePlusException catch (e) {
      // User rejected the request.
      if (e.code == _userRejectedErrorCode) {
        return false;
      }

      rethrow;
    }

    final state = await FlutterBluePlus.adapterState.firstWhere(
      (state) =>
          state == BluetoothAdapterState.on ||
          state == BluetoothAdapterState.off,
    );

    return state == BluetoothAdapterState.on;
  }

  Future<bool> isBluetoothEnabled() async {
    if (!await FlutterBluePlus.isSupported) {
      return false;
    }

    final state = await FlutterBluePlus.adapterState.first;

    return state == BluetoothAdapterState.on;
  }
}
