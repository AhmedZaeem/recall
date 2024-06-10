import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:quickalert/quickalert.dart';
import 'package:recall/app/repository/app_hive.dart';
import 'package:recall/l10n/l10n.dart';
import 'package:recall/settings/repository/settings_cache.dart';

class ClearAppData {
  static void clearAppData(BuildContext context) async {
    await SettingsCache().cache.erase();
    await AppHive.eraseData();
    if (context.mounted) {
      Phoenix.rebirth(context);
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
      onConfirmBtnTap: () => clearAppData(context),
    );
  }
}
