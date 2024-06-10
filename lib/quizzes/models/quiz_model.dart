import 'package:hive_flutter/hive_flutter.dart';
import 'package:recall/quizzes/models/question_model.dart';

part 'quiz_model.g.dart';

@HiveType(typeId: 4)
class QuizModel extends HiveObject {
  @HiveField(0)
  int id;
  @HiveField(1)
  int deckId;
  @HiveField(2)
  String title;
  @HiveField(3)
  List<QuestionModel>? questions;
  @HiveField(4)
  int maxScore = 0;
  @HiveField(5)
  int maxNumOfQuestions;
  QuizModel(
      {required this.id,
      required this.title,
      this.questions,
      required this.deckId,
      this.maxNumOfQuestions = 0});
}
