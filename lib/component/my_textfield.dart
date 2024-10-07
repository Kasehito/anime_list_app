import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final bool? obscureText;
  final TextStyle? textStyle;
  final ValueChanged<String>? onChanged;
  final Icon? prefixIcon;

  const MyTextField(
      {super.key,
      required this.hintText,
      required this.controller,
      this.obscureText,
      this.textStyle,
      this.onChanged,
      this.prefixIcon});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      style: textStyle,
      onChanged: onChanged,
    );
  }
}
