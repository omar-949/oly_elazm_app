import 'package:flutter/material.dart';

class AppColors {
  // Solid Colors
  static Color get mainAppColor => const Color(0xFF522700);
  static Color get secondaryAppColor => const Color(0xffA85000);
  static Color get grey => const Color(0xFF777777);
  static Color get textFieldColor => const Color(0xFFf5f5f5);
  static Color get textColor => const Color(0xFF505050);
  static Color get hintTextColor => const Color(0xFFC2C2C2);
  static Color get dividerAppColor => const Color(0xFF818181).withOpacity(0.4);
  static Color get errorColor => const Color(0xFFBA0000);
  static Color get successColor => const Color(0xff116530);
  static Color get offWhite => const Color(0xffEDEEEF);
  static Color get black => const Color(0xFF000000);
  static Color get white => const Color(0xFFFFFFFF);
  static Color get gold => const Color(0xFFFFD700);
  static Color get lightGrey => const Color(0xFFD9D9D9);
  static Color get beige => const Color(0xFFFAF6EB);
  static Color get darkGrey => const Color(0xFF474747);
  static Color get ashGrey => const Color(0xFFD4D6D8);
  static Color get errorLight => const Color(0xFFED4C5C);
  static Color get softWhite => const Color(0xFFFAFAFA);
  static const Color darkSlate = Color(0xFF2E2828);
  static const Color yellow = Color(0xFFFFD700);


  // Gradients
  static Gradient get goldToBrown => const LinearGradient(
    colors: [Color(0xFFA85000), Color(0xFF522700)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static Gradient get purpleToLavender => const LinearGradient(
    colors: [Color(0xFF5C649D), Color(0xFF9884BB)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static Gradient get lightOverlay =>  LinearGradient(
    colors: [Color(0xFFFFFFFF).withOpacity(0.2), Color(0xFF000000).withOpacity(0.2)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static Gradient get radialOverlay =>  RadialGradient(
    colors: [
      Color(0xFFA85000).withOpacity(0.8),
      Color(0xFF522700).withOpacity(0.8),
    ],
    center: Alignment.topLeft,
    radius: 1.0,
  );
}
