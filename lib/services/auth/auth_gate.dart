import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:minimal_chat_app/View/home_view.dart';
import 'package:minimal_chat_app/View/login_or_register.dart';
class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context , snapshot)
      {
        if(snapshot.hasData)
          {
            return  MyHomePage();
          }
        else
          {
            return LoginOrRegister();
          }
      }),
    );
  }
}
