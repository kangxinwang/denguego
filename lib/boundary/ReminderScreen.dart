import 'package:flutter/material.dart';

class ReminderScreen extends StatefulWidget {
  static String id = 'ReminderScreen';
  @override
  _ReminderScreenState createState() => new _ReminderScreenState();
}

class _ReminderScreenState extends State<ReminderScreen> {
  @override
  Widget build(BuildContext context) {
    Map<String, bool> values = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.topRight,
              colors: [
                Color(0xff5B92C8),
                Color(0xffBCD49D),
              ],
            ),
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            Text(
              'Reminders',
              style: TextStyle(
                fontSize: 25.0,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              width: 45,
            ),
          ],
        ),
      ),
      body: ListView(
        children: values.keys.map((String key) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(5, 3, 5, 3),
            child: Card(
              elevation: 2,
              child: CheckboxListTile(
                title: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    key,
                    style: TextStyle(
                      fontSize: 15.0,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                value: values[key],
                onChanged: (bool value) {
                  setState(() {
                    values[key] = value;
                  });
                },
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
