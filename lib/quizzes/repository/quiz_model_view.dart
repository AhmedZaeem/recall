import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:recall/app/repository/app_hive.dart';
import 'package:recall/l10n/l10n.dart';
import 'package:recall/quizzes/models/quiz_model.dart';
import 'package:recall/quizzes/repository/quiz_cubit.dart';

class QuizModelView {
  static createQuiz(BuildContext context,
      {required String title,
      required int numOfQuestions,
      required int deckId}) async {
    AppLocalizations l10n = AppLocalizations.of(context);
    int id = await AppHive.list(isQuiz: true).length;
    QuizModel quiz = QuizModel(
      title: title,
      maxNumOfQuestions: numOfQuestions,
      id: id,
      deckId: deckId,
    );
    if (context.mounted) {
      await context.read<QuizCubit>().createQuiz(quiz);
      Navigator.pop(context);
      QuickAlert.show(
        context: context,
        type: QuickAlertType.success,
        title: l10n.success,
      );
    }
  }

  static removeQuiz(BuildContext context, QuizModel quiz) async {
    AppLocalizations l10n = AppLocalizations.of(context);
    await QuickAlert.show(
      context: context,
      type: QuickAlertType.confirm,
      title: l10n.areYouSureThatYouWantToRemoveThisQuiz,
      customAsset: 'assets/images/warning.webp',
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      titleColor: Theme.of(context).brightness == Brightness.light
          ? Colors.black
          : Colors.white,
      onConfirmBtnTap: () async {
        await context.read<QuizCubit>().deleteQuiz(quiz.id);
        Navigator.pop(context);
        await QuickAlert.show(
          context: context,
          type: QuickAlertType.success,
          title: l10n.success,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          titleColor: Theme.of(context).brightness == Brightness.light
              ? Colors.black
              : Colors.white,
        );
      },
    );
  }
}
