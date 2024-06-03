import 'package:bloc/bloc.dart';
export 'package:flutter_bloc/flutter_bloc.dart';

class LocalizationCubit extends Cubit<int> {
  LocalizationCubit() : super(1);

  void changeLocale() {
    emit(state == 0 ? 1 : 0);
  }
}
