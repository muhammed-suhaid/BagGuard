import 'package:equatable/equatable.dart';
import 'package:bagguard/features/splash/data/models/startup_destination.dart';

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

  final StartupDestination destination;

  @override
  List<Object?> get props => [destination];
}

final class SplashError extends SplashState {
  const SplashError();
}
