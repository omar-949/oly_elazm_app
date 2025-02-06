import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pannable_rating_bar/flutter_pannable_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oly_elazm/features/elmohafez_details/logic/rate_elmohafez_cubit.dart';
import 'package:oly_elazm/features/elmohafez_details/logic/rate_elmohafez_state.dart';

import '../../../../core/theme/app_colors.dart';

class RatingBarWidget extends StatelessWidget {
  const RatingBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RateElMohafezCubit, RateElMohafezState>(
      builder: (context, state) {
        return PannableRatingBar(
          spacing: 15.w,
          rate: state.profileModel?.data?.teacherOfStudent?.rating ?? 0,
          items: List.generate(
            5,
            (index) => RatingWidget(
              selectedColor: AppColors.mainAppColor,
              unSelectedColor: Colors.grey,
              child: SvgPicture.asset(
                'assets/svgs/rate.svg',
                width: 32.w,
              ),
            ),
          ),
        );
      },
    );
  }
}
