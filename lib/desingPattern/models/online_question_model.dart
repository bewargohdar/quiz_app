class OnlineQuestion {
  String? type;
  String? difficulty;
  String? category;
  String? question;
  String? correctAnswer;
  List<String>? incorrectAnswers;

  OnlineQuestion({
    this.type,
    this.difficulty,
    this.category,
    this.question,
    this.correctAnswer,
    this.incorrectAnswers,
  });

  OnlineQuestion.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    difficulty = json['difficulty'];
    category = json['category'];
    question = json['question'];
    correctAnswer = json['correct_answer'];
    incorrectAnswers = json['incorrect_answers'].cast<String>();
  }

  List<String> get SuffledAnswers {
    final shuffledList = List.of(incorrectAnswers!);

    shuffledList.shuffle();
    shuffledList.add(correctAnswer!);
    return shuffledList;
  }
}
