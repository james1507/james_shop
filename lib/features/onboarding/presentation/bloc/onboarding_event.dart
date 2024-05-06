part of 'onboarding_bloc.dart';

abstract class OnboardingEvent {
  const OnboardingEvent();
}

class WelcomeLoadAndNavigatedEvent extends OnboardingEvent {}

class ChangeCurrentIndexEvent extends OnboardingEvent {
  final int currentPageIndex;

  ChangeCurrentIndexEvent({
    required this.currentPageIndex,
  });
}

class ChangeCurrentPageEvent extends OnboardingEvent {
  final int currentPageIndex;

  ChangeCurrentPageEvent({
    required this.currentPageIndex,
  });
}

class NavigateToAccountAuthEvent extends OnboardingEvent {}
