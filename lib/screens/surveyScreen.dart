import 'package:flutter/material.dart';

class surveyScreen extends StatefulWidget {
  @override
  _surveyScreenState createState() => _surveyScreenState();
}

class _surveyScreenState extends State<surveyScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
            child: Text(
              "Survey Page",
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
              ),
            ),
          )
        ],
      ),
    );
  }
}
