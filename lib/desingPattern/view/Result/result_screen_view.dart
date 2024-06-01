import 'package:flutter/material.dart';
import 'package:quiz_app/data/question.dart';
import 'package:quiz_app/desingPattern/view/QuestionSummery/question_summery_screen.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({super.key, required this.chosenAnswer});
  final List<String> chosenAnswer;

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  List<Map<String, Object>> summaryData() {
    final List<Map<String, Object>> summary = [];
    print(questions[0].text);
    for (var i = 0; i < 6; i++) {
      summary.add({
        'question': questions[i].text,
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summryData = summaryData();
    final numOfTotalQuestion = questions.length;
    final numOfCorrectQuestion = summryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text(
                  ' Your answer $numOfCorrectQuestion out of $numOfTotalQuestion question correct',
                  style: const TextStyle(
                    color: Color.fromARGB(255, 158, 38, 167),
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    fontFamily: "Roboto",
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            QuestionSummaryScreen(summaryData: summryData),
            SizedBox(
              height: 30,
            ),
            TextButton(onPressed: () {}, child: Text('restart quiz'))
          ],
        ),
      ),
    );
  }
}
