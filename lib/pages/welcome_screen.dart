import 'dart:async';

import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

import 'login_screen.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final globalScaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    Timer(
        Duration(seconds: 3),
        () => Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (BuildContext context) => Login())));

    return Scaffold(
      key: globalScaffoldKey,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset('assets/wave.png'),
            Container(
              height: 300,
              width: 300,
              child: Padding(
                padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
                child: AnimatedTextKit(
                  animatedTexts: [
                    RotateAnimatedText(
                      'Welcome',
                      textStyle: const TextStyle(
                        fontSize: 32.0,
                        fontWeight: FontWeight.bold,
                      ),
                      duration: const Duration(milliseconds: 5000),
                    ),
                  ],
                  // isRepeatingAnimation: true,
                  // totalRepeatCount: 10,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
