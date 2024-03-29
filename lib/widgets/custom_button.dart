import 'package:flutter/material.dart';

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
        style: ElevatedButton.styleFrom(
            primary: Colors.blue,
            textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      ),
    );
  }
}
