import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oly_elazm/core/theme/app_colors.dart';
import 'package:oly_elazm/core/theme/app_text_style.dart';
import 'package:oly_elazm/core/widgets/app_image_view.dart';
import 'package:oly_elazm/features/home/data/models/teacher/all_student_model.dart';

class StudentListItem extends StatelessWidget {
  const StudentListItem({super.key, required this.student});

  final DataAllStudents student;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 165.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
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
          Container(
            width: double.infinity,
            height: 100.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(16.r),
                topLeft: Radius.circular(16.r),
              ),
              color: AppColors.secondaryAppColor,
            ),
            child: AppImageView(
              imagePath:
              student.profilePicture,
              borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),

            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  student.name ?? '_',
                  style: AppTextStyle.font16Regular(
                    color: Color(0xff5C649D),
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                4.verticalSpace,
                Text(
                  'طالب',
                  style: AppTextStyle.font12Regular(
                    color: AppColors.grey,
                  ),
                ),
                4.verticalSpace,
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6.r),
                    color: AppColors.secondaryAppColor,
                  ),
                  child: Text(
                    'كل التفاصيل',
                    style: AppTextStyle.font12Regular(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
