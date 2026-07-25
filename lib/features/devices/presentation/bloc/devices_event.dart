import 'package:equatable/equatable.dart';

sealed class DevicesEvent extends Equatable {
  const DevicesEvent();

  @override
  List<Object?> get props => [];
}

final class DevicesStarted extends DevicesEvent {
  const DevicesStarted();
}
