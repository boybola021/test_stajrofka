


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final String? helperText;
  final void Function(String)? onChanged;
  final TextEditingController controller;
  final Widget? prefixIcon;
  final Widget? prefix;
  final Widget? suffix;
  final TextInputType? keyboardType;
  final VoidCallback? onPressed;
  final void Function(String)? onSubmitted;
  final String hintText;
  final bool readOnly;
  final bool obscureText;
  final int? maxLine;
  final bool? isValid;
  final List<TextInputFormatter>? formatter;
  final double fontSize;
  final double hintFontSize;
  const CustomTextField({
    super.key,
    required this.controller,
    this.prefixIcon,
    this.prefix,
    this.keyboardType,
    this.onPressed,
    this.readOnly = false,
    required this.hintText,
    this.onSubmitted,
    this.suffix,
    this.obscureText = false,
    this.maxLine,
    this.helperText,
    this.onChanged,
    this.isValid,
    this.formatter,
    this.fontSize = 20,
    this.hintFontSize = 20,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onEditingComplete: () {
        FocusScope.of(context).nextFocus();
      },
      inputFormatters: formatter,
      textCapitalization: TextCapitalization.words,
      textInputAction: TextInputAction.next,
      onChanged: onChanged,
      maxLines: maxLine,
      onSubmitted: onSubmitted,
      obscureText: obscureText,
      readOnly: readOnly,
      controller: controller,
      onTap: onPressed,
      keyboardType: keyboardType,
      style:  TextStyle(fontSize: fontSize,fontFamily: "Mulish"),
      decoration: InputDecoration(
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: Colors.black,width: 1.5)
        ),
        helperText: helperText,
        helperStyle: const TextStyle(color: Colors.red,),
        prefixIcon: prefixIcon,
        prefix: prefix,
        suffixIcon: suffix,
        fillColor: Colors.white10,
        hintText: hintText,
        hintStyle: TextStyle(fontSize: hintFontSize),
        filled: true,
      ),
    );
  }
}