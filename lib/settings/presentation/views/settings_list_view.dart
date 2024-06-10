import 'package:flutter/material.dart';
import 'package:recall/l10n/l10n.dart';
import 'package:recall/settings/models/settings_list_tile_model.dart';
import 'package:recall/settings/repository/send_feedback.dart';

import '../../repository/clear_app_data.dart';
import '../../repository/redirect_to_privacy_policy.dart';
import '../widgets/locale_drop_list.dart';
import '../widgets/settings_divider.dart';
import '../widgets/theme_switch_button.dart';

class SettingsListView extends StatelessWidget {
  const SettingsListView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    List<SettingsListTileModel> settingsListTileModel = [
      SettingsListTileModel(
        title: l10n.darkTheme,
        leading: Icon(Icons.dark_mode),
        trailing: ThemeSwitchButton(),
      ),
      SettingsListTileModel(
        title: l10n.language,
        leading: Icon(Icons.language_rounded),
        trailing: LocaleDropList(),
      ),
      SettingsListTileModel(
        title: l10n.policies,
        leading: Icon(Icons.policy),
        onTap: () => RedirectToPrivacyPolicy.redirectToPrivacyPolicy(),
      ),
      SettingsListTileModel(
        title: l10n.contactUs,
        leading: Icon(Icons.feedback),
        onTap: () => SendFeedback.sendFeedback(),
      ),
      SettingsListTileModel(
        title: l10n.deleteAppData,
        leading: Icon(Icons.delete),
        onTap: () => ClearAppData.showClearAppDataDialog(context),
      ),
    ];
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: settingsListTileModel.length,
      separatorBuilder: (context, index) => const SettingsDivider(),
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(settingsListTileModel[index].title),
          leading: settingsListTileModel[index].leading,
          trailing: settingsListTileModel[index].trailing,
          onTap: settingsListTileModel[index].onTap,
        );
      },
      // children: [
      //   SizedBox(height: 8.h),
      //   ListTile(
      //       leading: Icon(Icons.dark_mode),
      //       title: Text(l10n.darkTheme),
      //       trailing: SwitcherButton(
      //         value: Theme.of(context).brightness == Brightness.dark,
      //         onColor: Theme.of(context).secondaryHeaderColor,
      //         offColor: Theme.of(context).focusColor,
      //         onChange: (value) => setState(
      //             () => context.read<ThemeCubit>().changeTheme(context)),
      //       )),
      //   const SettingsDivider(),
      //   ListTile(
      //     leading: Icon(Icons.language_rounded),
      //     title: Text(l10n.language),
      //     trailing: LocaleDropList(),
      //   ),
      //   const SettingsDivider(),
      //   ListTile(
      //     title: Text(l10n.policies),
      //     leading: Icon(Icons.policy),
      //     onTap: () => RedirectToPrivacyPolicy.redirectToPrivacyPolicy(),
      //   ),
      //   const SettingsDivider(),
      //   ListTile(
      //     title: Text(l10n.contactUs),
      //     leading: Icon(Icons.feedback),
      //     onTap: () => SendFeedback.sendFeedback(),
      //   ),
      //   const SettingsDivider(),
      //   ListTile(
      //     title: Text(l10n.deleteAppData),
      //     leading: Icon(Icons.delete),
      //     onTap: () => ClearAppData.showClearAppDataDialog(context),
      //   ),
      // ],
    );
  }
}
