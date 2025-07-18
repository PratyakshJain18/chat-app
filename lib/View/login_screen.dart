import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:minimal_chat_app/Components/buttons.dart';
import 'package:minimal_chat_app/Components/text_field.dart';
import 'package:minimal_chat_app/Controller/login_controller.dart';
class LoginScreen extends GetView<LoginController> {
  const LoginScreen({super.key ,this.onTap });
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.message,
                size: 60 ,
                color: Theme.of(context).colorScheme.primary,

              ),
              SizedBox(height: 16),
              Text("Welcome to this Chat App" , style: TextStyle(color: Theme.of(context).colorScheme.primary , fontWeight: FontWeight.bold , fontSize: 17),),
              SizedBox(height: 16,),
              MyTextField(hintText: "Email" , hidden: false, textController: controller.emailController,),
              SizedBox(height: 10,),
              MyTextField(hintText: "Password" , hidden: true, textController: controller.passwordController,),
              SizedBox(height: 20,),
              Buttons(text: "Login" , onTap: controller.login,),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Not a Member!" ,style: TextStyle(color: Theme.of(context).colorScheme.primary),),
                  SizedBox(width: 4,),
                  InkWell(
                      onTap: onTap,
                      child: Text("Register Now" , style: TextStyle(color: Theme.of(context).colorScheme.primary , fontWeight: FontWeight.bold),))
                ],
              )
            ],
          ),
        ),
    );
  }
}
