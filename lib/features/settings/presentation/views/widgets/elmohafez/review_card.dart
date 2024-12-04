import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oly_elazm/core/helpers/app_size.dart';
import 'package:oly_elazm/core/helpers/extentions.dart';
import 'package:oly_elazm/core/theme/app_colors.dart';
import 'package:oly_elazm/core/theme/app_text_style.dart';

class ReviewCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String date;
  final double rating;
  final String comment;

  const ReviewCard({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.date,
    required this.rating,
    required this.comment,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSize.w358,

      margin: EdgeInsets.all(8.h),
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.1),
            blurRadius: 6.r,
            offset: Offset(1, 1.h),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 25.r,
                backgroundImage: AssetImage(imageUrl),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 12.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          name,
                          style: AppTextStyle.font16SemiBold().copyWith(fontFamily: 'Roboto'),
                        ),

                      ],
                    ),
                    SizedBox(height: 5.h),
                  ],
                ),
              ),
            ],
          ),
          Row(
            children: [
              Row(
                children: List.generate(
                  5,
                      (index) => Icon(
                    index < rating ? Icons.star : Icons.star_border,
                    color: AppColors.yellow,
                    size: 18.r,
                  ),
                ),
              ),
              5.pw,
              Text(
                  date,
                  style: AppTextStyle.font16Regular()
              ),
            ],
          ),
          SizedBox(height: 5.h),
          // Comment Text
          Text(
            comment,
            style: AppTextStyle.font16Regular(color: AppColors.darkGrey),

          ),
        ],

      ),
    );
  }
}
