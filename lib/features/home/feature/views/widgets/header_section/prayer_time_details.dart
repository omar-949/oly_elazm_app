import 'package:flutter/material.dart';
import 'package:oly_elazm/core/theme/app_colors.dart';
import 'package:oly_elazm/core/theme/app_text_style.dart';

class PrayerTimeDetails extends StatelessWidget {
  const PrayerTimeDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'الفجر',
          style: AppTextStyle.font16SemiBold(
            color: AppColors.secondaryAppColor,
          ),
        ),
        Text(
          '04:39 ص',
          style: AppTextStyle.font14Medium(
            color: AppColors.mainAppColor,
          ),
        ),
        Text(
          '04:11:42-',
          style: AppTextStyle.font14Medium(
            color: AppColors.secondaryAppColor,
          ),
        ),
      ],
    );
  }
}
