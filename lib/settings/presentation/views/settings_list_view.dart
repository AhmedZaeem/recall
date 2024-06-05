import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recall/app/theme/theme_cubit.dart';
import 'package:recall/l10n/l10n.dart';
import 'package:recall/l10n/localization_cubit/localization_cubit.dart';
import 'package:switcher_button/switcher_button.dart';

import '../widgets/locale_drop_list.dart';
import '../widgets/settings_divider.dart';

class SettingsListView extends StatefulWidget {
  const SettingsListView({super.key});

  @override
  State<SettingsListView> createState() => _SettingsListViewState();
}

class _SettingsListViewState extends State<SettingsListView> {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        SizedBox(height: 8.h),
        ListTile(
            leading: Icon(Icons.dark_mode),
            title: Text(l10n.darkTheme),
            trailing: SwitcherButton(
              value: Theme.of(context).brightness == Brightness.dark,
              onColor: Theme.of(context).secondaryHeaderColor,
              offColor: Theme.of(context).focusColor,
              onChange: (value) => setState(
                  () => context.read<ThemeCubit>().changeTheme(context)),
            )),
        SettingsDivider(),
        ListTile(
          leading: Icon(Icons.language_rounded),
          title: Text(l10n.language),
          trailing: LocaleDropList(),
        ),
        SettingsDivider(),
        ListTile(
          title: Text(l10n.policies),
          leading: Icon(Icons.policy),
        ),
        SettingsDivider(),
        ListTile(
          title: Text(l10n.contactUs),
          leading: Icon(Icons.feedback),
        ),
        SettingsDivider(),
        ListTile(
          title: Text(l10n.deleteAppData),
          leading: Icon(Icons.delete),
        ),
      ],
    );
  }
}
