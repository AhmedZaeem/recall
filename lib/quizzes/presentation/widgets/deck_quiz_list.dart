import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recall/flashcards_decks/models/flashcards_deck_model.dart';
import 'package:recall/l10n/l10n.dart';

class DeckQuizListVIew extends StatelessWidget {
  final List<FlashcardsDeckModel> decks;
  final AppLocalizations l10n;

  DeckQuizListVIew({required this.decks, required this.l10n});

  @override
  Widget build(BuildContext context) {
    return decks.isEmpty
        ? Center(
            child: Text(l10n.noDecks),
          )
        : Column(
            children: [
              SizedBox(height: 8.h),
              Text('Select a deck for creating a quiz'),
              SizedBox(height: 16.h),
              SizedBox(
                height: 200.h,
                child: ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index) => Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.r),
                            color: Colors.grey[900],
                          ),
                          child: ListTile(
                            title: Text(decks[index].deckName),
                            onTap: () {},
                          ),
                        ),
                    separatorBuilder: (context, index) => SizedBox(height: 8.h),
                    itemCount: decks.length),
              ),
            ],
          );
  }
}
