import 'package:flutter/material.dart';
import 'package:oly_elazm/core/helpers/extentions.dart';
import 'package:oly_elazm/core/widgets/lesson_over_view_card.dart';

class LessonOverview extends StatelessWidget {
  const LessonOverview({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children:  [
        LessonOverViewCard(
          title: 'الخبرة',
          content: '3 سنوات في تحفيظ القرآن الكريم',
        ),
        10.ph,
        LessonOverViewCard(
          title: 'عدد دورات لتحفيظ',
          content: '15 دورة تحفيظ',
        ),
      ],
    );
  }
}
