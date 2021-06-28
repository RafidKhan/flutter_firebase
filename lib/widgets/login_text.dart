import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:login_reg/pages/login_screen.dart';

class LoginAccountTxt extends StatefulWidget {
  @override
  _LoginAccountTxtState createState() => _LoginAccountTxtState();
}

class _LoginAccountTxtState extends State<LoginAccountTxt> {
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: "Already A User?",
        style: DefaultTextStyle.of(context).style,
        children: <TextSpan>[
          TextSpan(
            text: "Login",
            style: TextStyle(
              color: Colors.blue[900],
              fontWeight: FontWeight.bold,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => Login(),
                ),
              ),
          ),
        ],
      ),
    );
  }
}
