import 'package:equatable/equatable.dart';

enum SplashDestination { permission, bluetooth, dashboard, scan }

sealed class SplashState extends Equatable {
  const SplashState();

  @override
  List<Object?> get props => [];
}

final class SplashInitial extends SplashState {
  const SplashInitial();
}

final class SplashLoading extends SplashState {
  const SplashLoading();
}

final class SplashNavigate extends SplashState {
  const SplashNavigate(this.destination);

  final SplashDestination destination;

  @override
  List<Object?> get props => [destination];
}

final class SplashError extends SplashState {
  const SplashError();
}
