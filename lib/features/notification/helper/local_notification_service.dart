import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

import '../../praying/data/praying_model/timings.dart';

class LocalNotificationService {
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  /// Initialize the [FlutterLocalNotificationsPlugin] package.
  static void onDidReceiveNotificationResponse(NotificationResponse details) {}
  static void onDidReceiveBackgroundNotificationResponse(NotificationResponse details) {}
  static Future<void> init() async {
    tz.initializeTimeZones();
    InitializationSettings initializationSettings = InitializationSettings(
      android: AndroidInitializationSettings("@mipmap/ic_launcher"),
      iOS: DarwinInitializationSettings(),
    );
    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse:onDidReceiveNotificationResponse,
      onDidReceiveBackgroundNotificationResponse:onDidReceiveBackgroundNotificationResponse,
    );
  }

  /// Basic notification details
  static void showNotification({required String title, required String body}) async {
    NotificationDetails notificationDetails = NotificationDetails(
      android: AndroidNotificationDetails(
        'id 1',
        'basic notification',
        importance: Importance.max,
        priority: Priority.high,
      ),
      iOS: DarwinNotificationDetails(),
    );
    await flutterLocalNotificationsPlugin.show(
      0,
      title,
      body,
      notificationDetails,
    );
  }
  /// schedule notification
  static Future<void> schedulePrayerNotifications(Timings timings) async {
    final tz.TZDateTime now = tz.TZDateTime.now(tz.local);

    tz.setLocalLocation(tz.getLocation('Africa/Cairo'));

    Map<String, String?> prayers = {
      "الفجر": timings.fajr,
      "الظهر": timings.dhuhr,
      "العصر": timings.asr,
      "المغرب": timings.maghrib,
      "العشاء": timings.isha,
    };

    Map<String, String> prayerSounds = {
      "الفجر": "fajr_soon.mp3",
      "الظهر": "dhuhr_soon.mp3",
      "العصر": "asr_soon.mp3",
      "المغرب": "maghrib_soon.mp3",
      "العشاء": "isha_soon.mp3",
    };

    int notificationId = 0;

    for (var entry in prayers.entries) {
      if (entry.value != null) {
        final tz.TZDateTime prayerTime =
        _convertToTZDateTime(entry.value!, now);

        // Daily notifications for prayer times
        await _scheduleDailyNotification(
          notificationId++,
          entry.key,
          'اقتربت صلاة ${entry.key}',
          prayerTime.subtract(const Duration(minutes: 5)),
          prayerSounds[entry.key]!.split('.').first,
          payload: 'صلاة',
        );

        await _scheduleDailyNotification(
          notificationId++,
          entry.key,
          'حان الآن وقت صلاة ${entry.key}',
          prayerTime,
          'call',
          payload: 'صلاة',
        );

        await _scheduleDailyNotification(
          notificationId++,
          entry.key,
          'اقامت صلاة ${entry.key}',
          prayerTime.add(const Duration(minutes: 15)),
          'establish',
          payload: 'صلاة',
        );
      }
    }

    // Add custom Zekr notifications
    if (timings.asr != null) {
      await _scheduleDailyNotification(
        notificationId++,
        'أذكار المساء',
        'وقت قراءة أذكار المساء',
        _convertToTZDateTime(timings.asr!, now).add(const Duration(hours: 1)),
        'default',
        payload: 'اذكار',
      );
    }

    if (timings.sunrise != null) {
      await _scheduleDailyNotification(
        notificationId++,
        'أذكار الصباح',
        'وقت قراءة أذكار الصباح',
        _convertToTZDateTime(timings.sunrise!, now)
            .add(const Duration(hours: 1)),
        'default',
        payload: 'اذكار',
      );
    }

    await _scheduleDailyNotification(
      notificationId++,
      'أذكار النوم',
      'وقت قراءة أذكار النوم',
      tz.TZDateTime(tz.local, now.year, now.month, now.day, 0, 0),
      'default',
      payload: 'اذكار',
    );

    await _scheduleDailyNotification(
      notificationId++,
      'أذكار الاستيقاظ',
      'وقت قراءة أذكار الاستيقاظ',
      tz.TZDateTime(tz.local, now.year, now.month, now.day, 8, 0),
      'default',
      payload: 'اذكار',
    );
  }

  static Future<void> _scheduleDailyNotification(
      int id,
      String title,
      String body,
      tz.TZDateTime scheduledTime,
      String sound, {
        String? payload,
      }) async {
    final AndroidNotificationDetails androidDetails =
    AndroidNotificationDetails(
      'notification_channel_$id',
      'Notifications $title',
      channelDescription: 'Notifications for $title',
      importance: Importance.max,
      priority: Priority.high,
      sound: sound == 'default'
          ? null
          : RawResourceAndroidNotificationSound(sound),
    );

    final NotificationDetails notificationDetails =
    NotificationDetails(android: androidDetails);

    await flutterLocalNotificationsPlugin.zonedSchedule(
      id,
      title,
      body,
      scheduledTime,
      notificationDetails,
      uiLocalNotificationDateInterpretation:
      UILocalNotificationDateInterpretation.wallClockTime,
      matchDateTimeComponents: DateTimeComponents.time, // Repeat daily
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      payload: payload, // Pass payload for navigation
    );
  }

  static tz.TZDateTime _convertToTZDateTime(String time, tz.TZDateTime now) {
    String cleanedTime = time.replaceAll(RegExp(r'\s*\(.*\)'), '').trim();
    DateFormat inputFormat = DateFormat("HH:mm");
    DateTime dateTime = inputFormat.parse(cleanedTime);

    final tz.TZDateTime scheduledTime = tz.TZDateTime(
      tz.local,
      now.year,
      now.month,
      now.day,
      dateTime.hour,
      dateTime.minute,
    );

    return scheduledTime.isBefore(now)
        ? scheduledTime.add(const Duration(days: 1))
        : scheduledTime;
  }
}