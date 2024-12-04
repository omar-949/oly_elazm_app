import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oly_elazm/core/theme/app_colors.dart';
import 'package:oly_elazm/core/widgets/app_gradient_button.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        150.horizontalSpace,
        CustomAppButton(
          onTap: () {

          },
          title: 'تسجيل الخروج',
          width: 195.w,
          height: 46.h,
          isRadial: true,
          gradientColors: AppColors.radialOverlay,
        ),
      ],
    );
  }
}
