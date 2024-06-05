import 'package:cool_dropdown/cool_dropdown.dart';
import 'package:cool_dropdown/models/cool_dropdown_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recall/l10n/localization_cubit/localization_cubit.dart';

class LocaleDropList extends StatelessWidget {
  const LocaleDropList({super.key});

  @override
  Widget build(BuildContext context) {
    DropdownController _controller = DropdownController();
    var items = context
        .read<LocalizationCubit>()
        .supportedLocales()
        .map((e) =>
            CoolDropdownItem(label: e.toString(), value: e.toLanguageTag()))
        .toList();
    return SizedBox(
      width: 80.w,
      child: CoolDropdown(
        defaultItem: items
            .where((element) =>
                element.value ==
                context.read<LocalizationCubit>().state.toLanguageTag())
            .first,
        resultOptions: ResultOptions(
          textStyle: Theme.of(context).textTheme.bodyMedium!,
          boxDecoration: BoxDecoration(
            color: Colors.transparent,
          ),
        ),
        dropdownOptions:
            DropdownOptions(color: Theme.of(context).secondaryHeaderColor),
        dropdownItemOptions: DropdownItemOptions(
            boxDecoration: BoxDecoration(
              color: Colors.white.withOpacity(.1),
            ),
            selectedBoxDecoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer),
            selectedTextStyle: TextStyle(color: Colors.black)),
        dropdownList: items,
        controller: _controller,
        onChange: (p0) {
          context.read<LocalizationCubit>().changeLocale(Locale(p0));
          _controller.close();
        },
      ),
    );
  }
}
