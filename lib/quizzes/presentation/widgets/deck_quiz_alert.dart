import 'package:flutter/material.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:recall/flashcards_decks/models/flashcards_deck_model.dart';
import 'package:recall/l10n/l10n.dart';
import 'package:recall/quizzes/presentation/widgets/deck_quiz_list.dart';

class DeckQuizAlert {
  static showDeckQuizAlertDial(BuildContext context,
      {required List<FlashcardsDeckModel> decks,
      required AppLocalizations l10n}) {
    return QuickAlert.show(
      context: context,
      type: QuickAlertType.custom,
      confirmBtnText: l10n.cancel,
      confirmBtnColor: Colors.red,
      customAsset: 'assets/images/quiz.webp',
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      widget: DeckQuizListVIew(decks: decks, l10n: l10n),
    );
  }
}
