import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oly_elazm/core/helpers/extentions.dart';
import 'package:oly_elazm/core/widgets/app_text.dart';

import '../../../../../core/theme/app_colors.dart';
import 'quran_continue_background.dart';
import 'quran_continue_icon.dart';
import 'quran_continue_progress_button.dart';
import 'quran_progress_info.dart';
import 'verse_range_info.dart';

class QuranContinueBody extends StatelessWidget {
  final String name;
  final String startVerse;
  final String endVerse;
  final bool isInHome;

  const QuranContinueBody({
    super.key,
    required this.name,
    this.startVerse = '12',
    this.endVerse = '14',
    this.isInHome = true,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const QuranContinueBackground(),
        const QuranContinueIcon(),
        if (name != '_') ...[
          QuranProgressInfo(
            name: name,
          ),
          VerseRangeInfo(startVerse: startVerse, endVerse: endVerse),
          if (isInHome)
          const QuranContinueProgressButton(),
        ] else ...[

          AppText(
            text: "لا يوجد حفظ لديك حاليا",
            textSize: 16.sp,
            textColor: AppColors.white,
            textWeight: FontWeight.w600,
          ).addSymmetricPadding(hVal: 20.w, vVal: 60.h),
        ]
      ],
    );
  }
}
