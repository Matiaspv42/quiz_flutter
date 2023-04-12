import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_second_project/data/questions.dart';
import 'package:flutter_second_project/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(this.choosenAnswers,
      {super.key, required this.onRestartQuiz});
  final List<String> choosenAnswers;
  final void Function() onRestartQuiz;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < choosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': choosenAnswers[i]
      });
    }
    return summary;
  }

  @override
  Widget build(context) {
    final summaryData = getSummaryData();
    final totalNumQuestions = questions.length;
    final correctNumQuestions = summaryData
        .where(
            (question) => question['correct_answer'] == question['user_answer'])
        .length;

    return SizedBox(
        width: double.infinity,
        child: Container(
          margin: const EdgeInsets.all(40),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
                'You answered right $correctNumQuestions out of $totalNumQuestions questions'),
            SizedBox(
              height: 30,
            ),
            QuestionsSummary(summaryData),
            SizedBox(
              height: 30,
            ),
            TextButton(onPressed: onRestartQuiz, child: Text('Restart Quiz!'))
          ]),
        ));
  }
}
