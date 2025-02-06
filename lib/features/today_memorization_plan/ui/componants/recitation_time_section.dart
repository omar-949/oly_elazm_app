import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oly_elazm/core/helpers/extentions.dart';
import 'package:oly_elazm/features/today_memorization_plan/logic/today_memorization_plan_cubit.dart';
import 'package:oly_elazm/features/today_memorization_plan/ui/componants/reminder_text_widget.dart';
import 'package:oly_elazm/features/today_memorization_plan/ui/componants/time_indicator_widget.dart';

import '../../../../../../../../core/helpers/app_size.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_style.dart';
import '../../logic/today_memorization_plan_state.dart';
import 'join_recitation_button.dart';

class RecitationTimeSection extends StatelessWidget {
  const RecitationTimeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MemorizationPlanCubit, MemorizationPlanState>(
      builder: (context, state) {
        final today = DateTime.now();

        final data = state.assignedTaskModel?.data?.firstWhereOrNull(
          (element) =>
              element.scheduledTime != null &&
              element.scheduledTime!.year == today.year &&
              element.scheduledTime!.month == today.month &&
              element.scheduledTime!.day == today.day,
        );

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
                'لا يوجد تسميع لليوم الحالي',
                style: AppTextStyle.font16Regular(color: AppColors.secondaryAppColor),
              ),
            ),
          ),
        ) : Column(
          children: [

            TimeIndicatorWidget(
              time: DateTime.now().add(Duration(
                  hours: data.scheduledTime!.hour,
                  minutes: data.scheduledTime!.minute)),
            ),
            AppSize.h20.ph,
            JoinRecitationButton(
              title: 'رابط التسميع',
              onTap: () {

              },
            ),
          ],
        );
      },
    );
  }
}
