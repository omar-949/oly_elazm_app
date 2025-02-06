import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oly_elazm/core/helpers/app_size.dart';
import 'package:oly_elazm/core/helpers/extentions.dart';
import 'package:oly_elazm/core/theme/app_colors.dart';
import 'package:oly_elazm/core/theme/app_text_style.dart';

import '../../../home/ui/componants/continue_memorization/quran_progress_info.dart';
import '../../../home/ui/componants/continue_memorization/verse_range_info.dart';

class NoteCard extends StatelessWidget {
  final String note;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final String name;
  final String startVerse;
  final String endVerse;

  const NoteCard({
    super.key,
    required this.note,
    this.margin,
    this.padding,
    required this.name,
    required this.startVerse,
    required this.endVerse,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? EdgeInsets.all(10.r),
      width: AppSize.w358,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        boxShadow: const [
          BoxShadow(
            color: Colors.black45,
            blurRadius: 6,
            spreadRadius: 0,
            offset: Offset(1, 1),
          ),
        ],
        color: AppColors.white,
      ),
      child: Padding(
        padding: padding ?? EdgeInsets.all(10.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              note,
              style: AppTextStyle.font16Regular(),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'الحفظ ',
                  style: AppTextStyle.font16Regular(color: AppColors.mainAppColor),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildRow('سورة ', name),
                    Row(
                      children: [
                        Text(
                          'من الآية ',
                          style: AppTextStyle.font16Regular(color: AppColors.mainAppColor),
                        ),
                        Text(
                          startVerse,
                          style: AppTextStyle.font16Regular(color: AppColors.secondaryAppColor),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          ' للآية ',
                          style: TextStyle(
                            fontSize: AppSize.sp16,
                            color:AppColors.mainAppColor,
                          ),
                        ),
                        Text(
                          endVerse,
                          style: AppTextStyle.font16Regular(color: AppColors.secondaryAppColor),
                        ),
                      ],
                    ),
                  ],
                ),

              ],
            ),

          ],
        ),
      ),
    );
  }
  Widget _buildRow(String label, String value) {
    return Row(
      children: [
        Text(
          label,
          style: AppTextStyle.font16Regular(color:AppColors.mainAppColor),
        ),
        Text(
          value,
          style: AppTextStyle.font16Regular(color: AppColors.secondaryAppColor),
        ),
      ],
    );
  }

}
