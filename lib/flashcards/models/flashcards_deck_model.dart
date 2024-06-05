import 'flashcards_model.dart';

class FlashcardsDeckModel {
  int deckId;
  String deckName;
  String deckDescription;
  List<FlashcardsModel> flashcards;

  FlashcardsDeckModel(
      {required this.deckId,
      required this.deckName,
      required this.deckDescription,
      this.flashcards = const []});
}
