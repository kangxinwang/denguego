import 'package:denguego/boundary/HomeScreen.dart';
import 'package:denguego/entity/ClusterLocation.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:web_scraper/web_scraper.dart';
import 'dart:async';
import 'package:geocoding/geocoding.dart';

class ClusterManager {
  static bool loaded = false;
  static WebScraper webScraper;
  static List<String> keys = [];
  static Map<String, ClusterLocation> LocationList = {};
  static List<String> nearByClusters = [];

  static Future<List<String>> getAllLocations() async {
    List<String> updates;
    List<String> individualCluster = [];

    var currentLocation = await HomeScreen.locationTracker.getLocation();

    webScraper = WebScraper('https://www.nea.gov.sg');
    if (await webScraper.loadWebPage('/dengue-zika/dengue/dengue-clusters')) {
      List<Map<String, dynamic>> results =
          webScraper.getElement('table', ['title']);
      List<Map<String, dynamic>> clusterNames =
          webScraper.getElement('.rte a:not([class^=btn])', ['title']);
      int clusterCases;
      String locName;
      //print(results[results.length - 1]);
      for (var i = 2; i < results.length; i++) {
        clusterCases = 0;
        updates = [];
        String clusterName = clusterNames[i - 2]['title'];
        //listOfClusters.add(results[i]['title']);
        individualCluster = results[i]['title'].split("    ");
        for (var j = 59; j < individualCluster.length; j += 42) {
          locName = individualCluster[j]
              .substring(0, individualCluster[j].length - 1);

          //print(
          //  "Location:${individualCluster[j]}No.of cases:${individualCluster[j + 11]}");
          clusterCases += int.parse(individualCluster[j + 11]);

          ClusterManager.LocationList[locName] = ClusterLocation(
            location: locName,
            cases: int.parse(individualCluster[j + 11]),
            cluster: clusterName,
          );

          await getLatLong(ClusterManager.LocationList[locName]);

          var _distanceInMeters = await Geolocator.distanceBetween(
            ClusterManager.LocationList[locName].coordinates[0].latitude,
            ClusterManager.LocationList[locName].coordinates[0].longitude,
            currentLocation.latitude,
            currentLocation.longitude,
          );
          if (_distanceInMeters / 1000 < 2) {
            if (!nearByClusters
                .contains(ClusterManager.LocationList[locName].cluster))
              nearByClusters.add(ClusterManager.LocationList[locName].cluster);
          }
          updates.add(locName);
        }

        for (String loc in updates) {
          ClusterManager.LocationList[loc].clusterCases = clusterCases;
          ClusterManager.LocationList[loc].zone =
              clusterCases > 10 ? "High Risk" : "Medium Risk";
        }
      }

      addMarkers(LocationList.keys.toList());
      keys = ClusterManager.LocationList.keys.toList();
      return ClusterManager.LocationList.keys.toList();
    }
  }

  static void addMarkers(List<String> cluster) {
    for (int i = 0; i < cluster.length; i++) {
      String place = cluster[i];
      ClusterLocation loc = LocationList[place];
      HomeScreen.allMarkers.add(Marker(
        markerId: MarkerId(loc.location),
        draggable: false,
        zIndex: 2,
        flat: true,
        anchor: Offset(0.5, 0.5),
        position:
            LatLng(loc.coordinates[0].latitude, loc.coordinates[0].longitude),
        icon: LocationList[place].zone == 'Safe'
            ? BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen)
            : LocationList[place].zone == 'Medium Risk'
                ? BitmapDescriptor.defaultMarkerWithHue(
                    BitmapDescriptor.hueOrange)
                : BitmapDescriptor.defaultMarkerWithHue(
                    BitmapDescriptor.hueRed),
      ));
    }
  }

  static getLatLong(ClusterLocation cluster) async {
    try {
      cluster.coordinates =
          await locationFromAddress(cluster.location + " Singapore");
    } catch (e) {
      print(e);
    }
  }
}
