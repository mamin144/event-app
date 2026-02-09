import 'package:event/core/color/AppColors.dart';
import 'package:event/core/gen/assets.gen.dart';
import 'package:event/core/routes/route_name.dart';
import 'package:event/features/Home/view/homeView.dart';
import 'package:event/features/favourite/view/favorite_view.dart';
import 'package:event/features/login/ui/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:provider/provider.dart';

import '../../../core/providers/appSettingProvider.dart';

class LayoutView extends StatelessWidget {
  const LayoutView({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [HomeView(), FavoriteView(), HomeView()];
    final theme = Theme.of(context);
    final appSettingProvider = Provider.of<AppSettingProvider>(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),
        elevation: 0,
        // hoverColor: Appcolors.disable,
        backgroundColor: Appcolors.primary,
        onPressed: () {
          Navigator.pushNamed(context,RouteName.addEvent);
        },
        child:  Icon(Icons.add,color:  Appcolors.white,),

      ),
      appBar: AppBar(
        toolbarHeight: 60,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              spacing: 8,
              children: [
                Expanded(
                  child: Text(
                    'Welcome Back ✨',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: Appcolors.secText,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
                Bounceable(
                  onTap: () {
                    if (appSettingProvider.currentTheme == ThemeMode.dark) {
                      appSettingProvider.ChangeTheme(ThemeMode.light);
                    } else {
                      appSettingProvider.ChangeTheme(ThemeMode.dark);
                    }
                  },
                  child: Assets.icons.sun.svg(),
                ),
                Bounceable(
                  onTap: () {
                    if (appSettingProvider.currentLanguage == 'en') {
                      appSettingProvider.changeLanguage('ar', context);
                    } else {
                      appSettingProvider.changeLanguage('en', context);
                    }
                  },
                  child: Container(
                    // margin: EdgeInsets.all(8),
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Appcolors.primary,
                      borderRadius: BorderRadius.circular(8),
                      // border: Border.all(color: Appcolors.stroke, width: 2),
                    ),
                    child: Text(
                      appSettingProvider.currentLanguage.toUpperCase(),
                      style: theme.textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: Appcolors.white,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Text(
              'John Safwat',
              style: theme.textTheme.bodyLarge?.copyWith(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Appcolors.mainText,
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        child: BottomNavigationBar(
          currentIndex: appSettingProvider.currentIndex,
          onTap: (index) {
            appSettingProvider.ChangeIndex(index);
          },
          elevation: 0,

          items: [
            BottomNavigationBarItem(
              icon: Assets.icons.inActiveHome.svg(),
              activeIcon: Assets.icons.activeHome.svg(),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Assets.icons.inActiveFavorite.svg(),
              activeIcon: Assets.icons.activeFavorite.svg(),
              label: 'Favorite',
            ),
            BottomNavigationBarItem(
              icon: Assets.icons.inActiveProfile.svg(),
              activeIcon: Assets.icons.activeProfile.svg(),
              label: 'Profile',
            ),
          ],
        ),
      ),
      body: screens[appSettingProvider.currentIndex],
    );
  }
}
