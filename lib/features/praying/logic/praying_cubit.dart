import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:oly_elazm/core/helpers/app_strings.dart';
import 'package:oly_elazm/features/notification/helper/local_notification_service.dart';
import 'package:oly_elazm/features/praying/logic/praying_state.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../../core/helpers/shared_prefrences.dart';
import '../data/praying_model/timings.dart';

class PrayingCubit extends Cubit<PrayingState> {
  PrayingCubit() : super(PrayingInitial());
  final List<String> prayerNames = [
    "الفجر",
    "الشروق",
    "الظهر",
    "العصر",
    "المغرب",
    "العشاء"
  ];

  String? nextPrayerTitle;

  Future<void> getPrayerTimesByAddress({
    required int day,
    required String year,
    required String month,
    required double latitude,
    required double longitude,
  }) async {
    emit(PrayingLoading());
    try {
      Dio http = Dio(

      );
      final logger = PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 100,
        logPrint: (object) => log(
          object.toString(),
          name: "Api",
        ),
      );
      http.interceptors.add(logger);
      final response = await http.get(
          'http://api.aladhan.com/v1/calendar/$year/$month?latitude=$latitude&longitude=$longitude&method=5&lang=en');
      if (response.statusCode == 200) {
        final jsonResponse =response.data;
        final prayerTimesData = PrayerTimingsResponse.fromJson(jsonResponse);
        // var nextPrayer = calculateTimeUntilNextPrayer(
        //     prayerTimesData.data![day - 1].timings!);

        LocalNotificationService.schedulePrayerNotifications(
            prayerTimesData.data![day - 1].timings!);
        Timings convertTimingsTo12HourFormat(Timings timings) {
          return Timings(
            fajr: convertTo12HourFormat(timings.fajr!),
            sunrise: convertTo12HourFormat(timings.sunrise!),
            dhuhr: convertTo12HourFormat(timings.dhuhr!),
            asr: convertTo12HourFormat(timings.asr!),
            maghrib: convertTo12HourFormat(timings.maghrib!),
            isha: convertTo12HourFormat(timings.isha!),
            sortAt: timings.sortAt,
            // قم بتحويل الأوقات الأخرى بنفس الطريقة إذا لزم الأمر
          );
        }

        final timings = convertTimingsTo12HourFormat(
            prayerTimesData.data![day - 1].timings!);

        ///save timing in shared pref
        await SharedPrefHelper.setDataObject(key: AppStrings.prayTiming, value: timings);
        emit(PrayingLoaded(
          prayerTimesData,
          // nextPrayer,
          nextPrayerTitle!,
          convertTimingsTo12HourFormat(prayerTimesData.data![day - 1].timings!),
        ));
      }
    } catch (e) {
      emit(PrayingError(e.toString()));
    }
  }

//----------------
  String convertTo12HourFormat(String time24Hour) {
    // إزالة (EET) من الوقت
    String timeWithoutEET = time24Hour.split(" ")[0].toString();

    // تحليل الوقت باستخدام تنسيق 24 ساعة
    // DateFormat inputFormat = DateFormat("HH:mm");
    // DateTime dateTime = inputFormat.parse(timeWithoutEET);

    // تحويل الوقت إلى تنسيق 12 ساعة
    DateFormat outputFormat = DateFormat("hh:mm a");
    String time12Hour = outputFormat.tryParse(timeWithoutEET).toString();

    return time12Hour;
  }

  //---------------
  String calculateTimeUntilNextPrayer(Timings timings) {
    DateTime now = DateTime.now();
    DateFormat format = DateFormat("HH:mm");

    List<String?> prayerTimes = [
      timings.fajr,
      timings.sunrise,
      timings.dhuhr,
      timings.asr,
      timings.maghrib,
      timings.isha,
    ];

    DateTime? nextPrayerTime;
    Duration? smallestDifference;
    String? nextPrayerName; // لحفظ اسم الصلاة القادمة

    for (int i = 0; i < prayerTimes.length; i++) {
      String? timeString = prayerTimes[i];
      if (timeString != null) {
        DateTime prayerTime = DateTime(
            now.year,
            now.month,
            now.day,
            format.parse(timeString.split(" ")[0]).hour,
            format.parse(timeString.split(" ")[0]).minute);

        if (prayerTime.isBefore(now)) {
          prayerTime = prayerTime.add(const Duration(days: 1));
        }

        Duration difference = prayerTime.difference(now);

        if (smallestDifference == null || difference < smallestDifference) {
          smallestDifference = difference;
          nextPrayerTime = prayerTime;
          nextPrayerName = prayerNames[i]; // تحديث اسم الصلاة القادمة
        }
      }
    }

    if (nextPrayerTime != null &&
        smallestDifference != null &&
        nextPrayerName != null) {
      int hours = smallestDifference.inHours;
      int minutes = smallestDifference.inMinutes.remainder(60);
      int seconds = smallestDifference.inSeconds.remainder(60);
      nextPrayerTitle = nextPrayerName;
      String formattedTime =
          "${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}";
      return formattedTime;
    } else {
      return "لم يتم العثور على وقت الصلاة";
    }
  }
}
