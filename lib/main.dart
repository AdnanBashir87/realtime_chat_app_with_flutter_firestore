import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:realtime_chat_app_with_flutter_firestore/firebase_options.dart';
import 'package:realtime_chat_app_with_flutter_firestore/screens/chat_screen.dart';
import 'package:realtime_chat_app_with_flutter_firestore/screens/login_screen.dart';
import 'package:realtime_chat_app_with_flutter_firestore/screens/registration_screen.dart';
import 'package:realtime_chat_app_with_flutter_firestore/screens/welcome_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const FlashChat());
}

class FlashChat extends StatelessWidget {
  const FlashChat({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: 'welcome_screen',
      routes: {
        WelcomeScreen.id: (context) => const WelcomeScreen(),
        ChatScreen.id: (context) => const ChatScreen(),
        RegistrationScreen.id: (context) => const RegistrationScreen(),
        LoginScreen.id: (context) => const LoginScreen(),
      },
    );
  }
}
