import 'package:get/get.dart';
import 'package:minimal_chat_app/Controller/home_controller.dart';
import 'package:minimal_chat_app/Controller/login_controller.dart';
import 'package:minimal_chat_app/services/auth/login_register_controller.dart';
import 'package:minimal_chat_app/Controller/register_controller.dart';
import 'package:minimal_chat_app/View/login_screen.dart';

class Binding extends Bindings
{
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<LoginController>(() => LoginController());
    Get.lazyPut<RegisterController>(() => RegisterController());
    Get.lazyPut<LoginRegisterController>(() => LoginRegisterController());
  }

}