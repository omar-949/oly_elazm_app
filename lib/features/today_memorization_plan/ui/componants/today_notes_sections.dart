import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oly_elazm/core/helpers/app_size.dart';
import 'package:oly_elazm/core/helpers/extentions.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_style.dart';
import '../../logic/today_memorization_plan_cubit.dart';
import '../../logic/today_memorization_plan_state.dart';
import 'note_card.dart';

class TodayNotesSections extends StatelessWidget {

  const TodayNotesSections({super.key, });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MemorizationPlanCubit, MemorizationPlanState>(
      builder: (context, state) {
        final data = state.assignedTaskModel?.data;
        return data == null ? Container(
          margin: const EdgeInsets.all(16.0),
          height: 100.h,
          decoration: BoxDecoration(

            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(color: AppColors.secondaryAppColor),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                'لا يوجد ملاحظات لليوم الحالي',
                style: AppTextStyle.font16Regular(color: AppColors.secondaryAppColor),
              ),
          ))
        ) : ListView.separated(
          itemCount: data.length,
          itemBuilder: (context, index) {
            return NoteCard(
                note: data[index].teacherNotes ?? "لا يوجد ملاحظات",
              endVerse: data[index].versesTo ?? "_",
              startVerse: data[index].versesFrom ?? "_",
              name: data[index].surahName ?? "_",
            );
          },
          separatorBuilder: (context, index) {
            return AppSize.h10.ph;
          },
        );
      },
    );
  }
}
