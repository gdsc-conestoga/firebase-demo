import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_firebase_demo/models/message.dart';

class MessageService {
  static Future<List<Message>> getMessages() async {
    final snapshots = await FirebaseFirestore.instance.collection('messages').get();
    return snapshots.docs.map((doc) => Message.fromDocumentSnapshot(doc)).toList();
  }

  static void addMessage(Message message) {
    FirebaseFirestore.instance.collection('messages').add(message.toMap());
  }
}