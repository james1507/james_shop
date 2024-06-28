import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:james_shop/core/translations/l10n.dart';
import 'package:james_shop/core/utils/constant/app_assets.dart';
import 'package:james_shop/shared/presentation/widgets/app_text_input.dart';

class SearchInputWidget extends StatelessWidget {
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final Function(String)? onSubmitted;
  final Function()? onTap;

  const SearchInputWidget({
    super.key,
    this.controller,
    this.focusNode,
    this.onSubmitted,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return AppTextInput(
      controller: controller,
      hintText: lang.search,
      icon: Icons.search,
      suffixIcon: SvgPicture.asset(
        AppAssets.option,
        height: 5,
        width: 5,
        fit: BoxFit.scaleDown,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      focusNode: focusNode,
      onSubmitted: onSubmitted,
      onTap: onTap,
    );
  }
}
