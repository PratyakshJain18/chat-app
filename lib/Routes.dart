import 'package:get/get.dart';
import 'package:minimal_chat_app/View/chat_page.dart';
import 'package:minimal_chat_app/View/home_view.dart';
import 'package:minimal_chat_app/View/settings.dart';
import 'package:minimal_chat_app/services/auth/auth_gate.dart';
import 'package:minimal_chat_app/binding.dart';

class Routes
{
  static final initialRoute='/login';
  static final home='/home';
  static final settingsPage='/settings';
  static final chatPage='/chatPage';
  static final getPages=[
    GetPage(name: initialRoute, page: ()=>AuthGate()),
    GetPage(name: home, page: ()=> MyHomePage() , binding: Binding()),
    GetPage(name: settingsPage, page: ()=> Settings()),
    // GetPage(name: chatPage, page:()=> ChatPage())
  ];
}