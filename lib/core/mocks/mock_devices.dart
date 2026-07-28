import 'package:bagguard/features/devices/data/models/device.dart';

class MockDevices {
  MockDevices._();

  static final devices = <Device>[
    Device(
      id: '1',
      name: 'Laptop Bag',
      macAddress: 'AA:BB:CC:DD:EE:01',
      batteryLevel: 92,
      isConnected: true,
      protectionEnabled: true,
      sensitivity: 50,
      firmwareVersion: '1.0.2',
      signalStrength: -48,
      lastConnected: null,
    ),

    Device(
      id: '2',
      name: 'Travel Bag',
      macAddress: 'AA:BB:CC:DD:EE:02',
      batteryLevel: 71,
      isConnected: true,
      protectionEnabled: false,
      sensitivity: 65,
      firmwareVersion: '1.0.1',
      signalStrength: -63,
      lastConnected: DateTime(DateTime.april),
    ),

    Device(
      id: '3',
      name: 'Backpack',
      macAddress: 'AA:BB:CC:DD:EE:03',
      batteryLevel: 50,
      isConnected: false,
      protectionEnabled: false,
      sensitivity: 40,
      firmwareVersion: '0.9.8',
      signalStrength: -94,
      lastConnected: DateTime.now(),
    ),

    Device(
      id: '4',
      name: 'Camera Bag',
      macAddress: 'AA:BB:CC:DD:EE:04',
      batteryLevel: 86,
      isConnected: true,
      protectionEnabled: true,
      sensitivity: 80,
      firmwareVersion: '1.1.0',
      signalStrength: -54,
      lastConnected: null,
    ),
  ];
}
