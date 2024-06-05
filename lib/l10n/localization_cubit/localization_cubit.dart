import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../l10n.dart';

export 'package:flutter_bloc/flutter_bloc.dart';

class LocalizationCubit extends Cubit<Locale> {
  LocalizationCubit() : super(Locale('en'));

  void changeLocale(Locale selectedLocale) {
    emit(
        supportedLocales().where((element) => element == selectedLocale).first);
  }

  List<Locale> supportedLocales() {
    return AppLocalizations.supportedLocales;
  }
}
