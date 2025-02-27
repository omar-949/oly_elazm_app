import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oly_elazm/core/helpers/app_strings.dart';
import 'package:oly_elazm/core/helpers/shared_prefrences.dart';
import 'package:oly_elazm/core/theme/app_colors.dart';
import 'package:oly_elazm/core/theme/app_text_style.dart';

class StudentsListHeader extends StatelessWidget {
  const StudentsListHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'الطلاب',
          style: AppTextStyle.font20Medium(),
        ),
        Row(
          children: [
            Text(
              'عرض الكل',
              style: AppTextStyle.font16Medium(
                color: AppColors.secondaryAppColor,
              ),
            ),
            InkWell(
              onTap:() {
                log(SharedPrefHelper.getString(AppStrings.userRoleKey));
                log(SharedPrefHelper.getSecuredString(AppStrings.userTokenKey));
              },
              child: Icon(
                Icons.arrow_forward_ios,
                color: AppColors.secondaryAppColor,
                size: 15.w,
              ),
            ),
          ],
        )
      ],
    );
  }
}
