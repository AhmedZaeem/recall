import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:recall/settings/repository/settings_cache.dart';

import '../l10n.dart';

export 'package:flutter_bloc/flutter_bloc.dart';

class LocalizationCubit extends Cubit<Locale> {
  LocalizationCubit() : super(Locale('en')) {
    initLocale();
  }

  initLocale() {
    int? savedLocale = SettingsCache().cache.read('locale');
    if (savedLocale != null) {
      emit(supportedLocales()[savedLocale]);
    } else {
      emit(supportedLocales()[1]);
    }
  }

  void changeLocale(Locale selectedLocale) {
    SettingsCache()
        .cache
        .write('locale', supportedLocales().indexOf(selectedLocale));
    emit(
        supportedLocales().where((element) => element == selectedLocale).first);
  }

  eraseLocale() {
    SettingsCache().cache.erase();
    emit(supportedLocales()[1]);
  }

  List<Locale> supportedLocales() {
    return AppLocalizations.supportedLocales;
  }
}
