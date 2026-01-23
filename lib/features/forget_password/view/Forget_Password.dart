import 'package:event/core/color/AppColors.dart';
import 'package:event/core/widgets/CustomElevatedButton.dart';
import 'package:event/core/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Forget Password')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Assets.images.forgetPassword.image(
              fit: BoxFit.cover,
              color: Appcolors.primary,
            ),
            SizedBox(height: 24),
            CustomElevatedButton(onPressed: () {}, text: 'Reset Password'),
          ],
        ),
      ),
    );
  }
}
