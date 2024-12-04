import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oly_elazm/core/theme/app_colors.dart';
import 'package:oly_elazm/core/theme/app_text_style.dart';

class LoginSignUpTabBar extends StatelessWidget {
  const LoginSignUpTabBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.offWhite,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: TabBar(
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: Colors.white,
        ),
        indicatorPadding: EdgeInsets.symmetric(
          vertical: 6.h,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 12.w,
        ),
        labelColor: AppColors.secondaryAppColor,
        labelStyle: AppTextStyle.font18SemiBold(),
        unselectedLabelStyle: AppTextStyle.font18Medium(),
        unselectedLabelColor: Colors.black,
        tabAlignment: TabAlignment.fill,
        tabs: const [
          Tab(
            text: 'تسجيل الدخول',
          ),
          Tab(
            text: 'إنشاء حساب',
          ),
        ],
      ),
    );
  }
}
