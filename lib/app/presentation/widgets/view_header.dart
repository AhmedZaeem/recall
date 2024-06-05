import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ViewHeader extends StatelessWidget {
  const ViewHeader({
    super.key,
    required this.title,
  });

  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadiusDirectional.only(
          bottomEnd: Radius.circular(64.r),
          bottomStart: Radius.circular(64.r),
        ),
      ),
      alignment: AlignmentDirectional.center,
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      padding: EdgeInsetsDirectional.only(top: 82.h, start: 16.w, bottom: 16.h),
      child: Text(title, style: Theme.of(context).textTheme.headlineLarge),
    );
  }
}
