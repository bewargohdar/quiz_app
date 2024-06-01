import 'package:flutter/material.dart';
import 'package:quiz_app/desingPattern/models/online_question_model.dart';
import 'package:quiz_app/desingPattern/view/QuestionSummery/question_summery_screen.dart';
import 'package:quiz_app/desingPattern/viewModels/result_screen_view_model.dart';

class ResultScreen extends StatelessWidget {
  final List<String> chosenAnswer;
  final List<OnlineQuestion> question;

  const ResultScreen(
      {Key? key, required this.chosenAnswer, required this.question})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel =
        ResultScreenViewModel(questions: question, chosenAnswers: chosenAnswer);
    final summaryData = viewModel.summaryData();
    final numOfTotalQuestion = question.length;
    final numOfCorrectQuestion =
        viewModel.getNumOfCorrectQuestions(summaryData);

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
            SizedBox(height: 30),
            SingleChildScrollView(
                child: QuestionSummaryScreen(summaryData: summaryData)),
            SizedBox(height: 30),
            TextButton(onPressed: () {}, child: Text('restart quiz'))
          ],
        ),
      ),
    );
  }
}
