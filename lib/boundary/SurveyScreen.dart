import 'package:denguego/controller/AuthenticateManager.dart';
import 'package:denguego/shared/Constants.dart';
import 'package:denguego/controller/UserAccountManager.dart';
import 'package:denguego/widgets/Result.dart';
import 'package:flutter/material.dart';
import 'package:denguego/widgets/Survey.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SurveyScreen extends StatefulWidget {
  @override
  _SurveyScreenState createState() => _SurveyScreenState();
}

class _SurveyScreenState extends State<SurveyScreen> {
  int _questionIndex = 0;
  int _totalScore = UserAccountManager.userDetails.SurveyScore;
  bool surveyCompleted = UserAccountManager.userDetails.SurveyDone;

  static UserAccountManager UsrMgr = UserAccountManager();
  static AuthenticateManager _auth = AuthenticateManager();

  void resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
      UserAccountManager.userDetails.SurveyDone = false;
    });
  }

  void answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
  }

  void surveyDone() async {
    String name = await _auth.getCurrentUserName();
    await UsrMgr.updateSurveyDone(name);
  }

  @override
  Widget build(BuildContext context) {
    print(UserAccountManager.userDetails.SurveyDone);
    print(surveyCompleted);
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Geeks for Geeks'),
      //   backgroundColor: Color(0xFF00E676),
      // ),
      body: surveyCompleted
          ? Result(_totalScore, resetQuiz)
          : _questionIndex < questions.length
              ? Survey(
                  answerQuestion: answerQuestion,
                  questionIndex: _questionIndex,
                  questions: questions,
                  //surveyUpdate: surveyDone(), //Call update surveydone
                )
              : Result(_totalScore, resetQuiz), //Padding
      //debugShowCheckedModeBanner: false,
    );
  }
}
