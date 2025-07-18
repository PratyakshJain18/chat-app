import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:minimal_chat_app/Controller/settings_controller.dart';
class Settings extends GetView<SettingsController> {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.grey[100],
        elevation: 4,
        shadowColor: Colors.black,
        title: Text("Settings"),
      ),
    );
  }
}
