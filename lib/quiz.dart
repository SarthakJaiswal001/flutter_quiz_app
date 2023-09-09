import 'package:flutter/material.dart';
import 'package:quiz_app2/questions_screen.dart';
import 'package:quiz_app2/start_screen.dart';
import 'package:quiz_app2/data/questions.dart';
import 'package:quiz_app2/result_screen.dart';
class Quiz extends StatefulWidget{
const Quiz({super.key});
  @override
  State<Quiz> createState(){
return _QuizState();
  }
}
class _QuizState extends State<Quiz>{
  List<String> selectedAnswers=[];
  Widget? changeScreen; //here the variable of type widget stores our custom widget so that changeScreen can also be used as a widget
  
  @override
  void initState() {
    
    super.initState();
    changeScreen=StartScreen(setScreen);
  }
  void setScreen(){
    setState(() {
      changeScreen= QuestionsScreen(onSelectingAnswer:choosedAnswer);//here whenever the setScreen function will be called the value of changeScreen will change to QuestionsScreen
    });
  }
  void choosedAnswer(String answer){
    selectedAnswers.add(answer);
    if(selectedAnswers.length==questions.length){
      setState(() {
        changeScreen=ResultScreen(displayingAns: selectedAnswers,onrestart: restartQuiz,);
        selectedAnswers=[];
      });

    }
  }
  void restartQuiz(){
    setState(() {
      selectedAnswers=[];
      changeScreen=QuestionsScreen(onSelectingAnswer: choosedAnswer);
    });
  }

  @override
  Widget build(context){
    return  MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.purple,
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.purple, Colors.deepPurpleAccent],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight)),
          child: changeScreen,
          //we could have  written child in this form as well
          //child : changeScreen == StartScreen ? StartScreen(setScreen) : const QuestionsScreen(),
        ),
      ),
    );
  }
}