import 'package:denguego/boundary/MainScreen.dart';
import 'package:denguego/boundary/NotificationScreen.dart';
import 'package:denguego/controller/ScreenManager.dart';
import 'package:denguego/entity/UserAccount.dart';
import 'package:denguego/shared/Constants.dart';
import 'package:flutter/material.dart';
import 'package:denguego/controller/UserAccountManager.dart';
import 'package:denguego/controller/LocalNotificationManager.dart';
import 'package:denguego/controller/AuthenticateManager.dart';

class Result extends StatefulWidget {
  final int resultScore;
  final Function resetHandler;
  Result(this.resultScore, this.resetHandler);

  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {
  static UserAccountManager UserMgr = UserAccountManager();

  void initState() {
    // TODO: implement initState
    super.initState();
    localNotificationManager.setOnNotificationReceive(onNotificationReceive);
    localNotificationManager.setOnNotificationClick(onNotificationClick);

    if (!UserAccountManager.userDetails.SurveyDone) {
      sendNotification();
    }
  }

  void sendNotification() async {
    await localNotificationManager.showDailyAtTimeNotification();
    Navigator.pushNamed(context, ScreenManager.id);
    Navigator.pop(context);
  }

  onNotificationReceive(ReceiveNotification notification) {
    print('Notification recieved: ${notification.id}');
  }

  onNotificationClick(String payload) {
    print('Payload $payload');
    Navigator.pushNamed(context, NotificationScreen.id);
  }

  String get resultPhrase {
    String resultText;
    if (widget.resultScore >= 70) {
      resultText = 'High risk';
      print(widget.resultScore);
    } else if (40 <= widget.resultScore && widget.resultScore < 70) {
      resultText = 'Medium risk';
      print(widget.resultScore);
    } else if (widget.resultScore <= 39) {
      resultText = 'Low risk';
    } else {
      resultText = 'Incorrect Score. Please try again!';
      print(widget.resultScore);
    }
    return resultText;
  }

  List<String> get values {
    List<String> reminderValues;
    if (resultPhrase.contains('High')) {
      reminderValues = HighRiskValues;
    } else if (resultPhrase.contains('Medium')) {
      reminderValues = MediumRiskValues;
    } else if (resultPhrase.contains('Low')) {
      reminderValues = LowRiskValues;
    }
    return reminderValues;
  }

  @override
  Widget build(BuildContext context) {
    UserAccountManager.userDetails.RiskZone = resultPhrase;
    UserAccountManager.userDetails.SurveyDone = true;
    UserAccountManager.userDetails.SurveyScore = widget.resultScore;
    UserMgr.updateSurvey(UserAccountManager.userDetails.name);

    UserAccountManager.userDetails.Reminders = values;
    UserMgr.updateReminders(UserAccountManager.userDetails.name);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 100,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(4.0, 80.0, 4.0, 4.0),
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
            height: 40,
          ),
          //Text
          Text(
            'Score: ${widget.resultScore} / 100',
            style: TextStyle(
              fontSize: 32,
              fontFamily: "Montserrat",
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
            child: Text(
              resultPhrase.contains('risk')
                  ? 'You are at $resultPhrase!'
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
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color(0xff5B92C8),
                padding: EdgeInsets.all(8),
              ),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  'Restart Survey',
                  style: TextStyle(
                    color: Colors.white, //Color(0xff5B92C8),
                    fontFamily: 'Montserrat',
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              onPressed: widget.resetHandler,
            ),
          ),
        ], //<Widget>[]
      ), //Column
    ); //Center
  }
}
