import 'package:flutter/cupertino.dart';
import 'package:recall/flashcards_decks/models/flashcards_deck_model.dart';
import 'package:recall/flashcards_decks/repository/deck_model_view.dart';

import '../models/flashcards_model.dart';

class FlashcardModelView {
  static addFlashcardItem(BuildContext context,
      {required FlashcardsDeckModel deck,
      String? flashcardTitle,
      String? flashcardDescription}) async {
    if (flashcardTitle != null && flashcardDescription != null) {
      deck.flashcards.add(FlashcardsModel(
        definition: flashcardDescription,
        term: flashcardTitle,
        id: deck.flashcards.length,
      ));
      await DeckModelView.editDeck(deck: deck, context: context);
    }
  }

  static Future editFlashcardItem(BuildContext context,
      {required FlashcardsDeckModel deck,
      required FlashcardsModel flashcard}) async {
    try {
      await DeckModelView.editDeck(deck: deck, context: context);
    } on Exception {
      return Future.error('error');
    }
  }

  static Future deleteFlashcardItem(BuildContext context,
      {required FlashcardsDeckModel deck,
      required FlashcardsModel flashcard}) async {
    try {
      deck.flashcards.removeWhere((element) => element.id == flashcard.id);
      await DeckModelView.editDeck(deck: deck, context: context);
    } on Exception {
      return Future.error('error');
    }
  }
}
