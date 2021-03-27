import 'package:denguego/models/Location.dart';
import 'package:flutter/material.dart';

const fontTextStyle = TextStyle(
  fontWeight: FontWeight.bold,
  fontFamily: 'Montserrat',
  fontSize: 24,
  color: Colors.white,
);

const spacing = SizedBox(
  height: 50.0,
);

const textInputDecoration = InputDecoration(
  fillColor: Colors.white,
  filled: true,
  enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.white, width: 2.0)),
  focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.0)),
);
List<Location> locationList = [
  Location(location: "Kallang", cases: 12, zone: "Safe"),
  Location(location: "Yishun", cases: 30, zone: "Medium Risk"),
  Location(location: "Pasir Ris", cases: 50, zone: "High Risk"),
];
