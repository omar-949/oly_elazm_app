import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oly_elazm/core/theme/app_colors.dart';
import 'package:oly_elazm/core/theme/app_text_style.dart';

class DailyContentHeader extends StatelessWidget {
  const DailyContentHeader({
    super.key, required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Text(
            title,
            style: AppTextStyle.font20SemiBold(
              color: AppColors.secondaryAppColor,
            ),
          ),
          Spacer(),
          SvgPicture.asset('assets/svgs/share.svg'),
          16.horizontalSpace,
          SvgPicture.asset('assets/svgs/repost.svg'),
        ],
      ),
    );
  }
}
