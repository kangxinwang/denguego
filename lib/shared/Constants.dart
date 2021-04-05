import 'package:denguego/entity/ClusterLocation.dart';
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

// List<ClusterLocation> savedList = [];

const List<String> DengueFacts = [
  'Papaya leaf extract can treat dengue fever.',
  'Fever and muscle pain from dengue lasts about one to two weeks',
  'Dengue is transmitted by Aedes mosquitoes',
  'Dengue fever may occur from 3 to 14 days after being bitten',
];

/*[
  ClusterLocation(location: "Kallang", cases: 12, zone: "Safe",),
  ClusterLocation(location: "Yishun", cases: 30, zone: "Medium Risk"),
  ClusterLocation(location: "Pasir Ris", cases: 50, zone: "High Risk"),
];*/
