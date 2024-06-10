import 'package:hive_flutter/hive_flutter.dart';

part 'flashcards_model.g.dart';

@HiveType(typeId: 0)
class FlashcardsModel extends HiveObject {
  @HiveField(0)
  int id;
  @HiveField(1)
  String definition;
  @HiveField(2)
  String term;

  @override
  String toString() {
    return 'FlashcardsModel{id: $id, definition: $definition, term: $term}';
  }

  FlashcardsModel({
    required this.id,
    required this.definition,
    required this.term,
  });
}
