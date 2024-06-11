import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NoData extends StatelessWidget {
  const NoData({
    super.key,
    required this.title,
    required this.message,
  });

  final String title;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 64.h),
        Align(
          alignment: Alignment.centerLeft,
          child: Image.asset('assets/images/error.webp', width: 148.w),
        ),
        SizedBox(height: 24.h),
        Text(title, style: Theme.of(context).textTheme.headlineLarge),
        SizedBox(height: 8.h),
        Text(message, style: Theme.of(context).textTheme.bodyLarge),
      ],
    );
  }
}
