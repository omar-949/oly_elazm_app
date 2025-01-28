import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oly_elazm/core/helpers/app_size.dart';
import 'package:oly_elazm/core/helpers/extentions.dart';
import 'package:oly_elazm/core/theme/app_colors.dart';
import '../../../../../../core/theme/app_text_style.dart';
class TodayMemorizationAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const TodayMemorizationAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('مكرر حفظ اليوم'),
      titleTextStyle: AppTextStyle.font20Medium(),
      elevation: 0,
      scrolledUnderElevation: 0,
      centerTitle: true,
      leading: IconButton(
        onPressed: () => context.pop(),
        icon: Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
          size: AppSize.w17,
        ),
      ),
      backgroundColor: AppColors.white,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(54.h);
}
