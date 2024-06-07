import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recall/flashcards/presentation/widgets/flashcard_details_alert.dart';

import '../../../flashcards_decks/models/flashcards_deck_model.dart';

class AddFlashcardItem extends StatelessWidget {
  const AddFlashcardItem({super.key, required this.deck});
  final FlashcardsDeckModel deck;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => flashcardDetailsAlert(context, deck: deck),
      child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Theme.of(context).dividerColor,
            borderRadius: BorderRadius.circular(8.r),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 1,
                blurRadius: 2,
                offset: Offset(0, 1),
              ),
            ],
          ),
          child: Icon(
            Icons.add,
            size: 40.sp,
            color: Theme.of(context).focusColor,
          )),
    );
  }
}
