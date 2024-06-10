import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recall/flashcards_decks/models/flashcards_deck_model.dart';
import 'package:recall/l10n/l10n.dart';
import 'package:recall/quizzes/presentation/widgets/create_quiz_alert.dart';

class DeckQuizListVIew extends StatelessWidget {
  final List<FlashcardsDeckModel> decks;
  final AppLocalizations l10n;
  final BuildContext parent;

  DeckQuizListVIew(
      {required this.decks, required this.l10n, required this.parent});

  @override
  Widget build(BuildContext context) {
    AppLocalizations l10n = AppLocalizations.of(context);
    return decks.isEmpty
        ? Center(
            child: Text(l10n.noDecks),
          )
        : Column(
            children: [
              SizedBox(height: 8.h),
              Text(l10n.quizTitle),
              SizedBox(height: 16.h),
              SizedBox(
                height: 200.h,
                child: ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      FlashcardsDeckModel deck = decks[index];

                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Colors.grey[900]
                              : Colors.grey[200],
                        ),
                        child: ListTile(
                            title: Text(deck.deckName),
                            onTap: () => CreateQuizAlert.showAlert(
                                  parent,
                                  flashcardsListLength: deck.flashcards.length,
                                  title: deck.deckName,
                                  l10n: l10n,
                                  deckId: deck.deckId,
                                )),
                      );
                    },
                    separatorBuilder: (context, index) => SizedBox(height: 8.h),
                    itemCount: decks.length),
              ),
            ],
          );
  }
}
