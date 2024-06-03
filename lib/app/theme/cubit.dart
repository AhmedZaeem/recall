import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit() : super(ThemeMode.system);

  void changeTheme(BuildContext context) {
    if (Theme.of(context).brightness == Brightness.dark) {
      emit(ThemeMode.light);
    } else if (Theme.of(context).brightness == Brightness.light) {
      emit(ThemeMode.dark);
    }
  }
}
