import 'package:flutter/material.dart';
import 'GoogleMapsScreen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, GoogleMapScreen.id),
        tooltip: 'Increment',
        child: Icon(Icons.pin_drop),
      ),
    );
  }
}
