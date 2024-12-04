import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oly_elazm/core/helpers/font_weight_helper.dart';

class AppTextStyle {
  static TextStyle style({
    required double textSize,
    required Color textColor,
    required FontWeight textWeight,
    TextDecoration decoration = TextDecoration.none,
  }) {
    return TextStyle(
      fontSize: textSize,
      color: textColor,
      fontWeight: textWeight,
      fontFamily: 'ElMessiri', // Add the font family here
      decoration: decoration,
    );
  }

  static TextStyle font40SemiBold({Color? color = Colors.black}) => TextStyle(
    color: color,
    fontFamily: 'ElMessiri',
    fontSize: 40.sp,
    fontWeight: FontWeightHelper.semiBold,
  );
  static TextStyle font32SemiBold({Color? color = Colors.black}) => TextStyle(
    fontSize: 32.sp,
    color: color,
    fontWeight: FontWeightHelper.semiBold,
    fontFamily: 'ElMessiri',
  );

  static TextStyle font32Bold({Color? color = Colors.black}) => TextStyle(
    fontSize: 32.sp,
    color: color,
    fontWeight: FontWeightHelper.bold,
    fontFamily: 'ElMessiri',
  );

  static TextStyle font18SemiBold({Color? color = Colors.black}) => TextStyle(
    fontSize: 18.sp,
    color: color,
    fontWeight: FontWeightHelper.semiBold,
    fontFamily: 'ElMessiri',
  );

  static TextStyle font16SemiBold({Color? color = Colors.black}) => TextStyle(
    fontSize: 16.sp,
    color: color,
    fontWeight: FontWeightHelper.semiBold,
    fontFamily: 'ElMessiri',
  );

  static TextStyle font16Medium({Color? color = Colors.black}) => TextStyle(
    fontSize: 16.sp,
    color: color,
    fontWeight: FontWeightHelper.medium,
    fontFamily: 'ElMessiri',
  );

  static TextStyle font18Medium({Color? color = Colors.black}) => TextStyle(
    fontSize: 18.sp,
    color: color,
    fontWeight: FontWeightHelper.medium,
    fontFamily: 'ElMessiri',
  );

  static TextStyle font18Regular({Color? color = Colors.black}) => TextStyle(
    fontSize: 18.sp,
    color: color,
    fontWeight: FontWeightHelper.regular,
    fontFamily: 'ElMessiri',
  );

  static TextStyle font16Regular({Color? color = Colors.black}) => TextStyle(
    fontSize: 16.sp,
    color: color,
    fontWeight: FontWeightHelper.regular,
    fontFamily: 'ElMessiri',
  );

  static TextStyle font12Regular({Color? color = Colors.black}) => TextStyle(
    fontSize: 12.sp,
    color: color,
    fontWeight: FontWeightHelper.regular,
    fontFamily: 'ElMessiri',
  );

  static TextStyle font14Regular({Color? color = Colors.black}) => TextStyle(
    fontSize: 14.sp,
    color: color,
    fontWeight: FontWeightHelper.regular,
    fontFamily: 'ElMessiri',
  );

  static TextStyle font14Medium({Color? color = Colors.black}) => TextStyle(
    fontSize: 14.sp,
    color: color,
    fontWeight: FontWeightHelper.medium,
    fontFamily: 'ElMessiri',
  );

  static TextStyle font20Regular({Color? color = Colors.black}) => TextStyle(
    fontSize: 20.sp,
    color: color,
    fontWeight: FontWeightHelper.regular,
    fontFamily: 'ElMessiri',
  );

  static TextStyle font20SemiBold({Color? color = Colors.black}) => TextStyle(
    fontSize: 20.sp,
    color: color,
    fontWeight: FontWeightHelper.semiBold,
    fontFamily: 'ElMessiri',
  );

  static TextStyle font20Medium({Color? color = Colors.black}) => TextStyle(
    fontSize: 20.sp,
    color: color,
    fontWeight: FontWeightHelper.medium,
    fontFamily: 'ElMessiri',
  );

  static TextStyle font24Regular({Color? color = Colors.black}) => TextStyle(
    fontSize: 24.sp,
    color: color,
    fontWeight: FontWeightHelper.regular,
    fontFamily: 'ElMessiri',
  );

  static TextStyle font24Bold({Color? color = Colors.black}) => TextStyle(
    fontSize: 24.sp,
    color: color,
    fontWeight: FontWeightHelper.bold,
    fontFamily: 'ElMessiri',
  );

  static TextStyle font18Bold({Color? color = Colors.black}) => TextStyle(
    fontSize: 18.sp,
    color: color,
    fontWeight: FontWeightHelper.bold,
    fontFamily: 'ElMessiri',
  );

  static TextStyle font16Bold({Color? color = Colors.black}) => TextStyle(
    fontSize: 16.sp,
    color: color,
    fontWeight: FontWeightHelper.bold,
    fontFamily: 'ElMessiri',
  );
  static TextStyle font50Regular({Color? color = Colors.black}) => TextStyle(
    fontSize: 50.sp,
    color: color,
    fontWeight: FontWeightHelper.regular,
    fontFamily: 'ElMessiri',
  );
}
