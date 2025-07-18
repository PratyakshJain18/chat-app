import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:minimal_chat_app/services/auth/auth_service.dart';
import 'package:minimal_chat_app/View/login_screen.dart';
import 'package:minimal_chat_app/View/register_view.dart';

import '../services/auth/login_register_controller.dart';
class LoginOrRegister extends GetView<LoginRegisterController> {
  RxBool showLoginPage=false.obs;
  LoginOrRegister({super.key} );

  void togglePages()
  {

    showLoginPage.value=!showLoginPage.value;
  }
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return controller.showLoginPage.value
          ? LoginScreen(onTap: controller.togglePages)
          : RegisterView(onTap: controller.togglePages);
    });
  }
}
