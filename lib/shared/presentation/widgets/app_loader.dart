import 'package:flutter/material.dart';
import 'package:james_shop/core/style/app_colors.dart';
import 'package:loading_indicator/loading_indicator.dart';

class AppLoader extends StatelessWidget {
  final Color? iconColor;

  const AppLoader({
    super.key,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Stack(
      children: [
        Container(
          color: theme.primaryColor.withOpacity(0.5),
        ),
        const Center(
          child: SizedBox(
            height: 50,
            width: 50,
            child: LoadingIndicator(
              indicatorType: Indicator.ballSpinFadeLoader,
              colors: [AppColors.white],
            ),
          ),
        )
      ],
    );
  }
}
