import 'package:recall/quizzes/models/question_model.dart';

class QuizModel {
  int id;
  String title;
  List<QuestionModel> questions;

  QuizModel({required this.id, required this.title, required this.questions});
}
