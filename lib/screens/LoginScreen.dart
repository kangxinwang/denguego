import 'package:denguego/constants.dart';
import 'package:denguego/screens/MainScreen.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'ForgotPasswordScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  static String id = 'LoginPageScreen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        automaticallyImplyLeading: false,
        backgroundColorStart: Color(0xff5B92C8),
        backgroundColorEnd: Color(0xffBCD49D),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            Text(
              'DengueGo!',
              style: TextStyle(
                fontSize: 25.0,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              width: 45,
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Center(
                child: Image.asset(
                  'images/login.png',
                ),
              ),
              Container(
                padding: EdgeInsets.all(20.0),
                child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                      borderSide: BorderSide.none,
                    ),
                    icon: Icon(Icons.person, color: Colors.black),
                    hintText: 'Username',
                    hintStyle: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(20.0),
                child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                      borderSide: BorderSide.none,
                    ),
                    icon: Icon(Icons.vpn_key_sharp, color: Colors.black),
                    hintText: 'Password',
                    hintStyle: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    ForgotPasswordScreen.id,
                  );
                },
                child: Text(
                  'Forgot Password',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Montserrat',
                    fontSize: 12,
                    color: Color(0xff5B92C8),
                  ),
                ),
              ),
              TextButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Color(0xff5B92C8)),
                    padding: MaterialStateProperty.all(EdgeInsets.only(
                        left: 50.0, top: 8.0, right: 50.0, bottom: 8.0))),
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    MainScreen.id,
                  );
                  //@todo check for user authentication/database admin
                },
                child: Text(
                  'Login',
                  textAlign: TextAlign.left,
                  style: fontTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
