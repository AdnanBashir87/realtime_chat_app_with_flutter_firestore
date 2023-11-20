import 'package:flutter/material.dart';
import 'package:realtime_chat_app_with_flutter_firestore/Constants/constants.dart';

class ReUsableButton extends StatelessWidget {
  final Color color;
  final String title;
  final Function()? onPressed;
  const ReUsableButton({
    super.key,
    required this.color,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: color,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            title,
            style: kTextStyle,
          ),
        ),
      ),
    );
  }
}
