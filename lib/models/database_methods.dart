import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethod{
  uploadUserInfo(userDataMap){
    Firestore.instance.collection("user")
        .add(userDataMap).catchError((e){
      print(e.toString());
    });
  }
}