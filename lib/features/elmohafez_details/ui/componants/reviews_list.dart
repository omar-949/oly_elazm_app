import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oly_elazm/core/theme/app_text_style.dart';
import 'package:oly_elazm/features/elmohafez_details/logic/rate_elmohafez_cubit.dart';
import 'package:oly_elazm/features/elmohafez_details/logic/rate_elmohafez_state.dart';
import 'package:oly_elazm/features/elmohafez_details/ui/componants/review_card.dart';


class ReviewsList extends StatelessWidget {

  const ReviewsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<RateElMohafezCubit,
        RateElMohafezState>(
      builder: (context, state) {
        return state.profileModel?.data?.comments?.isEmpty == true ? Container() : Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Text(
                'كل التعليقات',
                style: AppTextStyle.font18Bold().copyWith(fontFamily: 'Roboto'),
              ),
            ),
            SizedBox(height: 10.h),
            // List of Review Cards
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: state.profileModel?.data?.comments?.length ?? 0,
              itemBuilder: (context, index) {
                final review = state.profileModel?.data?.comments?[index];
                return ReviewCard(
                  imageUrl:"assets/images/reviewboy.png",
                  name: "",
                  date:DateFormat('dd/MM/yyyy').format(DateTime.parse(review!.dateCommented!)),
                  rating: review.rating!,
                  comment: review.comment??"",
                );
              },
            ),
          ],
        );
      },
    );
  }
}
