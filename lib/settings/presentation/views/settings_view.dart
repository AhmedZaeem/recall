import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recall/l10n/l10n.dart';
import 'package:recall/settings/presentation/views/settings_list_view.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Column(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryContainer,
            borderRadius: BorderRadiusDirectional.only(
              bottomEnd: Radius.circular(144.r),
              topEnd: Radius.circular(4.r),
            ),
          ),
          alignment: AlignmentDirectional.centerStart,
          padding:
              EdgeInsetsDirectional.only(top: 82.h, start: 16.w, bottom: 16.h),
          child: Text(l10n.settings,
              style: Theme.of(context).textTheme.headlineLarge),
        ),
        const SettingsListView(),
      ],
    );
  }
}
