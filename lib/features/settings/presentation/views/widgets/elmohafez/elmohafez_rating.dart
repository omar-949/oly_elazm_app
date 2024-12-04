import 'package:flutter/material.dart';
import 'package:flutter_pannable_rating_bar/flutter_pannable_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oly_elazm/core/helpers/extentions.dart';
import 'package:oly_elazm/core/theme/app_colors.dart';
import 'package:oly_elazm/core/theme/app_text_style.dart';

class ElmohafezRating extends StatefulWidget {
  const ElmohafezRating({super.key});

  @override
  State<ElmohafezRating> createState() => _ElmohafezRatingState();
}

class _ElmohafezRatingState extends State<ElmohafezRating> {
  double rating = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'اضف تقييم للطالب',
            style: AppTextStyle.font16Bold(),
          ),
          10.ph,
          Row(
            children: [
              PannableRatingBar(
                spacing: 15.w,
                rate: rating,
                items: List.generate(5, (index) =>
                RatingWidget(
                  selectedColor: AppColors.secondaryAppColor,
                  unSelectedColor: Colors.grey,
                  child:SvgPicture.asset('assets/svgs/rate.svg')
                )),
                onChanged: (value) {
                  setState(() {
                    rating = value;
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
