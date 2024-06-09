import 'package:flutter/material.dart';
import 'package:flutter_flip_card/controllers/flip_card_controllers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recall/flashcards/presentation/widgets/flashcard_flip_widget.dart';

import '../../../flashcards_decks/models/flashcards_deck_model.dart';
import '../../models/flashcards_model.dart';
import '../widgets/navigations_button.dart';

class FlashcardPlayerView extends StatefulWidget {
  FlashcardPlayerView({
    super.key,
    required this.flashcard,
    required this.deck,
  });
  final FlashcardsModel flashcard;
  final FlashcardsDeckModel deck;

  @override
  State<FlashcardPlayerView> createState() => _FlashcardPlayerViewState();
}

class _FlashcardPlayerViewState extends State<FlashcardPlayerView> {
  late PageController pageController;
  @override
  void initState() {
    super.initState();
    pageController = PageController(
        initialPage: widget.deck.flashcards.indexOf(widget.flashcard));
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.deck.deckName),
      ),
      body: PageView.builder(
        controller: pageController,
        itemBuilder: (BuildContext context, int index) {
          var currentFlashcard = widget.deck.flashcards[index];
          FlipCardController controller = FlipCardController();

          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlashcardFlipWidget(
                controller: controller,
                currentFlashcard: currentFlashcard,
              ),
              SizedBox(height: 24.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  NavigationButton(
                      icon: Icons.skip_previous,
                      enabled: index != 0,
                      onPressed: () {
                        pageController.previousPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeIn,
                        );
                      }),
                  NavigationButton(
                    onPressed: () async {
                      await controller.flipcard();
                    },
                    icon: Icons.play_arrow,
                  ),
                  NavigationButton(
                    enabled: index != widget.deck.flashcards.length - 1,
                    onPressed: () {
                      pageController.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut);
                    },
                    icon: Icons.skip_next,
                  ),
                ],
              ),
            ],
          );
        },
        itemCount: widget.deck.flashcards.length,
      ),
    );
  }
}
