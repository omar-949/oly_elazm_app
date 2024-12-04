import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oly_elazm/core/theme/app_colors.dart';
import 'package:oly_elazm/features/user_info/presentation/views/widgets/chapters/chapters_list_view_builder.dart';

class ChaptersBox extends StatelessWidget {
  const ChaptersBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 480.h,
      width: 360.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: Colors.white,
        border: Border.all(color: AppColors.secondaryAppColor),
      ),
      child: const ChaptersListVIewBuilder(),
    );
  }
}
