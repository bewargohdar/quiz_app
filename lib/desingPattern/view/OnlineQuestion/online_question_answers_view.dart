import 'package:flutter/material.dart';
import 'package:quiz_app/desingPattern/view/OnlineQuestion/online_question_answer_button.dart';
import 'package:quiz_app/desingPattern/models/online_question_singleton_model.dart';

class OnlineQuestionView extends StatelessWidget {
  final OnlineQuestion currentQuestion;
  final void Function(String answer) onAnswerSelected;

  OnlineQuestionView({
    super.key,
    required this.currentQuestion,
    required this.onAnswerSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            currentQuestion.question ?? "No title",
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 24,
              fontFamily: "Roboto",
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          ...currentQuestion.SuffledAnswers.map((answer) {
            return OnlineQuestionAnswerButton(
              answerText: answer,
              onPressed: () {
                onAnswerSelected(answer);
              },
            );
          }).toList(),
        ],
      ),
    );
  }
}
