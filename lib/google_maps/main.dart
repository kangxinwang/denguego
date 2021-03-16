import 'package:flutter/material.dart';
import 'package:flutter_app/google_map_screen.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Maps',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dengue Cluster Maps')
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Dengue Cluster Map',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold
              )
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => GoogleMapScreen(),),),
        tooltip: 'Increment',
        child: Icon(Icons.pin_drop),
      ),
    );
  }
}
