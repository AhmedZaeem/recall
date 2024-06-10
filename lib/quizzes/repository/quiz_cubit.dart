import 'package:bloc/bloc.dart';
import 'package:recall/app/repository/app_hive.dart';
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

  Future editQuiz(QuizModel quiz, int index) async {
    try {
      await AppHive.save(index, quiz, isQuiz: true);
      List<QuizModel> quizzes = state;
      quizzes[index] = quiz;
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
