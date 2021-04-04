import 'dart:typed_data';
import 'package:denguego/controller/SavedManager.dart';
import 'package:denguego/widgets/PopUpLocationCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:denguego/controller/ClusterManager.dart';
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:location/location.dart';
import 'package:denguego/entity/ClusterLocation.dart';
import 'package:custom_searchable_dropdown/custom_searchable_dropdown.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool locationSelected = false;
  String place = "";
  StreamSubscription _locationSubscription;
  Location _locationTracker = Location();
  List<Marker> allMarkers = [];
  Circle circle;
  GoogleMapController _controller;
  static final CameraPosition initialLocation =
      CameraPosition(target: LatLng(1.3521, 103.8198), zoom: 10);
  static final List<String> keys = ClusterManager.LocationList.keys.toList();
  Map<String, ClusterLocation> clusterDetails = ClusterManager.LocationList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: <Widget>[
            _buildGoogleMap(context),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                locationSelected
                    ? PopUpLocationCard(
                        location: clusterDetails[place].location,
                        cases: clusterDetails[place].cases,
                        cluster: clusterDetails[place].cluster,
                        clusterCases: clusterDetails[place].clusterCases,
                        zone: clusterDetails[place].zone,
                        saved: SavedManager.isSaved(clusterDetails[place]),
                        savedFunc: () {
                          setState(() {
                            SavedManager.editSaved(clusterDetails[place]);
                            locationSelected = true;
                          });
                        },
                      )
                    : Text(''),
              ],
            ),
            _buildSearch(keys),
          ],
        ),
        floatingActionButton: Align(
          alignment: Alignment.topRight,
          child: Padding(
            padding: const EdgeInsets.only(top: 120),
            child: FloatingActionButton(
                child: Icon(Icons.gps_fixed),
                onPressed: () {
                  getCurrentLocation();
                }),
          ),
        ));
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
          }),
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
            child: FutureBuilder<List<String>>(
                future: ClusterManager
                    .getAllLocations(), // a previously-obtained Future<String> or null
                builder: (BuildContext context,
                    AsyncSnapshot<List<String>> snapshot) {
                  Widget drop;
                  if (snapshot.hasData) {
                    drop = customSearchableDropDown(
                      showClearButton: true,
                      hideSearch: false,
                      menuMode: false,
                      dropDownMenuItems: snapshot.data?.map((item) {
                            return item;
                          })?.toList() ??
                          [],
                      items: snapshot.data,
                      label: 'Search for clusters',
                      //decoration: BoxDecoration(border: Border.all(color: Colors.blue)),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: Icon(Icons.search),
                      ),
                      onChanged: (value) {
                        if (value != null) {
                          place = value;
                          setState(() {
                            locationSelected = true;
                          });
                        } else {
                          setState(() {
                            locationSelected = false;
                          });
                        }
                      },
                    );
                  } else
                    drop = CircularProgressIndicator();
                  return drop;
                }),
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
    ByteData byteData =
        await DefaultAssetBundle.of(context).load("assets/arrow.png");
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

      if (_locationSubscription != null) {
        _locationSubscription.cancel();
      }

      _locationSubscription =
          _locationTracker.onLocationChanged().listen((newLocalData) {
        if (_controller != null) {
          _controller.animateCamera(CameraUpdate.newCameraPosition(
              new CameraPosition(
                  bearing: 0,
                  target: LatLng(newLocalData.latitude, newLocalData.longitude),
                  tilt: 0,
                  zoom: 16)));
          updateMarkerAndCircle(newLocalData, imageData);
        }
      });
    } on PlatformException catch (e) {
      if (e.code == 'PERMISSION DENIED') {
        debugPrint("Permission Denied");
      }
    }
  }

  Future<void> _gotoLocation(double lat, double long) async {
    _controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      target: LatLng(lat, long),
      zoom: 15,
      tilt: 50.0,
      bearing: 45.0,
    )));
  }
}
