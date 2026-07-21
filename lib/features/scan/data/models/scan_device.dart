import 'package:equatable/equatable.dart';

class ScanDevice extends Equatable {
  const ScanDevice({required this.id, required this.name, required this.rssi});

  final String id;
  final String name;
  final int rssi;

  @override
  List<Object?> get props => [id, name, rssi];
}
