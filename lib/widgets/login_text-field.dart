import 'package:chat_app/utils/text_style.dart';
import 'package:flutter/material.dart';

class LoginFields extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final FormFieldValidator<String>? validator;
  final bool obscureText;

  const LoginFields(
      {super.key,
      required this.controller,
      required this.validator,
      required this.hintText,
      required this.obscureText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (validator != null) return validator!(value);

        return null;
      },
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: ThemeTextStyle.hintStyle,
        border: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black)
        ),
      ),
      obscureText: obscureText,
    );
  }
}
