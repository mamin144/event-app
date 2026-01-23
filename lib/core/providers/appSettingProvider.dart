import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class AppSettingProvider extends ChangeNotifier{
  String currentLanguage = 'en';

  void changeLanguage(String newLanguage, BuildContext context){
    if(currentLanguage == newLanguage) return;
    currentLanguage = newLanguage;
    context.setLocale(Locale(newLanguage));
    notifyListeners();
  }

  ThemeMode currentTheme = ThemeMode.light;
  void ChangeTheme(ThemeMode theme){
    currentTheme = theme;
    notifyListeners();
  }

  int currentIndex=0;
  void ChangeIndex(int index){
    currentIndex = index;
    notifyListeners();
  }
}



