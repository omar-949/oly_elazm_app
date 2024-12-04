import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oly_elazm/core/theme/app_colors.dart';
import 'package:percent_indicator/percent_indicator.dart';

class PercentBar extends StatelessWidget {
  const PercentBar({
    super.key,
    required this.percent,
  });

  final double percent;

  @override
  Widget build(BuildContext context) {
    return LinearPercentIndicator(
      lineHeight: 12.h,
      percent: percent,
      animation: true,
      alignment: MainAxisAlignment.end,
      animateFromLastPercent: true,
      isRTL: true,
      progressColor: AppColors.secondaryAppColor,
      backgroundColor: const Color(0xffD9D9D9),
      barRadius: Radius.circular(12.r),
    );
  }
}
