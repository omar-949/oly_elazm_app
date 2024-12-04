import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppTheme {
  static ThemeData get lightThemeData => ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.mainAppColor),
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: false,
        fontFamily: 'Tajawal',
        textTheme: GoogleFonts.elMessiriTextTheme(),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0.0,
          centerTitle: true,
        ),
        dividerColor: AppColors.dividerAppColor,
        brightness: Brightness.light,
      ).copyWith(
          pageTransitionsTheme: const PageTransitionsTheme(
        builders: <TargetPlatform, PageTransitionsBuilder>{
          TargetPlatform.iOS: ZoomPageTransitionsBuilder(),
          TargetPlatform.android: ZoomPageTransitionsBuilder(),
        },
      ));
}
