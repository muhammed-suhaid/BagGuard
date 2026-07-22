import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bagguard/core/constants/app_strings.dart';
import 'package:bagguard/features/scan/data/models/scan_device.dart';
import 'package:bagguard/features/scan/presentation/bloc/scan_event.dart';
import 'package:bagguard/features/scan/presentation/bloc/scan_state.dart';
import 'package:bagguard/features/scan/data/repositories/scan_repository.dart';

class ScanBloc extends Bloc<ScanEvent, ScanState> {
  ScanBloc({required ScanRepository scanRepository})
    : _scanRepository = scanRepository,
      super(const ScanInitial()) {
    on<ScanStarted>(_onScanStarted);
    on<ScanAgainRequested>(_onScanAgainRequested);
    on<ScanStopped>(_onScanStopped);
    on<ScanDeviceConnectionRequested>(_onScanDeviceConnectionRequested);
    on<ScanConnectionCancelled>(_onScanConnectionCancelled);
  }

  final ScanRepository _scanRepository;
  List<ScanDevice> _devices = [];
  ScanDevice? _connectingDevice;
  bool _connectionCancelled = false;

  Future<void> _onScanStarted(
    ScanStarted event,
    Emitter<ScanState> emit,
  ) async {
    return _startScan(emit);
  }

  Future<void> _onScanAgainRequested(
    ScanAgainRequested event,
    Emitter<ScanState> emit,
  ) async {
    return _startScan(emit);
  }

  Future<void> _startScan(Emitter<ScanState> emit) async {
    if (state is ScanLoading) return;

    emit(const ScanLoading());

    try {
      final devices = await _scanRepository.scanDevices();

      //TODO: Remove when integrating flutter_blue_plus.
      if (state is! ScanLoading) {
        return;
      }

      if (devices.isEmpty) {
        _devices = [];

        emit(const ScanEmpty());
        return;
      }

      _devices = devices;
      emit(ScanResult(devices: devices));
    } catch (_) {
      emit(const ScanError(message: AppStrings.unableToScanNearbyDevices));
    }
  }

  Future<void> _onScanStopped(
    ScanStopped event,
    Emitter<ScanState> emit,
  ) async {
    _devices = [];
    _connectingDevice = null;

    emit(const ScanInitial());
  }

  Future<void> _onScanDeviceConnectionRequested(
    ScanDeviceConnectionRequested event,
    Emitter<ScanState> emit,
  ) async {
    if (state is ScanConnecting) return;
    _connectionCancelled = false;
    _connectingDevice = event.device;

    emit(ScanConnecting(device: event.device));

    try {
      await _scanRepository.connectDevice(event.device);

      //TODO: Remove when integrating flutter_blue_plus.
      if (_connectionCancelled) {
        return;
      }

      _connectingDevice = null;

      emit(ScanConnected(device: event.device));
    } catch (_) {
      _connectingDevice = null;

      emit(const ScanError(message: AppStrings.unableToConnectDevice));
    }
  }

  Future<void> _onScanConnectionCancelled(
    ScanConnectionCancelled event,
    Emitter<ScanState> emit,
  ) async {
    _connectionCancelled = true;
    try {
      if (_connectingDevice == null) return;

      await _scanRepository.disconnectDevice(_connectingDevice!);

      _connectingDevice = null;

      emit(ScanResult(devices: _devices));
    } catch (_) {
      _connectingDevice = null;

      emit(const ScanError(message: AppStrings.unableToCancelConnection));
    }
  }
}
