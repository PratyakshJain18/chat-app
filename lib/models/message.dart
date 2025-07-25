import 'package:cloud_firestore/cloud_firestore.dart';

class Messages {
  final String senderId;
  final String senderEmail;
  final String receiverId;
  final String message;
  final Timestamp timestamp;
  final String time;
  Messages({
    required this.senderId,
    required this.senderEmail,
    required this.receiverId,
    required this.message,
    required this.timestamp,
    required this.time
  });
  Map<String, dynamic> toMap()
  {
    return
        {
          'senderId':senderId,
          'senderEmail':senderEmail,
          'receiverId':receiverId,
           'message':message,
          'timestamp':timestamp,
          'time':time
        };
  }
}
