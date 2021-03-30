import 'package:denguego/boundary/SignupScreen.dart';
import 'package:denguego/boundary/LoginScreen.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn = true;

  void toggleView() {
    setState(() => showSignIn = !showSignIn);
  }

  @override
  Widget build(BuildContext context) {
    if (showSignIn) {
      return LoginScreen(toggleView: toggleView);
    } else {
      return SignupScreen(toggleView: toggleView);
    }
  }
}
