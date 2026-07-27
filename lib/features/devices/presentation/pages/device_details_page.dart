import 'package:flutter/material.dart';

import 'package:bagguard/features/devices/data/models/device.dart';
import 'package:bagguard/features/devices/presentation/views/device_details_view.dart';

class DeviceDetailsPage extends StatelessWidget {
  const DeviceDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DeviceDetailsView(
      device: Device(
        id: '3',
        name: 'Backpack',
        macAddress: 'AA:BB:CC:DD:EE:03',
        batteryLevel: 50,
        isConnected: false,
        protectionEnabled: false,
        sensitivity: 40,
        firmwareVersion: '0.9.8',
        signalStrength: null,
        lastConnected: null,
      ),
      onProtectionChanged: (bool value) {},
      onSensitivityTap: () {},
      onDisconnect: () {},
      onForgetDevice: () {},
    );
  }
}
