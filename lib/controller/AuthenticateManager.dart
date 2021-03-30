import 'package:denguego/entity/UserAccount.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //create user object based on firebase user
  UserAccount _userFromFirebaseUser(User user) {
    return user != null ? UserAccount(uid: user.uid) : null;
  }

// auth change user stream
  Stream<UserAccount> get user {
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
  Future registerNewUser(String email, String password, String name) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password); // authresult changed to usercredential
      User user = result.user;

      // create a new document for the user with uid
      await updateUserName(name, result.user);

      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future updateUserName(String name, User currentUser) async {
    await currentUser.updateProfile(displayName: name);
    await currentUser.reload();
  }

  Future<void> resetPassword(String email) async {
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

  Future getCurrentUser() async {
    // ignore: await_only_futures
    return await _auth.currentUser;
  }
}
