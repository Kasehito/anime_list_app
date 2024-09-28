import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  final VoidCallback onpressed;
  final TextStyle? textStyle;
  final Color? bgColor;
  final Color? fgColor;

  const MyButton({
    super.key,
    required this.text,
    required this.onpressed,
    this.textStyle,
    this.bgColor,
    this.fgColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onpressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: fgColor,
        backgroundColor: bgColor,
      ),
      child: Text(
        text,
        style: textStyle,
      ),
    );
  }
}
