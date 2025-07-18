import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:minimal_chat_app/Controller/home_controller.dart';
import 'package:minimal_chat_app/View/chat_page.dart';
import 'package:minimal_chat_app/services/auth/auth_service.dart';
import 'package:minimal_chat_app/services/chat/chat_service.dart';
import '../Components/my_drawer.dart';
import '../Components/user_tile.dart';
class MyHomePage extends GetView<HomeController> {
   MyHomePage({super.key});
   final AuthService authService=AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.grey[100],
        elevation: 4,
        shadowColor: Colors.black,
        title: Text("Home"),
        actions: [
          IconButton(onPressed: controller.logout , icon: Icon(Icons.logout)),
        ],
      ),
      drawer: MyDrawer(),
      body: buildUserList(),
    );
  }
   Widget buildUserList()
   {
     return StreamBuilder(
         stream: controller.chatService.getUsersStream(),
         builder: (context , snapshot)
         {
           if(snapshot.hasError)
           {
             return Text("Error");
           }
           else if(snapshot.connectionState== ConnectionState.waiting)
           {
             return Text("Loading");
           }
           return ListView(
             children: snapshot.data!.map<Widget>((userData)=> buildUserListItem(userData)).toList(),
           );
         }
     );
   }
   // building individual list tile for every user
   Widget buildUserListItem(Map<String , dynamic> userData )
   {
     // displaying all user except the current user
     if(userData['email']!=controller.authService.getCurrentUser()!.email)
     {
       return UserTile(
         text:userData['email'],
         onTap: ()
         {
           Get.to(ChatPage(receiverEmail: userData["email"], receiverId: userData['uid']));
         },
       );
     }
     else
     {
       return Container();
     }

   }
}
