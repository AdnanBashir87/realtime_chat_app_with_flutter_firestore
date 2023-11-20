import 'package:flutter/material.dart';
import 'package:realtime_chat_app_with_flutter_firestore/Constants/constants.dart';

class MessageBubble extends StatelessWidget {
  const MessageBubble({
    super.key,
    required this.messageSender,
    required this.messageText,
  });

  final String messageSender;
  final String messageText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(messageSender),
          // TODO Sender : You can add sender Info here like email.
          Material(
            color: kSenderMessageColor,
            elevation: 3.0,
            borderRadius: BorderRadius.circular(20),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Text(
                messageText,
                style: const TextStyle(fontSize: 15),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
