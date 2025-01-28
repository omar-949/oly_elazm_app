import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oly_elazm/core/theme/app_colors.dart';
import 'package:oly_elazm/core/theme/app_text_style.dart';
import 'package:oly_elazm/features/students_progress/logic/student_progress_cubit.dart';
import 'package:oly_elazm/features/students_progress/logic/student_progress_state.dart';
import 'package:skeletonizer/skeletonizer.dart';

class StudentNameAndPoints extends StatelessWidget {
  const StudentNameAndPoints({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentProgressCubit, StudentProgressState>(
      builder: (context, state) {
        return Skeletonizer(
          enabled:state.studentsDetailsState.isLoading&&state.studentsDetailsData==null,
          child: Column(
            children: [
              Text(
                state.studentsDetailsData?.data?.name ?? '_',
                style: AppTextStyle.font20SemiBold(),
              ),
              Text(
                'طالب',
                style: AppTextStyle.font16Medium(
                  color: AppColors.grey,
                ),
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'عدد النقاط: ',
                      style: AppTextStyle.font14Regular(
                        color: AppColors.grey,
                      ),
                    ),
                    TextSpan(
                      text: state.studentsDetailsData?.data?.totalPoints.toString() ?? '_',
                      style: AppTextStyle.font14Medium(
                        color: AppColors.secondaryAppColor,
                      ),
                    ),
                    TextSpan(
                      text: 'نقطة',
                      style: AppTextStyle.font16SemiBold(
                        color: AppColors.secondaryAppColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
