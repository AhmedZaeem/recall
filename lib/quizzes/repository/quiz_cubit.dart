import 'package:bloc/bloc.dart';
import 'package:recall/app/repository/app_hive.dart';
import 'package:recall/quizzes/models/question_model.dart';
import 'package:recall/quizzes/models/quiz_model.dart';

class QuizCubit extends Cubit<List<QuizModel>> {
  QuizCubit() : super([]) {
    init();
  }
  init() {
    try {
      List data = AppHive.list(isQuiz: true);
      List<QuizModel> quizzes = [];
      quizzes = data.map((e) => e as QuizModel).toList();
      emit(quizzes);
    } on Exception {
      return Future.error('error');
    }
  }

  Future createQuiz(QuizModel quiz) async {
    try {
      var numOfQuizzesWithSameTitle =
          state.where((element) => element.title == quiz.title).length;
      if (numOfQuizzesWithSameTitle > 0) {
        quiz.title = '${quiz.title} ${numOfQuizzesWithSameTitle + 1}';
      }
      await AppHive.save(state.length, quiz, isQuiz: true);
      emit([...state, quiz]);
    } on Exception {
      return Future.error('error');
    }
  }

  Future addQuestion(QuestionModel question, int index) async {
    try {
      List<QuizModel> quizzes = state;
      quizzes[index].questions == null
          ? [question]
          : quizzes[index].questions!.add(question);
      emit(quizzes);
    } on Exception {
      return Future.error('error');
    }
  }

  Future deleteQuizFromDeck(int deckId) async {
    try {
      List<QuizModel> quizzes = state;
      for (int i = 0; i < quizzes.length; i++) {
        if (quizzes[i].deckId == deckId) {
          await AppHive.delete(i, isQuiz: true);
          quizzes.removeAt(i);
          i--;
        }
      }
      emit(quizzes);
    } on Exception {
      return Future.error('error');
    }
  }

  Future deleteQuiz(int index) async {
    try {
      await AppHive.delete(index, isQuiz: true);
      List<QuizModel> quizzes = state;
      quizzes.removeAt(index);
      emit(quizzes);
    } on Exception {
      return Future.error('error');
    }
  }
}