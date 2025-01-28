import 'package:flutter/material.dart';
import 'package:oly_elazm/core/theme/app_text_style.dart';

import '../../data/praying_model/timings.dart';

List<Widget> buildPrayerTimes(BuildContext context, Timings timings) {
  final prayerTimes = [
    {"name": "الفجر", "time": timings.fajr},
    {"name": "الشروق", "time": timings.sunrise},
    {"name": "الظهر", "time": timings.dhuhr},
    {"name": "العصر", "time": timings.asr},
    {"name": "المغرب", "time": timings.maghrib},
    {"name": "العشاء", "time": timings.isha},
  ];

  return prayerTimes
      .map(
        (prayer) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(prayer["name"]!,
                  style:AppTextStyle.font16SemiBold()),
              Text(
                prayer["time"] ?? "غير متوفر",
                style:AppTextStyle.font16SemiBold(),
              ),
            ],
          ),
        ),
      )
      .toList();
}
