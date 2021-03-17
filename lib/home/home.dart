import 'package:denguego/screens/SignupScreen.dart';
import 'package:denguego/services/auth.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
            title: Text('Dengue Go'),
            backgroundColor: Colors.brown[400],
            elevation: 0.0,
            actions: <Widget>[
              TextButton.icon(
                icon: Icon(Icons.person),
                label: Text('logout'),
                onPressed: () async {
                  await _auth.signOut();
                },
              )
            ]),
        body: Column(
          children: <Widget>[
            Container(
              width: 150,
              height: 20,
              child: Center(
                child: Text('Welcome, ' + name),
              ),
            )
          ],
        ));
  }
}
