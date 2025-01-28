import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oly_elazm/core/widgets/curved_background_with_image.dart';
import 'package:oly_elazm/core/widgets/lesson_over_view_card.dart';
import 'package:oly_elazm/features/students_progress/ui/componants/student_form.dart';
import 'package:oly_elazm/features/students_progress/ui/componants/student_name_and_points.dart';
import 'package:oly_elazm/features/students_progress/ui/componants/student_rating.dart';
import 'package:oly_elazm/features/students_progress/ui/componants/time_remaining.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../logic/student_progress_cubit.dart';
import '../../logic/student_progress_state.dart';

class StudentProgressBody extends StatelessWidget {
  const StudentProgressBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          BlocBuilder<StudentProgressCubit, StudentProgressState>(
            builder: (context, state) {
              return Skeletonizer(
                enabled: state.studentsDetailsState.isLoading &&
                    state.studentsDetailsData == null,
                child: CurvedBackgroundWithImage(
                  imagePath: state.studentsDetailsData?.data?.profilePicture,
                ),
              );
            },
          ),
          16.verticalSpace,
          StudentNameAndPoints(),
          16.verticalSpace,
          BlocBuilder<StudentProgressCubit, StudentProgressState>(
            builder: (context, state) {
              return Skeletonizer(
                enabled: state.studentsDetailsState.isLoading &&
                    state.studentsDetailsData == null,
                child: LessonOverViewCard(
                  title: 'الحفظ',
                  content: state
                              .studentsDetailsData?.data?.quranPartsMemorized ==
                          "0"
                      ? 'لم يبدء الطالب حفظ القرآن'
                      : 'حفظ الطالب عدد (${state.studentsDetailsData?.data?.quranPartsMemorized}) أجزاء من القرآن الكريم',
                ),
              );
            },
          ),
          LessonOverViewCard(
            title: 'مكرر حفظ اليوم',
            content: 'سورة النساء صفحة 79',
          ),
          6.verticalSpace,
          TimeRemaining(),
          16.verticalSpace,
          StudentForm(),
        ],
      ),
    );
  }
}
