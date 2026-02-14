import 'package:flutter/material.dart';

import '../color/AppColors.dart';

class CustomTextFormField extends StatefulWidget {
  final TextEditingController? controller;
  final String hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool isPassword;
  final String? Function(String?)? validator;
  final int maxLines;
  final bool? enabled;

  const CustomTextFormField({
    super.key,
    this.controller,
    required this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.isPassword = false,
    this.validator,
    this.maxLines = 0,
    this.enabled = true,

  });

  @override
  _CustomTextFormField createState() => _CustomTextFormField();
}

class _CustomTextFormField extends State<CustomTextFormField> {
  late bool obscureText = false;


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: widget.enabled,
      maxLines: widget.maxLines == 0 ? null : widget.maxLines,
      controller: widget.controller,
      validator: widget.validator,
      style: Theme
          .of(context)
          .textTheme
          .bodyMedium
          ?.copyWith(
        color: Appcolors.secText,
        fontSize: 16,
        fontWeight: FontWeight.w500,
        fontFamily: 'Poppins',
      ),
      // autovalidateMode: AutovalidateMode.always,
      obscureText: widget.isPassword! ? obscureText : false,
      decoration: InputDecoration(

        prefixIconColor: Colors.black,
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.isPassword!
            ? IconButton(
          onPressed: () {
            setState(() {
              obscureText = !obscureText;
            });
          },
          icon: obscureText
              ? Icon(Icons.visibility)
              : Icon(Icons.visibility_off),
        )
            : null,
        // contentPadding: EdgeInsets.all(20),
        hintText: widget.hintText ?? '',
        hintStyle: Theme
            .of(context)
            .textTheme
            .labelLarge
            ?.copyWith(
          color: Appcolors.secText,
          fontWeight: FontWeight.w500,
          fontSize: 14,
        ),
        counterStyle: Theme
            .of(context)
            .textTheme
            .labelLarge
            ?.copyWith(
          color: Appcolors.secText,),

        fillColor: Appcolors.white,
        filled: true,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Appcolors.disable),
          borderRadius: BorderRadius.circular(16),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Appcolors.stroke),
          borderRadius: BorderRadius.circular(16),
        ),
        enabledBorder: OutlineInputBorder(

          borderSide: BorderSide(color: Appcolors.stroke),
          borderRadius: BorderRadius.circular(16),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Appcolors.stroke),
          borderRadius: BorderRadius.circular(16),

        ),

      ),
    );
  }
}
