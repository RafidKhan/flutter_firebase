import 'package:flutter/material.dart';
import 'package:login_reg/pages/welcome_screen.dart';
import 'package:login_reg/widgets/create_account_txt.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Firebase Project',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        //accentColor: Color(0x99c2ff),
      ),

      home: WelcomePage(),
    );
  }
}
