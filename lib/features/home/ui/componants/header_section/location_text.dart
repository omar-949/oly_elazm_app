import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oly_elazm/core/theme/app_text_style.dart';

class LocationText extends StatelessWidget {
  const LocationText({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 24.w,
      bottom: 20.h,
      child: Text(
        'الزقازيق , السلام',
        style: AppTextStyle.font16Medium(
          color: Colors.white,
        ),
      ),
    );
  }
}
