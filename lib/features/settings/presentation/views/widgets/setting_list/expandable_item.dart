import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oly_elazm/core/theme/app_colors.dart';
import 'package:oly_elazm/core/theme/app_text_style.dart';
import 'package:oly_elazm/core/helpers/app_size.dart';

class ExpandableItem extends StatelessWidget {
  final String icon;
  final String title;
  final String pointsLabel;
  final String pointsValue;

  const ExpandableItem({
    super.key,
    required this.icon,
    required this.title,
    required this.pointsLabel,
    required this.pointsValue,
  });

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      leading: SvgPicture.asset(
        icon,
        width: AppSize.w24,
        height: AppSize.h24,
      ),
      title: Text(
        title,
        style: AppTextStyle.font20Regular(),
      ),
      trailing: SvgPicture.asset(
        'assets/svgs/arrow-down.svg',
        width: AppSize.w24,
      ),
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: AppSize.h8),
          child: Row(
            children: [
              Text(
                pointsLabel,
                style: AppTextStyle.font20Regular(color: AppColors.darkGrey).copyWith(fontFamily: 'Roboto'),
              ),
              Text(
                pointsValue,
                style: AppTextStyle.font24Bold(color: AppColors.secondaryAppColor).copyWith(fontFamily: 'Roboto'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
