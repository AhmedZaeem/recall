import 'package:flutter/material.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:recall/l10n/l10n.dart';
import 'package:recall/quizzes/presentation/widgets/number_of_questions_slider.dart';
import 'package:recall/quizzes/repository/quiz_model_view.dart';

class CreateQuizAlert {
  static showAlert(BuildContext context,
      {required int flashcardsListLength,
      required String title,
      required int deckId,
      required AppLocalizations l10n}) async {
    if (flashcardsListLength > 3) {
      double sliderValue = 4;
      Navigator.pop(context);
      await QuickAlert.show(
        context: context,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        type: QuickAlertType.custom,
        widget: NumberOfQuestionsSlider(
          sliderValue: sliderValue,
          flashcardsListLength: flashcardsListLength,
          onChangeEnd: (double value) {
            sliderValue = value;
          },
        ),
        showCancelBtn: true,
        cancelBtnText: l10n.cancel,
        confirmBtnText: l10n.create,
        confirmBtnColor: Theme.of(context).primaryColorDark,
        onConfirmBtnTap: () async => await QuizModelView.createQuiz(context,
            title: title, deckId: deckId, numOfQuestions: sliderValue.toInt()),
      );
    } else {
      QuickAlert.show(
        context: context,
        type: QuickAlertType.error,
        text: l10n.deckMustContainMoreThanFourFlashcardsToCreateAQuiz,
      );
    }
  }
}
