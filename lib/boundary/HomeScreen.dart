import 'dart:typed_data';

import 'package:dropdownfield/dropdownfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:denguego/controller/ClusterManager.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          _buildGoogleMap(context),
          _buildSearch(ClusterManager.listOfClusters),
          //_boxes(),
        ],
      ),
    );
  }
}

Widget _buildGoogleMap(BuildContext context) {
  return Container(
    height: MediaQuery.of(context).size.height,
    width: MediaQuery.of(context).size.width,
    child: GoogleMap(
      mapType: MapType.normal,
      initialCameraPosition: CameraPosition(
        target: LatLng(1.3521, 103.8198),
        zoom: 10,
      ),
    ),
  );
}

Widget _buildSearch(List<String> clusters) {
  return Container(
    margin: EdgeInsets.fromLTRB(15, 25, 15, 15),
    alignment: Alignment.topCenter,
    child: Material(
      color: Colors.white,
      elevation: 14.0,
      borderRadius: BorderRadius.circular(10.0),
      shadowColor: Color(0x802196F3),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
          child: DropDownField(
            itemsVisibleInDropdown: 5,
            icon: Icon(Icons.search),
            hintText: 'Search for clusters',
            items: clusters,
            strict: false,
            /*setter: (dynamic newValue) {
                formData['City'] = newValue;
              },*/
            onValueChanged: (value) {
              print(value);
              SystemChannels.textInput.invokeMethod('TextInput.hide');
            },
          ),
        ),
      ),
    ),
  );
}
