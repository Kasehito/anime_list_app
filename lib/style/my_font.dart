import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyFonts {
  static TextStyle primaryFont(
      {double fontSize = 14,
      FontWeight fontWeight = FontWeight.normal,
      Color? color}) {
    return GoogleFonts.poppins(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
    );
  }
}
