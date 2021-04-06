import 'dart:developer';
import 'package:denguego/widgets/question.dart';
import 'package:flutter/material.dart';
import 'package:denguego/entity/Result.dart';

class ViewReminder extends StatefulWidget {
  final int resultScore;
  ViewReminder(this.resultScore);
  @override
  ViewReminderState createState() => new ViewReminderState();
}

class ViewReminderState extends State<ViewReminder> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Center(
        child: Text(
          'View Checklist',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 28,
            fontFamily: 'Montserrat',
          ),
        ),
      ),
      TextButton(
          child: Text(
            'View reminders',
          ),
          onPressed: () {
            if (widget.resultScore >= 70) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HighRisk()),
              );
            } else if (40 <= widget.resultScore && widget.resultScore < 70) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MediumRisk()),
              );
            } else if (widget.resultScore <= 39) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LowRisk()),
              );
            }
          })
    ]);
  }
}
