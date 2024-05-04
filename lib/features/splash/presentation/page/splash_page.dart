import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:james_shop/core/style/app_colors.dart';
import 'package:james_shop/core/utils/constant/app_assets.dart';
import 'package:james_shop/features/splash/presentation/bloc/splash_bloc.dart';
import 'package:loading_indicator/loading_indicator.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final _bloc = SplashBloc();

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
                _image(),
                _loading(),
              ],
            );
          }),
    );
  }

  Widget _background() {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.blackOlive,
            AppColors.chaosBlack,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
    );
  }

  Widget _image() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: SvgPicture.asset(
          AppAssets.imageLogo,
        ),
      ),
    );
  }

  Widget _loading() {
    final padding = MediaQuery.of(context).padding;

    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: EdgeInsets.only(bottom: 50 + padding.bottom),
        height: 50,
        width: 50,
        child: const LoadingIndicator(
          indicatorType: Indicator.ballSpinFadeLoader,
          colors: [AppColors.white],
        ),
      ),
    );
  }

  _loadAndNavigate() {
    _bloc.add(SplashLoadAndNavigatedEvent());
  }
}
