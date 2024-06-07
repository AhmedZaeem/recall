import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';

import '../../../flashcards_decks/repository/deck_model_view.dart';
import '../../../l10n/l10n.dart';

deleteConfirmation(BuildContext context, int id, {bool isDeck = false}) async {
  AppLocalizations l10n = context.l10n;
  if (isDeck) {
    await QuickAlert.show(
      context: context,
      type: QuickAlertType.confirm,
      title: l10n.deleteDeck,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      showCancelBtn: true,
      titleColor: Theme.of(context).brightness == Brightness.dark
          ? Colors.white
          : Colors.black,
      textColor: Theme.of(context).brightness == Brightness.dark
          ? Colors.white
          : Colors.black,
      customAsset: 'assets/images/areYouSure.webp',
      text: l10n.deleteConfirmation,
      cancelBtnText: l10n.cancel,
      confirmBtnText: l10n.delete,
      confirmBtnColor: Theme.of(context).primaryColorDark,
      onCancelBtnTap: () => Navigator.pop(context),
      onConfirmBtnTap: () async {
        Navigator.pop(context);
        QuickAlert.show(context: context, type: QuickAlertType.loading);
        await DeckModelView.deleteDeck(key: id, context: context);
        Navigator.pop(context);
        await QuickAlert.show(
          context: context,
          type: QuickAlertType.success,
          text: l10n.deckDeleted,
        );
      },
    );
  }
}
