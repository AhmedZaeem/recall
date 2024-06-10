import 'package:flutter/material.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

import '../../../l10n/l10n.dart';
import '../../models/quiz_model.dart';

class ShowQuizDetailsAlert {
  static showAlert(BuildContext context, QuizModel quiz) {
    AppLocalizations l10n = AppLocalizations.of(context);
    String locale = Localizations.localeOf(context).languageCode;
    return QuickAlert.show(
      context: context,
      onConfirmBtnTap: () => Navigator.pop(context),
      customAsset: 'assets/images/score.webp',
      confirmBtnText: l10n.start,
      confirmBtnColor: Theme.of(context).primaryColorDark,
      cancelBtnText: l10n.cancel,
      showCancelBtn: true,
      type: QuickAlertType.custom,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      widget: _buildAlert(context, locale, l10n, quiz),
    );
  }

  static Widget _buildAlert(BuildContext context, String locale,
      AppLocalizations l10n, QuizModel quiz) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.center,
          child: Text(
              locale == 'ar'
                  ? (l10n.quiz + ' ' + quiz.title)
                  : (quiz.title + ' ' + l10n.quiz),
              style: Theme.of(context).textTheme.headlineSmall),
        ),
        SizedBox(height: 16),
        Text(l10n.highScore + quiz.maxScore.toString()),
        Text(l10n.numberOfQuestions + quiz.maxNumOfQuestions.toString()),
      ],
    );
  }
}
