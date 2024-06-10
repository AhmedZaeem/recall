import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:recall/settings/repository/settings_cache.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit() : super(ThemeMode.system) {
    initTheme();
  }

  initTheme() {
    bool? isDark = SettingsCache().cache.read('isDark');
    if (isDark != null) {
      if (isDark) {
        emit(ThemeMode.dark);
      } else {
        emit(ThemeMode.light);
      }
    } else {
      emit(ThemeMode.system);
    }
  }

  void changeTheme(BuildContext context) {
    if (Theme.of(context).brightness == Brightness.dark) {
      SettingsCache().cache.write('isDark', false);
      emit(ThemeMode.light);
    } else if (Theme.of(context).brightness == Brightness.light) {
      SettingsCache().cache.write('isDark', true);
      emit(ThemeMode.dark);
    }
  }
}
