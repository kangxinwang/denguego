import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

class NotificationScreen extends StatefulWidget {
  static String id = 'NotificationScreen';
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
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
              'Notifications',
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
    );
  }
}