import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:minimal_chat_app/Components/buttons.dart';
import 'package:minimal_chat_app/Controller/register_controller.dart';

import '../Components/text_field.dart';
class RegisterView extends GetView<RegisterController> {
  const RegisterView( { this.onTap, super.key});
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
            Text("Register for the chat app today " , style: TextStyle(color: Theme.of(context).colorScheme.primary , fontWeight: FontWeight.bold , fontSize: 17),),
            SizedBox(height: 16,),
            MyTextField(hintText: "Email" , hidden: false, textController: controller.emailController,),
            SizedBox(height: 10,),
            MyTextField(hintText: "Password" , hidden: true, textController: controller.passwordController,),
            SizedBox(height: 10,),
            MyTextField(hintText: "Confirm Password" , hidden: true, textController: controller.confPasswordController,),
            SizedBox(height: 20,),
            Buttons(text: "Register Now" , onTap: controller.Register,),
            SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already a Member!" ,style: TextStyle(color: Theme.of(context).colorScheme.primary),),
                SizedBox(width: 4,),
                InkWell(
                    onTap: onTap,
                    child: Text("Login Now" , style: TextStyle(color: Theme.of(context).colorScheme.primary , fontWeight: FontWeight.bold),))
              ],
            )
          ],
        ),
      ),
    );;
  }
}
