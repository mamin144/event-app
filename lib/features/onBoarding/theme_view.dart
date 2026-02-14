import 'package:easy_localization/easy_localization.dart';
import 'package:event/core/color/AppColors.dart';
import 'package:event/core/gen/assets.gen.dart';
import 'package:event/core/routes/route_name.dart';
import 'package:event/core/widgets/CustomElevatedButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:provider/provider.dart';

import '../../core/providers/appSettingProvider.dart';

class ThemeView extends StatelessWidget {
  const ThemeView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final appSettingProvider = Provider.of<AppSettingProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Assets.images.logo.image(
          width: 145,
          height: 27,
          alignment: Alignment.center,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(child: Assets.images.themeViewImg.image(fit: BoxFit.cover)),
            SizedBox(height: 24),
            Text(
              'Personalize Your Experience',
              style: theme.textTheme.titleLarge!.copyWith(
                color: Appcolors.mainText,
                fontWeight: FontWeight.w600,
                fontSize: 20,
                decoration: TextDecoration.none,
              ),
            ),
            SizedBox(height: 8),
            Text(
              '''Choose your preferred theme and language to get started with a comfortable, tailored experience that suits your style.''',
              style: theme.textTheme.titleLarge!.copyWith(
                color: Appcolors.secText,
                fontWeight: FontWeight.w400,
                fontSize: 16,
                decoration: TextDecoration.none,
              ),
            ),
            SizedBox(height: 16),
            Column(
              children: [
                Row(
                  spacing: 8,
                  children: [
                    Expanded(
                      child: Text(
                        'Language',
                        style: theme.textTheme.bodyMedium!.copyWith(
                          color: Appcolors.primary,
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Bounceable(
                      onTap: () {
                        if (appSettingProvider.currentLanguage == 'ar') {
                          appSettingProvider.changeLanguage('en', context);
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 6,
                          horizontal: 16,
                        ),

                        decoration: BoxDecoration(
                          color: Appcolors.primary,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          'English',
                          style: theme.textTheme.titleLarge!.copyWith(
                            color: Appcolors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                    Bounceable(
                      onTap: () {
                        if (appSettingProvider.currentLanguage == 'en') {
                          appSettingProvider.changeLanguage('ar', context);
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 6,
                          horizontal: 16,
                        ),

                        decoration: BoxDecoration(
                          color: Appcolors.primary,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          'Arabic',
                          style: theme.textTheme.titleLarge!.copyWith(
                            color: Appcolors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  spacing: 8,
                  children: [
                    Expanded(
                      child: Text(
                        'Theme',
                        style: theme.textTheme.bodyMedium!.copyWith(
                          color: Appcolors.primary,
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Bounceable(
                      onTap: () {
                        if (appSettingProvider.currentTheme == ThemeMode.dark) {
                          appSettingProvider.ChangeTheme(ThemeMode.light);
                        } else {
                          appSettingProvider.ChangeTheme(ThemeMode.light);
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 6,
                          horizontal: 16,
                        ),

                        decoration: BoxDecoration(
                          color: Appcolors.primary,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(
                          Icons.sunny,
                          color: Appcolors.white,
                          size: 18,
                        ),
                      ),
                    ),

                    Bounceable(
                      onTap: () {
                        if (appSettingProvider.currentTheme ==
                            ThemeMode.light) {
                          appSettingProvider.ChangeTheme(ThemeMode.dark);
                        } else {
                          appSettingProvider.ChangeTheme(ThemeMode.dark);
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 6,
                          horizontal: 16,
                        ),

                        decoration: BoxDecoration(
                          color: Appcolors.primary,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(
                          Icons.dark_mode,
                          color: Appcolors.white,
                          size: 18,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                CustomElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, RouteName.onBoarding);
                  },
                  text: "Let's Start",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
