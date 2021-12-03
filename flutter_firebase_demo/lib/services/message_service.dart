import 'package:flutter_firebase_demo/models/message.dart';

class MessageService {
  static final List<Message> _messages = [];

  static List<Message> getMessages() {
    return _messages;
  }

  static void addMessage(Message message) {
    _messages.add(message);
  }
}