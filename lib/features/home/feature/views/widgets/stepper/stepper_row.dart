import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oly_elazm/core/theme/app_colors.dart';

class StepperRow extends StatelessWidget {
  const StepperRow({
    super.key,
    required this.isCompleted,
    required this.totalSteps,
    required this.index,
  });

  final int index;
  final bool isCompleted;
  final int totalSteps;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 24.w,
          height: 24.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isCompleted ? AppColors.mainAppColor : Colors.white,
            border: Border.all(
              color: AppColors.mainAppColor,
              width: 1.0,
            ),
          ),
          child: isCompleted
              ? Icon(
            Icons.check,
            color: Colors.white,
            size: 20.sp,
          )
              : null,
        ),
        if (index < totalSteps - 1)
          Container(
            width: 55.w,
            height: 1.h,
            color: AppColors.secondaryAppColor,
          ),
      ],
    );
  }
}
