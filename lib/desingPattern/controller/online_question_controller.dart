import 'package:dio/dio.dart';
import 'package:quiz_app/Api/api_url.dart';
import 'package:quiz_app/desingPattern/models/online_question_model.dart';

class OnlineQuestionController {
  static final OnlineQuestionController _instancee =
      OnlineQuestionController._internal();

  OnlineQuestionController._internal();

  factory OnlineQuestionController() {
    return _instancee;
  }

  Future<List<OnlineQuestion>> getQuestions() async {
    List<OnlineQuestion> questions = [];

    try {
      final response = await Dio().get(ApiUrl().getQuestions);

      if (response.statusCode == 200) {
        questions = (response.data['results'] as List)
            .map((item) => OnlineQuestion.fromJson(item))
            .toList();
      }
    } catch (e) {
      print(e);
    }
    //print json data
    return questions;
  }
}
