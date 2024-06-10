import 'package:hive_flutter/hive_flutter.dart';
import 'package:recall/quizzes/models/question_model.dart';

part 'quiz_model.g.dart';

@HiveType(typeId: 4)
class QuizModel extends HiveObject {
  @HiveField(0)
  int id;
  @HiveField(1)
  String title;
  @HiveField(2)
  List<QuestionModel>? questions;

  QuizModel({required this.id, required this.title, this.questions});
}
