// import 'package:flutter/material.dart';
// import 'package:navigation_demo_starter/screen0.dart';
// import 'screen2.dart';
// import 'package:fl_chart/fl_chart.dart';
// import 'Indicator.dart';
//
// import 'package:geocode/geocode.dart';
//
// final _formKey = GlobalKey<FormState>();
//
// String enteredName;
// String enteredUsername;
// String enteredEmail;
// String enteredPassword;
// String enteredConfirmPassword;
//
// class Screen1 extends StatefulWidget {
//   static Coordinates coordinates;
//   @override
//   _Screen1State createState() => _Screen1State();
// }
//
// class _Screen1State extends State<Screen1> {
//   int i = 0;
//   int touchedIndex;
//   List<bool> isSelected = [true, false];
//
//   @override
//   Widget build(BuildContext context) {
//     List<Widget> options = [
//       Container(
//         child: Text("jaa"),
//         color: Colors.red,
//       ),
//       Container(
//         child: Text("haha"),
//         color: Colors.blue,
//       )
//     ];
//     return MaterialApp(
//       home: Scaffold(
//         extendBodyBehindAppBar: true,
//         appBar: AppBar(
//           backgroundColor: Colors.transparent,
//           leading: IconButton(
//             icon: Icon(Icons.arrow_back_ios, color: Colors.black),
//             onPressed: () => Navigator.of(context).pop(),
//           ),
//           elevation: 0.0,
//         ),
//         body: SafeArea(
//           child: Column(
//             children: [
//               Center(
//                 child: ToggleButtons(
//                   children: [
//                     Text("hha"),
//                     Text("ehehe"),
//                   ],
//                   onPressed: (int value) {
//                     setState(() {
//                       i = value;
//
//                       for (int buttonIndex = 0;
//                           buttonIndex < isSelected.length;
//                           buttonIndex++) {
//                         if (buttonIndex == i) {
//                           isSelected[buttonIndex] = true;
//                         } else {
//                           isSelected[buttonIndex] = false;
//                         }
//                       }
//                     });
//                   },
//                   isSelected: isSelected,
//                 ),
//               ),
//               options[i],
//               RaisedButton(
//                 onPressed: () async {
//                   GeoCode geoCode = GeoCode();
//
//                   try {
//                     Screen1.coordinates = await geoCode.forwardGeocoding(
//                         address: "Kaki Bukit Avenue 3 Singapore");
//                     var address = await geoCode.reverseGeocoding(
//                       latitude: Screen1.coordinates.latitude,
//                       longitude: Screen1.coordinates.longitude,
//                     );
//
//                     print("Latitude: ${Screen1.coordinates.latitude}");
//                     print("Longitude: ${Screen1.coordinates.longitude}");
//                     print("Address: ${address.streetAddress}");
//                   } catch (e) {
//                     print(e);
//                   }
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => Screen0()),
//                   );
//                 },
//                 child: Text("haha"),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
