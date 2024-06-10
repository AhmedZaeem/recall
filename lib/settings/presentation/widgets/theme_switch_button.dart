import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:switcher_button/switcher_button.dart';

import '../../../app/theme/theme_cubit.dart';

class ThemeSwitchButton extends StatefulWidget {
  const ThemeSwitchButton({super.key});

  @override
  State<ThemeSwitchButton> createState() => _ThemeSwitchButtonState();
}

class _ThemeSwitchButtonState extends State<ThemeSwitchButton> {
  @override
  Widget build(BuildContext context) {
    return SwitcherButton(
      value: Theme.of(context).brightness == Brightness.dark,
      onColor: Theme.of(context).secondaryHeaderColor,
      offColor: Theme.of(context).focusColor,
      onChange: (value) =>
          setState(() => context.read<ThemeCubit>().changeTheme(context)),
    );
  }
}
