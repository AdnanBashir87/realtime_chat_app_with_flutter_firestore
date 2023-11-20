import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:realtime_chat_app_with_flutter_firestore/components/messages.dart';
import '../Constants/constants.dart';

class ChatScreen extends StatefulWidget {
  static String id = 'chat_screen';

  const ChatScreen({super.key});
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _controller = TextEditingController();
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  late User userLoggedIn;
  late String messageText;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        userLoggedIn = user;
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  /*  
  void getMessages() async {
    final messages = await _firestore.collection('messages').get();
    for (var message in messages.docs) {
      print(message.data());
    }
    messages.docs;
  }
  */
  void messagesStreams() async {
    await for (var snapshot in _firestore.collection('messages').snapshots()) {
      for (var message in snapshot.docs) {
        print(message.data());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kScaffoldBackgroundColor,
      appBar: AppBar(
        leading: null,
        actions: [
          IconButton(
              icon: const Icon(Icons.close),
              onPressed: () {
                // await _auth.signOut();
                // Navigator.pop(context);
                messagesStreams();
              }),
        ],
        title: const Text('⚡️Chat'),
        backgroundColor: kWhatsAppColor,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            StreamBuilder(
              stream: _firestore.collection('messages').snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                }

                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(
                      backgroundColor: kWhatsAppColor,
                    ), // Show a loading indicator
                  );
                }

                final messages = snapshot.data!.docs;
                // List<Widget> messagesWidgets = [];
                // if (snapshot.hasData) {
                //   for (var message in messages) {
                //     final messageText = message['text'];
                //     final messageSender = message['sender'];
                //     messagesWidgets
                //         .add(Text('$messageText from $messageSender'));
                //   }
                // }
                return Expanded(
                  child: ListView.builder(
                    itemCount: messages.length,
                    itemBuilder: (context, index) {
                      final message = messages[index];
                      final messageText = message['text'];
                      final messageSender = message['sender'];
                      return MessageBubble(
                        messageSender: messageSender,
                        messageText: messageText,
                      );
                    },
                  ),
                );
              },
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: _controller,
                    onChanged: (value) {
                      messageText = value;
                    },
                    decoration: kMessageTextFieldDecoration,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    print(messageText);
                    _firestore.collection('messages').add({
                      'text': messageText,
                      'sender': userLoggedIn.email,
                    });
                    _controller.clear();
                  },
                  icon: const Icon(
                    Icons.send,
                    color: Colors.blue,
                    fill: BorderSide.strokeAlignOutside,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
