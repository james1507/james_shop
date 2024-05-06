import 'package:flutter/material.dart';

class AppTextInput extends StatelessWidget {
  const AppTextInput({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
            width: 1.0,
          ),
        ),
        fillColor: Colors.black,
        filled: true,
      ),
    );
  }
}
