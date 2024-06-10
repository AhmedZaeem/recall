import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recall/app/app.dart';
import 'package:recall/app/presentation/widgets/no_data.dart';
import 'package:recall/flashcards_decks/repository/flashcard_deck_cubit.dart';
import 'package:recall/l10n/l10n.dart';

import 'flashcards_deck_list.dart';

class FlashcardsDeckView extends StatelessWidget {
  const FlashcardsDeckView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    var decks = context.watch<FlashcardDeckCubit>().state;
    return SingleChildScrollView(
      child: Column(
        children: [
          ViewHeader(title: l10n.flashcards),
          decks.isEmpty
              ? NoData(title: l10n.oops, message: l10n.noDecks)
              : FlashcardsDeckList(),
        ],
      ),
    );
  }
}
