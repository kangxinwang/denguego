import 'package:flutter/material.dart';
import 'package:denguego/screens/homePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dengue Go',
      initialRoute: homePage.id,
      routes: {
        homePage.id: (context) => homePage(),
      },
    );
  }
}
