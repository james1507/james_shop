part of 'splash_bloc.dart';

abstract class SplashEvent {
  const SplashEvent();
}

class SplashLoadAndNavigatedEvent extends SplashEvent {}