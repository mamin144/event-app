import 'package:event/core/color/AppColors.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final void Function()? onPressed;
  final Widget? child;
  final String? text;
  final Color? backGroundColor;

  const CustomElevatedButton({
    super.key,
    required this.onPressed,
    this.child,
    this.text,
    this.backGroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: backGroundColor ?? Appcolors.primary,
          alignment: Alignment.center,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(color: Appcolors.stroke),
          ),
          // ro(
          //
          //   side: BorderSide(
          //            color: Appcolors.grey,
          //
          //          ),
          // ),
          // WidgetStatePropertyAll(
          //
          //   RoundedRectangleBorder(
          //     borderRadius: BorderRadius.circular(16),
          //     side: const BorderSide(
          //       color: Appcolors.primary,
          //       width: 2,
          //     ),
          //   ),
          // ),
          // padding: EdgeInsets.all(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child:
              child ??
              Text(
                text!,
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: Appcolors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
                // TextStyle(
                //   fontSize: 24,
                //   fontWeight: FontWeight.w500,
                //   color: Appcolors.white,
                // ),
              ),
        ),
      ),
    );
  }
}
