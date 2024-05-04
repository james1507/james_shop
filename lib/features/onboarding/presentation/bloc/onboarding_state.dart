part of 'onboarding_bloc.dart';

abstract class OnboardingState {
  const OnboardingState();
}

class OnboardingInitialState extends OnboardingState {}

class CurrentPageIndexState extends OnboardingState {
  final int currentPageIndex;

  CurrentPageIndexState({required this.currentPageIndex});
}
