import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recall/flashcards_decks/repository/flashcard_deck_cubit.dart';

import '../../models/flashcards_deck_model.dart';
import '../widgets/flashcards_deck_list_tile.dart';

class FlashcardsDeckList extends StatelessWidget {
  const FlashcardsDeckList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FlashcardDeckCubit, List<FlashcardsDeckModel>>(
      builder: (context, state) {
        context.watch<FlashcardDeckCubit>();
        if (state.isNotEmpty) {
          return ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.only(
                top: 16.h, right: 16.w, left: 16.w, bottom: 32.h),
            itemBuilder: (context, index) =>
                FlashcardsListTile(deck: state[index]),
            separatorBuilder: (context, index) => SizedBox(height: 16.h),
            itemCount: state.length,
          );
        }
        return SizedBox();
      },
    );
  }
}
