import 'package:flutter/material.dart';

class Reminder extends StatefulWidget {
  @override
  _ReminderState createState() => new _ReminderState();
}

class _ReminderState extends State<Reminder> {
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
