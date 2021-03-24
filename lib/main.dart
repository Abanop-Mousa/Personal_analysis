import 'package:flutter/material.dart';
import 'package:quizz/quiz.dart';
import 'package:quizz/result.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bomba',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color w = Colors.white;
  Color b = Colors.black;
  bool isSwitched = false;
  var _questionIndex = 0;
  var _totalScore = 0;
  int num0 = 0, num1 = 0, num2 = 0, num3 = 0;

  void answerQuestion(score) {
    if (_questionIndex == 0) num0 = score;
    if (_questionIndex == 1) num1 = score;
    if (_questionIndex == 2) num2 = score;
    if (_questionIndex == 3) num3 = score;

    _totalScore += score;
    num0 = score;
    setState(() {
      _questionIndex += 1;
    });
    print("index $_questionIndex");
    print("num0 $num0");
    print("num1 $num1");
    print("num2 $num2");
    print("num3 $num3");
    print("total $_totalScore");
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
      num0 = 0;
      num1 = 0;
      num2 = 0;
      num3 = 0;
    });
  }

  List<Map<String, Object>> _question = [
    {
      'question': 'what\'s your favorait color ?',
      'answer': [
        {"text": 'blue', 'score': 10},
        {"text": 'red', 'score': 20},
        {"text": 'green', 'score': 30},
        {"text": 'black', 'score': 40},
      ],
    },
    {
      'question': 'what\'s your favorait animal ?',
      'answer': [
        {"text": 'cat', 'score': 10},
        {"text": 'Lion', 'score': 20},
        {"text": 'Elephant', 'score': 30},
        {"text": 'Duck', 'score': 40},
      ],
    },
    {
      'question': 'what\'s your favorait sport ?',
      'answer': [
        {"text": 'Cycling', 'score': 10},
        {"text": 'Summing', 'score': 20},
        {"text": 'Football', 'score': 30},
        {"text": 'Gymnastics', 'score': 40},
      ],
    },
    {
      'question': 'what\'s your favorait food ?',
      'answer': [
        {"text": 'Salad', 'score': 10},
        {"text": 'Pizza', 'score': 20},
        {"text": 'Pasta', 'score': 30},
        {"text": 'Roast chicken', 'score': 40},
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz App'),
        actions: [
          Switch(
            value: isSwitched,
            onChanged: (value) {
              setState(() {
                isSwitched = value;
                if (isSwitched == true) {
                  b = Colors.white;
                  w = Colors.black;
                }
                if (isSwitched == false) {
                  b = Colors.black;
                  w = Colors.white;
                }
              });
            },
            activeColor: Colors.white,
            inactiveThumbColor: Colors.greenAccent,
          ),
        ],
      ),
      body: Container(
        color: w,
        child: _questionIndex < _question.length
            ? Quiz(_question, _questionIndex, answerQuestion)
            : Result(_resetQuiz, _totalScore),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_questionIndex == 1) {
            _totalScore -= num0;
          } else if (_questionIndex == 2) {
            _totalScore -= num1;
          } else if (_questionIndex == 3) {
            _totalScore -= num2;
          } else if (_questionIndex == 4) {
            _totalScore -= num3;
          }

          setState(() {
            if (_questionIndex > 0) {
              _questionIndex--;
            }
          });
          print("index $_questionIndex");
          print("num0 $num0");
          print("num1 $num1");
          print("num2 $num2");
          print("num3 $num3");
          print("total $_totalScore");
        },
        child: Icon(Icons.arrow_back_ios),
        backgroundColor: Colors.green,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }
}
