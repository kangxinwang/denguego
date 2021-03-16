import 'LoginScreen.dart';
import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

class ForgotPasswordScreen extends StatefulWidget {
  static String id = 'ForgotPasswordScreen';
  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
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
        child: Column(
          children: <Widget>[
            Center(
              child: Image.asset(
                'images/forgot_password.png',
              ),
            ),
            //spacing,
            Flexible(
              child: Container(
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
                    hintText: 'Enter email address',
                    hintStyle: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  LoginScreen.id,
                );
              },
              child: Text(
                'Submit',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Montserrat',
                  fontSize: 12,
                  color: Color(0xff5B92C8),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}