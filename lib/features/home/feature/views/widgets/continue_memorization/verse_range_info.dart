import 'package:flutter/material.dart';
import 'package:oly_elazm/core/helpers/app_size.dart';
import 'package:oly_elazm/core/theme/app_colors.dart';
import 'package:oly_elazm/core/theme/app_text_style.dart';

class VerseRangeInfo extends StatelessWidget {
  final String startVerse;
  final String endVerse;

  const VerseRangeInfo({
    super.key,
    required this.startVerse,
    required this.endVerse,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: AppSize.h25,
      right: AppSize.h15,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'من الآية ',
            style: AppTextStyle.font16Regular(color: Colors.white),
          ),
          Text(
            startVerse,
            style: AppTextStyle.font16Regular(color: AppColors.secondaryAppColor),
          ),
          Text(
            ' للآية ',
            style: TextStyle(
              fontSize: AppSize.sp16,
              color: Colors.white,
            ),
          ),
          Text(
            endVerse,
            style: AppTextStyle.font16Regular(color: AppColors.secondaryAppColor),
          ),
        ],
      ),
    );
  }
}
