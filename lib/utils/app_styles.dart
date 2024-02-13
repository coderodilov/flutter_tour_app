import 'dart:ui';

import 'package:flutter/src/painting/text_style.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyles{
  static TextStyle appCustomTextStyle(
      Color color,
      FontWeight? fontWeight,
      [double? fontSize = 14]
      )
  {
    return GoogleFonts.poppins(
      textStyle: TextStyle(
        color: color,
        fontWeight: fontWeight,
        fontSize: fontSize
      )
    );
  }
}