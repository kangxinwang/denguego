import 'package:flutter/cupertino.dart';

class Location {
  String _location;
  int _cases;
  String _zone;
  Location({
    @required String location,
    @required int cases,
    @required String zone,
  })  : _location = location,
        _cases = cases,
        _zone = zone;
  String get location => _location;
  int get cases => _cases;
  String get zone => _zone;

  set location(String location) {
    _location = location;
  }

  set cases(int cases) {
    _cases = cases;
  }

  set zone(String zone) {
    _zone = zone;
  }
}
