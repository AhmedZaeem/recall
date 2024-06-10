class QuestionModel {
  int id;
  String question;
  int answerIndex;
  List<String> options;

  QuestionModel(
      {required this.id,
      required this.question,
      required this.answerIndex,
      required this.options});
}
