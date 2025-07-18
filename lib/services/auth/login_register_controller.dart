import 'package:get/get.dart';
import 'package:minimal_chat_app/Controller/login_controller.dart';
import 'package:minimal_chat_app/Controller/register_controller.dart';

class LoginRegisterController extends GetxController
{
  RxBool showLoginPage = false.obs;

  void togglePages() {
    showLoginPage.value = !showLoginPage.value;
    Get.find<LoginController>().emailController.clear();
    Get.find<LoginController>().passwordController.clear();
    Get.find<RegisterController>().emailController.clear();
    Get.find<RegisterController>().passwordController.clear();
  }
  @override
  void onClose() {
    Get.find<LoginController>().emailController.dispose();
    Get.find<LoginController>().passwordController.dispose();
    Get.find<RegisterController>().emailController.dispose();
    Get.find<RegisterController>().passwordController.dispose();
    super.onClose();
  }
}