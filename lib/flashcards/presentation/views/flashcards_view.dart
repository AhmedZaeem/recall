import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recall/flashcards/presentation/widgets/flashcards_list_tile.dart';
import 'package:recall/l10n/l10n.dart';

import '../../../app/presentation/widgets/view_header.dart';

class FlashcardsView extends StatelessWidget {
  const FlashcardsView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return SingleChildScrollView(
      child: Column(
        children: [
          ViewHeader(title: l10n.flashcards),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.only(
                top: 16.h, right: 16.w, left: 16.w, bottom: 32.h),
            itemBuilder: (context, index) => FlashcardsListTile(),
            separatorBuilder: (context, index) => SizedBox(height: 16.h),
            itemCount: 10,
          ),
        ],
      ),
    );
  }
}
