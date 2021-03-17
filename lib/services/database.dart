import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService(
      {this.uid}); // this is how we get the uid from anywhere that calls this class. So instead of passing values to functions, here we are using constructors to pass/initialize values
  // collection reference
  // this is used to interact with collections on the firestore database

  final CollectionReference userDetails =
      FirebaseFirestore.instance.collection('Details');
  // userDetails will be the reference we need to use when we want to access that colllection

  Future updateUserData(String name, String email) async {
    return await userDetails.doc(uid).set({
      'Name': name,
      'Email': email,
    });
  }
}
