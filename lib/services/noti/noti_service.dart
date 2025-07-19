import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:permission_handler/permission_handler.dart';
class NotiService {
  final notifPlugin = FlutterLocalNotificationsPlugin();
  bool isInitialized = false;
  bool get isInit => isInitialized;

  Future<void> requestNotificationPermission() async {
    final status = await Permission.notification.request();
    if (status.isGranted) {
      print(' Notification permission granted');
    } else {
      print(' Notification permission denied');
    }
  }

  //INITIALIZE
  Future<void> initNotification() async {
    if (isInitialized) return;
    // android init settings
    const initSettingsAndroid = AndroidInitializationSettings(
      '@mipmap/ic_launcher',
    );

    // init settings
    const initSettings = InitializationSettings(android: initSettingsAndroid);

    // initialize the plugin
    await notifPlugin.initialize(initSettings);

  }

  // NOTIFICATIONS DETAIL SETUP
  NotificationDetails notificationDetails() {
    return const NotificationDetails(
      android: AndroidNotificationDetails(
        'daily_channel_id',
        'Daily Notifications',
        channelDescription: 'Daily Notifications Channel',
        importance: Importance.max,
        priority: Priority.high,
      ),
    );
  }

  //SHOW NOTIFICATION
  Future<void> showNotification({int id=0, String? title , String? body}) async
  {
   return notifPlugin.show(id, title, body, notificationDetails());
  }
}
