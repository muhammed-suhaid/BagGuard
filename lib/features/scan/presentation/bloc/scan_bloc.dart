import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bagguard/core/constants/app_strings.dart';
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
  }

  final ScanRepository _scanRepository;

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

      if (devices.isEmpty) {
        emit(const ScanEmpty());
        return;
      }

      emit(ScanResult(devices: devices));
    } catch (_) {
      emit(const ScanError(message: AppStrings.unableToScanNearbyDevices));
    }
  }

  Future<void> _onScanStopped(
    ScanStopped event,
    Emitter<ScanState> emit,
  ) async {
    emit(const ScanEmpty());
  }

  Future<void> _onScanDeviceConnectionRequested(
    ScanDeviceConnectionRequested event,
    Emitter<ScanState> emit,
  ) async {
    if (state is ScanConnecting) return;

    emit(ScanConnecting(device: event.device));

    try {
      await _scanRepository.connectDevice(event.device);

      emit(ScanConnected(device: event.device));
    } catch (_) {
      emit(const ScanError(message: AppStrings.unableToConnectDevice));
    }
  }
}
