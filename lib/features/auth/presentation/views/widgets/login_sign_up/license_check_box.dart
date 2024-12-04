import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oly_elazm/core/theme/app_colors.dart';
import 'package:oly_elazm/core/theme/app_text_style.dart';

class LicenseCheckBox extends StatefulWidget {
  const LicenseCheckBox({
    super.key,
  });

  @override
  State<LicenseCheckBox> createState() => _LicenseCheckBoxState();
}

class _LicenseCheckBoxState extends State<LicenseCheckBox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 24.h,
          width: 24.w,
          child: Checkbox(
            value: isChecked,
            onChanged: (value) {
              setState(() {
                isChecked = value ?? false;
              });
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.r),
            ),
            side: const BorderSide(
              color: Color(0xff777777),
            ),
            activeColor: AppColors.secondaryAppColor,
            splashRadius: 0,
          ),
        ),
        8.horizontalSpace,
        SizedBox(
          width: 300.w,
          child: RichText(
            text: TextSpan(
              text: 'أوافق على ',
              style: AppTextStyle.font16Regular(color: AppColors.grey),
              children: [
                TextSpan(
                  text: 'شروط خدمة المنصة',
                  style: AppTextStyle.font16Regular(
                    color: AppColors.secondaryAppColor,
                  ),
                  recognizer: TapGestureRecognizer()..onTap = () {},
                ),
                const TextSpan(
                  text: ' و ',
                ),
                TextSpan(
                  text: 'سياسة الخصوصية',
                  style: AppTextStyle.font16Regular(
                    color: AppColors.secondaryAppColor,
                  ),
                  recognizer: TapGestureRecognizer()..onTap = () {},
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
