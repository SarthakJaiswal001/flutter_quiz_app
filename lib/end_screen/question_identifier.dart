import 'package:flutter/material.dart';

class QuestionIdentifier extends StatelessWidget {
  const QuestionIdentifier(
      {super.key, required this.questionIndex, required this.isCorrectAns});
  final int questionIndex;
  final bool isCorrectAns;

  Widget build(context) {
    final questionNumber = questionIndex + 1;
    return Container(
      height: 30,
      width: 30,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: isCorrectAns
              ? Color.fromARGB(255, 128, 191, 242)
              : Color.fromARGB(177, 238, 181, 240),
          borderRadius: BorderRadius.circular(100)),
      child: Text(
        questionNumber.toString(),
        style: const TextStyle(
            color: Color.fromARGB(255, 39, 1, 75), fontWeight: FontWeight.bold),
      ),
    );
  }
}
