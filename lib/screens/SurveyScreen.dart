import 'package:flutter/material.dart';
import '/quiz.dart';
import '/result.dart';

class SurveyScreen extends StatefulWidget {
  @override
  _SurveyScreenState createState() => _SurveyScreenState();
}

class _SurveyScreenState extends State<SurveyScreen> {
  final _questions = const [
    {
      'questionText': 'Are you living in a landed property?',
      'answers': [
        {'text': 'Yes', 'score': 10},
        {'text': 'No', 'score': 0},
      ],
    },
    {
      'questionText': 'Q2. Have any of your family members contracted dengue?',
      'answers': [
        {'text': 'No', 'score': 0},
        {'text': 'Yes', 'score': 10},
      ],
    },
    {
      'questionText': ' Q3. How often do you wash your toilet',
      'answers': [
        {'text': 'Daily', 'score': 0},
        {'text': 'Once a week', 'score': 2},
        {'text': 'Once in 2 weeks', 'score': 4},
        {'text': 'Once a month', 'score': 6},
        {'text': 'Never', 'score': 10},
      ],
    },
    {
      'questionText': 'Q4. How often do you take out the trash?',
      'answers': [
        {'text': 'Daily', 'score': 0},
        {'text': 'Once a week', 'score': 2},
        {'text': 'Once in 2 weeks', 'score': 4},
        {'text': 'Once a month', 'score': 6},
        {'text': 'Never', 'score': 10},
      ],
    },
    {
      'questionText':
      'Q5. How often do you clear the drains in or around your house?',
      'answers': [
        {'text': 'Daily', 'score': 0},
        {'text': 'Once a week', 'score': 2},
        {'text': 'Once in 2 weeks', 'score': 4},
        {'text': 'Once a month', 'score': 6},
        {'text': 'Never', 'score': 10},
      ],
    },
    {
      'questionText':
      'Q6. How often do you change the water for your plants?',
      'answers': [
        {'text': 'Daily', 'score': 0},
        {'text': 'Once a week', 'score': 2},
        {'text': 'Once in 2 weeks', 'score': 4},
        {'text': 'Once a month', 'score': 6},
        {'text': 'Never', 'score': 10},
      ],
    },
    {
      'questionText':
      'Q7. Do you cover your pole holders?',
      'answers': [
        {'text': 'No', 'score': 10},
        {'text': 'Yes', 'score': 0},
      ],
    },
    {
      'questionText':
      'Q8. How often do you clear water from dish rack trays?',
      'answers': [
        {'text': 'Daily', 'score': 0},
        {'text': 'Once a week', 'score': 2},
        {'text': 'Once in 2 weeks', 'score': 4},
        {'text': 'Once a month', 'score': 6},
        {'text': 'Never', 'score': 10},
      ],
    },
    {
      'questionText':
      'Q9. Do you keep your water storage containers(e.g. pails) dry?',
      'answers': [
        {'text': 'Yes', 'score': 0},
        {'text': 'No', 'score': 10},
      ],
    },
    {
      'questionText':
      'Q10. How often do you use insecticide in your house?',
      'answers': [
        {'text': 'Daily', 'score': 0},
        {'text': 'Once a week', 'score': 2},
        {'text': 'Once in 2 weeks', 'score': 4},
        {'text': 'Once a month', 'score': 6},
        {'text': 'Never', 'score': 10},
      ],
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    } else {
      print('No more questions!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // appBar: AppBar(
        //   title: Text('Geeks for Geeks'),
        //   backgroundColor: Color(0xFF00E676),
        // ),
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: _questionIndex < _questions.length
              ? Quiz(
            answerQuestion: _answerQuestion,
            questionIndex: _questionIndex,
            questions: _questions,
          ) //Quiz
              : Result(_totalScore, _resetQuiz),
        ), //Padding
      ), //Scaffold
      debugShowCheckedModeBanner: false,
    ); //MaterialApp
  }
}
