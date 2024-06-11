import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';
import 'package:recall/app/repository/app_hive.dart';
import 'package:recall/app/theme/theme_cubit.dart';
import 'package:recall/flashcards_decks/repository/flashcard_deck_cubit.dart';
import 'package:recall/home/home.dart';
import 'package:recall/l10n/l10n.dart';
import 'package:recall/l10n/localization_cubit/localization_cubit.dart';
import 'package:recall/quizzes/repository/quiz_cubit.dart';

class ClearAppData {
  static Future clearAppData(BuildContext context) async {
    await AppHive.eraseData();
    context.read<QuizCubit>().clearQuizzes();
    context.read<LocalizationCubit>().eraseLocale();
    context.read<FlashcardDeckCubit>().clearDeck();
    context.read<ThemeCubit>().clearTheme();
    if (context.mounted) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomeView()));
    }
  }

  static void showClearAppDataDialog(BuildContext context) async {
    AppLocalizations l10n = AppLocalizations.of(context);
    await QuickAlert.show(
      context: context,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      customAsset: 'assets/images/delete.webp',
      type: QuickAlertType.confirm,
      title: l10n.deleteAppData,
      text: l10n.confirmAppDataDelete,
      titleColor: Theme.of(context).brightness == Brightness.dark
          ? Colors.white
          : Colors.black,
      textColor: Theme.of(context).brightness == Brightness.dark
          ? Colors.white
          : Colors.black,
      confirmBtnText: l10n.delete,
      confirmBtnColor: Colors.red,
      cancelBtnText: l10n.cancel,
      onConfirmBtnTap: () async => await clearAppData(context),
    );
  }
}
