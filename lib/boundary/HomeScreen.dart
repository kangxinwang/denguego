import 'dart:typed_data';
import 'package:dropdownfield/dropdownfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:denguego/controller/ClusterManager.dart';
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:location/location.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  StreamSubscription _locationSubscription;
  Location _locationTracker = Location();
  List<Marker> allMarkers = [];
  Circle circle;
  GoogleMapController _controller;
  static final CameraPosition initialLocation = CameraPosition(
      target: LatLng(1.290270, 103.851959),
      zoom: 15);

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
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.location_searching),
            onPressed: () {
              getCurrentLocation();
            })
    );
  }


Widget _buildGoogleMap(BuildContext context) {
  return Container(
    height: MediaQuery.of(context).size.height,
    width: MediaQuery.of(context).size.width,
    child: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: initialLocation,
        markers: Set.from(allMarkers),
        circles: Set.of((circle != null) ? [circle] : []),
        onMapCreated: (GoogleMapController controller) {
          _controller = controller;
        }
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


  @override
  void initState() {
    super.initState();

    // buffer marker to simulate dengue cluster
    allMarkers.add(Marker(
        markerId: MarkerId("DengueCluster1"),
        draggable: false,
        zIndex: 2,
        flat: true,
        anchor: Offset(0.5, 0.5),
        position: LatLng(1.3491, 103.6789)));
  }

  Future<Uint8List> getMarker() async {
    ByteData byteData = await DefaultAssetBundle.of(context).load("assets/arrow.png");
    return byteData.buffer.asUint8List();
  }


  void updateMarkerAndCircle(LocationData newLocalData, Uint8List imageData) {
    LatLng latLng = LatLng(newLocalData.latitude, newLocalData.longitude);
    this.setState(() {
      allMarkers.add(Marker(
          markerId: MarkerId("home"),
          position: latLng,
          rotation: newLocalData.heading,
          draggable: false,
          zIndex: 2,
          flat: true,
          anchor: Offset(0.5, 0.5),
          icon: BitmapDescriptor.fromBytes(imageData)));
      circle = Circle(
          circleId: CircleId("arrow"),
          radius: newLocalData.accuracy,
          zIndex: 1,
          strokeColor: Colors.blue,
          center: latLng,
          fillColor: Colors.blue.withAlpha(70));
    });
  }

  void getCurrentLocation() async {
    try {

      Uint8List imageData = await getMarker();
      var location = await _locationTracker.getLocation();

      updateMarkerAndCircle(location, imageData);

      if (_locationSubscription != null){
        _locationSubscription.cancel();
      }

      _locationSubscription = _locationTracker.onLocationChanged().listen((newLocalData) {
        if (_controller != null) {
          _controller.animateCamera(CameraUpdate.newCameraPosition(new CameraPosition(
              bearing: 0,
              target: LatLng(newLocalData.latitude, newLocalData.longitude),
              tilt:0,
              zoom:16)));
          updateMarkerAndCircle(newLocalData, imageData);
        }
      });
    }

    on PlatformException catch (e) {
      if (e.code == 'PERMISSION DENIED') {
        debugPrint("Permission Denied");
      }
    }




}}