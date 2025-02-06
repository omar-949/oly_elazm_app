import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oly_elazm/core/helpers/app_size.dart';
import 'package:oly_elazm/core/theme/app_colors.dart';
import 'package:oly_elazm/core/theme/app_text_style.dart';

class RatingRow extends StatelessWidget {
  final double rating;
  final double progress;

  const RatingRow({
    Key? key,
    required this.rating,
    required this.progress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 15.w),
      child: Row(
        children: [
          SizedBox(width: AppSize.w8),
          Container(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(AppSize.r12),
              child: LinearProgressIndicator(
                value: progress,
                backgroundColor: AppColors.lightGrey,
                color: AppColors.yellow,
                minHeight: AppSize.h8,
              ),
            ),
            width: 197.w,
          ),
          SizedBox(width: AppSize.w5),
          Icon(Icons.star, color: AppColors.yellow, size: AppSize.w20),
          SizedBox(width: AppSize.w8),
          Text(
            rating.toStringAsFixed(1),
            style: AppTextStyle.font16Bold(),
          ),
        ],
      ),
    );
  }
}
