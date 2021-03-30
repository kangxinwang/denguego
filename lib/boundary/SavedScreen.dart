import 'package:denguego/entity/Location.dart';
import 'package:denguego/shared/constants.dart';
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
    if (locationList.isEmpty) {
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
    for (Location loc in locationList) {
      savedCards.add(Savedwidget(
        location: loc.location,
        cases: loc.cases,
        zone: loc.zone,
        isBookmarked: true,
        savedFunc: () {
          setState(() {
            if (locationList.contains(loc)) {
              locationList.remove(loc);
            } else {
              locationList.add(loc);
            }
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
    locationList = [
      Location(location: "Kallang", cases: 12, zone: "Safe"),
      Location(location: "Yishun", cases: 30, zone: "Medium Risk"),
      Location(location: "Pasir Ris", cases: 50, zone: "High Risk"),
    ];
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
