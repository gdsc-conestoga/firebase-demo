import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  String title;
  String author;

  Message({
    required this.title,
    required this.author,
  });

  static Message fromDocumentSnapshot(DocumentSnapshot doc) {
    return Message (author: doc['author'], title: doc['title']);
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'author': author
    };
  }
}
