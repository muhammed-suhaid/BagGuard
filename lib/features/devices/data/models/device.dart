import 'package:equatable/equatable.dart';

class Device extends Equatable {
  const Device({
    required this.id,
    required this.name,
    required this.macAddress,
    required this.batteryLevel,
    required this.isConnected,
    required this.protectionEnabled,
    required this.sensitivity,
    required this.firmwareVersion,
    this.signalStrength,
    this.lastConnected,
  });

  final String id;
  final String name;
  final String macAddress;
  final int batteryLevel;
  final bool isConnected;
  final bool protectionEnabled;
  final int sensitivity;
  final String firmwareVersion;
  final int? signalStrength;
  final DateTime? lastConnected;

  Device copyWith({
    String? id,
    String? name,
    String? macAddress,
    int? batteryLevel,
    bool? isConnected,
    bool? protectionEnabled,
    int? sensitivity,
    String? firmwareVersion,
    int? signalStrength,
    DateTime? lastConnected,
  }) {
    return Device(
      id: id ?? this.id,
      name: name ?? this.name,
      macAddress: macAddress ?? this.macAddress,
      batteryLevel: batteryLevel ?? this.batteryLevel,
      isConnected: isConnected ?? this.isConnected,
      protectionEnabled: protectionEnabled ?? this.protectionEnabled,
      sensitivity: sensitivity ?? this.sensitivity,
      lastConnected: lastConnected ?? this.lastConnected,
      firmwareVersion: firmwareVersion ?? this.firmwareVersion,
      signalStrength: signalStrength ?? this.signalStrength,
    );
  }

  @override
  List<Object?> get props => [
    id,
    name,
    macAddress,
    batteryLevel,
    isConnected,
    protectionEnabled,
    sensitivity,
    firmwareVersion,
    signalStrength,
    lastConnected,
  ];
}
