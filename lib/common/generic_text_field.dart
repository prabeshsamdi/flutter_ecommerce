import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



class GenericTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final bool isSecureText;
  final IconData? sufficIcon;
  final VoidCallback? onCLickSufficIcon;
  final String? keyboardTypeNumber;
  final bool? readOnly;
  final bool? hasBorder;
  final Color? bgColor;

  const GenericTextField({
    super.key,
    required this.controller,
    required this.labelText,
    required this.hintText,
    required this.isSecureText,
    this.sufficIcon,
    this.onCLickSufficIcon,
    this.keyboardTypeNumber,
    this.readOnly,
    this.hasBorder = true,
    this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: readOnly ?? false,
      obscureText: isSecureText,
      controller: controller,
      keyboardType: keyboardTypeNumber?.toString() == 'yes'
          ? TextInputType.number
          : TextInputType.text,
      decoration: InputDecoration(
        filled: bgColor != null, // Fill background if bgColor is provided
        fillColor: bgColor ?? Colors.transparent, // Set background color
        labelStyle:
            GoogleFonts.inter(textStyle: const TextStyle(color: Colors.grey)),
        suffixIcon: IconButton(
          onPressed: onCLickSufficIcon,
          icon: Icon(sufficIcon),
        ),
        labelText: labelText,
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.grey),
        border: hasBorder == true
            ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
                borderSide: const BorderSide(width: 0.5, color: Colors.red),
              )
            : InputBorder.none, // No border if hasBorder is false
        focusedBorder: hasBorder == true
            ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
                borderSide: const BorderSide(
                  color: Colors.grey,
                  width: 1.0,
                ),
              )
            : InputBorder.none, // No focused border if hasBorder is false
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "$hintText is required!";
        }

       

        return null; // Return null if the input is valid
      },
    );
  }
}
