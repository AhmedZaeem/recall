import 'package:hive_flutter/hive_flutter.dart';
import 'package:recall/flashcards/models/flashcards_model.dart';
import 'package:recall/flashcards_decks/models/flashcards_deck_model.dart';

class AppHive {
  static const String _boxName = 'app';

  static Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(FlashcardsModelAdapter());
    Hive.registerAdapter(FlashcardsDeckModelAdapter());
    await Hive.openBox(_boxName);
  }

  static list() {
    return Hive.box(_boxName).values.toList();
  }

  static Future<void> save(int key, dynamic value) async {
    await Hive.box(_boxName).put(key, value);
  }

  static dynamic read(int key) {
    return Hive.box(_boxName).get(key);
  }

  static Future<void> delete(int key) async {
    await Hive.box(_boxName).delete(key);
  }

  static Future<void> clear() async {
    await Hive.box(_boxName).clear();
  }
}
