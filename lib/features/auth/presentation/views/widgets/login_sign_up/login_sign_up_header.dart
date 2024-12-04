import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oly_elazm/core/theme/app_colors.dart';
import 'package:oly_elazm/core/theme/app_text_style.dart';
import 'package:oly_elazm/features/auth/presentation/views/widgets/login_sign_up/gradient_text.dart';

class LoginSignUpHeader extends StatelessWidget {
  const LoginSignUpHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        20.verticalSpace,
        GradientText(
          'أولي العزم',
          gradient: const LinearGradient(
            colors: [
              Color(0xFFA85000),
              Color(0xFF522700),
            ],
            stops: [0.2, 1.0],
          ),
          style: AppTextStyle.font32Bold(),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 12.h),
          child: Text(
            'قم بتسجيل الدخول أو إنشاء حساب جدبد لحفظ تقدمك',
            style: AppTextStyle.font16Medium(color: AppColors.grey),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
