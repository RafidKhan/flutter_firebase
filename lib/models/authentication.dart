import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_reg/models/userModel.dart';

class AuthenticationService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  Future signUpWithEmailAndPassword(String name, String email, String password) async{
    try{
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password);
      FirebaseUser firebaseUser = result.user;
      //return _userFromFirebaseUser(firebaseUser);
      return firebaseUser;

    }
    catch(e){
      print(e.toString());
      //return null;
    }
  }

  // Future signInwithEmailAndPassword(String email, String password) async {
  //   try {
  //     AuthResult result = await _auth.signInWithEmailAndPassword(
  //         email: email, password: password);
  //     FirebaseUser firebaseUser = result.user;
  //
  //     return _userFromFirebaseUser(firebaseUser);
  //   } catch (e) {
  //     print(e.toString());
  //     //return null;
  //   }
  // }
}
