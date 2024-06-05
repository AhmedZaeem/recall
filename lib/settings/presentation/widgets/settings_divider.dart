import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsDivider extends StatelessWidget {
  const SettingsDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 16.h,
      indent: 16.w,
      endIndent: 16.w,
      color: Theme.of(context).hintColor.withOpacity(.4),
      thickness: .2.h,
    );
  }
}
