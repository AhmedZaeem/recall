import 'package:flutter/material.dart';
import 'package:flutter_flip_card/flutter_flip_card.dart';

import '../../models/flashcards_model.dart';
import 'card_widget.dart';

class FlashcardFlipWidget extends StatelessWidget {
  const FlashcardFlipWidget({
    super.key,
    required this.controller,
    required this.currentFlashcard,
  });
  final FlipCardController controller;
  final FlashcardsModel currentFlashcard;
  @override
  Widget build(BuildContext context) {
    return FlipCard(
      animationDuration: const Duration(milliseconds: 300),
      controller: controller,
      onTapFlipping: true,
      frontWidget: CardWidget(text: currentFlashcard.term),
      backWidget: CardWidget(
        text: currentFlashcard.definition,
        color: Colors.red[700],
      ),
      rotateSide: RotateSide.left,
    );
  }
}
