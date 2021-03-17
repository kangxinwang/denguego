import 'package:flutter/material.dart';
import 'SignupScreen.dart';
import 'LoginScreen.dart';
import 'package:denguego/shared/constants.dart';

class StartingScreen extends StatefulWidget {
  static String id = 'StartingScreen';
  @override
  _StartingScreenState createState() => _StartingScreenState();
}

class _StartingScreenState extends State<StartingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.topRight,
              colors: [
                Color(0xff5B92C8),
                Color(0xffBCD49D),
              ],
            ),
          ),
        ),
        title: Text(
          'DengueGo!',
          style: TextStyle(
            fontSize: 25.0,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          spacing,
          Center(
            child: Image.asset('images/boy.png', height: 204, width: 194),
          ),
          spacing,
          Text(
            'Welcome to DengueGo!'
            '\n'
            ' Let\'s all help in keeping our city safe!',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 13,
              fontWeight: FontWeight.bold,
            ),
          ),
          spacing,
          TextButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Color(0xff5B92C8)),
                padding: MaterialStateProperty.all(EdgeInsets.only(
                    left: 50.0, top: 8.0, right: 50.0, bottom: 8.0))),
            onPressed: () {
              Navigator.pushNamed(
                context,
                LoginScreen.id,
              );
            },
            child: Text(
              'Log In',
              textAlign: TextAlign.center,
              style: fontTextStyle,
            ),
          ),
          Text(
            'or',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          TextButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Color(0xff5B92C8)),
              padding: MaterialStateProperty.all(EdgeInsets.only(
                left: 40.0,
                top: 8.0,
                bottom: 8.0,
                right: 40.0,
              )),
            ),
            onPressed: () {
              Navigator.pushNamed(
                context,
                SignupScreen.id,
              );
            },
            child: Text(
              'Sign Up',
              textAlign: TextAlign.center,
              style: fontTextStyle,
            ),
          ),
        ],
      ),
    );
  }
}
