import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});
  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Center(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
      Image.asset(
        //we can also wrap this image widget with opacity widget
        'assets/images/quiz-logo.png',
        width: 300,
        color: const Color.fromARGB(219, 255, 255, 255),
      ),
      const SizedBox(
        height: 30,
      ),
       Text(
        'Learn Flutter the fun way',
        style: GoogleFonts.poppins(
          fontSize: 24,
          color:const Color.fromARGB(255, 217, 214, 221),
          fontWeight: FontWeight.bold
        ),
      ),
      const SizedBox(height: 30),
      OutlinedButton.icon(
        onPressed: () {
          startQuiz(); //here what we are doing is that when start quiz button will be pressed startQuiz method will execute, startQuiz() method is equal to setScreen() function from quiz.dart file. When the setScreen method will execute it will call the questions_screen widget from questions_screen.dart file
        },
        style: OutlinedButton.styleFrom(
            foregroundColor: const Color.fromARGB(255, 221, 217, 225)),
        label: const Text(
          'Start Quiz',
          style: TextStyle(fontSize: 20),
        ),
        icon: const Icon(Icons.arrow_right_alt),
      )
    ]));
  }
}
