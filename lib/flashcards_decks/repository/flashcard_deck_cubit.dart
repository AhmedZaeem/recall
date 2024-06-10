import 'package:bloc/bloc.dart';
import 'package:recall/flashcards_decks/models/flashcards_deck_model.dart';

import '../../app/repository/app_hive.dart';

class FlashcardDeckCubit extends Cubit<List<FlashcardsDeckModel>> {
  FlashcardDeckCubit() : super([]) {
    readData();
  }

  readData() {
    List data = AppHive.list();
    List<FlashcardsDeckModel> decks = [];
    decks = data.map((e) => e as FlashcardsDeckModel).toList();
    emit(decks);
  }

  addDeck(FlashcardsDeckModel deck) {
    emit([...state, deck]);
  }

  editDeck(FlashcardsDeckModel deck) {
    emit(state.map((element) {
      if (element.deckId == deck.deckId) {
        return deck;
      }
      return element;
    }).toList());
  }

  deleteDeck(int key) {
    emit(state.where((element) => element.deckId != key).toList());
  }
}
