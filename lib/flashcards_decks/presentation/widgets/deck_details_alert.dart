import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';
import 'package:recall/flashcards_decks/models/flashcards_deck_model.dart';
import 'package:recall/flashcards_decks/repository/deck_model_view.dart';
import 'package:recall/l10n/l10n.dart';

deckDetailsAlert(BuildContext context,
    {FlashcardsDeckModel? deckToEdit}) async {
  TextEditingController deckTitleController =
      TextEditingController(text: deckToEdit?.deckName ?? '');
  TextEditingController deckDescriptionController =
      TextEditingController(text: deckToEdit?.deckDescription ?? '');
  AppLocalizations l10n = context.l10n;
  await QuickAlert.show(
    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    context: context,
    type: QuickAlertType.custom,
    barrierDismissible: true,
    confirmBtnText: l10n.save,
    confirmBtnColor: Theme.of(context).primaryColorDark,
    cancelBtnText: l10n.cancel,
    showCancelBtn: true,
    onCancelBtnTap: () => Navigator.pop(context),
    widget: Column(
      children: <Widget>[
        SizedBox(height: 16),
        Text(deckToEdit == null ? l10n.addDeck : l10n.editDeck,
            style: Theme.of(context).textTheme.titleLarge),
        SizedBox(height: 16),
        TextFormField(
          maxLength: 40,
          controller: deckTitleController,
          style: Theme.of(context).textTheme.titleSmall,
          decoration: InputDecoration(
            hintText: l10n.deckName,
            counter: const SizedBox.shrink(),
          ),
          textInputAction: TextInputAction.next,
        ),
        SizedBox(height: 16),
        TextFormField(
          controller: deckDescriptionController,
          maxLength: 50,
          maxLines: 2,
          style: Theme.of(context).textTheme.labelSmall,
          decoration: InputDecoration(
            hintText: l10n.deckDescription,
            counter: const SizedBox.shrink(),
          ),
          textInputAction: TextInputAction.next,
        ),
      ],
    ),
    onConfirmBtnTap: () async {
      Navigator.pop(context);
      QuickAlert.show(context: context, type: QuickAlertType.loading);
      if (deckToEdit != null && deckTitleController.text.isNotEmpty) {
        await DeckModelView.editDeck(
          key: deckToEdit.deckId,
          deckTitle: deckTitleController.text,
          deckDescription: deckDescriptionController.text,
          context: context,
        );
        Navigator.pop(context);
        await QuickAlert.show(
          context: context,
          type: QuickAlertType.success,
          text: l10n.edited,
        );
        return;
      } else if (deckTitleController.text.isNotEmpty) {
        await DeckModelView.addDeck(
          deckTitle: deckTitleController.text,
          deckDescription: deckDescriptionController.text,
          context: context,
        );
        Navigator.pop(context);
        await QuickAlert.show(
          context: context,
          type: QuickAlertType.success,
          text: l10n.yay,
        );
        return;
      } else {
        Navigator.pop(context);
        await QuickAlert.show(
          context: context,
          type: QuickAlertType.error,
          text: l10n.problem,
        );
        return deckDetailsAlert(context);
      }
    },
  );
}
