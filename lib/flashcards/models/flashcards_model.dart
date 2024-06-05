class FlashcardsModel {
  int id;
  String definition;
  String term;
  int deckId;

  FlashcardsModel(
      {required this.id,
      required this.definition,
      required this.term,
      required this.deckId});
}
