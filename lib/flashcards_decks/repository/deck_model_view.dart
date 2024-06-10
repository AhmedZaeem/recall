import 'package:flutter/material.dart';
import 'package:recall/app/repository/app_hive.dart';
import 'package:recall/flashcards_decks/models/flashcards_deck_model.dart';
import 'package:recall/l10n/localization_cubit/localization_cubit.dart';
import 'package:recall/quizzes/repository/quiz_cubit.dart';

import 'flashcard_deck_cubit.dart';

class DeckModelView {
  static Future addDeck(
      {required String deckTitle,
      required String deckDescription,
      required BuildContext context}) async {
    try {
      var key = AppHive.list().length + 1;
      var deck = FlashcardsDeckModel(
        deckDescription: deckDescription,
        deckId: key,
        deckName: deckTitle,
      );
      await AppHive.save(key, deck);
      context.read<FlashcardDeckCubit>().addDeck(deck);
    } on Exception {
      return Future.error('error');
    }
  }

  static Future deleteDeck(
      {required int key, required BuildContext context}) async {
    try {
      await context.read<QuizCubit>().deleteQuizFromDeck(key);
      await AppHive.delete(key);
      context.read<FlashcardDeckCubit>().deleteDeck(key);
    } on Exception {
      return Future.error('error');
    }
  }

  static Future editDeck(
      {required FlashcardsDeckModel deck,
      required BuildContext context}) async {
    try {
      await AppHive.save(deck.deckId, deck);
      context.read<FlashcardDeckCubit>().editDeck(deck);
    } on Exception {
      return Future.error('error');
    }
  }
}
