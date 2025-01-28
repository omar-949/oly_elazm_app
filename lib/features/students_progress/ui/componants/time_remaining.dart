import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oly_elazm/core/theme/app_colors.dart';
import 'package:oly_elazm/core/theme/app_text_style.dart';

class TimeRemaining extends StatelessWidget {
  const TimeRemaining({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
        vertical: 4.h,
      ),
      child: SizedBox(
        width: double.infinity,
        child: Text(
          'متبقي 3 ساعات و 45 دقيقة',
          style: AppTextStyle.font16Medium(
            color: AppColors.secondaryAppColor,
          ),
          textAlign: TextAlign.start,
        ),
      ),
    );
  }
}
