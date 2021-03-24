import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final String answerQuestion;
  final Function x;

  Answer(this.answerQuestion, this.x);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10),
      child: ElevatedButton(
        child: Text(
          answerQuestion,
          style: TextStyle(
            fontSize: 30,
          ),
        ),
        onPressed: x,
        style: ElevatedButton.styleFrom(
          primary: Colors.greenAccent, // background
          onPrimary: Colors.white, // foreground
        ),
      ),
    );
  }
}
