import 'package:flutter/foundation.dart';
import 'package:quiz_app/desingPattern/models/online_question_model.dart';
import 'package:quiz_app/desingPattern/viewModels/online_question_view_model_singleton.dart';

class OnlineQuestionProvider extends ChangeNotifier {
  List<OnlineQuestion> _questions = [];
  bool _isLoaded = false;
  int _currentQuestionIndex = 0;

  List<OnlineQuestion> get questions => _questions;
  bool get isLoaded => _isLoaded;
  int get currentQuestionIndex => _currentQuestionIndex;

  void fetchQuestions() async {
    _questions = await OnlineQuestionViewModel().getQuestions();
    _isLoaded = true;
    notifyListeners();
  }

  void answerQuestion(String selectedAnswer) {
    // Handle the selected answer if needed
    _currentQuestionIndex++;
    notifyListeners();
  }
}
