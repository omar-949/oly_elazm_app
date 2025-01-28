import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oly_elazm/core/theme/app_colors.dart';
import 'package:oly_elazm/core/widgets/app_text.dart';

import 'content.dart';
import 'daily_content_header.dart';


class DailyContent extends StatelessWidget {
  const DailyContent({super.key, required this.title, required this.content, this.surahName});

  final String title;
  final String content;
  final String? surahName;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 4,
            spreadRadius: 0.1,
            offset: Offset(2, 2),
          ),
        ],
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DailyContentHeader(
            title: title,
            surahName: surahName,
          ),
          Divider(
            color: AppColors.secondaryAppColor,
          ),
          Content(
            content: content,
          ),
        ],
      ),
    );
  }
}
