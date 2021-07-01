import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_reg/models/authentication.dart';
import 'package:login_reg/pages/login_screen.dart';
import 'package:login_reg/pages/user_profile_screen.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final AuthenticationService _authenticationService =
      new AuthenticationService();

  getAllUsersInfo() async {
    var firebaseAllUsers = await Firestore.instance.collection("user");
    Firestore.instance
        .collection("user")
        .getDocuments()
        .then((QuerySnapshot snapshot) {
      snapshot.documents.forEach((DocumentSnapshot doc) {
        print(doc.data);
      });
    });
  }

  // Future getAllData() async{
  //   var firestore = Firestore.instance;
  //
  //   QuerySnapshot qn= await firestore.collection('user').getDocuments();
  //
  //   return qn.documents;
  //   print(qn.documents);
  // }

  @override
  Widget build(BuildContext context) {
    //getAllUsersInfo();

    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.redAccent,
              ),
              child: Image(image: AssetImage('images/Screenshot_7.png')),
            ),
            ListTile(
              title: Text(
                'Profile',
                style: TextStyle(fontSize: 18.0, fontFamily: 'OverpassRegular'),
              ),
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => UserProfile()));
              },
            ),
            ListTile(
              title: Text(
                'Sign Out',
                style: TextStyle(fontSize: 18.0, fontFamily: 'OverpassRegular'),
              ),
              onTap: () {
                // AuthenticationService().signOut();
                // Navigator.pushReplacement(context,
                //     MaterialPageRoute(builder: (context) => AuthenticationService()));
              },
            ),
          ],
        ),
      ),
      // body: FutureBuilder(
      //     future: getAllUsersInfo(),
      //     builder: (_, snapshot) {
      //       if (snapshot.connectionState == ConnectionState.waiting) {
      //         return Center(
      //           child: Text("Loading"),
      //         );
      //       } else {
      //         return ListView.builder(
      //             itemCount: snapshot.data.length,
      //             itemBuilder: (_, index) {
      //               return ListTile(
      //                 title: Text(
      //                   snapshot.data[index].data['name'],
      //                 ),
      //               );
      //             });
      //       }
      //     }),
      body: StreamBuilder(
        stream: Firestore.instance.collection("user").snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView(
            children: snapshot.data.documents.map((document) {
              return Center(
                // child: Container(
                //   width: MediaQuery.of(context).size.width/1.2,
                //   height: MediaQuery.of(context).size.height/6,
                //   child: Text("Name: "+ document['name'],),
                // ),
                child: Column(
                  children: [
                    Text(
                      "Name: " + document['name'],
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      "Email: " + document['email'],
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    )
                  ],
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
