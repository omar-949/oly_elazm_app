import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oly_elazm/core/theme/app_colors.dart';
import 'package:oly_elazm/core/theme/app_text_style.dart';
import 'package:oly_elazm/core/widgets/curved_background_with_image.dart';

class InfoHeaderSection extends StatelessWidget {
  final String studentName;
  final String? userType;
  final String? imagePath;

  const InfoHeaderSection({
    super.key,
    required this.studentName,
    this.userType,
    this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CurvedBackgroundWithImage(
          imagePath: imagePath,
        ),
        SizedBox(height: 15.h),
        Text(
          studentName,
          style: AppTextStyle.font20SemiBold(),
        ),
        if (userType != null) ...[
          SizedBox(height: 2.h),
          Text(
              userType!,
              style: AppTextStyle.font16Medium(color: AppColors.darkGrey)
          ),
        ],
      ],
    );
  }
}
