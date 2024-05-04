import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:james_shop/core/flavors/app.dart';
import 'package:james_shop/features/home/presentation/page/home_page.dart';
import 'package:james_shop/features/onboarding/presentation/page/walkthrough_page.dart';

part 'onboarding_event.dart';
part 'onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  late PageController pageController;
  late TabController tabController;
  int currentPageIndex = 0;

  OnboardingBloc() : super(OnboardingInitialState()) {
    on<WelcomeLoadAndNavigatedEvent>(_onWelcomeLoadAndNavigate);
    on<ChangeCurrentPageEvent>(_onChangeCurrentPage);
    on<NavigateToHomeEvent>(_onNavigateToHome);
    on<ChangeCurrentIndexEvent>(_onChangeCurrentIndex);
  }

  _onWelcomeLoadAndNavigate(
      WelcomeLoadAndNavigatedEvent event, Emitter<OnboardingState> emitter) {
    Future.delayed(const Duration(milliseconds: 1500), () {
      Navigator.of(navigatorKey.currentContext!).push(
        MaterialPageRoute(
          builder: (context) => const WalkthroughPage(),
        ),
      );
    });
  }

  _onChangeCurrentIndex(
      ChangeCurrentIndexEvent event, Emitter<OnboardingState> emitter) {
    emitter(CurrentPageIndexState(currentPageIndex: event.currentPageIndex));
  }

  _onChangeCurrentPage(
      ChangeCurrentPageEvent event, Emitter<OnboardingState> emitter) {
    pageController.animateToPage(
      event.currentPageIndex,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  _onNavigateToHome(
      NavigateToHomeEvent event, Emitter<OnboardingState> emitter) {
    Navigator.of(navigatorKey.currentContext!).push(
      MaterialPageRoute(
        builder: (context) => const HomePage(),
      ),
    );
  }
}
