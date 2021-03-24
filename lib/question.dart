import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String questiontext;

  Question(this.questiontext);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      width: double.infinity,
      // alignment: Alignment.center,
      child: Text(
        questiontext,
        style: TextStyle(
          fontSize: 30,
          color: Colors.green,
          shadows: [
            Shadow(
              blurRadius: 5.0,
              color: Colors.green,
              offset: Offset(5.0, 5.0),
            ),
          ],
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
