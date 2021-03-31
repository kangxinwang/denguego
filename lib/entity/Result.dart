import 'package:denguego/widgets/question.dart';
import 'package:flutter/material.dart';
import 'package:denguego/boundary/QuestionnaireScreen.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;

  Result(this.resultScore, this.resetHandler);

//Remark Logic
  String get resultPhrase {
    String resultText;
    if (resultScore >= 70) {
      resultText = 'You are at high-risk!';
      print(resultScore);
    } else if (40 <= resultScore && resultScore <= 70) {
      resultText = 'You are at medium-risk!';
      print(resultScore);
    } else if (resultScore <= 39) {
      resultText = 'You are at low-risk!';
    } else {
      resultText = 'This is a poor score!';
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
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ), //Text
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
              'View reminders',
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Reminder()),
              );
            }, //FlatButton
          )
        ], //<Widget>[]
      ), //Column
    ); //Center
  }
}

class Reminder extends StatefulWidget {
  @override
  DemoState createState() => new DemoState();
}

class DemoState extends State<Reminder> {
  Map<String, bool> values = {
    'Wash your toilet': false,
    'Take out the trash': false,
    'Clear the drains': false,
    'Change the water for your plants': false,
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
