import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickalert/quickalert.dart';
import 'package:recall/l10n/l10n.dart';

import '../../../flashcards_decks/repository/flashcard_deck_cubit.dart';

class AddQuizFloatingActionButton extends StatelessWidget {
  const AddQuizFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    var decks = context.read<FlashcardDeckCubit>().state;
    AppLocalizations l10n = AppLocalizations.of(context);
    return FloatingActionButton(
      backgroundColor: Theme.of(context).primaryColor,
      onPressed: () {
        QuickAlert.show(
          context: context,
          type: QuickAlertType.custom,
          confirmBtnText: l10n.cancel,
          confirmBtnColor: Colors.red,
          customAsset: 'assets/images/quiz.webp',
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          widget: Column(
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
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ),
                    separatorBuilder: (context, index) => SizedBox(height: 8.h),
                    itemCount: decks.length),
              ),
            ],
          ),
        );
      },
      child: const Icon(Icons.add),
    );
  }
}
