import 'package:denguego/models/AppUser.dart';
import 'package:denguego/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:denguego/screens/SignupScreen.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //create user object based on firebase user
  AppUser _userFromFirebaseUser(User user) {
    return user != null ? AppUser(uid: user.uid) : null;
  }

// auth change user stream
  Stream<AppUser> get user {
    return _auth.authStateChanges().map((User user) => _userFromFirebaseUser(
        user)); // mapping the firebase user to the actual user
  }

  //sign in anonymously
  Future signInAnon() async {
    try {
      UserCredential result = await _auth
          .signInAnonymously(); // we need to await cause it will take some time to complete. we need to wait and get the result before proceeding to the next thing
      // also i think in the videos they said about AuthResult as the 'type' of return but it doesnt appear to be an exisiting class.
      // so ive changed it to UserCredential
      User user =
          result.user; // FirebaseUser deprecated and now changed to User
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // sign in with email and password
  Future signInWithEandP(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;

      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // register with email and password
  Future registerWithEandP(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password); // authresult changed to usercredential
      User user = result.user;

      //String name = getName(); // name is not accessible directly so calling this function i made in SignUpScreen.dart to get the name
      // create a new document for the user with uid
      await DatabaseService(uid: user.uid).updateUserData(name,
          email); // apparently can directly use the name attribute from SignUpScreen.dart file cause global

      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future <void> resetPassword ( String email) async {
    await _auth.sendPasswordResetEmail(email: email);
  }
  //sign out
  Future signOut() async {
    try {
      return await _auth
          .signOut(); // this signOut calling is calling a function signOut that is actually inbuilt(not the function we just made)
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
