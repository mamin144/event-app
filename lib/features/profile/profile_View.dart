import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:event/core/color/AppColors.dart';
import 'package:event/core/gen/assets.gen.dart';
import 'package:event/core/routes/route_name.dart';
import 'package:event/features/profile/widegts/custom_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:provider/provider.dart';
import 'package:switcher/core/switcher_size.dart';
import 'package:switcher/switcher.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../../core/providers/appSettingProvider.dart';
import '../signup/provideres/auth_provider.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    final appSettingProvider = Provider.of<AppSettingProvider>(context);
    final authProvider = context.watch<AuthProvider>();

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: CircleAvatar(
                backgroundColor: Appcolors.white,
                radius: 80,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Assets.images.logo.image(),
                ),
              ),
            ),
            SizedBox(height: 10),
            Text(
              authProvider.userName,
              style: theme.textTheme.titleLarge!.copyWith(
                color: Appcolors.mainText,
                decoration: TextDecoration.none,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 4),
            Text(
              authProvider.email,
              style: theme.textTheme.bodySmall!.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Appcolors.secText,
              ),
            ),
            SizedBox(height: 16),

            CustomContainer(text: 'Dark Mode'),
            Bounceable(
              onTap: () {
                showModalBottomSheet(
                  builder: (context) => Container(
                    decoration: BoxDecoration(
                      color: Appcolors.scaffoldBackGround,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(16),
                        topLeft: Radius.circular(16),
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,

                      children: [
                        Bounceable(
                          onTap: () {
                            setState(() {
                              if (appSettingProvider.currentLanguage == 'en') {
                                appSettingProvider.changeLanguage(
                                  'ar',
                                  context,
                                );
                              } else {
                                appSettingProvider.changeLanguage(
                                  'en',
                                  context,
                                );
                              }
                            });
                            Navigator.pop(context);
                          },
                          child: CustomContainer(
                            text: 'English',
                            icon: Icon(Icons.arrow_forward_ios_outlined),
                          ),
                        ),
                        Bounceable(
                          onTap: () {
                            setState(() {
                              if (appSettingProvider.currentLanguage == 'en') {
                                appSettingProvider.changeLanguage(
                                  'ar',
                                  context,
                                );
                              } else {
                                appSettingProvider.changeLanguage(
                                  'en',
                                  context,
                                );
                              }
                              Navigator.pop(context);
                            });
                          },
                          child: CustomContainer(
                            text: 'Arabic',
                            icon: Icon(Icons.arrow_forward_ios_outlined),
                          ),
                        ),
                      ],
                    ),
                  ),
                  isScrollControlled: false,
                  context: context,
                );
              },

              child: CustomContainer(
                text: 'Language',
                icon: Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: Appcolors.primary,
                ),
              ),
            ),
            Bounceable(
              onTap: () {
                authProvider.logout();
                Navigator.pushReplacementNamed(context, RouteName.login);
              },
              child: CustomContainer(
                text: 'Logout',
                icon: Icon(Icons.logout_outlined, color: Appcolors.error),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
