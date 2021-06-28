import 'package:flutter/material.dart';
import 'package:login_reg/operations/login_btn_function.dart';
import 'package:login_reg/operations/sign_up_btn_function.dart';
import 'package:login_reg/pages/home_page_screen.dart';
import 'package:login_reg/pages/login_screen.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;

  CustomButton({this.buttonText});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        child: Text(buttonText),
        onPressed: () {
          if(buttonText== "Login")
          {
            LoginBTNonPressed();
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => HomePage(),
              ),
            );
          }
          else if(buttonText == "Sign Up")
          {
            SignUpBTNonPressed();
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => Login(),
              ),
            );
          }
        },
        style: ElevatedButton.styleFrom(
            primary: Colors.blue,
            textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      ),
    );
  }
}
