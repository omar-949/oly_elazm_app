import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationService {
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  /// Initialize the [FlutterLocalNotificationsPlugin] package.
  static void onDidReceiveNotificationResponse(NotificationResponse details) {}
  static void onDidReceiveBackgroundNotificationResponse(NotificationResponse details) {}
  static Future<void> init() async {
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
}