import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../flashcards_decks/repository/flashcard_deck_cubit.dart';
import '../../../l10n/l10n.dart';
import 'deck_quiz_alert.dart';

class AddQuizFloatingActionButton extends StatelessWidget {
  const AddQuizFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    var decks = context.read<FlashcardDeckCubit>().state;
    AppLocalizations l10n = AppLocalizations.of(context);
    return FloatingActionButton(
      backgroundColor: Theme.of(context).primaryColor,
      onPressed: () {
        DeckQuizAlert.showDeckQuizAlertDial(context, decks: decks, l10n: l10n);
      },
      child: const Icon(Icons.add),
    );
  }
}
