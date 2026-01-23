import 'package:event/core/color/AppColors.dart';
import 'package:event/core/routes/route_name.dart';
import 'package:event/core/widgets/CustomElevatedButton.dart';
import 'package:event/core/widgets/textFormField.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import '../../../core/gen/assets.gen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController(text: 'mahmoud@gmail.com');
  final passwordController = TextEditingController(text: 'Mahmouda14');

  // @override
  // void dispose() {
  //   emailController.dispose();
  //   passwordController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: Appcolors.scaffoldBackGround,
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: Center(
                  child: Assets.images.logo.image(
                    width: 180,
                    height: 130,
                    alignment: Alignment.center,
                  ),
                ),
              ),

              Text(
                'Login to your account',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: Appcolors.primary,
                  fontSize: 24,
                  fontFamily: 'Poppins',
                ),
              ),

              SizedBox(height: 24),
              CustomTextFormField(
                controller: emailController,
                hintText: 'email'.tr(),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email address.';
                  }
                  if (!value.contains('@')) {
                    return 'An email address must contain an "@" symbol.';
                  }
                  // A final check with a simpler regex for general validity
                  if (!RegExp(
                    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
                  ).hasMatch(value)) {
                    return 'Please enter a valid email address.';
                  }
                  return null;
                },
                isPassword: false,
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: (Assets.icons.sms.svg(height: 20, width: 20)),
                ),
              ),
              SizedBox(height: 24),
              CustomTextFormField(
                controller: passwordController,
                hintText: 'password'.tr(),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a password.';
                  }
                  if (value.length < 8) {
                    return 'Password is too short (minimum 8 characters).';
                  }
                  if (!RegExp(r'(?=.*[A-Z])').hasMatch(value)) {
                    return 'Password needs at least one uppercase letter (A-Z).';
                  }
                  if (!RegExp(r'(?=.*[a-z])').hasMatch(value)) {
                    return 'Password needs at least one lowercase letter (a-z).';
                  }
                  if (!RegExp(r'(?=.*\d)').hasMatch(value)) {
                    return 'Password needs at least one number (0-9).';
                  }

                  return null;
                },
                isPassword: true,
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Assets.icons.lock.svg(height: 20, width: 20),
                ),
                suffixIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Assets.icons.eyeSlash.svg(),
                ),
              ),
              SizedBox(height: 12),
              Bounceable(
                onTap: () =>
                    Navigator.pushNamed(context, RouteName.forgetPassword),

                child: Text(
                  'forgetPassword'.tr(),
                  textAlign: TextAlign.end,
                  style: theme.textTheme.bodySmall?.copyWith(
                    fontFamily: 'Poppins',
                    color: Appcolors.primary,
                    decoration: TextDecoration.underline,
                    decorationColor: Appcolors.primary,
                    decorationThickness: 2,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(height: 35),
              CustomElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {

                    Navigator.pushNamed(context, RouteName.layout);
                  }
                },
                text: 'login'.tr(),
              ),
              SizedBox(height: 35),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'dontHaveAnAccount'.tr(),
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
                            Navigator.pushNamed(context, RouteName.signup),
                        child: Text(
                          'createAccount'.tr(),
                          textAlign: TextAlign.center,
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Icon(Assets.ico)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Assets.images.google.image(width: 24, height: 24),
                    ),
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

              // LanguageRow(),
            ],
          ),
        ),
      ),
    );
  }
}
