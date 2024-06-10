import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:recall/app/repository/app_hive.dart';
import 'package:recall/quizzes/models/quiz_model.dart';
import 'package:recall/quizzes/repository/quiz_cubit.dart';

class QuizModelView {
  static createQuiz(BuildContext context,
      {required String title,
      required int numOfQuestions,
      required int deckId}) async {
    int id = await AppHive.list(isQuiz: true).length;
    QuizModel quiz = QuizModel(
        title: title,
        maxNumOfQuestions: numOfQuestions,
        id: id,
        deckId: deckId);
    if (context.mounted) {
      await context.read<QuizCubit>().createQuiz(quiz);
      Navigator.pop(context);
      QuickAlert.show(
        context: context,
        type: QuickAlertType.success,
      );
    }
  }
}
