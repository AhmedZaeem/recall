import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';
import 'package:recall/app/presentation/widgets/quick_alert_dials.dart';
import 'package:recall/flashcards_decks/models/flashcards_deck_model.dart';
import 'package:recall/flashcards_decks/repository/deck_model_view.dart';
import 'package:recall/l10n/l10n.dart';

class DeckAlerts {
  static addDeck(BuildContext context) async {
    AppLocalizations l10n = context.l10n;
    TextEditingController deckTitleController = TextEditingController();
    TextEditingController deckDescriptionController = TextEditingController();
    await QuickAlertDials.showDetailsAlert(context,
        confirmBtnText: l10n.save,
        cancelBtnText: l10n.cancel,
        title: l10n.addDeck,
        firstHint: l10n.deckName,
        secondHint: l10n.deckDescription,
        firstController: deckTitleController,
        secondController: deckDescriptionController,
        onConfirmBtnTap: () => _confirmDeck(context,
            deckTitle: deckTitleController.text,
            deckDescription: deckDescriptionController.text,
            l10n: l10n));
  }

  static _confirmDeck(BuildContext context,
      {required String deckTitle,
      required String deckDescription,
      required AppLocalizations l10n}) async {
    {
      QuickAlertDials.showLoadingAlert(context);
      if (deckTitle.isNotEmpty) {
        await DeckModelView.addDeck(
          deckTitle: deckTitle,
          deckDescription: deckDescription,
          context: context,
        ).then(
          (value) async {
            Navigator.pop(context);
            if (value != 'error') {
              await QuickAlert.show(
                context: context,
                type: QuickAlertType.success,
                title: l10n.success,
                text: l10n.yay,
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

  static showEditDeckAlert(BuildContext context,
      {required FlashcardsDeckModel deck}) {
    AppLocalizations l10n = context.l10n;
    TextEditingController deckTitleController =
        TextEditingController(text: deck.deckName);
    TextEditingController deckDescriptionController =
        TextEditingController(text: deck.deckDescription);
    QuickAlertDials.showDetailsAlert(context,
        confirmBtnText: l10n.update,
        cancelBtnText: l10n.cancel,
        title: l10n.editDeck,
        firstHint: l10n.deckName,
        secondHint: l10n.deckName,
        firstController: deckTitleController,
        secondController: deckDescriptionController,
        onConfirmBtnTap: () => _updateDeck(context,
            deck: deck,
            deckTitle: deckTitleController.text,
            deckDescription: deckDescriptionController.text,
            l10n: l10n));
  }

  static _updateDeck(BuildContext context,
      {required FlashcardsDeckModel deck,
      required String deckTitle,
      required String deckDescription,
      required AppLocalizations l10n}) async {
    deck.deckName = deckTitle;
    deck.deckDescription = deckDescription;
    QuickAlertDials.showLoadingAlert(context);
    await DeckModelView.editDeck(
      deck: deck,
      context: context,
    ).then(
      (value) {
        Navigator.pop(context);
        if (value == 'error' || deckTitle.isEmpty) {
          QuickAlertDials.showErrorAlert(context,
              text: l10n.problem, title: l10n.oops);
        } else {
          QuickAlert.show(
            context: context,
            type: QuickAlertType.success,
            title: l10n.success,
            text: l10n.edited,
          );
        }
      },
    );
  }

  static showDeleteAlert(BuildContext context, int deckKey) async {
    AppLocalizations l10n = context.l10n;
    await QuickAlertDials.showDeleteDial(
      context,
      text: l10n.deckDeleteConfirmation,
      confirmBtnText: l10n.delete,
      onConfirm: () => _deleteDeck(context, deckKey),
    );
  }

  static _deleteDeck(BuildContext context, int key) async {
    AppLocalizations l10n = context.l10n;
    QuickAlertDials.showLoadingAlert(context);
    await DeckModelView.deleteDeck(
      key: key,
      context: context,
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
            title: l10n.success,
            text: l10n.deckDeleted,
          );
        }
      },
    );
  }
}
