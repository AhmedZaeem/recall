import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recall/app/presentation/widgets/delete_confirmation.dart';
import 'package:recall/flashcards_decks/models/flashcards_deck_model.dart';
import 'package:recall/flashcards_decks/presentation/widgets/deck_alerts.dart';
import 'package:recall/l10n/l10n.dart';

import '../../../flashcards/flashcards.dart';

class FlashcardsListTile extends StatelessWidget {
  const FlashcardsListTile({super.key, required this.deck});
  final FlashcardsDeckModel deck;
  @override
  Widget build(BuildContext context) {
    AppLocalizations l10n = context.l10n;
    return Stack(
      children: [
        GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FlashcardsView(deck: deck),
            ),
          ),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 2.h),
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: Offset(0, 1),
                ),
              ],
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 5.w,
                  height: 64.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.r),
                    color: Theme.of(context).primaryColorDark,
                  ),
                ),
                SizedBox(width: 16.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 8.h),
                    Text(
                      deck.deckName,
                      maxLines: 1,
                      overflow: TextOverflow.fade,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    SizedBox(height: 8.h),
                    Text(deck.deckDescription,
                        style: Theme.of(context).textTheme.bodySmall),
                  ],
                ),
              ],
            ),
          ),
        ),
        PositionedDirectional(
          top: -6.h,
          end: -6.w,
          child: PopupMenuButton(
            itemBuilder: (BuildContext context) {
              return <PopupMenuEntry>[
                PopupMenuItem(
                    child: Text(
                      l10n.edit,
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                    onTap: () =>
                        DeckAlerts.showEditDeckAlert(context, deck: deck)),
                PopupMenuItem(
                  child: Text(
                    l10n.delete,
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                  onTap: () =>
                      deleteConfirmation(context, deck.deckId, isDeck: true),
                ),
              ];
            },
          ),
        )
      ],
    );
  }
}
