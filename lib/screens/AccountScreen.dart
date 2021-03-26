import 'package:denguego/screens/LoginScreen.dart';
import 'package:denguego/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:denguego/services/auth.dart';

class AccountScreen extends StatefulWidget {
  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  final AuthService _auth = AuthService();
  final _formKeyHome = GlobalKey<FormState>();
  final _formKeyPassword = GlobalKey<FormState>();
  String address =
      '50 Nanyang Ave, Nanyang Technological University, Singapore 639798';
  String email = '';
  String newAddress = '';
  void changeAddress(String addy) {
    setState(() {
      address = addy;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                /*Image.asset(
                  'images/profile.png',
                ),*/
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 15, 8, 15),
                  child: Center(
                    child: Card(
                      elevation: 10,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 15, 10, 15),
                        child: Column(
                          children: [
                            Center(
                              child: FutureBuilder(
                                  future: _auth.getCurrentUser(),
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.done) {
                                      return Text(
                                        'Hi, ${snapshot.data.displayName}',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Montserrat',
                                          fontSize: 20,
                                          color: Colors.black,
                                        ),
                                      );
                                    } else {
                                      return CircularProgressIndicator();
                                    }
                                  }),
                            ),
                            /*Icon(
                                Icons.account_box,
                                size: 70,
                              ),*/
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Icon(
                                        Icons.email,
                                      ),
                                    ),
                                    FutureBuilder(
                                        future: _auth.getCurrentUser(),
                                        builder: (context, snapshot) {
                                          if (snapshot.connectionState ==
                                              ConnectionState.done) {
                                            return Text(
                                              "${snapshot.data.email}",
                                              style: TextStyle(
                                                fontFamily: 'Montserrat',
                                                fontSize: 15,
                                                color: Colors.black,
                                              ),
                                            );
                                          } else {
                                            return CircularProgressIndicator();
                                          }
                                        }),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Icon(
                                        Icons.room,
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        address,
                                        style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontSize: 15,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Divider(
                  height: 25,
                ),
                Text(
                  'Change password',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Montserrat',
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
                Form(
                  key: _formKeyPassword,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Card(
                          child: TextFormField(
                            decoration: textInputDecoration.copyWith(
                                hintText: 'Confirm Email ID'),
                            validator: (val) =>
                                val.isEmpty ? 'Enter valid Email' : null,
                            onChanged: (val) {
                              email = val;
                            },
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Color(0xff5B92C8)),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 12.0),
                              child: Text('Confirm',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15)),
                            ),
                            onPressed: () async {
                              if (_formKeyPassword.currentState.validate()) {
                                _auth.resetPassword(email);
                              }
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Divider(
                  height: 25,
                ),
                Text(
                  'Change home address',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Montserrat',
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
                Form(
                  key: _formKeyHome,
                  child: Column(
                    children: [
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: TextFormField(
                              decoration: textInputDecoration.copyWith(
                                  hintText: 'Enter new home address'),
                              validator: (val) => val.isEmpty
                                  ? 'Enter a valid home address'
                                  : null,
                              onChanged: (val) {
                                newAddress = val;
                              }),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Color(0xff5B92C8)),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 12.0),
                              child: Text('Confirm',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15)),
                            ),
                            onPressed: () async {
                              if (_formKeyHome.currentState.validate()) {
                                changeAddress(newAddress);
                                print(newAddress);
                              }
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Divider(
                  height: 25,
                ),
                Center(
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xffd05f5f),
                        padding: EdgeInsets.all(8),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(2.5),
                            child: Icon(Icons.logout),
                          ),
                          Text('Log Out',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20)),
                        ],
                      ),
                      onPressed: () async {
                        await _auth.signOut();
                        Navigator.pop(context);
                      }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
