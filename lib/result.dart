import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final Function reset;
  final int score;

  Result(this.reset, this.score);
  String get resultPhrase {
    String resultText;
    if (score >= 80) {
      resultText = "You are awesome !";
    } else if (score >= 40) {
      resultText = "Pretty likable !";
    } else {
      resultText = "You are so bad !";
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Your score is $score",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.green,
              shadows: [
                Shadow(
                  blurRadius: 5.0,
                  color: Colors.green,
                  offset: Offset(5.0, 5.0),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            resultPhrase,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Colors.green,
              shadows: [
                Shadow(
                  blurRadius: 5.0,
                  color: Colors.green,
                  offset: Offset(5.0, 5.0),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 40,
          ),
          TextButton(
            onPressed: reset,
            child: Text(
              "Restart The App :)",
              style: TextStyle(fontSize: 25, color: Colors.green),
            ),
          )
        ],
      ),
    );
  }
}
