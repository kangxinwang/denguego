import 'package:denguego/controller/SavedManager.dart';
import 'package:denguego/entity/ClusterLocation.dart';
import 'package:denguego/shared/Constants.dart';
import 'package:denguego/widgets/Savedwidget.dart';
import 'package:flutter/material.dart';

class SavedScreen extends StatefulWidget {
  @override
  _SavedScreenState createState() => _SavedScreenState();
}

class _SavedScreenState extends State<SavedScreen> {
  bool isBookmarked = false;

  List<Widget> BuildSavedCards() {
    List<Savedwidget> savedCards = [];
    if (savedList.isEmpty) {
      return [
        SizedBox(
          height: 24,
        ),
        Text(
          'No Saved locations',
          style: TextStyle(
              color: Colors.grey, fontSize: 20, fontFamily: 'Montserrat'),
        ),
      ];
    }
    for (ClusterLocation loc in savedList) {
      savedCards.add(Savedwidget(
        location: loc.location,
        cases: loc.cases,
        zone: loc.zone,
        isBookmarked: true,
        savedFunc: () {
          setState(() {
            SavedManager.editSaved(loc);
          });
        },
      ));
    }
    return savedCards;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    /*locationList = [
      ClusterLocation(location: "Kallang", cases: 12, zone: "Safe"),
      ClusterLocation(location: "Yishun", cases: 30, zone: "Medium Risk"),
      ClusterLocation(location: "Pasir Ris", cases: 50, zone: "High Risk"),
    ];*/
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
              Center(
                child: Image.asset(
                  'images/location.png',
                ),
              ),
            ] +
            BuildSavedCards(),
      ),
    );
  }
}
