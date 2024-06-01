import 'package:flutter/material.dart';
import 'package:quiz_app/desingPattern/controller/online_question_controller.dart';
import 'package:quiz_app/desingPattern/models/online_question_model.dart';
import 'package:quiz_app/desingPattern/view/OnlineQuestion/online_question_answers_view.dart';

class OnlineQuestionScreen extends StatefulWidget {
  const OnlineQuestionScreen({super.key, required this.onSelectorAnswer});

  final void Function(String answer) onSelectorAnswer;

  @override
  State<OnlineQuestionScreen> createState() => _OnlineQuestionScreenState();
}

class _OnlineQuestionScreenState extends State<OnlineQuestionScreen> {
  List<OnlineQuestion> questions = [];
  bool _isLoaded = false;
  int currentQuestionIndex = 0;

  @override
  void initState() {
    super.initState();
    fetchQuestions();
  }

  void fetchQuestions() async {
    await OnlineQuestionController().getQuestions().then((value) {
      setState(() {
        questions = value;
        _isLoaded = true;
      });
    });
  }

  void answerQuestion(String selectedAnswer) {
    widget.onSelectorAnswer(selectedAnswer);

    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!_isLoaded && currentQuestionIndex == 0) {
      return Center(child: CircularProgressIndicator());
    }

    if (currentQuestionIndex >= questions.length) {
      return Center(child: Text('No more questions.'));
    }

    final currentQuestion = questions[currentQuestionIndex];

    return SizedBox(
      width: double.infinity,
      child: OnlineQuestionView(
        currentQuestion: currentQuestion,
        onAnswerSelected: answerQuestion,
      ),
    );
  }
}
