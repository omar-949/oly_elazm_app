import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oly_elazm/core/helpers/extentions.dart';
import '../continue_memorization/quran_continue_body.dart';
import 'today_memorization_tab_bar.dart';
import 'today_memorization_tab_bar_view.dart';

class TodayMemorizationBody extends StatelessWidget {
  const TodayMemorizationBody({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          12.verticalSpace,
          QuranContinueBody(
            name: 'النساء',
            num: '79',
            isInHome: false,
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
