import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final Function()? onPressed;
  final Widget? child;
  final double? height;
  final double? width;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final Color? buttonColor;

  const AppButton({
    super.key,
    this.onPressed,
    this.child,
    this.width,
    this.height,
    this.padding,
    this.margin,
    this.buttonColor,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      padding: padding,
      margin: margin,
      height: height,
      width: width,
      child: FilledButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(buttonColor),
          textStyle: MaterialStatePropertyAll(
            textTheme.titleMedium!.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        child: child,
      ),
    );
  }
}
