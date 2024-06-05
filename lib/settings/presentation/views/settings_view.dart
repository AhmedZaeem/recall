import 'package:flutter/material.dart';
import 'package:recall/l10n/l10n.dart';
import 'package:recall/settings/presentation/views/settings_list_view.dart';

import '../../../app/presentation/widgets/view_header.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Column(
      children: <Widget>[
        ViewHeader(title: l10n.settings),
        const SettingsListView(),
      ],
    );
  }
}
