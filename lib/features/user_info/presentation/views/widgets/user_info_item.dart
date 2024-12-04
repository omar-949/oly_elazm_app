import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oly_elazm/core/theme/app_colors.dart';
import 'package:oly_elazm/core/theme/app_text_style.dart';

class UserInfoItem extends StatelessWidget {
  const UserInfoItem({
    super.key,
    required this.image,
    required this.info,
    required this.isSelected,
  });

  final String image;
  final String info;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 130.h,
          width: 130.w,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isSelected ? AppColors.secondaryAppColor : Colors.transparent,
            border: Border.all(
              color: isSelected ? AppColors.secondaryAppColor : Colors.transparent,
              width: 3.0, // Adjust border width
            ),
          ),
          child: Image.asset(
            image,
            height: 120.h,
            width: 120.w,
          ),
        ),
        8.verticalSpace,
        Text(
          info,
          style: AppTextStyle.font16Medium(
            color: const Color(0xff5F5F5F),
          ),
        ),
      ],
    );
  }
}
