import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';

class QuickAlertDials {
  static showDetailsAlert(
    BuildContext context, {
    required TextEditingController firstController,
    required TextEditingController secondController,
    required String confirmBtnText,
    required String cancelBtnText,
    required String title,
    required String firstHint,
    required String secondHint,
    Function()? onConfirmBtnTap,
  }) async {
    await QuickAlert.show(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      context: context,
      type: QuickAlertType.custom,
      barrierDismissible: true,
      confirmBtnText: confirmBtnText,
      confirmBtnColor: Theme.of(context).primaryColorDark,
      cancelBtnText: cancelBtnText,
      showCancelBtn: true,
      onCancelBtnTap: () => Navigator.pop(context),
      widget: Column(
        children: <Widget>[
          SizedBox(height: 16),
          Text(title, style: Theme.of(context).textTheme.titleLarge),
          SizedBox(height: 16),
          TextFormField(
            maxLength: 40,
            controller: firstController,
            style: Theme.of(context).textTheme.titleSmall,
            decoration: InputDecoration(
              hintText: firstHint,
              counter: const SizedBox.shrink(),
            ),
            textInputAction: TextInputAction.next,
          ),
          SizedBox(height: 16),
          TextFormField(
            controller: secondController,
            maxLength: 50,
            maxLines: 2,
            style: Theme.of(context).textTheme.labelSmall,
            decoration: InputDecoration(
              hintText: secondHint,
              counter: const SizedBox.shrink(),
            ),
            textInputAction: TextInputAction.next,
          ),
        ],
      ),
      onConfirmBtnTap: onConfirmBtnTap,
    );
  }

  static showLoadingAlert(BuildContext context) {
    Navigator.pop(context);
    QuickAlert.show(
      context: context,
      barrierDismissible: false,
      type: QuickAlertType.loading,
    );
  }

  static showErrorAlert(BuildContext context,
      {required String text, required String title}) {
    QuickAlert.show(
      context: context,
      type: QuickAlertType.error,
      text: text,
      title: title,
    );
  }

  static showDeleteDial(BuildContext context,
      {required String text,
      required String confirmBtnText,
      Function()? onConfirm}) async {
    await QuickAlert.show(
      context: context,
      type: QuickAlertType.warning,
      text: text,
      textColor: Theme.of(context).brightness == Brightness.dark
          ? Colors.white
          : Colors.black,
      titleColor: Colors.red,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      showCancelBtn: true,
      confirmBtnText: confirmBtnText,
      onCancelBtnTap: () => Navigator.pop(context),
      onConfirmBtnTap: onConfirm,
      customAsset: 'assets/images/areYouSure.webp',
    );
  }
}
