part of 'onboarding_bloc.dart';

abstract class OnboardingEvent {
  const OnboardingEvent();
}

class WelcomeLoadAndNavigatedEvent extends OnboardingEvent {}

class ChangeCurrentPageEvent extends OnboardingEvent {
  final int currentPageIndex;

  ChangeCurrentPageEvent({
    required this.currentPageIndex,
  });
}

class NavigateToHomeEvent extends OnboardingEvent {}
