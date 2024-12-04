import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oly_elazm/core/theme/app_colors.dart';
import 'package:oly_elazm/core/theme/app_text_style.dart';

class ResendVerificationCode extends StatelessWidget {
  const ResendVerificationCode({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: RichText(
        text: TextSpan(
          text: 'لم تستلم الرمز؟ ',
          style: AppTextStyle.font16Regular(color: AppColors.grey),
          children: [
            TextSpan(
              text: 'إعادة ارسال',
              style: AppTextStyle.font18Regular(
                color: AppColors.secondaryAppColor,
              ),
              recognizer: TapGestureRecognizer()..onTap = () {},
            ),
          ],
        ),
      ),
    );
  }
}
