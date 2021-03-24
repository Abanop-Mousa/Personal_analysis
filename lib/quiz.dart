import 'package:flutter/material.dart';
import 'package:quizz/question.dart';
import 'package:quizz/answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> question;
  final int questionIndex;
  final Function answerQuestion;

  Quiz(this.question, this.questionIndex, this.answerQuestion);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 40,
        ),
        Question(question[questionIndex]["question"]),
        ...(question[questionIndex]["answer"] as List<Map<String, Object>>)
            .map((answer) {
          return Answer(answer['text'], () => answerQuestion(answer['score']));
        }).toList(),
      ],
    );
  }
}
