import 'package:flutter/material.dart';
import 'package:oly_elazm/features/today_memorization_plan/ui/componants/recitation_time_section.dart';
import 'package:oly_elazm/features/today_memorization_plan/ui/componants/today_notes_sections.dart';
class TodayMemorizationTabBarView extends StatelessWidget {
  const TodayMemorizationTabBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return const TabBarView(
      physics: NeverScrollableScrollPhysics(),
      children: [
        RecitationTimeSection(),
        TodayNotesSections(note: 'الحفظ ممتاز لكن يرجى ضبط التجويد أكثر Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut aliquip ex ea commodo consequat.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut aliquip ex ea commodo consequat.',),
      ],
    );
  }
}
