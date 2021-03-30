import 'package:denguego/controller/UserManager.dart';
import 'package:flutter/material.dart';
import 'package:denguego/shared/constants.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class SignupScreen extends StatefulWidget {
  final Function toggleView;
  SignupScreen({this.toggleView});
  static String id = 'SignUpScreen';
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool showSpinner = false;
  String email = ' ';
  String password = ' ';
  String error = ' ';
  String name = ' ';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: <Widget>[
          TextButton.icon(
            icon: Icon(Icons.person),
            label: Text('Sign in'),
            onPressed: () {
              widget
                  .toggleView(); // property of the stateful widget in register class
            },
          )
        ],
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
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
            child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Center(
                      child: Image.asset('images/signUp.png'),
                    ),
                    SizedBox(height: 20.0),
                    TextFormField(
                        decoration:
                            textInputDecoration.copyWith(hintText: 'Name'),
                        validator: (val) =>
                            val.isEmpty ? 'Enter your name' : null,
                        onChanged: (val) {
                          setState(() => name = val);
                        }),
                    SizedBox(height: 20.0),
                    TextFormField(
                        decoration:
                            textInputDecoration.copyWith(hintText: 'Email'),
                        validator: (val) =>
                            val.isEmpty ? 'Enter an email' : null,
                        onChanged: (val) {
                          setState(() => email = val);
                        }),
                    SizedBox(height: 20.0),
                    TextFormField(
                        decoration:
                            textInputDecoration.copyWith(hintText: 'Password'),
                        validator: (val) => val.length < 6
                            ? 'Enter a password with 6+ characters'
                            : null,
                        obscureText: true,
                        onChanged: (val) {
                          setState(() => password = val);
                        }),
                    SizedBox(height: 20.0),
                    ElevatedButton(
                      style:
                          ElevatedButton.styleFrom(primary: Color(0xff5B92C8)),
                      child: Text('Register',
                          style: TextStyle(color: Colors.white)),
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          setState(() => showSpinner = true);
                          final result = await _auth.registerNewUser(
                              email, password, name);
                          if (result == null) {
                            setState(
                                () => error = 'Please enter a valid email!');
                            showSpinner = false;
                          }
                        }
                      },
                    ),
                    SizedBox(height: 12.0),
                    Text(
                      error,
                      style: TextStyle(color: Colors.red, fontSize: 14.0),
                    ),
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
