import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

// class DatabaseMethod{
//   uploadUserInfo(userDataMap){
//     Firestore.instance.collection("user")
//         .add(userDataMap).catchError((e){
//       print(e.toString());
//     });
//   }
// }

class DatabaseMethod {
  uploadUserInfo(userDataMap) async {
    var firebaseUser = await FirebaseAuth.instance.currentUser();

    Firestore.instance
        .collection("user")
        .document(firebaseUser.uid)
        .setData(userDataMap)
        .catchError((e) {
      print(e.toString());
    });
  }
}
