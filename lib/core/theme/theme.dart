import 'package:event/core/color/AppColors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeManger {
  static ThemeData getLightTheme() => ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: Appcolors.scaffoldBackGround,
    fontFamily: GoogleFonts.poppins().fontFamily,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      titleTextStyle: TextStyle(
        color: Appcolors.mainText,
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
      backgroundColor: Colors.transparent,
      iconTheme: IconThemeData(color: Appcolors.mainText),
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(
        decoration: TextDecoration.underline,
        fontSize: 24,
        fontWeight: FontWeight.w700,
        color: Colors.red,
        fontFamily: 'Poppins',
      ),
      bodyLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: Appcolors.primary,
        fontFamily: 'Poppins',
      ),
      bodyMedium: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w700,
        color: Appcolors.primary,
        fontFamily: 'Poppins',
      ),

      bodySmall: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        fontFamily: 'Poppins',
      ),
      labelLarge: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 14,
        color: Appcolors.disable,
        fontFamily: 'Poppins',
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Appcolors.input,
      elevation: 0,
      selectedItemColor: Appcolors.primary,
      unselectedItemColor: Appcolors.secText,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
    )
  );

  static ThemeData getDarkTheme() => ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: Appcolors.darkScaffoldBackGround,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      titleTextStyle: TextStyle(
        color: Appcolors.darkMainText,
        fontSize: 24,
        fontWeight: FontWeight.w500,
      ),
      backgroundColor: Colors.transparent,
      iconTheme: IconThemeData(color: Appcolors.primary),
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(
        decoration: TextDecoration.underline,
        fontSize: 16,
        fontWeight: FontWeight.w700,
        color: Colors.red,
        fontFamily: 'Poppins',
      ),
      bodyLarge: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: Appcolors.primary,
        fontFamily: 'Poppins',
      ),
      bodyMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        decoration: TextDecoration.underline,
        color: Appcolors.primary,
        fontFamily: 'Poppins',
      ),

      bodySmall: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        fontFamily: 'Poppins',
      ),
      labelLarge: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 18,
        color: Appcolors.disable,
        fontFamily: 'Poppins',
      ),
    ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Appcolors.darkScaffoldBackGround,
        elevation: 0,
        selectedItemColor: Appcolors.darkPrimary,
        unselectedItemColor: Appcolors.secText,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
      )
  );
}
