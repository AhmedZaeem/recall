import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recall/flashcards/presentation/widgets/add_flashcard_item.dart';
import 'package:recall/l10n/l10n.dart';

import '../widgets/flashcard_item.dart';

class FlashcardsView extends StatelessWidget {
  const FlashcardsView({super.key});

  @override
  Widget build(BuildContext context) {
    AppLocalizations l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(
        title: Text('Flashcards'),
      ),
      body: Padding(
        padding: EdgeInsets.only(right: 16.w, left: 16.w, top: 40.h),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12.w,
            mainAxisSpacing: 8.h,
            childAspectRatio: 1.5,
          ),
          itemCount: 6,
          itemBuilder: (BuildContext context, int index) {
            return index == 5 ? AddFlashcardItem() : FlashcardItem();
          },
        ),
      ),
    );
  }
}
