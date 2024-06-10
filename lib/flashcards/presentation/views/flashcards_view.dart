import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recall/flashcards/presentation/widgets/add_flashcard_item.dart';
import 'package:recall/flashcards_decks/models/flashcards_deck_model.dart';
import 'package:recall/flashcards_decks/repository/flashcard_deck_cubit.dart';
import 'package:recall/l10n/localization_cubit/localization_cubit.dart';

import '../widgets/flashcard_item.dart';

class FlashcardsView extends StatelessWidget {
  const FlashcardsView({super.key, required this.deck});

  final FlashcardsDeckModel deck;

  @override
  Widget build(BuildContext context) {
    context.watch<FlashcardDeckCubit>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Flashcards'),
      ),
      body: Padding(
        padding: EdgeInsets.only(right: 16.w, left: 16.w, top: 40.h),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12.w,
            mainAxisSpacing: 8.h,
            childAspectRatio: 1.5,
          ),
          itemCount: deck.flashcards.length + 1,
          itemBuilder: (BuildContext context, int index) {
            return index == deck.flashcards.length
                ? AddFlashcardItem(deck: deck)
                : FlashcardItem(flashcard: deck.flashcards[index], deck: deck);
          },
        ),
      ),
    );
  }
}
