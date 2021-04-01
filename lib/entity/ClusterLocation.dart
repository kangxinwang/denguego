import 'package:flutter/cupertino.dart';

class ClusterLocation {
  String _location;
  int _cases;
  String _zone;
  String _cluster;
  int _clusterCases;

  ClusterLocation({
    @required String location,
    @required int cases,
    @required String zone,
    @required String cluster,
    int clusterCases,
  })  : _location = location,
        _cases = cases,
        _zone = zone,
        _clusterCases = clusterCases,
        _cluster = cluster;

  String get location => _location;
  int get cases => _cases;
  String get zone => _zone;
  int get clusterCases => _clusterCases;
  String get cluster => _cluster;

  set location(String location) {
    _location = location;
  }

  set cases(int cases) {
    _cases = cases;
  }

  set zone(String zone) {
    _zone = zone;
  }

  set clusterCases(int clusterCases) {
    _clusterCases = clusterCases;
  }

  set cluster(String cluster) {
    _cluster = cluster;
  }

  void printDetails() {
    print("Cluster cases : " + _clusterCases.toString());
  }
}
