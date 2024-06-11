import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';
import 'package:recall/l10n/l10n.dart';

class ExitQuizConfirmation {
  static show(BuildContext context) async {
    AppLocalizations l10n = AppLocalizations.of(context);
    var textColor = Theme.of(context).brightness == Brightness.dark
        ? Colors.white
        : Colors.black;
    await QuickAlert.show(
      context: context,
      customAsset: 'assets/images/areYouSure.webp',
      type: QuickAlertType.confirm,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      title: l10n.yourProgressWillBeLost,
      titleColor: Colors
          .red[Theme.of(context).brightness == Brightness.dark ? 400 : 800]!,
      text: l10n.areYouSureYouWantToExitFromThisQuiz,
      textColor: textColor,
      confirmBtnText: l10n.yes,
      cancelBtnText: l10n.cancel,
      onConfirmBtnTap: () {
        Navigator.of(context).pop();
        Navigator.of(context).pop();
      },
    );
  }
}
