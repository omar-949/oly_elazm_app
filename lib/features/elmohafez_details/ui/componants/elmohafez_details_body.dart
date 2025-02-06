import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oly_elazm/core/helpers/extentions.dart';
import 'package:oly_elazm/core/widgets/app_button.dart';
import 'package:oly_elazm/core/widgets/app_button_loading.dart';
import 'package:oly_elazm/core/widgets/info_header_section.dart';
import 'package:oly_elazm/features/elmohafez_details/logic/rate_elmohafez_cubit.dart';
import 'package:oly_elazm/features/elmohafez_details/logic/rate_elmohafez_state.dart';
import 'package:oly_elazm/features/elmohafez_details/ui/componants/rating_bar_widget.dart';
import 'package:oly_elazm/features/elmohafez_details/ui/componants/reviews_list.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/helpers/app_strings.dart';
import '../../../../core/helpers/shared_prefrences.dart';
import '../../../../core/routing/named_router.dart';
import 'add_comment_section.dart';
import 'elmohafez_rating.dart';
import 'lesson_overview.dart';

class ElmohafezDetailsBody extends StatefulWidget {
  const ElmohafezDetailsBody({super.key});

  @override
  State<ElmohafezDetailsBody> createState() => _ElmohafezDetailsBodyState();
}

class _ElmohafezDetailsBodyState extends State<ElmohafezDetailsBody> {
  final formKey = GlobalKey<FormState>();
  late final TextEditingController commentController;

  @override
  void initState() {
    commentController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    commentController.dispose();
    super.dispose();
  }

  double rating = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          BlocBuilder<RateElMohafezCubit, RateElMohafezState>(
            builder: (context, state) {
              return Skeletonizer(
                enabled: state.profileModel == null,
                child: InfoHeaderSection(
                  studentName:
                      state.profileModel?.data?.teacherOfStudent?.name ?? "_",
                  userType: SharedPrefHelper.getString(AppStrings.userRoleKey),
                ),
              );
            },
          ),
          15.ph,
          const RatingBarWidget(),
          15.ph,
          const LessonOverview(),
          15.ph,
          ElmohafezRating(
            onRate: (value) => setState(() => rating = value),
          ),
          15.ph,
          AddCommentSection(
            formKey: formKey,
            commentController: commentController,
          ),
          if (rating != 0) ...[
            15.ph,
            BlocConsumer<RateElMohafezCubit, RateElMohafezState>(
              listener: (context, state) {
                if (state.addRate.isSuccess || state.addRate.isError) {
                  context.pushNamedAndRemoveUntil(Routes.mainNav,
                      predicate: (route) => false);
                }
              },
              builder: (context, state) {
                return state.addRate.isLoading
                    ? const AppButtonLoading(title: 'ارسال التقييم')
                        .addSymmetricPadding(hVal: 16.w)
                    : AppButton(
                        height: 45.h,
                        title: 'ارسال التقييم',
                        radius: 33.r,
                        onTap: () {
                          context.read<RateElMohafezCubit>().addRate(
                              rating: rating,
                              comment: commentController.text,
                              teacherId: state
                                  .profileModel!.data!.teacherOfStudent!.id!);
                        },
                      ).addSymmetricPadding(hVal: 16.w);
              },
            )
          ],
          15.ph,
          ReviewsList(),
        ],
      ),
    );
  }
}
