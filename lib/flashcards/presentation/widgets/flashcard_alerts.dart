import 'package:flutter/cupertino.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:recall/flashcards/repository/flashcard_model_view.dart';
import 'package:recall/flashcards_decks/models/flashcards_deck_model.dart';

import '../../../app/presentation/widgets/quick_alert_dials.dart';
import '../../../l10n/l10n.dart';
import '../../models/flashcards_model.dart';

class FlashcardAlerts {
  static showAddFlashcardAlert(BuildContext context,
      {required FlashcardsDeckModel deck}) async {
    AppLocalizations l10n = context.l10n;
    TextEditingController termController = TextEditingController();
    TextEditingController defController = TextEditingController();
    await QuickAlertDials.showDetailsAlert(context,
        confirmBtnText: l10n.save,
        cancelBtnText: l10n.cancel,
        secondEditTextMaxChars: 700,
        firstEditTextMaxChars: 120,
        title: l10n.addCard,
        firstHint: l10n.term,
        secondHint: l10n.definition,
        firstController: termController,
        secondController: defController,
        onConfirmBtnTap: () => _confirmFlashcard(context,
            term: termController.text,
            def: defController.text,
            deck: deck,
            l10n: l10n));
  }

  static _confirmFlashcard(BuildContext context,
      {required String term,
      required String def,
      required FlashcardsDeckModel deck,
      required AppLocalizations l10n}) async {
    {
      QuickAlertDials.showLoadingAlert(context);
      if (term.isNotEmpty && def.isNotEmpty) {
        await FlashcardModelView.addFlashcardItem(
          context,
          deck: deck,
          flashcardTitle: term,
          flashcardDescription: def,
        ).then(
          (value) async {
            Navigator.pop(context);
            if (value != 'error') {
              await QuickAlert.show(
                context: context,
                type: QuickAlertType.success,
                text: l10n.yayFlashcard,
              );
            }
          },
        );
      } else {
        Navigator.pop(context);
        QuickAlertDials.showErrorAlert(context,
            text: l10n.problem, title: l10n.oops);
      }
    }
  }

  static showEditFlashcardAlert(BuildContext context,
      {required FlashcardsDeckModel deck,
      required FlashcardsModel flashcard}) async {
    AppLocalizations l10n = context.l10n;
    TextEditingController termController = TextEditingController();
    TextEditingController defController = TextEditingController();
    termController.text = flashcard.term;
    defController.text = flashcard.definition;
    await QuickAlertDials.showDetailsAlert(context,
        confirmBtnText: l10n.save,
        cancelBtnText: l10n.cancel,
        title: l10n.editFlashcard,
        firstHint: l10n.term,
        secondHint: l10n.definition,
        firstController: termController,
        secondController: defController,
        onConfirmBtnTap: () => _confirmEditFlashcard(context,
            term: termController.text,
            def: defController.text,
            deck: deck,
            flashcard: flashcard,
            l10n: l10n));
  }

  static _confirmEditFlashcard(BuildContext context,
      {required String term,
      required String def,
      required FlashcardsDeckModel deck,
      required FlashcardsModel flashcard,
      required AppLocalizations l10n}) async {
    {
      QuickAlertDials.showLoadingAlert(context);
      if (term.isNotEmpty && def.isNotEmpty) {
        flashcard.term = term;
        flashcard.definition = def;
        await FlashcardModelView.editFlashcardItem(
          context,
          deck: deck,
          flashcard: flashcard,
        ).then(
          (value) async {
            Navigator.pop(context);
            if (value != 'error') {
              await QuickAlert.show(
                context: context,
                type: QuickAlertType.success,
                text: l10n.editedFlashcard,
              );
            }
          },
        );
      } else {
        Navigator.pop(context);
        QuickAlertDials.showErrorAlert(context,
            text: l10n.problem, title: l10n.oops);
      }
    }
  }

  static showDeleteAlert(BuildContext context, FlashcardsModel flashcard,
      FlashcardsDeckModel deck) async {
    AppLocalizations l10n = context.l10n;
    await QuickAlertDials.showDeleteDial(
      context,
      text: l10n.flashcardDeleteConfirmation,
      confirmBtnText: l10n.delete,
      onConfirm: () => _deleteDeck(context, flashcard, deck),
    );
  }

  static _deleteDeck(BuildContext context, FlashcardsModel flashcard,
      FlashcardsDeckModel deck) async {
    AppLocalizations l10n = context.l10n;
    QuickAlertDials.showLoadingAlert(context);
    await FlashcardModelView.deleteFlashcardItem(
      context,
      flashcard: flashcard,
      deck: deck,
    ).then(
      (value) {
        Navigator.pop(context);
        if (value == 'error') {
          QuickAlertDials.showErrorAlert(context,
              text: l10n.problem, title: l10n.oops);
        } else {
          QuickAlert.show(
            context: context,
            type: QuickAlertType.success,
            text: l10n.flashcardDeleted,
          );
        }
      },
    );
  }
}
