import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';
import 'package:minimal_chat_app/models/message.dart';

class ChatService {
  //instance of firestore and auth
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseAuth fireAuth = FirebaseAuth.instance;
  // get the stream of users
  Stream<List<Map<String, dynamic>>> getUsersStream() {
    return firestore.collection("Users").snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        final user = doc.data();
        return user;
      }).toList();
    });
  }

  //send message
  Future<void> sendMessage(String receiverId, message) async {
    final String currentUserId = fireAuth.currentUser!.uid;
    final String currentUserEmail = fireAuth.currentUser?.email! ?? "No Email";
    final Timestamp timestamp = Timestamp.now();
    DateTime dateTime = timestamp.toDate();
    String formattedTime=DateFormat.jm().format(dateTime);
    Messages newMesssage = Messages(
      senderId: currentUserId,
      senderEmail: currentUserEmail,
      receiverId: receiverId,
      message: message,
      timestamp: timestamp,
      time: formattedTime
    );
    // constructing a chat room id for two users
    List<String> ids=[currentUserId , receiverId];
    ids.sort();
    String chatRoomId=ids.join('_');

    //add new messages to database
    await firestore.collection("chat_rooms").doc(chatRoomId).collection("messages").add(newMesssage.toMap());
  }

  //get message
  Stream<QuerySnapshot> getMessages(String userId , otherUserId)
  {
    List<String > ids=[userId , otherUserId];
    ids.sort();
    String chatRoomId=ids.join('_');  
    return firestore.collection("chat_rooms").doc(chatRoomId).collection('messages').orderBy("timestamp" , descending: false).snapshots();
  }
}
