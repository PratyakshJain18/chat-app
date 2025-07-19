import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:minimal_chat_app/Controller/settings_controller.dart';
import 'package:minimal_chat_app/firebase_options.dart';
import 'package:minimal_chat_app/services/noti/noti_service.dart';
import 'package:minimal_chat_app/themes/light_mode.dart';

import 'Controller/home_controller.dart';
import 'Controller/login_controller.dart';
import 'Controller/register_controller.dart';
import 'Routes.dart';
import 'View/home_view.dart';
import 'package:get/get.dart';

import 'package:minimal_chat_app/services/auth/login_register_controller.dart';
void main() async {
  Get.lazyPut<HomeController>(() => HomeController());
  Get.lazyPut<LoginController>(() => LoginController());
  Get.lazyPut<RegisterController>(() => RegisterController());
  Get.lazyPut<LoginRegisterController>(() => LoginRegisterController());
  Get.lazyPut<SettingsController>(() => SettingsController());
  WidgetsFlutterBinding.ensureInitialized();
  NotiService().initNotification();
  await Firebase.initializeApp( options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
  await notiService.initNotification();
}
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
FlutterLocalNotificationsPlugin();
final notiService = NotiService();

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: lightMode,
      initialRoute: Routes.initialRoute,
      getPages: Routes.getPages,
    );
  }
}

