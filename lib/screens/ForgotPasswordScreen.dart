import 'package:denguego/shared/constants.dart';
import 'package:flutter/cupertino.dart';

import 'LoginScreen.dart';
import 'package:flutter/material.dart';
import 'package:denguego/services/auth.dart';
class ForgotPasswordScreen extends StatefulWidget {
  static String id = 'ForgotPasswordScreen';
  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final AuthService _auth = AuthService();
  String email= ' ';
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
                child: Column(
                    children: <Widget>[
                    SizedBox(height: 20.0),
                TextFormField(
                    decoration: textInputDecoration.copyWith(
                        hintText: 'Email'),
                    validator: (val) =>
                    val.isEmpty ? 'Enter email' : null,
                    onChanged: (val) {
                      setState(() => email = val);
                    }),
                ],
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                _auth.resetPassword(email);
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
