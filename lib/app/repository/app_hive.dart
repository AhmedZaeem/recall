import 'package:hive_flutter/hive_flutter.dart';
import 'package:recall/flashcards/models/flashcards_model.dart';
import 'package:recall/flashcards_decks/models/flashcards_deck_model.dart';
import 'package:recall/quizzes/models/question_model.dart';
import 'package:recall/quizzes/models/quiz_model.dart';

class AppHive {
  static const String _boxName = 'app';
  static const String _quizBoxName = 'quiz';

  static Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(FlashcardsModelAdapter());
    Hive.registerAdapter(FlashcardsDeckModelAdapter());
    Hive.registerAdapter(QuizModelAdapter());
    Hive.registerAdapter(QuestionModelAdapter());
    await Hive.openBox(_boxName);
    await Hive.openBox(_quizBoxName);
  }

  static eraseData() async {
    await Hive.openBox(_boxName)
      ..clear();

    await Hive.openBox(_quizBoxName)
      ..clear();
  }

  static list({bool isQuiz = false}) {
    return Hive.box(isQuiz ? _quizBoxName : _boxName).values.toList();
  }

  static Future<void> save(int key, dynamic value,
      {bool isQuiz = false}) async {
    await Hive.box(isQuiz ? _quizBoxName : _boxName).put(key, value);
  }

  static dynamic read(int key, {bool isQuiz = false}) {
    return Hive.box(isQuiz ? _quizBoxName : _boxName).get(key);
  }

  static Future<void> delete(int key, {bool isQuiz = false}) async {
    await Hive.box(_boxName).delete(key);
  }

  static Future<void> clear({bool isQuiz = false}) async {
    await Hive.box(isQuiz ? _quizBoxName : _boxName).clear();
  }
}
