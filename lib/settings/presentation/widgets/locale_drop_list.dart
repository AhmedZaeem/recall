import 'package:cool_dropdown/cool_dropdown.dart';
import 'package:cool_dropdown/models/cool_dropdown_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recall/l10n/localization_cubit/localization_cubit.dart';

class LocaleDropList extends StatelessWidget {
  const LocaleDropList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var localizationCubit = context.read<LocalizationCubit>();

    var items = [
      CoolDropdownItem(label: 'English', value: 'en'),
      CoolDropdownItem(label: 'Français', value: 'fr'),
      CoolDropdownItem(label: "日本語", value: 'ja'),
      CoolDropdownItem(label: 'العربية', value: 'ar'),
    ];
    var defaultItem = items.firstWhere(
        (element) => element.value == localizationCubit.state.toLanguageTag());
    DropdownController controller = DropdownController();
    return SizedBox(
      width: 92.w,
      child: CoolDropdown(
        controller: controller,
        defaultItem: defaultItem,
        dropdownList: items,
        dropdownItemOptions: DropdownItemOptions(
          boxDecoration: BoxDecoration(color: Colors.transparent),
          selectedBoxDecoration: BoxDecoration(color: Colors.transparent),
          selectedTextStyle: TextStyle(color: Theme.of(context).primaryColor),
        ),
        resultOptions: ResultOptions(
          openBoxDecoration: BoxDecoration(color: Colors.transparent),
          boxDecoration: BoxDecoration(color: Colors.transparent),
          textStyle: TextStyle(color: Theme.of(context).hintColor),
        ),
        onChange: (p0) {
          localizationCubit.changeLocale(Locale(p0));
          controller.close();
        },
      ),
    );
  }
}
