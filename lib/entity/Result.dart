import 'dart:developer';

import 'package:denguego/widgets/question.dart';
import 'package:flutter/material.dart';

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
            'Score: $resultScore / 100',
            style: TextStyle(
              fontSize: 32,
              fontFamily: "Montserrat",
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              resultPhrase.contains('risk')
                  ? 'You are at $resultPhrase'
                  : resultPhrase,
              style: TextStyle(
                fontFamily: "Montserrat",
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: resultPhrase.contains('High')
                    ? Color(0xffd26666)
                    : resultPhrase.contains('Medium')
                        ? Color(0xffdec649)
                        : resultPhrase.contains('Low')
                            ? Color(0xff81aa4c)
                            : Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12.0, 12, 12, 0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color(0xff5B92C8),
                padding: EdgeInsets.all(8),
              ),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  'View Safety Reminders',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Montserrat',
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              onPressed: () {
                if (resultScore >= 70) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HighRisk()),
                  );
                } else if (40 <= resultScore && resultScore < 70) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MediumRisk()),
                  );
                } else if (resultScore <= 39) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LowRisk()),
                  );
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(8),
              ),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  'Restart Survey',
                  style: TextStyle(
                    color: Colors.grey[600], //Color(0xff5B92C8),
                    fontFamily: 'Montserrat',
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              onPressed: resetHandler,
            ),
          ),
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
