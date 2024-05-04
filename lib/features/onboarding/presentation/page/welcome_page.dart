import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:james_shop/core/translations/l10n.dart';
import 'package:james_shop/core/utils/constant/app_assets.dart';
import 'package:james_shop/features/onboarding/presentation/bloc/onboarding_bloc.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final _bloc = OnboardingBloc();

  @override
  void initState() {
    super.initState();
    _loadAndNavigate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocBuilder(
      bloc: _bloc,
      builder: (context, state) {
        return Stack(
          children: [
            _background(),
            _content(),
          ],
        );
      },
    ));
  }

  Widget _background() {
    return Container(
        decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage(AppAssets.welcomeBackground),
        fit: BoxFit.cover,
      ),
    ));
  }

  Widget _content() {
    final padding = MediaQuery.of(context).padding;
    final textTheme = Theme.of(context).textTheme;

    return Container(
      margin: EdgeInsets.only(bottom: padding.bottom, left: 32, right: 32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            lang.welcomeTo,
            style: textTheme.displayLarge!.copyWith(
              fontSize: 48,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 15),
          Text(
            lang.james,
            style: textTheme.displayLarge!.copyWith(
              fontSize: 96,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 15),
          Text(
            lang.descriptionWelcome,
            style: textTheme.titleSmall!.copyWith(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  _loadAndNavigate() {
    _bloc.add(WelcomeLoadAndNavigatedEvent());
  }
}
