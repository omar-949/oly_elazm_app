import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oly_elazm/core/helpers/extentions.dart';

import '../helpers/app_size.dart';
import '../theme/app_colors.dart';
import 'app_button.dart';
import 'app_loading_indicator.dart';
import 'app_text.dart';

class AppButtonLoading extends StatelessWidget {
  final String title;
  final double? width;
  const AppButtonLoading({super.key, required this.title, this.width});

  @override
  Widget build(BuildContext context) {
    return AppButton(
      height: AppSize.h48,
      width:width,
      background: AppColors.mainAppColor.withOpacity(0.4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppText(
            text: title,
            textAlign: TextAlign.center,
            textSize: 14.sp,
            textColor: Colors.white,
            textWeight: FontWeight.w600,
          ),
          AppSize.w10.pw,
          const AppLoadingIndicator(),
        ],
      ),
    );
  }
}
