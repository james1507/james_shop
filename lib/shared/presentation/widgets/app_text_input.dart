import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:james_shop/core/style/app_colors.dart';

class AppTextInput extends StatefulWidget {
  final TextEditingController? controller;
  final Widget? icon;
  final String? hintText;
  final OutlineInputBorder? border;
  final FocusNode? focusNode;
  final bool showTogglePassword;

  const AppTextInput({
    super.key,
    this.controller,
    this.focusNode,
    this.icon,
    this.hintText,
    this.border,
    this.showTogglePassword = false,
  });

  @override
  State<AppTextInput> createState() => _AppTextInputState();
}

class _AppTextInputState extends State<AppTextInput> {
  bool _obscured = false;
  FocusNode? _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = widget.focusNode ?? FocusNode();
  }

  void _toggleObscured() {
    if (_focusNode == null) return;
    setState(() {
      _obscured = !_obscured;
      if (_focusNode!.hasPrimaryFocus) return;
      _focusNode!.canRequestFocus = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return TextFormField(
      controller: widget.controller,
      focusNode: _focusNode,
      decoration: InputDecoration(
        fillColor: theme.colorScheme.onSecondary,
        filled: true,
        contentPadding: const EdgeInsets.symmetric(vertical: 16),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: theme.primaryColor,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(12)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: AppColors.transparent,
          ),
        ),
        hintText: widget.hintText,
        hintStyle: theme.textTheme.titleSmall!.copyWith(
          fontSize: 14,
          color: AppColors.greyscale500,
        ),
        prefixIcon: widget.icon,
        suffixIcon: Visibility(
          visible: widget.showTogglePassword,
          child: IconButton(
            icon: Icon(
              _obscured ? Icons.visibility_rounded : Icons.visibility_off_rounded,
              color: AppColors.greyscale500,
            ),
            onPressed: _toggleObscured,
          ),
        ),
        border: widget.border,
      ),
      style: theme.textTheme.titleSmall!.copyWith(
        color: theme.primaryColor,
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
      cursorColor: AppColors.greyscale500,
    );
  }
}
