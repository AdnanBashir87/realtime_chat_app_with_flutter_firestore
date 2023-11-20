import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:realtime_chat_app_with_flutter_firestore/components/reusableButton.dart';
import 'package:realtime_chat_app_with_flutter_firestore/Constants/constants.dart';
import 'package:realtime_chat_app_with_flutter_firestore/screens/login_screen.dart';
import 'package:realtime_chat_app_with_flutter_firestore/screens/registration_screen.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = 'welcome_screen';

  const WelcomeScreen({super.key});

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 1), vsync: this);
    // animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);
    // controller.forward();

    animation =
        ColorTween(begin: Colors.blueGrey, end: kScaffoldBackgroundColor)
            .animate(controller);
    controller.forward();

    // animation.addStatusListener((status) {
    //   if (status == AnimationStatus.completed) {
    //     controller.reverse(from: 1.0);
    //   } else if (status == AnimationStatus.dismissed) {
    //     controller.forward();
    //   }
    // });

    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const width = double.infinity;
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Hero(
                  tag: 'logo',
                  child: SizedBox(
                    height: 60.0,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
                AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      'Flash Chat',
                      textStyle: const TextStyle(
                        color: Colors.black54,
                        fontSize: 40,
                        fontWeight: FontWeight.w900,
                      ),
                    )
                  ], //'Secret Chat',
                ),
              ],
            ),
            const SizedBox(height: 48.0),
            ReUsableButton(
              color: kWhatsAppColor,
              title: 'Log In',
              onPressed: () {
                Navigator.pushNamed(context, LoginScreen.id);
              },
            ),
            ReUsableButton(
              color: kWhatsAppColor,
              title: 'Register',
              onPressed: () {
                Navigator.pushNamed(context, RegistrationScreen.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}
