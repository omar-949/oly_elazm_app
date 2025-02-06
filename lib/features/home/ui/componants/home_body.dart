import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oly_elazm/core/helpers/app_strings.dart';
import 'package:oly_elazm/core/helpers/shared_prefrences.dart';
import 'package:oly_elazm/features/home/logic/home_cubit.dart';
import 'package:oly_elazm/features/home/ui/componants/stepper/home_stepper.dart';
import 'package:oly_elazm/features/home/ui/componants/students_list/student_section.dart';
import 'package:quran/quran.dart' as quran;
import 'package:skeletonizer/skeletonizer.dart';

import '../../logic/home_state.dart';
import 'continue_memorization/quran_continue_body.dart';
import 'daily_content/daily_content.dart';
import 'header_section/header_section.dart';
import 'package:collection/collection.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    int surah = Random().nextInt(114) + 1;
    int verse = Random().nextInt(quran.getVerseCount(surah)) + 1;
    return SingleChildScrollView(
      child: Column(
        children: [
          HeaderSection(),
          12.verticalSpace,
          HomeStepper(
            currentStep: 3,
          ),
          24.verticalSpace,
          if (SharedPrefHelper.getString(AppStrings.userRoleKey) == "teacher")
            StudentSection(),
          if (SharedPrefHelper.getString(AppStrings.userRoleKey) == "student")
            BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                final today = DateTime.now();

                final data = state.assignedTaskModel?.data?.firstWhereOrNull(
                      (element) =>
                  element.scheduledTime != null &&
                      element.scheduledTime!.year == today.year &&
                      element.scheduledTime!.month == today.month &&
                      element.scheduledTime!.day == today.day,
                );
                return Skeletonizer(
                  enabled: state.assignedTask.isLoading&&state.assignedTaskModel == null,
                  child: QuranContinueBody(
                    name: data?.surahName ?? "_",
                    endVerse:data?.versesTo ?? "_",
                    startVerse: data?.versesFrom ?? "_",
                    isInHome: true,
                  ),
                );
              },
            ),
          12.verticalSpace,
          DailyContent(
            title: '۞ آية اليوم',
            content:
            "﴿ ${quran.getVerse(surah, verse)} ﴾",
            surahName: "سورة ${quran.getSurahNameArabic(surah)} الآيه $verse",
          ),
          DailyContent(
            title: '۞ حديث اليوم',
            content:
            'قال رسول الله صلى الله عليه وسلم: (إنَّ مِن أحبِّكم إليَّ وأقربِكُم منِّي مجلسًا يومَ القيامةِ أحاسنَكُم أخلاقًا)',
          ),
          12.verticalSpace,
        ],
      ),
    );
  }
}
