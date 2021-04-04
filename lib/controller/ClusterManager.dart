import 'package:denguego/entity/ClusterLocation.dart';
import 'package:web_scraper/web_scraper.dart';
import 'dart:async';

class ClusterManager {
  static WebScraper webScraper;

  static Map<String, ClusterLocation> LocationList = {};

  static Future<List<String>> getAllLocations() async {
    List<String> updates;
    List<String> individualCluster = [];

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
          updates.add(locName);
        }
        for (String loc in updates) {
          ClusterManager.LocationList[loc].clusterCases = clusterCases;
          ClusterManager.LocationList[loc].zone =
              clusterCases > 10 ? "High Risk" : "Medium Risk";
        }
      }
      return ClusterManager.LocationList.keys.toList();
    }
  }
}
