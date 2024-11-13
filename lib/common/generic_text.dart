import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GenericText extends StatelessWidget {
  const GenericText({
    super.key,
    required this.text,
    this.textColor,
    this.fontSize,
    this.fontWeight,  this.textAlign,
  });
  final TextAlign ? textAlign;
  final String text;
  final Color? textColor;
  final double? fontSize;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign:textAlign?? TextAlign.center,
      style: GoogleFonts.lato(
          textStyle: TextStyle(
        color: textColor ?? Colors.black,
        fontSize: fontSize ?? 16,
        fontWeight: fontWeight ?? FontWeight.w400,
      )),
    );
  }
}
