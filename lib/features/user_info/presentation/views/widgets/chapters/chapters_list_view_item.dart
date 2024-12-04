import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oly_elazm/core/theme/app_colors.dart';
import 'package:oly_elazm/core/theme/app_text_style.dart';

class ChaptersListViewItem extends StatelessWidget {
  const ChaptersListViewItem({
    super.key,
    required this.text,
    required this.isSelected,
    required this.onTap,
  });

  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6.h),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: 12.h,
            horizontal: 16.w,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            color: Colors.white,
            gradient: isSelected
                ? const LinearGradient(
                    colors: [
                      Color(0xFFA85000),
                      Color(0xFF522700),
                    ],
                    stops: [0.2, 1.0],
                  )
                : null,
            border: Border(
              bottom: BorderSide(
                color: isSelected ? Colors.white : AppColors.secondaryAppColor,
              ),
            ),
          ),
          child: Text(
            text,
            style: AppTextStyle.font20Regular(
              color: isSelected ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
