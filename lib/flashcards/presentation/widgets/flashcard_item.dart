import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recall/flashcards/models/flashcards_model.dart';
import 'package:recall/flashcards_decks/models/flashcards_deck_model.dart';

import '../../../l10n/l10n.dart';
import 'flashcard_alerts.dart';

class FlashcardItem extends StatelessWidget {
  const FlashcardItem({
    super.key,
    required this.flashcard,
    required this.deck,
  });
  final FlashcardsModel flashcard;
  final FlashcardsDeckModel deck;
  @override
  Widget build(BuildContext context) {
    final AppLocalizations l10n = context.l10n;
    return Stack(
      children: [
        Container(
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
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 16.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 12.h),
                Text(
                  flashcard.term,
                  maxLines: 1,
                  overflow: TextOverflow.fade,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                SizedBox(height: 12.h),
                Text(
                  flashcard.definition,
                  style: Theme.of(context).textTheme.bodySmall,
                  maxLines: 1,
                  overflow: TextOverflow.fade,
                ),
              ],
            ),
          ),
        ),
        PositionedDirectional(
          top: -4.h,
          end: 0.w,
          child: PopupMenuButton(
            icon: Icon(Icons.menu),
            itemBuilder: (BuildContext context) {
              return <PopupMenuEntry>[
                PopupMenuItem(
                    child: Text(
                      l10n.edit,
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                    onTap: () => FlashcardAlerts.showEditFlashcardAlert(
                          context,
                          deck: deck,
                          flashcard: flashcard,
                        )),
                PopupMenuItem(
                  child: Text(
                    l10n.delete,
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                  onTap: () => FlashcardAlerts.showDeleteAlert(
                    context,
                    flashcard,
                    deck,
                  ),
                ),
              ];
            },
          ),
        ),
      ],
    );
  }
}
