import 'package:get/get.dart';

import 'package:minimal_chat_app/services/auth/auth_service.dart';

import '../services/chat/chat_service.dart';
class HomeController extends GetxController
{
  void logout()
  {
    AuthService().signOut();
  }
  final ChatService chatService = ChatService();
  final AuthService authService = AuthService();
}