import 'package:flutter/material.dart';
import 'package:quiz_app2/end_screen/summary_item.dart';


// ignore: must_be_immutable
class DataSummary extends StatelessWidget {
  DataSummary(this.summaryData, {super.key});

  List<Map<String, Object>> summaryData;
  @override
  Widget build(context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
            children: summaryData.map(
          (data) {
            return SummaryItem(data);
  }).toList()),
      ),
    );
  }
}
