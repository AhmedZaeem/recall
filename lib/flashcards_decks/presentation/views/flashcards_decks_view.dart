import 'package:flutter/material.dart';
import 'package:recall/app/app.dart';
import 'package:recall/flashcards_decks/presentation/widgets/add_deck_alert.dart';
import 'package:recall/l10n/l10n.dart';

import 'flashcards_deck_list.dart';

class FlashcardsDeckView extends StatelessWidget {
  const FlashcardsDeckView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () => AddDeckAlert(context),
        child: Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ViewHeader(title: l10n.flashcards),
            FlashcardsDeckList(),
          ],
        ),
      ),
    );
  }
}
