import 'package:flutter/material.dart';
import 'package:recall/app/repository/app_hive.dart';
import 'package:recall/flashcards_decks/models/flashcards_deck_model.dart';
import 'package:recall/l10n/localization_cubit/localization_cubit.dart';

import 'flashcard_deck_cubit.dart';

class DeckModelView {
  static addDeck(
      {required String deckTitle,
      required String deckDescription,
      required BuildContext context}) async {
    var key = AppHive.list().length + 1;
    var deck = FlashcardsDeckModel(
      deckDescription: deckDescription,
      deckId: key,
      deckName: deckTitle,
    );
    await AppHive.save(key, deck);
    context.read<FlashcardDeckCubit>().addDeck(deck);
  }

  static deleteDeck({required int key, required BuildContext context}) async {
    await AppHive.delete(key);
    context.read<FlashcardDeckCubit>().deleteDeck(key);
  }

  static editDeck(
      {required int key,
      required String deckTitle,
      required String deckDescription,
      required BuildContext context}) async {
    var deck = FlashcardsDeckModel(
      deckDescription: deckDescription,
      deckId: key,
      deckName: deckTitle,
    );
    await AppHive.save(key, deck);
    context.read<FlashcardDeckCubit>().editDeck(deck);
  }
}
