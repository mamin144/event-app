import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:provider/provider.dart';
import '../../../core/color/AppColors.dart';
import '../../../core/routes/route_name.dart';
import '../../../core/widgets/CustomElevatedButton.dart';
import '../../../core/widgets/textFormField.dart';
import '../../../core/gen/assets.gen.dart';
import '../provideres/auth_provider.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final nameController = TextEditingController();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final rePasswordController = TextEditingController();
    return Scaffold(
      // backgroundColor: Appcolors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Container(
                child: Assets.images.logo.image(
                  width: 180,
                  height: 130,
                  alignment: Alignment.center,
                ),
              ),
            ),

            Text(
              'Create your account',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.w700,
                color: Appcolors.primary,
                fontSize: 24,
                fontFamily: 'Poppins',
              ),
            ),
            SizedBox(height: 16),
            CustomTextFormField(
              controller: nameController,
              hintText: 'name'.tr(),
              isPassword: false,
              prefixIcon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: (Assets.icons.inActiveProfile.svg()),
              ),
            ),
            SizedBox(height: 16),
            CustomTextFormField(
              hintText: 'email'.tr(),
              controller: emailController,
              isPassword: false,
              prefixIcon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: (Assets.icons.sms.svg()),
              ),
            ),
            SizedBox(height: 16),
            CustomTextFormField(
              hintText: 'password'.tr(),
              controller: passwordController,
              isPassword: true,
              prefixIcon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Assets.icons.lock.svg(),
              ),
              suffixIcon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Assets.icons.eyeSlash.svg(),
              ),
            ),
            SizedBox(height: 16),
            CustomTextFormField(
              hintText: 'rePassword'.tr(),
              controller: rePasswordController,
              isPassword: true,
              prefixIcon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Assets.icons.lock.svg(),
              ),
              suffixIcon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Assets.icons.eyeSlash.svg(),
              ),
            ),
            SizedBox(height: 24),

            CustomElevatedButton(
              onPressed: () async {
                if (passwordController.text != rePasswordController.text) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Passwords do not match')),
                  );
                  return;
                }

                await context.read<AuthProvider>().register(
                  name: nameController.text,
                  email: emailController.text,
                  password: passwordController.text,
                );

                if (context.read<AuthProvider>().errorMessage == null) {
                  Navigator.pushReplacementNamed(context, RouteName.login);
                }
              },
              text: 'createAccount'.tr(),
            ),
            SizedBox(height: 15),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'alreadyHaveAnAccount'.tr(),
                    style: theme.textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      fontFamily: 'poppins',
                      color: Appcolors.secText,
                    ),
                  ),
                  WidgetSpan(
                    child: Bounceable(
                      onTap: () =>
                          Navigator.pushNamed(context, RouteName.login),
                      child: Text(
                        'login'.tr(),
                        // onEnter:
                        style: theme.textTheme.bodySmall?.copyWith(
                          fontFamily: 'poppins',
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                          decoration: TextDecoration.underline,
                          decorationColor: Appcolors.primary,
                          decorationThickness: 2,
                          color: Appcolors.primary,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: Divider(
                    color: Appcolors.stroke,
                    endIndent: 20,
                    indent: 20,
                    thickness: 2,
                  ),
                ),
                Text(
                  'or'.tr(),
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Appcolors.primary,
                    decoration: TextDecoration.underline,
                  ),
                ),
                Expanded(
                  child: Divider(
                    color: Appcolors.stroke,
                    endIndent: 20,
                    indent: 20,
                    thickness: 2,
                  ),
                ),
              ],
            ),
            SizedBox(height: 24),
            CustomElevatedButton(
              onPressed: () => {},
              backGroundColor: Colors.white,
              child: Row(
                spacing: 15,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Icon(Assets.ico)
                  Assets.images.google.image(width: 24, height: 24),
                  Text(
                    'loginWithGoogle'.tr(),
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
