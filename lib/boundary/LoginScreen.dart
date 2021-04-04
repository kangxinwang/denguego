import 'package:denguego/boundary/MainScreen.dart';
import 'package:denguego/controller/AuthenticateManager.dart';
import 'package:denguego/shared/Constants.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:denguego/boundary/ForgotPasswordScreen.dart';
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
  final AuthenticateManager _auth = AuthenticateManager();
  final _formKey = GlobalKey<FormState>();
  bool showSpinner = false;
  //text field state
  String email = ' ';
  String password = ' ';
  String error = ' ';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: SizedBox(
                    height: 200,
                    child: Image.asset(
                      'images/boy.png',
                    ),
                  ),
                ),
              ),
              spacing,
              Text(
                'Welcome to DengueGo!'
                '\n'
                ' Let\'s all help in keeping our city safe!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 20.0),
                        TextFormField(
                            decoration:
                                textInputDecoration.copyWith(hintText: 'Email'),
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
                                setState(() => showSpinner = true);
                                final result = await _auth.signInWithEandP(
                                    email, password);
                                if (result != null) {
                                  Navigator.pushNamed(context, MainScreen.id);
                                }
                                if (result == null) {
                                  setState(() {
                                    error =
                                        'Invalid Credentials! Could not sign in.';
                                    showSpinner = false;
                                  });
                                }
                              }
                            }),
                        SizedBox(height: 12.0),
                        Text(
                          error,
                          style: TextStyle(color: Colors.red, fontSize: 14.0),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                              child: Text('Forgot password?'),
                              onPressed: () => Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ForgotPasswordScreen())),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
