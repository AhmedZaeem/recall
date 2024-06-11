import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';
import 'package:recall/l10n/l10n.dart';
import 'package:recall/l10n/localization_cubit/localization_cubit.dart';
import 'package:recall/quizzes/repository/quiz_cubit.dart';

class ShowResultAlert {
  static void showResult(BuildContext context, int totalScore,
      int numOfQuestions, int quizId) async {
    double percentageScore = (totalScore / (10 * numOfQuestions)) * 100;
    AppLocalizations l10n = AppLocalizations.of(context);
    await context
        .read<QuizCubit>()
        .updateQuizHighScore(quizId, percentageScore.toInt());
    await QuickAlert.show(
      context: context,
      type: QuickAlertType.custom,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      confirmBtnColor: Theme.of(context).primaryColorDark,
      confirmBtnText: l10n.great,
      customAsset:
          'assets/images/${percentageScore >= 90 ? 'congrats' : percentageScore >= 60 ? 'good' : 'sad'}.webp',
      widget: Text(
        percentageScore >= 90
            ? l10n.fantastic
            : percentageScore >= 60
                ? l10n.goodJobButYouCanDoButter
                : l10n.ohNoYouHaveToTryAgainAndTryToGetAHigherScore,
        style: Theme.of(context).textTheme.labelMedium,
      ),
    ).then((value) => Navigator.of(context).pop());
  }
}
