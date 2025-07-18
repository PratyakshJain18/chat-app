import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:minimal_chat_app/services/auth/auth_service.dart';
class RegisterController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confPasswordController = TextEditingController();
  void Register() {
    final _auth = AuthService();
    if (passwordController.text == confPasswordController.text) {
      try {
        _auth.signUpWithEmailAndPassword(
          emailController.text,
          passwordController.text,
        );
      } catch (e) {
        print("Password didn't match");
      }
    }
    else
      {
        Get.snackbar(
          "Error",
          "Passwords do not match",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent,
          colorText: Colors.white,
        );
      }
  }
}
