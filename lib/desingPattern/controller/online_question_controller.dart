import 'package:dio/dio.dart';
import 'package:quiz_app/Api/api_url.dart';
import 'package:quiz_app/desingPattern/models/online_question_singleton_model.dart';

class OnlineQuestionController {
  Future<List<OnlineQuestion>> getQuestions() async {
    List<OnlineQuestion> question = [];

    try {
      final response = await Dio().get(ApiUrl().getQuestions);

      if (response.statusCode == 200) {
        question = (response.data['results'] as List)
            .map((item) => OnlineQuestion.fromJson(item))
            .toList();
      }
    } catch (e) {
      print(e);
    }
//print json data

    return question;
  }
}
