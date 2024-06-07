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
      height: 124.h,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadiusDirectional.only(
          bottomEnd: Radius.circular(44.r),
          bottomStart: Radius.circular(44.r),
        ),
      ),
      alignment: AlignmentDirectional.center,
      margin: EdgeInsets.symmetric(horizontal: 4.w),
      padding: EdgeInsetsDirectional.only(top: 42.h, start: 16.w, bottom: 16.h),
      child: Text(title, style: Theme.of(context).textTheme.headlineLarge),
    );
  }
}
