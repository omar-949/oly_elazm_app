import 'package:flutter/widgets.dart';
import 'package:oly_elazm/core/helpers/app_size.dart';
import 'package:oly_elazm/core/theme/app_colors.dart';
import 'package:oly_elazm/core/theme/app_text_style.dart';

class QuranTitle extends StatelessWidget {
  const QuranTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSize.h63,
      child: Center(
        child: Text(
          'القران الكريم',
          style: AppTextStyle.font40SemiBold(color: AppColors.white),
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
