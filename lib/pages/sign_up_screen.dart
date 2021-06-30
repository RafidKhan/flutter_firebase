import 'package:flutter/material.dart';
import 'package:login_reg/models/authentication.dart';
import 'package:login_reg/models/database_methods.dart';
import 'package:login_reg/pages/login_screen.dart';
import 'package:login_reg/widgets/custom_button.dart';
import 'package:login_reg/widgets/login_text.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final formkey = GlobalKey<FormState>();

  TextEditingController _passwordController = new TextEditingController();
  TextEditingController _emailEditingController = new TextEditingController();
  TextEditingController _nameEditingController = new TextEditingController();
  AuthenticationService _authenticationService = new AuthenticationService();
  DatabaseMethod _databaseMethod = new DatabaseMethod();

  RegisterUser() async {
    dynamic result = await _authenticationService.signUpWithEmailAndPassword(
        _nameEditingController.text.trim(),
        _emailEditingController.text.trim(),
        _passwordController.text.trim());
    if (formkey.currentState.validate()) {
      if (result == null) {
        print('Email Invalid');
      } else {
        Map<String, String> userDataMap = {
          "name": _nameEditingController.text.trim(),
          "email": _emailEditingController.text.trim(),
          "password": _passwordController.text.trim(),
        };
        await _authenticationService
            .signUpWithEmailAndPassword(
                _nameEditingController.text.trim(),
                _emailEditingController.text.trim(),
                _passwordController.text.trim())
            .then((result) {
          _databaseMethod.uploadUserInfo(userDataMap);
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => Login()));
        });
      }
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
                  'Welcome!',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 0.0),
                child: Material(
                  elevation: 2.0,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                    child: TextFormField(
                      controller: _nameEditingController,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          icon: Icon(
                            Icons.account_circle_outlined,
                            color: Colors.grey,
                          ),
                          hintText: 'Name'),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please Enter Name';
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
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value.isNotEmpty && !value.contains('@')) {
                          return 'Invalid Email Address';
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
                child: Material(
                  elevation: 2.0,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                    child: TextFormField(
                      obscureText: true,
                      controller: _passwordController,
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
                          hintText: 'Confirm Password'),
                      validator: (value) {
                        if (value.isEmpty &&
                            value != _passwordController.text.trim()) {
                          return 'Please Not Matched';
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
                    buttonText: 'Sign Up',
                  ),
                  onTap: () {
                    RegisterUser();
                  },
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                child: LoginAccountTxt(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
