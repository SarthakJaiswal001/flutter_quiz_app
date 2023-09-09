import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app2/answers.dart';
import 'package:quiz_app2/data/questions.dart';

class QuestionsScreen extends StatefulWidget{//this is the widget class
  const QuestionsScreen({super.key,required this.onSelectingAnswer});
  final void Function(String answer) onSelectingAnswer;

  @override
  State<QuestionsScreen> createState(){
    return _QuestionsScreenState();

  }
}
class _QuestionsScreenState extends State<QuestionsScreen>{//this is the state class
  var currentQuestionIndex=0;
  void questionAnswer(String selectedAnswer){
    widget.onSelectingAnswer(selectedAnswer);
    setState(() {

      currentQuestionIndex+=1;
    });
    
  }

  @override
  Widget build(context){
    final currentQuestion=questions[currentQuestionIndex];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
       Text(currentQuestion.question,style:GoogleFonts.poppins(color:const Color.fromARGB(255, 255, 255, 255)),textAlign: TextAlign.center,),
      const SizedBox(
        height: 30,
      ),
      ...currentQuestion.getShuffledAnswers().map((item){
      return Answers(answerText: item, onTap: (){
        questionAnswer(item);//this will add the selected or the tapped option to a list by passing it to
      },);
      }),
      
          ],
        ),
      ),
    );
  }
}