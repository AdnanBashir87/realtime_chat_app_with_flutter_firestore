import 'package:flutter/material.dart';
import 'package:realtime_chat_app_with_flutter_firestore/Constants/constants.dart';

class ReUsableTextField extends StatelessWidget {
  final String hintText;
  final TextInputType inputType;
  final bool obscureText;
  final Function(String)? onChanged;
  const ReUsableTextField({
    super.key,
    required this.hintText,
    required this.onChanged,
    required this.obscureText,
    required this.inputType,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: inputType,
      obscureText: obscureText,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        disabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: kWhatsAppColor, width: 2.0),
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: kWhatsAppColor, width: 2.0),
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: kWhatsAppColor, width: 2.0),
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
      ),
    );
  }
}
