import 'package:flutter/material.dart';

class UserProfile extends StatefulWidget {
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  String userName = "";
  String userEmail = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: Text(userName), automaticallyImplyLeading: false),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Container(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(60.0, 100.0, 0.0, 0.0),
                  child: Row(
                    children: [
                      Text(
                        'Name:',
                        style: TextStyle(fontSize: 20.0),
                      ),
                      Text(
                        userName,
                        style: TextStyle(fontSize: 20.0),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 20.0,),
                Padding(
                  padding: EdgeInsets.fromLTRB(60.0, 0.0, 0.0, 0.0),
                  child: Row(
                    children: [
                      Text(
                        'Email Address:',
                        style: TextStyle(fontSize: 20.0),
                      ),
                      Text(
                        userEmail,
                        style: TextStyle(fontSize: 20.0),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
