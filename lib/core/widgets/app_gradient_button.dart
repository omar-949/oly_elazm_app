import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oly_elazm/core/theme/app_colors.dart';
import 'package:oly_elazm/core/theme/app_text_style.dart';

class CustomAppButton extends StatelessWidget {
  const CustomAppButton({
    super.key,
    required this.onTap,
    required this.title,
    this.width,
    this.height,
    this.gradientColors,
    this.gradientStops,
    this.isRadial = false,
  });

  final void Function() onTap;
  final String title;
  final double? width;
  final double? height;
  final Gradient? gradientColors;
  final List<double>? gradientStops;
  final bool isRadial;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width ?? 323.w,
        height: height ?? 46.h,
        decoration: BoxDecoration(
          gradient: isRadial
              ? AppColors.radialOverlay
              :AppColors.goldToBrown,
          borderRadius: BorderRadius.circular(30.r),
        ),
        child: Center(
          child: Text(
            title,
            style: AppTextStyle.font18SemiBold(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
