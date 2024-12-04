import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oly_elazm/features/home/feature/views/widgets/header_section/prayer_time_details.dart';
import 'package:oly_elazm/features/home/feature/views/widgets/header_section/today_date.dart';

class InfoRow extends StatelessWidget {
  const InfoRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 20.w,
      right: 60.w,
      bottom: 70.h,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            PrayerTimeDetails(),
            TodayDate(),
          ],
        ),
      ),
    );
  }
}
