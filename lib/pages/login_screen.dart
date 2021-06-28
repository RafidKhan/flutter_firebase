import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:login_reg/pages/sign_up_page.dart';
import 'package:login_reg/widgets/create_account_txt.dart';
import 'package:login_reg/widgets/custom_button.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final GlobalKey<FormState> formStateLogin = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: formStateLogin,
          child: Column(
            children: [
              Image.asset('assets/wave.png'),
              Padding(
                padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                child: Text(
                  'Login To Continue',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              SizedBox(height: 20.0),
              Padding(
                padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                child: Material(
                  elevation: 2.0,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          icon: Icon(
                            Icons.mail,
                            color: Colors.grey,
                          ),
                          hintText: 'Email'),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Padding(
                padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                child: Material(
                  elevation: 2.0,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                    child: TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          icon: Icon(
                            Icons.lock,
                            color: Colors.grey,
                          ),
                          hintText: 'Password'),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Padding(
                padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                child: CustomButton(
                  buttonText: 'Login',
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                child: CreateAccountTxt(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
