import 'package:denguego/screens/ForgotPasswordScreen.dart';
import 'package:denguego/screens/LoginScreen.dart';
import 'package:denguego/screens/NotificationScreen.dart';
import 'package:denguego/screens/SignupScreen.dart';
import 'package:denguego/screens/StartingScreen.dart';
import 'package:flutter/material.dart';
import 'package:denguego/screens/MainScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dengue Go',
      initialRoute: StartingScreen.id,
      routes: {
        MainScreen.id: (context) => MainScreen(),
        ForgotPasswordScreen.id: (context) => ForgotPasswordScreen(),
        StartingScreen.id: (context) => StartingScreen(),
        SignupScreen.id: (context) => SignupScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        NotificationScreen.id: (context) => NotificationScreen(),
      },
    );
  }
}
