import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:realtime_chat_app_with_flutter_firestore/components/reusableButton.dart';
import 'package:realtime_chat_app_with_flutter_firestore/components/reusableTextField.dart';
import 'package:realtime_chat_app_with_flutter_firestore/Constants/constants.dart';
import 'package:realtime_chat_app_with_flutter_firestore/screens/chat_screen.dart';

class LoginScreen extends StatefulWidget {
  static String id = 'login_screen';

  const LoginScreen({super.key});
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                title: 'Login',
                onPressed: () async {
                  setState(() {
                    showSpinner = true;
                  });
                  try {
                    final userExists = await _auth.signInWithEmailAndPassword(
                      email: email,
                      password: password,
                    );
                    if (userExists != null) {
                      Navigator.pushNamed(context, ChatScreen.id);
                    }
                    setState(() {
                      showSpinner = false;
                    });
                  } catch (e) {
                    print(
                        "Error: User is not registered Yet Please register your email first");
                    // Handle login error
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
