import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../helpers/app_size.dart';
import '../theme/app_colors.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController? controller;
  final Color? enabledColor, fillColor, hintColor, focusColor, controllerColor;
  final double? tPadding, hintSize, bPadding;
  final double? borderRadius;
  final TextInputType? type;
  final Function()? onTap;
  final dynamic Function(dynamic)? onFieldSubmitted;
  final Function(String)? onChanged;
  final bool? isPassword;
  final int? maxLine, hintMaxLine;
  final String? hint;
  final Widget? prefix;
  final Function(String?) validator;
  final Widget? suffix;
  final Function()? suffixPressed;
  final bool? isClickable;
  final bool? autocorrect, isFill;
  final TextStyle? textStyle;
  final FocusNode? focusNode;
  final TextAlign? textAlign;
  final FontWeight? fontWeight;
  final bool? enabled;
  final Function()? onEditingComplete;
  final List<TextInputFormatter>? inputFormatters;
  final AutovalidateMode? autoValidateMode;
  const AppTextField({
    super.key,
    this.borderRadius,
    this.maxLine,
    this.textAlign,
    this.controller,
    this.type,
    this.focusNode,
    this.onChanged,
    this.onFieldSubmitted,
    this.onTap,
    this.textStyle,
    this.isPassword,
    this.hint,
    this.prefix,
    this.suffix,
    this.suffixPressed,
    this.isClickable,
    this.autocorrect,
    this.focusColor,
    this.enabledColor,
    this.tPadding,
    this.enabled,
    this.isFill,
    this.inputFormatters,
    this.fillColor,
    this.hintColor,
    this.hintSize,
    this.bPadding,
    this.onEditingComplete,
    this.controllerColor,
    this.hintMaxLine,
    this.fontWeight,
    required this.validator, this.autoValidateMode,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onEditingComplete: onEditingComplete,
      cursorColor: AppColors.mainAppColor,
      autovalidateMode: autoValidateMode,
      style: TextStyle(
        color: controllerColor ?? AppColors.textColor,
        fontSize: 14.sp,
        fontWeight: fontWeight ?? FontWeight.w400,
      ),
      textAlign: textAlign ?? TextAlign.start,
      validator: (value) {
        return validator(value);
      },
      decoration: InputDecoration(
        errorMaxLines: 5,
        filled: isFill ?? true,
        isDense: true,
        fillColor: fillColor ?? AppColors.textFieldColor,
        errorStyle: TextStyle(fontSize: 10.sp, color: AppColors.errorColor),
        contentPadding: EdgeInsets.only(
          left: AppSize.w15,
          right: AppSize.w15,
          top: tPadding ?? AppSize.h10,
          bottom: bPadding ?? AppSize.h10,
        ),
        focusedBorder: (enabled == true)
            ? UnderlineInputBorder(
                borderSide: BorderSide(
                  color: focusColor ?? AppColors.mainAppColor,
                ),
              )
            : OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius ?? 5.r),
                borderSide: BorderSide(
                  color: focusColor ?? AppColors.mainAppColor,
                ),
              ),
        enabledBorder: (enabled == true)
            ? UnderlineInputBorder(
                borderSide: BorderSide(
                  color: enabledColor ?? Colors.transparent,
                ),
              )
            : OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius ?? 5.r),
                borderSide: BorderSide(
                  color: enabledColor ?? Colors.transparent,
                ),
              ),
        border: (enabled == true)
            ? const UnderlineInputBorder(
                borderSide: BorderSide(),
              )
            : OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius ?? 5.r),
                borderSide: const BorderSide(),
              ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 5.r),
          borderSide: BorderSide(color: AppColors.errorColor),
        ),
        hintText: hint,
        hintMaxLines: hintMaxLine ?? 500,
        hintStyle: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: hintSize ?? 12.sp,
          color: hintColor ?? AppColors.hintTextColor,
        ),
        prefixIcon: prefix,
        suffixIcon: suffix,
      ),
      controller: controller,
      keyboardType: type,
      obscureText: isPassword ?? false,
      enabled: isClickable ?? true,
      focusNode: focusNode,
      onTap: onTap,
      onFieldSubmitted: onFieldSubmitted,
      onChanged: onChanged,
      maxLines: isPassword == true ? 1 : maxLine,
      inputFormatters: inputFormatters,
    );
  }
}
