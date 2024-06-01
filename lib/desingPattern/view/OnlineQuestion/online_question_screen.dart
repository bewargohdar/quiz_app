import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:quiz_app/desingPattern/view/OnlineQuestion/online_question_answers_view.dart';
import 'online_question_provider.dart';

class OnlineQuestionScreen extends StatelessWidget {
  const OnlineQuestionScreen({super.key, required this.onSelectorAnswer});

  final void Function(String answer) onSelectorAnswer;

  @override
  Widget build(BuildContext context) {
    return Consumer<OnlineQuestionProvider>(
      builder: (context, provider, child) {
        if (!provider.isLoaded && provider.currentQuestionIndex == 0) {
          return Center(child: CircularProgressIndicator());
        }

        if (provider.currentQuestionIndex >= provider.questions.length) {
          return Center(child: Text('No more questions.'));
        }

        final currentQuestion =
            provider.questions[provider.currentQuestionIndex];

        return SizedBox(
          width: double.infinity,
          child: OnlineQuestionView(
            currentQuestion: currentQuestion,
            onAnswerSelected: (String selectedAnswer) {
              provider.answerQuestion(selectedAnswer);
              onSelectorAnswer(selectedAnswer);
            },
          ),
        );
      },
    );
  }
}
