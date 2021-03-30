import 'package:flutter/material.dart';
import 'package:web_scraper/web_scraper.dart';
import 'dart:async';

class ClusterManager {
  static WebScraper webScraper;
  /* static bool loaded = false;
  static String clusters;*/
  static List<String> listOfClusters = [];

  static void getData() async {
    webScraper = WebScraper('https://www.nea.gov.sg');
    if (await webScraper.loadWebPage('/dengue-zika/dengue/dengue-clusters')) {
      List<Map<String, dynamic>> results =
          webScraper.getElement('.rte a:not([class^=btn])', ['title']);

      for (var i = 0; i < (results.length - 1); i++) {
        listOfClusters.add(results[i]['title']);
      }
    }
  }
}
