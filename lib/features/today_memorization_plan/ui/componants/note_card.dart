import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oly_elazm/core/helpers/app_size.dart';
import 'package:oly_elazm/core/theme/app_colors.dart';
import 'package:oly_elazm/core/theme/app_text_style.dart';

class NoteCard extends StatelessWidget {
  final String note;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;

  const NoteCard({
    super.key,
    required this.note,
    this.margin,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? EdgeInsets.all(10.r),
      width: AppSize.w358,
      height: AppSize.h195,
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
        child: Text(
          note,
          style: AppTextStyle.font16Regular(),
        ),
      ),
    );
  }
}
