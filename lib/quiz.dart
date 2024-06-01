import 'package:flutter/material.dart';
import 'package:quiz_app/data/question.dart';

import 'package:quiz_app/desingPattern/view/OnlineQuestion/online_question_screen.dart';
import 'package:quiz_app/desingPattern/view/OnlineQuestion/online_start_screen_view.dart';
import 'package:quiz_app/desingPattern/view/Result/result_screen_view.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  var activeScreen = 'start_screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'question_screen';
    });
  }

  Future<void> chooseAnswer(String answer) async {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        selectedAnswers = [];
        activeScreen = 'result_screen';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = activeScreen == 'start_screen'
        ? OnlineStartScreen(switchScreen)
        : OnlineQuestionScreen(onSelectorAnswer: chooseAnswer);
    if (activeScreen == 'result_screen') {
      screenWidget = ResultScreen(
        chosenAnswer: selectedAnswers,
      );
    }
    print(selectedAnswers);
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 89, 49, 158),
                Color.fromARGB(255, 63, 25, 96),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
