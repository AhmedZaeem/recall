import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({
    super.key,
    required this.text,
    this.color,
  });

  final String text;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        decoration: BoxDecoration(
            color: color ?? Colors.blue[700],
            borderRadius: BorderRadius.circular(10.r),
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).hoverColor.withOpacity(0.3),
                blurRadius: 6,
                offset: const Offset(0, 5),
              )
            ]),
        width: 300.w,
        height: 200.h,
        child: Text(text),
      ),
    );
  }
}
