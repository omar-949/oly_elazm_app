import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oly_elazm/core/helpers/extentions.dart';
import 'package:oly_elazm/features/today_memorization_plan/logic/today_memorization_plan_cubit.dart';
import 'package:oly_elazm/features/today_memorization_plan/logic/today_memorization_plan_state.dart';
import 'package:oly_elazm/features/today_memorization_plan/ui/componants/today_memorization_tab_bar.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../home/ui/componants/continue_memorization/quran_continue_body.dart';
import 'today_memorization_tab_bar_view.dart';
import 'package:collection/collection.dart';

class TodayMemorizationBody extends StatelessWidget {
  const TodayMemorizationBody({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          12.verticalSpace,
          BlocBuilder<MemorizationPlanCubit, MemorizationPlanState>(
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
                enabled: state.assignedTaskModel == null,
                child: QuranContinueBody(
                  name: data?.surahName ?? "_",
                  endVerse:data?.versesTo ?? "_",
                  startVerse: data?.versesFrom ?? "_",
                  isInHome: false,
                ),
              );
            },
          ),

          20.ph,
          const TodayMemorizationTabBar(),
          20.ph,
          Expanded(
            child: TodayMemorizationTabBarView(),

          ),
        ],
      ),
    );
  }
}
