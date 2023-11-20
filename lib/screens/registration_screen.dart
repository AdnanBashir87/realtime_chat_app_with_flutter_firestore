import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:realtime_chat_app_with_flutter_firestore/components/reusableButton.dart';
import 'package:realtime_chat_app_with_flutter_firestore/components/reusableTextField.dart';
import 'package:realtime_chat_app_with_flutter_firestore/Constants/constants.dart';
import 'package:realtime_chat_app_with_flutter_firestore/screens/chat_screen.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegistrationScreen extends StatefulWidget {
  static String id = 'registration_screen';

  const RegistrationScreen({super.key});
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;
  late String email, password;
  bool showSpinner = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kScaffoldBackgroundColor,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Hero(
                tag: 'logo',
                child: Container(
                  height: 200.0,
                  child: Image.asset('images/logo.png'),
                ),
              ),
              const SizedBox(height: 8.0),
              ReUsableTextField(
                hintText: 'Enter your email',
                onChanged: (value) {
                  email = value;
                },
                obscureText: false,
                inputType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 8.0),
              ReUsableTextField(
                hintText: 'Enter your Password',
                onChanged: (value) {
                  password = value;
                },
                obscureText: true,
                inputType: TextInputType.text,
              ),
              const SizedBox(height: 24.0),
              ReUsableButton(
                color: kWhatsAppColor,
                title: 'Register',
                onPressed: () async {
                  setState(() {
                    showSpinner = true;
                  });
                  try {
                    final newUser = await _auth.createUserWithEmailAndPassword(
                      email: email,
                      password: password,
                    );
                    if (newUser != null) {
                      Navigator.pushNamed(context, ChatScreen.id);
                    }
                    setState(() {
                      showSpinner = false;
                    });
                  } catch (e) {
                    print(e);
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
