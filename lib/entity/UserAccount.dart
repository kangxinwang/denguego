import 'package:flutter/cupertino.dart';

class UserAccount {
  String uid;
  String _name;
  String _email;
  String _RiskZone;
  bool _SurveyDone;
  int _SurveyScore;
  List<String> _SavedLocations;

  UserAccount({
    String name,
    String email,
    String RiskZone,
    bool SurveyDone,
    int SurveyScore,
    List<String> SavedLocations,
    String uid,
    //String uid,
  })  : _name = name,
        _email = email,
        _RiskZone = RiskZone,
        _SurveyDone = SurveyDone,
        _SurveyScore = SurveyScore,
        _SavedLocations = SavedLocations;
  //uid = this.uid;

  String get name => _name;
  String get email => _email;
  String get RiskZone => _RiskZone;
  bool get SurveyDone => _SurveyDone;
  int get SurveyScore => _SurveyScore;
  List<String> get SavedLocations => _SavedLocations;

  set name(String name) {
    _name = name;
  }

  set email(String email) {
    _email = email;
  }

  set RiskZone(String RiskZone) {
    _RiskZone = RiskZone;
  }

  set SurveyDone(bool SurveyDone) {
    _SurveyDone = SurveyDone;
  }

  set SurveyScore(int SurveyScore) {
    _SurveyScore = SurveyScore;
  }

  set SavedLocations(List<String> SavedLocations) {
    _SavedLocations = SavedLocations;
  }
}
