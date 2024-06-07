import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../flashcards/flashcards.dart';
import '../widgets/flashcards_deck_list_tile.dart';

class FlashcardsDeckList extends StatelessWidget {
  const FlashcardsDeckList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => FlashcardsView())),
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding:
            EdgeInsets.only(top: 16.h, right: 16.w, left: 16.w, bottom: 32.h),
        itemBuilder: (context, index) => FlashcardsListTile(),
        separatorBuilder: (context, index) => SizedBox(height: 16.h),
        itemCount: 10,
      ),
    );
  }
}
