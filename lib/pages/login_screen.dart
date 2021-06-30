import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:login_reg/models/authentication.dart';
import 'package:login_reg/models/database_methods.dart';
import 'package:login_reg/pages/home_page_screen.dart';
import 'package:login_reg/pages/sign_up_screen.dart';
import 'package:login_reg/widgets/create_account_txt.dart';
import 'package:login_reg/widgets/custom_button.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formkey = GlobalKey<FormState>();

  TextEditingController _passwordController = new TextEditingController();
  TextEditingController _emailEditingController = new TextEditingController();
  AuthenticationService _authenticationService = new AuthenticationService();
  DatabaseMethod _databaseMethod = new DatabaseMethod();

  void LoginUser() async{
    dynamic authResult = await _authenticationService.logInWithEmailAndPassword(_emailEditingController.text.trim(), _passwordController.text.trim());
    if(authResult==null)
      {
        print("Sign In Error");
      }
    else{
      _emailEditingController.clear();
      _passwordController.clear();
      print("Login Succesfull");
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => HomePage(),
        ),
      );
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: formkey,
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
                      controller: _emailEditingController,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          icon: Icon(
                            Icons.mail,
                            color: Colors.grey,
                          ),
                          hintText: 'Email'),
                      validator: (value) {
                        if (value.isNotEmpty && !value.contains('@')) {
                          return 'Invalid Email Address';
                        } else {
                          return null;
                        }
                      },
                      keyboardType: TextInputType.emailAddress,
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
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          icon: Icon(
                            Icons.lock,
                            color: Colors.grey,
                          ),
                          hintText: 'Password'),
                      validator: (value) {
                        if (value.length < 6) {
                          return 'Please Enter a 6 Digit Password';
                        } else if (value.isEmpty) {
                          return null;
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Padding(
                padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                child: GestureDetector(
                  child: CustomButton(
                    buttonText: 'Login',
                  ),
                  onTap: () {
                    LoginUser();
                  },
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
