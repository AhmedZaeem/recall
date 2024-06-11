import 'dart:math';

import 'package:recall/flashcards/models/flashcards_model.dart';
import 'package:recall/flashcards_decks/models/flashcards_deck_model.dart';
import 'package:recall/quizzes/models/question_model.dart';

class QuestionsGenerator {
  final _random = Random();

  List<QuestionModel> generateQuestions(
      int numberOfQuestions, FlashcardsDeckModel deck) {
    if (numberOfQuestions > deck.flashcards.length) {
      throw Exception('Number of questions cannot exceed number of flashcards');
    }

    var flashcards = deck.flashcards..shuffle();
    var questions = <QuestionModel>[];

    for (var i = 0; i < numberOfQuestions; i++) {
      var flashcard = flashcards[i];
      var options = _generateRandomOptions(flashcard.term, flashcards);

      var question = QuestionModel(
        id: i,
        question: flashcard.definition,
        answerIndex: options.indexOf(flashcard.term),
        options: options,
      );

      questions.add(question);
    }
    return questions;
  }

  List<String> _generateRandomOptions(
      String correctAnswer, List<FlashcardsModel> otherFlashcards) {
    var options = <String>{correctAnswer};

    while (options.length < 4) {
      String option =
          otherFlashcards[_random.nextInt(otherFlashcards.length)].term;
      if (options.contains(option)) {
        continue;
      } else {
        options.add(option);
      }
    }

    var shuffledOptions = options.toList()..shuffle();

    return shuffledOptions;
  }
}
