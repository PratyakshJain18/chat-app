import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:minimal_chat_app/services/auth/auth_service.dart';
import 'package:minimal_chat_app/services/chat/chat_service.dart';

import '../Components/text_field.dart';

class ChatPage extends StatelessWidget {
  final String receiverEmail;
  final String receiverId;
  ChatPage({super.key, required this.receiverEmail, required this.receiverId});
  final TextEditingController messageController = TextEditingController();
  final ChatService chatService = ChatService();
  final AuthService authService = AuthService();

  //send messages
  void sendMessages() async {
    if (messageController.text.isNotEmpty) {
      await chatService.sendMessage(receiverId, messageController.text);
      messageController.clear();
    }
  }

  Widget buildMessageList() {
    String senderId = authService.getCurrentUser()!.uid;
    return StreamBuilder(
      stream: chatService.getMessages(receiverId, senderId),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text("Error");
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        } else {
          return ListView(
            children:
                snapshot.data!.docs
                    .map((doc) => buildMessageItem(doc))
                    .toList(),
          );
        }
      },
    );
  }

  Widget buildMessageItem(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>? ?? {};

    final message = data["message"]?.toString() ?? "[Empty]";
    final senderId = data["senderId"]?.toString() ?? "";
    final isCurrentUser = senderId == authService.getCurrentUser()?.uid;

    final alignment =
    isCurrentUser ? Alignment.centerRight : Alignment.centerLeft;
    final color = isCurrentUser ? Colors.green : Colors.grey.shade500;

    return Container(
      alignment: alignment,
      margin: const EdgeInsets.symmetric(vertical: 2.5, horizontal: 25),
      child: Column(
        crossAxisAlignment:
        isCurrentUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: color,
            ),
            padding: const EdgeInsets.all(14),
            margin: const EdgeInsets.symmetric(vertical: 2.5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  message,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.white),
                ),

                // Optional: format timestamp if present
                if (data['timestamp'] != null)
                  Text(
                    formatTimestamp(data['timestamp']),
                    style: const TextStyle(fontSize: 12, color: Colors.white70),
                  )
                else
                  const Text(
                    "Time unknown",
                    style: TextStyle(fontSize: 12, color: Colors.white70),
                  )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildUserInput() {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(bottom:18.0),
            child: MyTextField(
              textController: messageController,
              hintText: "Type a Message",
              hidden: false,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right:8.0),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.green
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(bottom:4.0),
                child: IconButton(onPressed: sendMessages, icon: Icon(Icons.arrow_upward)),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text(receiverEmail)),
      body: Column(
        children: [
          Expanded(child: buildMessageList()),
          //textfield and send button
          buildUserInput(),
        ],
      ),
    );
  }
  String formatTimestamp(Timestamp timestamp) {
    final dt = timestamp.toDate();
    return "${dt.hour}:${dt.minute.toString().padLeft(2, '0')}";
  }
}
