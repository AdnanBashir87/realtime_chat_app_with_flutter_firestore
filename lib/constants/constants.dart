import 'package:flutter/material.dart';

const kScaffoldBackgroundColor = Color.fromARGB(255, 246, 242, 242);
const kSenderMessageColor = Color(0xFFD9FDD3);
const kWhatsAppColor = Color(0xFF00A884);

const kSendButtonTextStyle = TextStyle(
  color: Colors.lightBlueAccent,
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);

const kMessageTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintText: 'Type your message',
  filled: true,
  fillColor: Colors.white,
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.white, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(20)),
  ),
  disabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.white, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(20)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.white, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(20)),
  ),
);

const kTextStyle = TextStyle(color: Colors.white, fontSize: 16);
