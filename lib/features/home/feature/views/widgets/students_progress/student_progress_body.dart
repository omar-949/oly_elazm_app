import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oly_elazm/core/widgets/lesson_over_view_card.dart';
import 'package:oly_elazm/features/home/feature/views/widgets/students_progress/student_form.dart';
import 'package:oly_elazm/features/home/feature/views/widgets/students_progress/student_name_and_points.dart';
import 'package:oly_elazm/core/widgets/curved_background_with_image.dart';
import 'package:oly_elazm/features/home/feature/views/widgets/students_progress/student_rating.dart';
import 'package:oly_elazm/features/home/feature/views/widgets/students_progress/time_remaining.dart';

class StudentProgressBody extends StatelessWidget {
  const StudentProgressBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CurvedBackgroundWithImage(),
          16.verticalSpace,
          StudentNameAndPoints(),
          16.verticalSpace,
          LessonOverViewCard(
            title: 'الحفظ',
            content: 'حفظ الطالب ثلاث أجزاء من القرآن الكريم',
          ),
          LessonOverViewCard(
            title: 'مكرر حفظ اليوم',
            content: 'سورة النساء صفحة 79',
          ),
          6.verticalSpace,
          TimeRemaining(),
          16.verticalSpace,
          StudentRating(),
          16.verticalSpace,
          StudentForm(),
        ],
      ),
    );
  }
}
