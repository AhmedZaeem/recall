import 'package:hive_flutter/hive_flutter.dart';

import '../../flashcards/models/flashcards_model.dart';

part 'flashcards_deck_model.g.dart';

@HiveType(typeId: 1)
class FlashcardsDeckModel extends HiveObject {
  @HiveField(0)
  int deckId;
  @HiveField(1)
  String deckName;
  @HiveField(2)
  String deckDescription;
  @HiveField(3)
  List<FlashcardsModel> flashcards;

  FlashcardsDeckModel(
      {required this.deckId,
      required this.deckName,
      required this.deckDescription,
      this.flashcards = const []});
}
