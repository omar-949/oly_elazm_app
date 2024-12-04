import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oly_elazm/core/helpers/font_weight_helper.dart';
import 'package:oly_elazm/core/theme/app_colors.dart';
import 'package:oly_elazm/core/widgets/app_button.dart';

class OnboardingActionButtons extends StatelessWidget {
  final VoidCallback onSkip;
  final VoidCallback onContinue;

  const OnboardingActionButtons({
    super.key,
    required this.onSkip,
    required this.onContinue,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: AppButton(
            title: 'متابعة',
            background: Colors.white,
            height: 43.h,
            width: 156.w,
            elevation: 0,
            radius: 30.r,
            textColor: AppColors.secondaryAppColor,
            borderColor: AppColors.secondaryAppColor,
            fontSize: 20.sp,
            fontWeight: FontWeightHelper.regular,
            onTap: onContinue,
          ),
        ),
        10.horizontalSpace,
        Expanded(
          child: AppButton(
            title: 'تخطي',
            background: Colors.transparent,
            height: 43.h,
            width: 156.w,
            elevation: 0,
            radius: 30.r,
            textColor: AppColors.grey,
            borderColor: AppColors.grey,
            fontSize: 20.sp,
            fontWeight: FontWeightHelper.regular,
            onTap: onSkip,
          ),
        ),
      ],
    );
  }
}
