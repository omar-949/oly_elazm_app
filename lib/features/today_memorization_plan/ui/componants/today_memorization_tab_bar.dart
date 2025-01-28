import 'package:flutter/material.dart';
import 'package:oly_elazm/core/helpers/app_imgs.dart';
import 'package:oly_elazm/core/helpers/app_size.dart';import 'package:oly_elazm/core/theme/app_colors.dart';
import 'package:oly_elazm/core/theme/app_text_style.dart';
import 'today_memorization_tab_bar_item.dart';

class TodayMemorizationTabBar extends StatelessWidget {
  const TodayMemorizationTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return TabBar(
      indicatorColor: AppColors.secondaryAppColor,
      indicatorSize: TabBarIndicatorSize.label,
      indicatorPadding: EdgeInsets.symmetric(
        horizontal: AppSize.w15,
      ),
      labelColor: AppColors.secondaryAppColor,
      labelStyle: AppTextStyle.font18SemiBold(),
      unselectedLabelStyle: AppTextStyle.font18Medium(),
      unselectedLabelColor: AppColors.grey,
      tabAlignment: TabAlignment.fill,
      tabs: [
        TabItem(
          iconPath: AppImages.alarm,
          label: 'موعد التسميع',
        ),
        const TabItem(
          iconPath: AppImages.notes,
          label: 'ملاحظات اليوم',
        ),
      ],
    );
  }
}
