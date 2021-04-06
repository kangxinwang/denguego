import 'dart:developer';
import 'package:denguego/widgets/question.dart';
import 'package:flutter/material.dart';
import 'package:denguego/boundary/ViewReminder.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:denguego/controller/UserAccountManager.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;
  Result(this.resultScore, this.resetHandler);

//Remark Logic
  String get resultPhrase {
    String resultText;
    if (resultScore >= 70) {
      resultText = 'High-risk!';
      print(resultScore);
    } else if (40 <= resultScore && resultScore < 70) {
      resultText = 'Medium-risk!';
      print(resultScore);
    } else if (resultScore <= 39) {
      resultText = 'Low-risk!';
    } else {
      resultText = 'Incorrect Score. Please try again!';
      print(resultScore);
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text(
              "Thank you for taking this survey!",
              style: TextStyle(
                fontSize: 22,
                fontFamily: "Montserrat",
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 25,
          ),
          //Text
          Text(
            'Score ' '$resultScore',
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ), //Text
          TextButton(
            child: Text(
              'Restart Survey',
            ), //Text
            //textColor: Colors.blue,
            onPressed: resetHandler,
          ),
          TextButton(
              child: Text(
                'Continue',
              ),
              onPressed: () {
                // FirebaseFirestore.instance
                //     .collection('Users')
                //     .add({'SurveyScore': resultScore});
                // FirebaseFirestore.instance
                //     .collection('Users')
                //     .add({'SurveyDone': true});
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ViewReminder(resultScore)),
                );
              })
        ], //<Widget>[]
      ), //Column
    ); //Center
  }
}

class HighRisk extends StatefulWidget {
  @override
  HighRiskState createState() => new HighRiskState();
}

class HighRiskState extends State<HighRisk> {
  Map<String, bool> values = {
    'Wash your toilet': false,
    'Take out the trash': false,
    'Clear the drains': false,
    'Apply mosquito repellent': false,
    'Cover your pole holders': false,
    'Clear your water from trays': false,
    'Keep your water containers dry': false,
    'Use insecticide': false,
  };

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text('Reminders')),
      body: new ListView(
        children: values.keys.map((String key) {
          return new CheckboxListTile(
            title: new Text(key),
            value: values[key],
            onChanged: (bool value) {
              setState(() {
                values[key] = value;
              });
            },
          );
        }).toList(),
      ),
    );
  }
}

class MediumRisk extends StatefulWidget {
  @override
  MediumRiskState createState() => new MediumRiskState();
}

class MediumRiskState extends State<MediumRisk> {
  Map<String, bool> values = {
    'Wash your toilet': false,
    'Clear the drains': false,
    'Apply mosquito repellent': false,
    'Cover your pole holders': false,
    'Clear your water from trays': false,
    'Keep your water containers dry': false,
  };

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text('Reminders')),
      body: new ListView(
        children: values.keys.map((String key) {
          return new CheckboxListTile(
            title: new Text(key),
            value: values[key],
            onChanged: (bool value) {
              setState(() {
                values[key] = value;
              });
            },
          );
        }).toList(),
      ),
    );
  }
}

class LowRisk extends StatefulWidget {
  @override
  LowRiskState createState() => new LowRiskState();
}

class LowRiskState extends State<LowRisk> {
  Map<String, bool> values = {
    'Wash your toilet': false,
    'Clear the drains': false,
    'Clear your water from trays': false,
    'Keep your water containers dry': false,
  };

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text('Reminders')),
      body: new ListView(
        children: values.keys.map((String key) {
          return new CheckboxListTile(
            title: new Text(key),
            value: values[key],
            onChanged: (bool value) {
              setState(() {
                values[key] = value;
              });
            },
          );
        }).toList(),
      ),
    );
  }
}
