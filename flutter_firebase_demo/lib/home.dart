import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_demo/models/message.dart';
import 'package:flutter_firebase_demo/services/message_service.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Message> items = [];

  TextEditingController messageController = TextEditingController();

  @override
  void initState() {
    MessageService.getMessages().then((value) {
      setState(() {
        items = value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cool Messages')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, i) {
                return ListTile(
                  title: Text(items[i].title),
                  subtitle: Text(items[i].author),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: messageController,
                    decoration: const InputDecoration(labelText: 'Message'),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(onPressed: _postMessage, child: const Text('Post'))
              ],
            ),
          )
        ],
      ),
    );
  }

  void _postMessage() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    final message = Message(author: user.email ?? "Anonymous", title: messageController.text);
    MessageService.addMessage(message);
    final messages = await MessageService.getMessages();
    setState(() {
      items = messages;
    });
  }
}
