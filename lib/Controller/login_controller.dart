import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:minimal_chat_app/services/auth/auth_service.dart';
class LoginController extends GetxController
{
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController=TextEditingController();
  void login() async
    {
      final authService=AuthService();
       try
           {
             await authService.signInWithEmailPassword(emailController.text, passwordController.text);
               // Error handling logic


           }

       catch(e)
       {
         Get.snackbar(
             "Error",
             e.toString(),
             snackPosition: SnackPosition.BOTTOM,
             backgroundColor: Colors.red
         );
       }
  }
}