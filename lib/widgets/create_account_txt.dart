import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:login_reg/pages/sign_up_page.dart';


class CreateAccountTxt extends StatefulWidget {
  @override
  _CreateAccountTxtState createState() => _CreateAccountTxtState();
}

class _CreateAccountTxtState extends State<CreateAccountTxt> {
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: "Don't Have Account?",
        style: DefaultTextStyle.of(context).style,
        children: <TextSpan>[
          TextSpan(
            text: "Create Account!",
            style: TextStyle(
              color: Colors.blue[900],
              fontWeight: FontWeight.bold,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => SignUp(),
                ),
              ),
          ),
        ],
      ),
    );
  }
}
