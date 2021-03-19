import 'package:denguego/services/auth.dart';
import 'package:denguego/shared/constants.dart';
import 'package:denguego/shared/loading.dart';
import 'ForgotPasswordScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  final Function toggleView;
  LoginScreen({this.toggleView});
  static String id = 'LoginPageScreen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  //text field state
  String email = ' ';
  String password = ' ';
  String error = ' ';
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            appBar: AppBar(
              actions: <Widget>[
                TextButton.icon(
                  icon: Icon(Icons.person),
                  label: Text('Register'),
                  onPressed: () {
                    widget
                        .toggleView(); // property of the stateful widget of the sign in class
                  },
                )
              ],
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
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Center(
                    child:
                        Image.asset('images/boy.png', height: 204, width: 194),
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
                  Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 20.0, horizontal: 50.0),
                      child: Form(
                        key: _formKey,
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
                            SizedBox(height: 20.0),
                            TextFormField(
                                decoration: textInputDecoration.copyWith(
                                    hintText: 'Password'),
                                obscureText: true,
                                validator: (val) => val.length < 6
                                    ? 'Incorrect password! Please re-enter'
                                    : null,
                                onChanged: (val) {
                                  setState(() => password = val);
                                }),
                            SizedBox(height: 20.0),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: Color(0xff5B92C8)),
                                child: Text('Sign in',
                                    style: TextStyle(color: Colors.white)),
                                onPressed: () async {
                                  if (_formKey.currentState.validate()) {
                                    setState(() => loading = true);
                                    dynamic result = await _auth
                                        .signInWithEandP(email, password);

                                    if (result == null) {
                                      setState(() {
                                        error =
                                            'Invalid Credentials! Could not sign in.';
                                        loading = false;
                                      });
                                    }
                                  }
                                }),
                            SizedBox(height: 12.0),
                            Text(
                              error,
                              style:
                                  TextStyle(color: Colors.red, fontSize: 14.0),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                              TextButton(child: Text('Forgot password?'), onPressed: ()=> Navigator.of(context).push(MaterialPageRoute(builder: (context) => ForgotPasswordScreen())),),
                            ],

                            ),
                          ],
                        ),
                      )),
                ],

              ),
            ),
          );
  }
}
