import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oly_elazm/core/helpers/extentions.dart';
import 'package:oly_elazm/core/widgets/lesson_over_view_card.dart';
import 'package:oly_elazm/features/elmohafez_details/logic/rate_elmohafez_cubit.dart';
import 'package:oly_elazm/features/elmohafez_details/logic/rate_elmohafez_state.dart';
import 'package:skeletonizer/skeletonizer.dart';

class LessonOverview extends StatelessWidget {
  const LessonOverview({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RateElMohafezCubit, RateElMohafezState>(
      builder: (context, state) {
        return Skeletonizer(
          enabled: state.profileModel == null,
          child: Column(
            children: [
              LessonOverViewCard(
                title: 'الخبرة',
                content: '${state.profileModel?.data?.teacherOfStudent?.yearsOfExperience} سنوات في تحفيظ القرآن الكريم',
              ),
              // 10.ph,
              // LessonOverViewCard(
              //   title: 'عدد دورات لتحفيظ',
              //   content: '15 دورة تحفيظ',
              // ),
            ],
          ),
        );
      },
    );
  }
}
