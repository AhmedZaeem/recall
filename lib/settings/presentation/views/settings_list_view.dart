import 'package:flutter/material.dart';
import 'package:recall/app/theme/cubit.dart';
import 'package:recall/l10n/l10n.dart';
import 'package:recall/l10n/localization_cubit/localization_cubit.dart';

class SettingsListView extends StatelessWidget {
  const SettingsListView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return ListView(
      shrinkWrap: true,
      children: [
        ListTile(
          title: Text(l10n.darkTheme),
          onTap: () => context.read<ThemeCubit>().changeTheme(context),
        ),
        ListTile(
          title: Text(l10n.language),
          onTap: () => context.read<LocalizationCubit>().changeLocale(),
        ),
      ],
    );
  }
}
