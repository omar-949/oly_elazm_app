import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oly_elazm/core/theme/app_colors.dart';
import 'package:oly_elazm/core/theme/app_text_style.dart';

class StudentRating extends StatefulWidget {
  const StudentRating({super.key});

  @override
  State<StudentRating> createState() => _StudentRatingState();
}

class _StudentRatingState extends State<StudentRating> {
  double rating = 5;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Text(
            'اضف تقييم للطالب',
            style: AppTextStyle.font16Bold(),
          ),
        ),
        Slider(
          value: rating,
          min: 1,
          max: 10,
          divisions: 9,
          thumbColor: AppColors.mainAppColor,
          activeColor: AppColors.secondaryAppColor,
          inactiveColor: AppColors.grey,
          label: rating.toStringAsFixed(0),
          onChanged: (double value) {
            setState(
              () {
                rating = value;
              },
            );
          },
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '1',
                style: AppTextStyle.font16Bold(),
              ),
              Text(
                '10',
                style: AppTextStyle.font16Bold(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
