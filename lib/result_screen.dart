import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app2/data/questions.dart';
import 'package:quiz_app2/end_screen/data_summary.dart';


class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key,required this.displayingAns,required this.onrestart});
  final List<String> displayingAns;
  final void Function() onrestart; 

  List<Map<String,Object>> getAnswersinfo(){
List<Map<String,Object>> summary=[];

for(var i=0;i<displayingAns.length;i++){
  summary.add({
'serial_no':i,
'question_display':questions[i].question,
'correct_answer':questions[i].answer[0],
'selected_answer':displayingAns[i]
  });
}
return summary;

  }
  @override
  Widget build(context) {
    final totalQuestion=questions.length;
final summaryData=getAnswersinfo();
final numberOfCorrectQuestions=summaryData.where((element) {
  return element['selected_answer']==element['correct_answer'];
},).length;


    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('You have $numberOfCorrectQuestions out of $totalQuestion questions correct',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.bold)),

            const SizedBox(
              height: 30,
            ),
            DataSummary(summaryData),
            ElevatedButton.icon(
              onPressed: onrestart,
              
              style: ElevatedButton.styleFrom(
                backgroundColor:const Color.fromARGB(122, 109, 26, 123)
                ,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10)
                ,
              ),
              icon: const Icon(Icons.refresh),
              label: const Text(
                'Start Again',
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
