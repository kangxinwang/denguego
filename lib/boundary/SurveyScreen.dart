import 'package:denguego/controller/AuthenticateManager.dart';
import 'package:denguego/shared/Constants.dart';
import 'package:denguego/controller/UserAccountManager.dart';
import 'package:denguego/widgets/Result.dart';
import 'package:flutter/material.dart';
import 'package:denguego/widgets/Survey.dart';

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
      //String name = await _auth.getCurrentUserName();
      UserAccountManager.userDetails.SurveyDone = false;
      UserAccountManager.userDetails.SurveyScore = 0;
      surveyCompleted = false;
      // await UsrMgr.updateSurveyDone(name);
      // await UsrMgr.updateSurveyScore(name);
    });
  }

  void answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    print(UserAccountManager.userDetails.SurveyDone);
    print(surveyCompleted);
    return SingleChildScrollView(
      child: Column(children: <Widget>[
        surveyCompleted
            ? Result(_totalScore, resetQuiz)
            : _questionIndex < questions.length
                ? Survey(
                    answerQuestion: answerQuestion,
                    questionIndex: _questionIndex,
                    questions: questions,
                    //surveyUpdate: surveyDone(), //Call update surveydone
                  )
                : Result(_totalScore, resetQuiz), //Padding
      ]), //debugShowCheckedModeBanner: false,
    );
  }
}
