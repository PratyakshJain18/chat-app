import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:minimal_chat_app/services/auth/auth_service.dart';

import '../Routes.dart';
class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(child: Center(
            child: Icon(Icons.message , size: 40,),
          )),
          InkWell(
            onTap: (){Navigator.pop(context);},
            child: ListTile(
              leading: Icon(Icons.home),
              title: Text("H O M E"),
            ),
          ),
          InkWell(
            onTap: (){Get.toNamed(Routes.settingsPage);},
            child: ListTile(
              leading: Icon(Icons.settings),
              title: Text("S E T T I N G S"),
            ),
          ),
          InkWell(
            onTap: ()
            {
              AuthService().signOut();
            },
            child: ListTile(
              leading: Icon(Icons.logout),
              title: Text("L O G O U T"),
            ),
          )

        ],
      ),
    );
  }
}
