import 'package:flutter/material.dart';

class Answers extends StatelessWidget {
  const Answers({super.key, required this.answerText, required this.onTap});
  final String answerText;
  final void Function() onTap;
  @override
  Widget build(context) {
    return ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
          backgroundColor: const Color.fromARGB(174, 49, 1, 100),
          foregroundColor: const Color.fromARGB(255, 255, 255, 255),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child:  Text(answerText,textAlign: TextAlign.center,));
  }
}
