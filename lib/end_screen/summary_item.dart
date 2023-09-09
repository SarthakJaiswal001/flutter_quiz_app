import 'package:flutter/material.dart';

import 'package:quiz_app2/end_screen/question_identifier.dart';

class SummaryItem extends StatelessWidget {
  const SummaryItem(this.itemData, {super.key});
  final Map<String, Object> itemData;
  @override
  Widget build(context) {
    final isCorrectanswer =
        itemData['correct_answer'] == itemData['selected_answer'];
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        QuestionIdentifier(
            questionIndex: itemData['serial_no'] as int,
            isCorrectAns: isCorrectanswer),
        const SizedBox(
          height: 20,
        ),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              itemData['question_display'] as String,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
            const SizedBox(height: 5,),
            Text(itemData['correct_answer'] as String,style: const TextStyle(color: Colors.blue),),
            Text(itemData['selected_answer'] as String,style: const TextStyle(color: const Color.fromARGB(255, 239, 137, 171)),)
          ],
        ))
      ],
    );
  }
}
