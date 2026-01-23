import 'package:flutter/material.dart';

import '../color/AppColors.dart';

class CustomTextFormField extends StatefulWidget {
  final TextEditingController? controller;
  final String hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool? isPassword;
  final String? Function(String?)? validator;

  const CustomTextFormField({
    super.key,
    this.controller,
    required this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.isPassword,
    this.validator
  });

  @override
  _CustomTextFormField createState() => _CustomTextFormField();
}

class _CustomTextFormField extends State<CustomTextFormField> {
  late bool obscureText = false;


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: widget.validator,
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
        color: Appcolors.secText,        // لون الكلام
        fontSize: 16,                     // حجم الخط
        fontWeight: FontWeight.w500,      // سمك الخط
        fontFamily: 'Poppins',           // نوع الخط (اختياري)
      ),
      autovalidateMode: AutovalidateMode.always,
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
        hintText: widget.hintText,
        hintStyle: Theme
            .of(context)
            .textTheme
            .labelLarge
            ?.copyWith(
          color: Appcolors.secText,
          fontWeight: FontWeight.w500,
          fontSize: 14,
        ),
        counterStyle: Theme.of(context).textTheme.labelLarge?.copyWith(
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
