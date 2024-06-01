import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/desingPattern/view/OnlineQuestion/online_question_provider.dart';

import 'package:quiz_app/quiz.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => OnlineQuestionProvider()..fetchQuestions(),
      child: const Quiz(),
    ),
  );
}
