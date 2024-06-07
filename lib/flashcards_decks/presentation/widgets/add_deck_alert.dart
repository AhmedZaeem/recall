import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickalert/quickalert.dart';

AddDeckAlert(BuildContext context) async {
  TextEditingController deckTitleController = TextEditingController();
  TextEditingController deckDescriptionController = TextEditingController();
  return await QuickAlert.show(
    context: context,
    type: QuickAlertType.custom,
    barrierDismissible: true,
    confirmBtnText: 'Create',
    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    cancelBtnText: 'Cancel',
    showCancelBtn: true,
    confirmBtnColor: Theme.of(context).primaryColorDark,
    onCancelBtnTap: () => Navigator.pop(context),
    customAsset: 'assets/images/flashcard.webp',
    widget: Column(
      children: <Widget>[
        SizedBox(height: 16.h),
        Text('Create a deck !', style: Theme.of(context).textTheme.titleMedium),
        SizedBox(height: 16.h),
        TextFormField(
          maxLength: 47,
          controller: deckTitleController,
          style: Theme.of(context).textTheme.titleSmall,
          decoration: const InputDecoration(
            alignLabelWithHint: true,
            hintText: 'Enter deck title',
            counter: SizedBox.shrink(),
          ),
          textInputAction: TextInputAction.next,
        ),
        SizedBox(height: 16.h),
        TextFormField(
          controller: deckDescriptionController,
          maxLength: 57,
          maxLines: 2,
          style: Theme.of(context).textTheme.labelSmall,
          decoration: const InputDecoration(
            alignLabelWithHint: true,
            counter: SizedBox.shrink(),
            hintText: 'Enter a description for your deck',
          ),
          textInputAction: TextInputAction.next,
        ),
      ],
    ),
    onConfirmBtnTap: () async {
      if (deckTitleController.text.length < 5) {
        Navigator.pop(context);
        QuickAlert.show(context: context, type: QuickAlertType.loading);

        await Future.delayed(
          const Duration(milliseconds: 500),
          () async {
            Navigator.pop(context);
            await QuickAlert.show(
              context: context,
              type: QuickAlertType.error,
              text: 'Please input something',
            );
          },
        );
        return AddDeckAlert(context);
      }
      Navigator.pop(context);
      await Future.delayed(const Duration(milliseconds: 1000));
      await QuickAlert.show(
        context: context,
        type: QuickAlertType.success,
        text: "Phone number '${deckTitleController.text}' has been saved!.",
      );
    },
  );
}
