import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:james_shop/core/style/app_colors.dart';
import 'package:james_shop/core/utils/constant/app_image.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _background(),
          _image(),
        ],
      ),
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
      child: SvgPicture.asset(
        AppAssets.imageLogo,
      ),
    );
  }
}
