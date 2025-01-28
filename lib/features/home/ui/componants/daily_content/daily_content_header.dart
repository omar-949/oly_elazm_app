import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oly_elazm/core/theme/app_colors.dart';
import 'package:oly_elazm/core/theme/app_text_style.dart';

import '../../../../../core/widgets/app_text.dart';

class DailyContentHeader extends StatelessWidget {
  const DailyContentHeader({
    super.key, required this.title, this.surahName,
  });
  final String title;
  final String? surahName;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          // Text("۞",style: AppTextStyle.font20SemiBold(color: AppColors.secondaryAppColor),),
          Text(
            title,
            style: AppTextStyle.font20SemiBold(
              color: AppColors.secondaryAppColor,

            ),
          ),
          Spacer(),
          AppText(text: surahName ?? '',textSize:16.sp,textColor:AppColors.mainAppColor,textWeight: FontWeight.w600
            , ),

          // Spacer(),
          // SvgPicture.asset('assets/svgs/share.svg'),
          // 16.horizontalSpace,
          // SvgPicture.asset('assets/svgs/repost.svg'),
        ],
      ),
    );
  }
}
