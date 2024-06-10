import 'package:flutter/material.dart';

class SettingsListTileModel {
  String title;
  Widget leading;
  Widget? trailing;
  Function()? onTap;

  SettingsListTileModel(
      {required this.title, required this.leading, this.trailing, this.onTap});
}
