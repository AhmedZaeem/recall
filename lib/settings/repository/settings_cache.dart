import 'package:get_storage/get_storage.dart';

class SettingsCache {
  static final SettingsCache _instance = SettingsCache._internal();
  factory SettingsCache() => _instance;
  SettingsCache._internal();
  GetStorage cache = GetStorage();
}
