import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:intl/intl.dart';
import 'package:oly_elazm/core/theme/app_text_style.dart';

class TodayDate extends StatefulWidget {
  const TodayDate({super.key});

  @override
  State<TodayDate> createState() => _TodayDateState();
}

class _TodayDateState extends State<TodayDate> {
  late String gregorianDate;
  late String hijriFormattedDate;

  final hijriMonthsArabic = [
    "محرم",
    "صفر",
    "ربيع الأول",
    "ربيع الآخر",
    "جمادى الأولى",
    "جمادى الآخرة",
    "رجب",
    "شعبان",
    "رمضان",
    "شوّال",
    "ذو القعدة",
    "ذو الحجة"
  ];

  @override
  void initState() {
    super.initState();

    gregorianDate = DateFormat('EEEE , d MMMM', 'ar').format(DateTime.now());

    final hijriDate = HijriCalendar.fromDate(DateTime.now());

    hijriFormattedDate = '${hijriDate.hDay} ${hijriMonthsArabic[hijriDate.hMonth - 1]} | ${hijriDate.hYear} هجري';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          gregorianDate,
          style: AppTextStyle.font16Regular(color: Colors.white),
        ),
        5.verticalSpace,
        Text(
          hijriFormattedDate,
          style: AppTextStyle.font16Regular(color: Colors.white),
        ),
      ],
    );
  }
}
