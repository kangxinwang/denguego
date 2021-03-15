import 'package:flutter/material.dart';
import 'package:denguego/constants.dart';

class AccountScreen extends StatefulWidget {
  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: Image.asset('images/profile.jpg'),
          ),
          Text(
            'Username',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: 'Montserrat',
              fontSize: 20,
              color: Colors.black,
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
          Divider(
            height: 25,
          ),
        ],
      ),
    );
  }
}
