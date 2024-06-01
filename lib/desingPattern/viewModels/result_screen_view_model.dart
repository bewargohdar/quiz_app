import 'package:quiz_app/desingPattern/models/online_question_model.dart';

class ResultScreenViewModel {
  final List<OnlineQuestion> questions;
  final List<String> chosenAnswers;

  ResultScreenViewModel({required this.questions, required this.chosenAnswers});

  List<Map<String, Object>> summaryData() {
    List<Map<String, Object>> summary = [];

    for (int i = 0; i < questions.length; i++) {
      summary.add({
        'question': questions[i].question!,
        'user_answer': chosenAnswers[i],
        'correct_answer': questions[i].correctAnswer!,
      });
    }

    return summary;
  }

  int getNumOfCorrectQuestions(List<Map<String, Object>> summaryData) {
    return summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;
  }
}
