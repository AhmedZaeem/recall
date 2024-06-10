import 'package:hive_flutter/hive_flutter.dart';

part 'question_model.g.dart';

@HiveType(typeId: 3)
class QuestionModel extends HiveObject {
  @HiveField(0)
  int id;
  @HiveField(1)
  String question;
  @HiveField(3)
  int answerIndex;
  @HiveField(4)
  List<String> options;

  @override
  String toString() {
    return 'QuestionModel{id: $id, question: $question, answerIndex: $answerIndex, options: $options}';
  }

  QuestionModel(
      {required this.id,
      required this.question,
      required this.answerIndex,
      required this.options});
}
