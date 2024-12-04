import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oly_elazm/core/theme/app_colors.dart';
import 'package:oly_elazm/core/theme/app_text_style.dart';
import 'package:oly_elazm/core/widgets/app_text_form.dart';

class AppFormItem extends StatelessWidget {
  const AppFormItem({
    super.key,
    required this.title,
    required this.hint,
    required this.controller,
    this.type,
    this.isPassword,
    this.validator,
    this.autoValidateMode,
    this.borderRadius,
    this.textStyle,
    this.suffix,
  });

  final String title;
  final String hint;
  final TextEditingController controller;
  final TextInputType? type;
  final bool? isPassword;
  final Function(String?)? validator;
  final AutovalidateMode? autoValidateMode;
  final double? borderRadius;
  final TextStyle? textStyle;
  final Widget? suffix;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: textStyle ?? AppTextStyle.font16Medium(),
        ),
        8.verticalSpace,
        AppTextField(
          hint: hint,
          controller: controller,
          fillColor: Colors.white,
          borderRadius: borderRadius ?? 10,
          enabledColor: AppColors.grey,
          textStyle: AppTextStyle.font16Regular(),
          focusColor: AppColors.secondaryAppColor,
          type: type,
          isPassword: isPassword,
          validator: validator ?? (value) {},
          autoValidateMode: autoValidateMode,
          suffix: suffix,
        ),
      ],
    );
  }
}
